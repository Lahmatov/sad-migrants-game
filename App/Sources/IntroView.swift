import SwiftUI

/// Вступление: строфы печатаются по буквам поверх медленно плывущих пикселей.
///
/// Тап ускоряет: допечатывает строку или пропускает паузу. «Пропустить» —
/// сразу в игру. При «уменьшении движения» строфы появляются целиком.
struct IntroView: View {
    let stanzas: [[String]]
    let finish: () -> Void

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var visibleLines: [String] = []
    @State private var typing = ""
    @State private var hurry = false
    @State private var isDone = false
    @State private var stanzaOpacity = 1.0

    /// Скорость печати и паузы. Подобраны так, чтобы всё вступление
    /// занимало около минуты и не надоедало при второй партии.
    private let letterDelay: Duration = .milliseconds(38)
    private let linePause: Duration = .milliseconds(700)
    private let stanzaPause: Duration = .milliseconds(1600)

    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            PixelDrift()
                .ignoresSafeArea()
                .opacity(reduceMotion ? 0.4 : 1)

            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                ForEach(Array(visibleLines.enumerated()), id: \.offset) { _, line in
                    Text(line)
                }
                if !typing.isEmpty {
                    Text(typing + "▌")
                }
                Spacer()
                Spacer()
            }
            .font(Theme.body)
            .foregroundStyle(Theme.text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 28)
            .opacity(stanzaOpacity)

            VStack {
                HStack {
                    Spacer()
                    Button("Пропустить", action: finish)
                        .font(Theme.caption)
                        .foregroundStyle(Theme.dim)
                        .padding(8)
                }
                Spacer()
                if isDone {
                    Button(action: finish) {
                        Text("Начать")
                            .font(Theme.button)
                            .foregroundStyle(Theme.background)
                            .frame(maxWidth: .infinity, minHeight: 48)
                            .pixelFrame(color: Theme.accent, fill: Theme.accent)
                    }
                    .buttonStyle(.plain)
                    .padding(24)
                    .transition(.opacity)
                }
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if isDone { finish() } else { hurry = true }
        }
        .task { await play() }
    }

    private func play() async {
        for (index, stanza) in stanzas.enumerated() {
            if reduceMotion {
                visibleLines = stanza
                await wait(stanzaPause * 2)
            } else {
                for line in stanza {
                    await type(line)
                    await wait(linePause)
                }
                await wait(stanzaPause)
            }
            if Task.isCancelled { return }
            // Последняя строфа остаётся на экране вместе с кнопкой «Начать».
            if index < stanzas.count - 1 {
                withAnimation(.easeIn(duration: 0.6)) { stanzaOpacity = 0 }
                await wait(.milliseconds(650), skippable: false)
                visibleLines = []
                stanzaOpacity = 1
            }
        }
        withAnimation(.easeOut(duration: 0.8)) { isDone = true }
    }

    /// Печатает строку по букве. Тап допечатывает её сразу.
    private func type(_ line: String) async {
        hurry = false
        typing = ""
        for letter in line {
            if Task.isCancelled { return }
            if hurry { break }
            typing.append(letter)
            try? await Task.sleep(for: letterDelay)
        }
        typing = ""
        visibleLines.append(line)
    }

    /// Пауза, которую тап обрывает. Разбита на короткие шаги, чтобы тап
    /// срабатывал сразу, а не после всей паузы.
    private func wait(_ duration: Duration, skippable: Bool = true) async {
        hurry = false
        let step: Duration = .milliseconds(50)
        var waited: Duration = .zero
        while waited < duration {
            if Task.isCancelled || (skippable && hurry) { return }
            try? await Task.sleep(for: step)
            waited += step
        }
    }
}

/// Пиксели, медленно всплывающие снизу вверх, — как пыль в луче света
/// или искры над морем. Положения детерминированы, без генератора.
struct PixelDrift: View {
    private static let count = 56

    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let time = timeline.date.timeIntervalSinceReferenceDate
                for index in 0..<Self.count {
                    let a = Self.noise(index, 1)
                    let b = Self.noise(index, 2)
                    let c = Self.noise(index, 3)
                    let speed = 6 + b * 14
                    let travel = size.height + 40
                    let rise = (time * speed + a * travel).truncatingRemainder(dividingBy: travel)
                    let sway = sin(time * (0.2 + c * 0.4) + a * 6) * 6
                    // Координаты кратны двум — пиксель не размазывается между точками.
                    let x = ((a * size.width + sway) / 2).rounded() * 2
                    let y = ((size.height + 20 - rise) / 2).rounded() * 2
                    let side: CGFloat = c < 0.6 ? 2 : (c < 0.9 ? 4 : 6)
                    let color = c < 0.7 ? Theme.dim : (c < 0.9 ? Theme.azulejo : Theme.accent)
                    let fade = min(1, rise / 120) * (0.25 + b * 0.45)
                    context.fill(Path(CGRect(x: x, y: y, width: side, height: side)),
                                 with: .color(color.opacity(fade)))
                }
            }
        }
        .accessibilityHidden(true)
    }

    /// Псевдослучайное число 0..<1 из индекса: одинаковое при каждом кадре.
    private static func noise(_ index: Int, _ salt: Double) -> Double {
        let value = sin(Double(index) * 12.9898 + salt * 78.233) * 43758.5453
        return value - value.rounded(.down)
    }
}
