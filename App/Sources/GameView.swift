import MigrantCore
import SwiftUI
import UIKit

struct GameView: View {
    let session: GameSession
    @State private var tapCount = 0
    @State private var showSettings = false

    var body: some View {
        if let engine = session.engine, let card = shownCard(engine) {
            VStack(spacing: 12) {
                StatsBar(stats: engine.state.stats)
                HStack {
                    Button {
                        session.menuOpen = true
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                    .accessibilityLabel(L(.menu))
                    Text(engine.currentAct?.title ?? "")
                    Spacer()
                    Text(L(.day, engine.state.day))
                    // Настройки прямо из партии: музыку и тему меняют посреди игры, а не только в меню.
                    Button {
                        showSettings = true
                    } label: {
                        Image(systemName: "gearshape")
                    }
                    .accessibilityLabel(L(.settings))
                }
                .font(Theme.caption)
                .foregroundStyle(Theme.dim)

                SceneImage(name: card.scene, act: engine.state.act, art: artName(card))

                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        if let speaker = card.speaker {
                            Text(speaker)
                                .font(Theme.caption)
                                .foregroundStyle(Theme.accent)
                        }
                        Text(card.text)
                            .font(Theme.body)
                            .foregroundStyle(Theme.text)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }

                if case .outcome(_, let outcome, _) = session.phase {
                    OutcomePanel(outcome: outcome) {
                        tapCount += 1
                        session.dismissOutcome()
                    }
                } else {
                    ChoiceList(card: card, available: engine.availableChoices) { index in
                        tapCount += 1
                        session.choose(index)
                    }
                }
            }
            .padding(16)
            .sheet(isPresented: $showSettings) { SettingsView() }
            .sensoryFeedback(.selection, trigger: tapCount)
            .animation(.easeOut(duration: 0.2), value: session.phase)
        }
    }

    /// Пока показан итог — остаётся карточка, на которой сделан выбор.
    private func shownCard(_ engine: GameEngine) -> Card? {
        if case .outcome(let card, _, _) = session.phase { return card }
        return engine.currentCard
    }

    /// Картинка выбора, пока виден его итог; иначе — картинка карточки.
    private func artName(_ card: Card) -> String {
        if case .outcome(_, _, let choice) = session.phase {
            let name = ArtLibrary.choiceName(card: card.id, choice: choice)
            if ArtLibrary.has(name) { return name }
        }
        return card.id
    }
}

struct StatsBar: View {
    let stats: Stats

    var body: some View {
        HStack(spacing: 10) {
            ForEach(Stat.allCases, id: \.self) { stat in
                VStack(spacing: 4) {
                    Image(systemName: stat.symbol)
                        .foregroundStyle(color(for: stat))
                    if stat == .money {
                        Text("\(stats.money)€")
                            .font(Theme.caption)
                            .foregroundStyle(Theme.text)
                            .lineLimit(1)
                            .minimumScaleFactor(0.6)
                    } else {
                        PixelMeter(value: stats[stat], color: color(for: stat))
                    }
                }
                .frame(maxWidth: .infinity)
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(stat.title)
                .accessibilityValue(stat == .money ? "\(stats.money) евро" : "\(stats[stat]) из 100")
            }
        }
        .padding(10)
        .pixelFrame()
    }

    /// Шкала краснеет, когда до концовки остаётся немного.
    private func color(for stat: Stat) -> Color {
        let low = stat == .money ? stats.money < 800 : stats[stat] <= 20
        return low && stat != .belonging ? Theme.bad : Theme.accent
    }
}

/// Шкала из десяти «пикселей».
struct PixelMeter: View {
    let value: Int
    let color: Color

    var body: some View {
        HStack(spacing: 1) {
            ForEach(0..<10, id: \.self) { index in
                Rectangle()
                    .fill(index < filledCells ? color : Theme.dim.opacity(0.25))
                    .frame(height: 6)
            }
        }
    }

    private var filledCells: Int {
        // Хоть одна клетка, пока шкала не ноль: «почти пусто» и «пусто» — разное.
        value <= 0 ? 0 : max(1, min(10, (value + 5) / 10))
    }
}

struct SceneImage: View {
    let name: String?
    let act: String
    /// Картинка карточки или выбора из папки Art — главнее фона сцены.
    var art: String? = nil

    var body: some View {
        ZStack {
            if let art, let image = ArtLibrary.image(art) {
                Image(uiImage: image)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFill()
                ArtOverlay(kind: ArtLibrary.animation(for: art))
            } else if let name, let image = ArtLibrary.image(name) ?? UIImage(named: name) {
                // Фон сцены: из папки Art или из каталога ассетов.
                Image(uiImage: image)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFill()
            } else {
                // Картинки ещё нет — сцена рисуется кодом и живёт.
                LiveScene(scene: name, act: act)
            }
        }
        .aspectRatio(4.0 / 3.0, contentMode: .fit)
        .clipped()
        .pixelFrame()
        // Новая сцена проявляется, а не выскакивает.
        .id(ArtLibrary.has(art ?? "") ? art : name)
        .transition(.opacity)
    }
}

struct ChoiceList: View {
    let card: Card
    let available: [Int]
    let choose: (Int) -> Void

    var body: some View {
        VStack(spacing: 8) {
            ForEach(available, id: \.self) { index in
                Button {
                    choose(index)
                } label: {
                    Text(card.choices[index].label)
                        .font(Theme.button)
                        .foregroundStyle(Theme.text)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .padding(.horizontal, 8)
                        .pixelFrame(color: Theme.accent)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct OutcomePanel: View {
    let outcome: Outcome
    let dismiss: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let result = outcome.result {
                Text(result)
                    .font(Theme.body)
                    .foregroundStyle(Theme.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            if !outcome.applied.isEmpty {
                DeltaRow(applied: outcome.applied)
            }
            Button(action: dismiss) {
                Text(L(.next))
                    .font(Theme.button)
                    .foregroundStyle(Theme.background)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .pixelFrame(color: Theme.accent, fill: Theme.accent)
            }
            .buttonStyle(.plain)
        }
        .padding(12)
        .pixelFrame(color: Theme.azulejo)
    }
}

struct DeltaRow: View {
    let applied: StatNumbers

    var body: some View {
        HStack(spacing: 12) {
            ForEach(Stat.allCases, id: \.self) { stat in
                if let change = applied[stat] {
                    Label {
                        Text(change > 0 ? "+\(change)" : "\(change)")
                    } icon: {
                        Image(systemName: stat.symbol)
                    }
                    .font(Theme.caption)
                    .foregroundStyle(change > 0 ? Theme.good : Theme.bad)
                    .accessibilityLabel("\(stat.title) \(change > 0 ? "+" : "")\(change)")
                }
            }
        }
    }
}
