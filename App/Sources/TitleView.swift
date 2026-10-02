import MigrantCore
import SwiftUI

struct TitleView: View {
    let session: GameSession
    @State private var showSettings = false

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Text(L(.gameTitle))
                .font(Theme.title)
                .foregroundStyle(Theme.accent)
            Text(L(.tagline))
                .font(Theme.body)
                .foregroundStyle(Theme.dim)
                .multilineTextAlignment(.center)
            Spacer()
            if let progress = session.galleryProgress {
                Text(L(.endingsOpened, progress.opened, progress.total))
                    .font(Theme.caption)
                    .foregroundStyle(Theme.dim)
            }
            if let error = session.loadError {
                Text("\(L(.scriptFailed))\n\(error)")
                    .font(Theme.caption)
                    .foregroundStyle(Theme.bad)
            }
            VStack(spacing: 10) {
                if session.canContinue {
                    menuButton(L(.continueGame), filled: true) { session.continueGame() }
                }
                menuButton(L(.newGame), filled: !session.canContinue) { session.newGame() }
                menuButton(L(.settings), filled: false) { showSettings = true }
            }
        }
        .padding(24)
        .sheet(isPresented: $showSettings) { SettingsView() }
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
                Text(L(.newEnding))
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
                Text(L(.daysAndChoices, engine.state.day, engine.state.turn))
                    .font(Theme.caption)
                    .foregroundStyle(Theme.dim)
            }
            if let progress = session.galleryProgress {
                Text(L(.endingsOpened, progress.opened, progress.total))
                    .font(Theme.caption)
                    .foregroundStyle(Theme.dim)
            }
            Spacer()
            Button {
                session.newGame()
            } label: {
                Text(L(.playAgain))
                    .font(Theme.button)
                    .foregroundStyle(Theme.background)
                    .frame(maxWidth: .infinity, minHeight: 48)
                    .pixelFrame(color: Theme.accent, fill: Theme.accent)
            }
            .buttonStyle(.plain)
            Button(L(.toMenu)) { session.backToTitle() }
                .font(Theme.button)
                .foregroundStyle(Theme.dim)
        }
        .padding(24)
    }
}
