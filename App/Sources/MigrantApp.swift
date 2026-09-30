import MigrantCore
import SwiftUI

@main
struct MigrantApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    @State private var session = GameSession()

    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            switch session.phase {
            case .title:
                TitleView(session: session)
            case .card, .outcome:
                GameView(session: session)
            case .ending(let ending):
                EndingView(session: session, ending: ending)
            }
        }
        .preferredColorScheme(.dark)
    }
}
