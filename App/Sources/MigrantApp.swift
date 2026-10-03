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
    @State private var session = GameSession(language: AppSettings.shared.value.language)
    /// Сдвиг пальцем, пока меню тянут: плюс — открывают, минус — закрывают.
    @State private var drag: CGFloat = 0
    @Environment(\.scenePhase) private var scenePhase
    private let settings = AppSettings.shared

    /// Свайп засчитывается, только если начат у самого левого края —
    /// иначе меню выезжало бы при каждом движении пальца по тексту.
    private let edge: CGFloat = 28

    var body: some View {
        GeometryReader { geometry in
            let width = min(300, geometry.size.width * 0.82)
            ZStack(alignment: .leading) {
                ZStack {
                    Theme.background.ignoresSafeArea()
                    switch session.phase {
                    case .title:
                        TitleView(session: session)
                    case .intro:
                        IntroView(stanzas: session.introStanzas, finish: session.finishIntro)
                    case .card, .outcome:
                        GameView(session: session)
                    case .ending(let ending, let isNew):
                        EndingView(session: session, ending: ending, isNew: isNew)
                    }
                }
                .disabled(session.menuOpen)

                Color.black
                    .opacity(0.5 * openness(width))
                    .ignoresSafeArea()
                    .allowsHitTesting(session.menuOpen)
                    .onTapGesture { session.menuOpen = false }

                DrawerMenu(session: session)
                    .frame(width: width)
                    .offset(x: offset(width))
                    .accessibilityHidden(!session.menuOpen)
            }
            .simultaneousGesture(swipe(width))
            .animation(.easeOut(duration: 0.22), value: session.menuOpen)
        }
        .preferredColorScheme(Theme.palette.scheme)
        .onAppear { MusicPlayer.shared.apply(settings.value) }
        .onChange(of: settings.value) { _, new in MusicPlayer.shared.apply(new) }
        // Вернулись из фона — музыка продолжается.
        .onChange(of: scenePhase) { _, phase in
            if phase == .active { MusicPlayer.shared.apply(settings.value) }
        }
        .onChange(of: settings.value.language) { _, language in session.reload(language: language) }
    }

    private func offset(_ width: CGFloat) -> CGFloat {
        session.menuOpen ? min(0, drag) : -width + max(0, drag)
    }

    /// 0 — меню спрятано, 1 — открыто полностью. От неё темнеет фон.
    private func openness(_ width: CGFloat) -> Double {
        Double((width + offset(width)) / width)
    }

    private func swipe(_ width: CGFloat) -> some Gesture {
        DragGesture(minimumDistance: 10)
            .onChanged { value in
                if session.menuOpen {
                    drag = min(0, value.translation.width)
                } else if value.startLocation.x < edge {
                    drag = min(width, max(0, value.translation.width))
                }
            }
            .onEnded { value in
                // Отпустил палец — меню доезжает до конца или возвращается, а не прыгает.
                withAnimation(.easeOut(duration: 0.22)) {
                    if session.menuOpen {
                        if value.translation.width < -width / 3 { session.menuOpen = false }
                    } else if value.startLocation.x < edge, value.translation.width > width / 3 {
                        session.menuOpen = true
                    }
                    drag = 0
                }
            }
    }
}
