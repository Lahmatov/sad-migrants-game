@testable import MigrantCore

/// Маленький сценарий для тестов движка: настоящий слишком велик, чтобы
/// по нему проверять отдельные правила.
enum TestContent {
    static let startStats = Stats(money: 1000, nerves: 50, documents: 50, home: 50, belonging: 0)

    static let endings = [
        Ending(id: "broke", title: "Нет денег", text: "", stat: .money),
        Ending(id: "burnout", title: "Выгорание", text: "", stat: .nerves),
        Ending(id: "happy", title: "Хорошо", text: "")
    ]

    static func make(cards: [Card], acts: [Act]? = nil, startCard: String = "start",
                     stats: Stats = startStats, extraFiles: [CardFile] = []) throws -> GameContent {
        let game = GameFile(
            start: StartState(act: "a", card: startCard, stats: stats),
            acts: acts ?? [
                Act(id: "a", title: "Первый", daysPerCard: 1, fallback: "fallback_a"),
                Act(id: "b", title: "Второй", daysPerCard: 3, fallback: "fallback_b")
            ],
            endings: endings
        )
        let fallbacks = CardFile(act: "b", cards: [
            Card(id: "fallback_b", kind: .event, text: "запасная Б", repeatable: true,
                 choices: [Choice(label: "дальше")])
        ])
        let mainFile = CardFile(act: "a", cards: cards + [
            Card(id: "fallback_a", kind: .event, text: "запасная А", repeatable: true,
                 choices: [Choice(label: "дальше")])
        ])
        return try GameContent(game: game, cardFiles: [mainFile, fallbacks] + extraFiles)
    }

    /// Карточка-событие с одной кнопкой.
    static func event(_ id: String, requires: Requirement? = nil, effects: Effects = Effects()) -> Card {
        Card(id: id, kind: .event, text: id, requires: requires,
             choices: [Choice(label: "ок", effects: effects)])
    }

    /// Карточка из колоды с одной кнопкой.
    static func pool(_ id: String, requires: Requirement? = nil, weight: Int? = nil,
                     repeatable: Bool? = nil, effects: Effects = Effects()) -> Card {
        Card(id: id, kind: .pool, text: id, requires: requires, repeatable: repeatable,
             weight: weight, choices: [Choice(label: "ок", effects: effects)])
    }
}
