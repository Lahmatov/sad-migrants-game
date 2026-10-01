import Foundation
import MigrantCore
import Observation

/// Партия на экране: движок, текущая фаза и сохранение на диск.
@Observable
final class GameSession {
    enum Phase: Equatable {
        case title
        /// Вступление перед новой партией.
        case intro
        case card
        /// Итог выбора показывается поверх карточки, на которой он сделан.
        case outcome(Card, Outcome)
        /// `isNew` — концовка открыта впервые.
        case ending(Ending, isNew: Bool)
    }

    private(set) var engine: GameEngine?
    private(set) var phase: Phase = .title
    private(set) var loadError: String?
    private(set) var gallery = EndingGallery()
    /// Концовка, открытая этим выбором впервые, — до показа экрана концовки.
    private var freshEnding = false

    private let content: GameContent?
    private let saveURL = URL.applicationSupportDirectory.appending(path: "save.json")
    private let galleryURL = URL.applicationSupportDirectory.appending(path: "endings.json")

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
        if let data = try? Data(contentsOf: galleryURL),
           let saved = try? JSONDecoder().decode(EndingGallery.self, from: data) {
            gallery = saved
        }
    }

    var canContinue: Bool {
        guard let engine else { return false }
        return !engine.isFinished
    }

    var introStanzas: [[String]] {
        content?.introStanzas ?? []
    }

    /// «Открыто 3 из 9» — для титульного экрана и концовки.
    var galleryProgress: (opened: Int, total: Int)? {
        guard let content else { return nil }
        let opened = gallery.openedCount(in: content)
        return opened > 0 ? (opened, content.endings.count) : nil
    }

    func newGame() {
        guard let content else { return }
        engine = GameEngine(content: content, seed: UInt64.random(in: .min ... .max))
        phase = introStanzas.isEmpty ? .card : .intro
        save()
    }

    func finishIntro() {
        phase = .card
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
        if let ending = outcome.ending {
            freshEnding = gallery.record(ending.id)
            saveGallery()
        }
        if outcome.result == nil, outcome.applied.isEmpty, outcome.ending == nil {
            phase = .card
        } else {
            phase = .outcome(card, outcome)
        }
    }

    func dismissOutcome() {
        if let ending = engine?.ending {
            phase = .ending(ending, isNew: freshEnding)
            freshEnding = false
        } else {
            phase = .card
        }
    }

    func backToTitle() {
        phase = .title
    }

    private func save() {
        guard let engine else { return }
        write(engine.state, to: saveURL)
    }

    private func saveGallery() {
        write(gallery, to: galleryURL)
    }

    private func write<T: Encodable>(_ value: T, to url: URL) {
        do {
            try FileManager.default.createDirectory(at: url.deletingLastPathComponent(),
                                                    withIntermediateDirectories: true)
            try JSONEncoder().encode(value).write(to: url, options: .atomic)
        } catch {
            // Не сохранилось — игра продолжается, потеряется только прогресс
            // при закрытии. Показывать ошибку посреди сцены хуже.
        }
    }
}
