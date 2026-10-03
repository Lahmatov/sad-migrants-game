import MigrantCore
import SwiftUI

/// Карта пути: ночная Европа в пикселях, пройденные города горят,
/// по пройденной дороге бегут огоньки, последний город мигает.
struct JourneyMapView: View {
    let session: GameSession
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        let language = AppSettings.shared.value.language
        let visited = Journey.visited(upTo: session.furthestAct)
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                header(L(.journey), dismiss: { dismiss() })
                JourneyCanvas(visited: visited.map(\.id))
                    .aspectRatio(4.0 / 3.0, contentMode: .fit)
                    .pixelFrame()
                ForEach(Journey.stops) { stop in
                    let lit = visited.contains(stop)
                    HStack {
                        Text(lit ? "●" : "○")
                            .foregroundStyle(lit ? Theme.accent : Theme.dim)
                        Text(stop.name(language))
                            .foregroundStyle(lit ? Theme.text : Theme.dim)
                    }
                    .font(Theme.button)
                }
            }
            .padding(24)
        }
        .background(Theme.background.ignoresSafeArea())
    }
}

private struct JourneyCanvas: View {
    let visited: [String]

    var body: some View {
        TimelineView(.periodic(from: .now, by: 1.0 / 8)) { timeline in
            Canvas { context, size in
                let frame = Int(timeline.date.timeIntervalSinceReferenceDate * 8)
                let canvas = PixelCanvas(context: context, size: size)
                draw(canvas, frame: frame)
            }
        }
        .accessibilityHidden(true)
    }

    private func point(_ stop: JourneyStop) -> (Int, Int) {
        let p = Journey.position(of: stop)
        return (8 + Int(p.x * Double(PixelCanvas.width - 16)), 8 + Int(p.y * Double(PixelCanvas.height - 16)))
    }

    private func draw(_ canvas: PixelCanvas, frame: Int) {
        // Ночное море и редкая сетка меридианов — как на старой штурманской карте.
        canvas.rect(0, 0, PixelCanvas.width, PixelCanvas.height, E32.night)
        for x in stride(from: 0, to: PixelCanvas.width, by: 15) {
            for y in stride(from: 0, to: PixelCanvas.height, by: 3) { canvas.dot(x, y, E32.navy) }
        }
        for y in stride(from: 0, to: PixelCanvas.height, by: 15) {
            for x in stride(from: 0, to: PixelCanvas.width, by: 3) { canvas.dot(x, y, E32.navy) }
        }
        let stops = Journey.stops
        // Дорога: пройденная — пунктир, по которому бегут огоньки; будущая — тусклые точки.
        for (a, b) in zip(stops, stops.dropFirst()) {
            let done = visited.contains(b.id)
            let (x0, y0) = point(a), (x1, y1) = point(b)
            let steps = max(abs(x1 - x0), abs(y1 - y0), 1)
            for i in 0...steps {
                let x = x0 + (x1 - x0) * i / steps
                let y = y0 + (y1 - y0) * i / steps
                if done {
                    let runner = (i + frame) % 12 < 2
                    if i % 3 == 0 || runner { canvas.dot(x, y, runner ? E32.lemon : E32.gold) }
                } else if i % 6 == 0 {
                    canvas.dot(x, y, E32.slate)
                }
            }
        }
        for stop in stops {
            let (x, y) = point(stop)
            let lit = visited.contains(stop.id)
            let last = stop.id == visited.last
            let blink = last && (frame / 4) % 2 == 0
            canvas.rect(x - 1, y - 1, 3, 3, lit ? (blink ? E32.white : E32.gold) : E32.steel)
        }
    }
}

/// Альбом памятных вещей: найденные с подписью, ненайденные — силуэтом.
struct AlbumView: View {
    let session: GameSession
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        let language = AppSettings.shared.value.language
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                header(L(.album), dismiss: { dismiss() })
                Text("\(session.album.keepsakes.count)/\(Keepsake.all.count)")
                    .font(Theme.caption)
                    .foregroundStyle(Theme.dim)
                ForEach(Keepsake.all) { keepsake in
                    let found = session.album.keepsakes.contains(keepsake.id)
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: found ? "sparkles" : "questionmark")
                            .frame(width: 24)
                            .foregroundStyle(found ? Theme.accent : Theme.dim)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(found ? keepsake.title(language) : "? ? ?")
                                .font(Theme.button)
                                .foregroundStyle(found ? Theme.text : Theme.dim)
                            if found {
                                Text(keepsake.note(language))
                                    .font(Theme.body)
                                    .foregroundStyle(Theme.dim)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(12)
                    .pixelFrame()
                }
            }
            .padding(24)
        }
        .background(Theme.background.ignoresSafeArea())
    }
}

/// Найденные воспоминания можно перечитать; ненайденные — замок.
struct MemoriesView: View {
    let session: GameSession
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                header(L(.memories), dismiss: { dismiss() })
                ForEach(session.memoryCards) { card in
                    let found = session.album.memories.contains(card.id)
                    VStack(alignment: .leading, spacing: 6) {
                        Image(systemName: found ? "photo" : "lock")
                            .foregroundStyle(found ? Theme.accent : Theme.dim)
                        Text(found ? card.text : L(.memoryLocked))
                            .font(Theme.body)
                            .foregroundStyle(found ? Theme.text : Theme.dim)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .pixelFrame()
                }
            }
            .padding(24)
        }
        .background(Theme.background.ignoresSafeArea())
    }
}
