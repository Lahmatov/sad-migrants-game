import Foundation
import MigrantCore
import Observation

/// Партия на экране: движок, текущая фаза и сохранение на диск.
@MainActor
@Observable
final class GameSession {
    enum Phase: Equatable {
        case title
        case card
        /// Итог выбора показывается поверх карточки, на которой он сделан.
        case outcome(Card, Outcome)
        case ending(Ending)
    }

    private(set) var engine: GameEngine?
    private(set) var phase: Phase = .title
    private(set) var loadError: String?

    private let content: GameContent?
    private let saveURL = URL.applicationSupportDirectory.appending(path: "save.json")

    init() {
        do {
            content = try ContentLoader.bundled()
        } catch {
            content = nil
            loadError = String(describing: error)
        }
        if let content,
           let data = try? Data(contentsOf: saveURL),
           let state = try? JSONDecoder().decode(GameState.self, from: data) {
            engine = GameEngine(content: content, restoring: state)
        }
    }

    var canContinue: Bool {
        guard let engine else { return false }
        return !engine.isFinished
    }

    func newGame() {
        guard let content else { return }
        engine = GameEngine(content: content, seed: UInt64.random(in: .min ... .max))
        phase = .card
        save()
    }

    func continueGame() {
        guard canContinue else { return }
        phase = .card
    }

    func choose(_ index: Int) {
        guard var engine, let card = engine.currentCard else { return }
        // Недоступную кнопку экран не показывает, так что ошибка тут — баг
        // сценария, а не игрока. Партию из-за неё не роняем.
        guard let outcome = try? engine.choose(index) else { return }
        self.engine = engine
        save()
        if outcome.result == nil, outcome.applied.isEmpty, outcome.ending == nil {
            phase = .card
        } else {
            phase = .outcome(card, outcome)
        }
    }

    func dismissOutcome() {
        if let ending = engine?.ending {
            phase = .ending(ending)
        } else {
            phase = .card
        }
    }

    func backToTitle() {
        phase = .title
    }

    private func save() {
        guard let engine else { return }
        do {
            try FileManager.default.createDirectory(at: saveURL.deletingLastPathComponent(),
                                                    withIntermediateDirectories: true)
            try JSONEncoder().encode(engine.state).write(to: saveURL, options: .atomic)
        } catch {
            // Не сохранилось — игра продолжается, потеряется только прогресс
            // при закрытии. Показывать ошибку посреди сцены хуже.
        }
    }
}
