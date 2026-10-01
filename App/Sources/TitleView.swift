import MigrantCore
import SwiftUI

struct TitleView: View {
    let session: GameSession

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Text("23 кг")
                .font(Theme.title)
                .foregroundStyle(Theme.accent)
            Text("История про эмиграцию.\nСмешная и немного грустная.\nОснована на реальных событиях.")
                .font(Theme.body)
                .foregroundStyle(Theme.dim)
                .multilineTextAlignment(.center)
            Spacer()
            if let progress = session.galleryProgress {
                Text("Открыто концовок: \(progress.opened) из \(progress.total)")
                    .font(Theme.caption)
                    .foregroundStyle(Theme.dim)
            }
            if let error = session.loadError {
                Text("Сценарий не загрузился:\n\(error)")
                    .font(Theme.caption)
                    .foregroundStyle(Theme.bad)
            }
            VStack(spacing: 10) {
                if session.canContinue {
                    menuButton("Продолжить", filled: true) { session.continueGame() }
                }
                menuButton("Новая игра", filled: !session.canContinue) { session.newGame() }
            }
        }
        .padding(24)
    }

    private func menuButton(_ title: String, filled: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(Theme.button)
                .foregroundStyle(filled ? Theme.background : Theme.text)
                .frame(maxWidth: .infinity, minHeight: 48)
                .pixelFrame(color: Theme.accent, fill: filled ? Theme.accent : Theme.panel)
        }
        .buttonStyle(.plain)
    }
}

struct EndingView: View {
    let session: GameSession
    let ending: Ending
    let isNew: Bool

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            if isNew {
                Text("Новая концовка")
                    .font(Theme.caption)
                    .foregroundStyle(Theme.background)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Theme.accent)
            }
            Text(ending.title)
                .font(Theme.title)
                .foregroundStyle(ending.stat == nil ? Theme.accent : Theme.bad)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
            // Финальные тексты длинные: на маленьком айфоне без прокрутки не влезут.
            ScrollView {
                Text(ending.text)
                    .font(Theme.body)
                    .foregroundStyle(Theme.text)
            }
            .frame(maxHeight: 280)
            if let engine = session.engine {
                StatsBar(stats: engine.state.stats)
                Text("Дней в пути: \(engine.state.day) · решений: \(engine.state.turn)")
                    .font(Theme.caption)
                    .foregroundStyle(Theme.dim)
            }
            if let progress = session.galleryProgress {
                Text("Открыто концовок: \(progress.opened) из \(progress.total)")
                    .font(Theme.caption)
                    .foregroundStyle(Theme.dim)
            }
            Spacer()
            Button {
                session.newGame()
            } label: {
                Text("Начать заново")
                    .font(Theme.button)
                    .foregroundStyle(Theme.background)
                    .frame(maxWidth: .infinity, minHeight: 48)
                    .pixelFrame(color: Theme.accent, fill: Theme.accent)
            }
            .buttonStyle(.plain)
            Button("В меню") { session.backToTitle() }
                .font(Theme.button)
                .foregroundStyle(Theme.dim)
        }
        .padding(24)
    }
}
