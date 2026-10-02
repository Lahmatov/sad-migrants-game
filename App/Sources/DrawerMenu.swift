import MigrantCore
import StoreKit
import SwiftUI

/// Боковое меню: выезжает слева — свайпом от края экрана или кнопкой ☰.
struct DrawerMenu: View {
    let session: GameSession
    @State private var sheet: DrawerSheet?
    @State private var confirm: Confirmation?
    @Environment(\.openURL) private var openURL
    @Environment(\.requestReview) private var requestReview

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 4) {
                Text(L(.gameTitle))
                    .font(Theme.title)
                    .foregroundStyle(Theme.accent)
                    .padding(.bottom, 12)

                if session.isPlaying {
                    item(L(.continueGame), icon: "play.fill") { close() }
                    item(L(.toMenu), icon: "house") {
                        session.backToTitle()
                        close()
                    }
                } else if session.canContinue {
                    item(L(.continueGame), icon: "play.fill") {
                        session.continueGame()
                        close()
                    }
                }
                item(L(.newGame), icon: "arrow.counterclockwise") {
                    // Случайный тап не должен стереть партию на сороковой карточке.
                    if session.canContinue { confirm = .newGame } else { startNewGame() }
                }

                divider
                item(L(.endings), icon: "book.closed", detail: endingsDetail) { sheet = .endings }
                item(L(.settings), icon: "gearshape") { sheet = .settings }

                divider
                if let telegram = Links.telegram {
                    item(L(.telegram), icon: "paperplane") { openURL(telegram) }
                } else {
                    item(L(.telegramSoon), icon: "paperplane", enabled: false) {}
                }
                ShareLink(item: L(.shareText)) {
                    row(L(.shareGame), icon: "square.and.arrow.up")
                }
                .buttonStyle(.plain)
                item(L(.rateGame), icon: "star") { requestReview() }

                divider
                item(L(.aboutStory), icon: "text.book.closed") { sheet = .about }
                item(L(.privacy), icon: "lock") { sheet = .privacy }
                item(L(.resetProgress), icon: "trash", tint: Theme.bad) { confirm = .reset }

                Text("\(L(.version)) \(appVersion)")
                    .font(Theme.caption)
                    .foregroundStyle(Theme.dim)
                    .padding(.top, 20)
            }
            .padding(20)
        }
        .frame(maxHeight: .infinity)
        .background(Theme.panel.ignoresSafeArea())
        .overlay(alignment: .trailing) {
            Rectangle().fill(Theme.accent).frame(width: 2).ignoresSafeArea()
        }
        .sheet(item: $sheet) { sheet in
            switch sheet {
            case .settings: SettingsView()
            case .endings: EndingsGalleryView(session: session)
            case .about: InfoView(title: L(.aboutStory), text: L(.aboutStoryText))
            case .privacy: InfoView(title: L(.privacy), text: L(.privacyText))
            }
        }
        .confirmationDialog(confirm?.title ?? "", isPresented: Binding(
            get: { confirm != nil }, set: { if !$0 { confirm = nil } }), titleVisibility: .visible) {
            if let confirm {
                Button(confirm.button, role: .destructive) { perform(confirm) }
            }
            Button(L(.cancel), role: .cancel) {}
        } message: {
            Text(confirm?.message ?? "")
        }
    }

    private var endingsDetail: String {
        let opened = session.endings.filter { session.gallery.isOpened($0) }.count
        return "\(opened)/\(session.endings.count)"
    }

    private var appVersion: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "—"
    }

    private var divider: some View {
        Rectangle().fill(Theme.dim.opacity(0.3)).frame(height: 1).padding(.vertical, 8)
    }

    private func item(_ title: String, icon: String, detail: String? = nil, tint: Color? = nil,
                      enabled: Bool = true, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            row(title, icon: icon, detail: detail, tint: tint)
        }
        .buttonStyle(.plain)
        .disabled(!enabled)
        .opacity(enabled ? 1 : 0.5)
    }

    private func row(_ title: String, icon: String, detail: String? = nil, tint: Color? = nil) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .frame(width: 24)
            Text(title)
            Spacer()
            if let detail {
                Text(detail).foregroundStyle(Theme.dim)
            }
        }
        .font(Theme.button)
        .foregroundStyle(tint ?? Theme.text)
        .padding(.vertical, 10)
        .contentShape(Rectangle())
    }

    private func close() {
        session.menuOpen = false
    }

    private func startNewGame() {
        session.newGame()
        close()
    }

    private func perform(_ confirmation: Confirmation) {
        switch confirmation {
        case .newGame: startNewGame()
        case .reset:
            session.resetProgress()
            close()
        }
    }
}

private enum DrawerSheet: String, Identifiable {
    case settings, endings, about, privacy
    var id: String { rawValue }
}

private enum Confirmation {
    case newGame, reset

    var title: String {
        switch self {
        case .newGame: return L(.newGameConfirm)
        case .reset: return L(.resetProgress)
        }
    }

    var button: String {
        switch self {
        case .newGame: return L(.newGameConfirm)
        case .reset: return L(.resetConfirm)
        }
    }

    var message: String {
        switch self {
        case .newGame: return L(.newGameWarning)
        case .reset: return L(.resetWarning)
        }
    }
}

/// Открытые концовки — названия и тексты; закрытые — замок и «ещё не открыта».
struct EndingsGalleryView: View {
    let session: GameSession
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                header(L(.endings), dismiss: { dismiss() })
                ForEach(session.endings) { ending in
                    let opened = session.gallery.isOpened(ending)
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Image(systemName: opened ? "book" : "lock")
                            Text(opened ? ending.title : "? ? ?")
                        }
                        .font(Theme.button)
                        .foregroundStyle(opened ? (ending.stat == nil ? Theme.accent : Theme.bad) : Theme.dim)
                        Text(opened ? ending.text : L(.endingLocked))
                            .font(Theme.body)
                            .foregroundStyle(opened ? Theme.text : Theme.dim)
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

/// Простой экран с заголовком и текстом: «Об истории», «Приватность».
struct InfoView: View {
    let title: String
    let text: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                header(title, dismiss: { dismiss() })
                Text(text)
                    .font(Theme.body)
                    .foregroundStyle(Theme.text)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(24)
        }
        .background(Theme.background.ignoresSafeArea())
    }
}

/// Заголовок листа с кнопкой «Готово».
func header(_ title: String, dismiss: @escaping () -> Void) -> some View {
    HStack {
        Text(title)
            .font(Theme.title)
            .foregroundStyle(Theme.accent)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
        Spacer()
        Button(L(.done), action: dismiss)
            .font(Theme.button)
            .foregroundStyle(Theme.accent)
    }
}
