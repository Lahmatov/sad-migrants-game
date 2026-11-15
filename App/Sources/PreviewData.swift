#if DEBUG
import Foundation
import MigrantCore

/// Данные для превью: настоящая игра из бандла, но сохранения — во временной
/// папке, так что Canvas не портит партию на устройстве.
@MainActor
enum PreviewData {
    enum Stage {
        case title, card, outcome
    }

    static func session(_ stage: Stage = .title) -> GameSession {
        let folder = URL.temporaryDirectory.appending(path: "preview-\(UUID().uuidString)")
        let session = GameSession(language: AppSettings.shared.value.language, folder: folder)
        guard stage != .title else { return session }
        session.newGame()
        session.finishIntro()
        if stage == .outcome, let first = session.engine?.availableChoices.first {
            session.choose(first)
        }
        return session
    }

    static let ending = Ending(
        id: "two_homes", title: "Два дома",
        text: "Ключи от квартиры в Лиссабоне лежат рядом с камнем из Батуми. Дом теперь — и там, и тут.")

    static let longText = String(repeating: "Очень длинный текст, который не помещается на экран. ", count: 30)
}
#endif
