/// Условие показа карточки или варианта ответа. Все заданные части
/// должны выполняться одновременно; пустое условие выполняется всегда.
public struct Requirement: Codable, Equatable, Sendable {
    /// Все эти флаги должны быть установлены.
    public var flags: [String]?
    /// Ни один из этих флагов не должен быть установлен.
    public var notFlags: [String]?
    /// Хотя бы один из этих флагов должен быть установлен.
    public var anyFlags: [String]?
    /// Шкала не ниже значения.
    public var minStats: StatNumbers?
    /// Шкала не выше значения.
    public var maxStats: StatNumbers?
    /// Счётчик не меньше значения. Отсутствующий счётчик равен нулю.
    public var minCounters: [String: Int]?
    /// Счётчик не больше значения.
    public var maxCounters: [String: Int]?
    /// Не раньше этого игрового дня от начала партии.
    public var fromDay: Int?
    /// Не раньше этого дня от начала текущего акта. Удобнее `fromDay`:
    /// не ломается, когда предыдущие акты становятся длиннее.
    public var fromActDay: Int?

    public init(flags: [String]? = nil, notFlags: [String]? = nil, anyFlags: [String]? = nil,
                minStats: StatNumbers? = nil, maxStats: StatNumbers? = nil,
                minCounters: [String: Int]? = nil, maxCounters: [String: Int]? = nil,
                fromDay: Int? = nil, fromActDay: Int? = nil) {
        self.flags = flags
        self.notFlags = notFlags
        self.anyFlags = anyFlags
        self.minStats = minStats
        self.maxStats = maxStats
        self.minCounters = minCounters
        self.maxCounters = maxCounters
        self.fromDay = fromDay
        self.fromActDay = fromActDay
    }
}

/// Отложенная карточка: «через N дней случится вот это».
///
/// Главный инструмент отложенных последствий: не задекларировал посылку —
/// через две недели её отправят обратно маме.
public struct Schedule: Codable, Equatable, Sendable {
    public var card: String
    public var inDays: Int

    public init(card: String, inDays: Int) {
        self.card = card
        self.inDays = inDays
    }
}

/// Что происходит после выбора.
public struct Effects: Codable, Equatable, Sendable {
    public var stats: StatNumbers?
    public var setFlags: [String]?
    public var clearFlags: [String]?
    /// Прибавки к счётчикам: килограммы в чемодане, звонки в AIMA.
    public var add: [String: Int]?
    /// Кандидаты на следующую карточку: берётся первая, чьё условие
    /// выполнено. Так ветвление «перевес / не перевес» пишется без кода.
    public var next: [String]?
    public var schedule: [Schedule]?
    /// Переход в другой акт.
    public var act: String?
    /// Сколько дней проходит. Если не задано — сколько обычно в этом акте.
    public var days: Int?
    /// Концовка по сюжету, а не по обнулившейся шкале.
    public var ending: String?

    enum CodingKeys: String, CodingKey {
        case stats
        case setFlags = "set"
        case clearFlags = "clear"
        case add, next, schedule, act, days, ending
    }

    public init(stats: StatNumbers? = nil, setFlags: [String]? = nil, clearFlags: [String]? = nil,
                add: [String: Int]? = nil, next: [String]? = nil, schedule: [Schedule]? = nil,
                act: String? = nil, days: Int? = nil, ending: String? = nil) {
        self.stats = stats
        self.setFlags = setFlags
        self.clearFlags = clearFlags
        self.add = add
        self.next = next
        self.schedule = schedule
        self.act = act
        self.days = days
        self.ending = ending
    }
}

/// Кнопка ответа.
public struct Choice: Codable, Equatable, Sendable {
    public var label: String
    /// Текст последствия, который показывается после нажатия.
    public var result: String?
    /// Кнопка видна только при выполнении условия: «укрыться пледом» — если плед взят.
    public var requires: Requirement?
    public var effects: Effects?

    public init(label: String, result: String? = nil, requires: Requirement? = nil,
                effects: Effects? = nil) {
        self.label = label
        self.result = result
        self.requires = requires
        self.effects = effects
    }
}

public enum CardKind: String, Codable, Sendable {
    /// Может выпасть случайно, пока игрок в акте этой карточки.
    case pool
    /// Показывается только по ссылке: `next`, `schedule` или как стартовая.
    case event
}

public struct Card: Codable, Equatable, Identifiable, Sendable {
    public var id: String
    /// Акт берётся из файла, в котором лежит карточка, — в JSON не пишется.
    public var act: String?
    public var kind: CardKind?
    /// Имя картинки сцены. Список картинок — в docs/art.md.
    public var scene: String?
    public var speaker: String?
    public var text: String
    public var requires: Requirement?
    /// Можно показать повторно. По умолчанию карточка показывается один раз.
    public var repeatable: Bool?
    /// Вес при случайном выборе. Ноль — никогда не выпадает сама.
    public var weight: Int?
    public var choices: [Choice]

    public init(id: String, act: String? = nil, kind: CardKind? = nil, scene: String? = nil,
                speaker: String? = nil, text: String, requires: Requirement? = nil,
                repeatable: Bool? = nil, weight: Int? = nil, choices: [Choice]) {
        self.id = id
        self.act = act
        self.kind = kind
        self.scene = scene
        self.speaker = speaker
        self.text = text
        self.requires = requires
        self.repeatable = repeatable
        self.weight = weight
        self.choices = choices
    }
}

public struct Act: Codable, Equatable, Identifiable, Sendable {
    public var id: String
    public var title: String
    /// Сколько игровых дней обычно проходит за одну карточку.
    public var daysPerCard: Int?
    /// Повторяемая карточка на случай, когда в акте нечего показать.
    public var fallback: String?

    public init(id: String, title: String, daysPerCard: Int? = nil, fallback: String? = nil) {
        self.id = id
        self.title = title
        self.daysPerCard = daysPerCard
        self.fallback = fallback
    }
}

public struct Ending: Codable, Equatable, Identifiable, Sendable {
    public var id: String
    public var title: String
    public var text: String
    /// Если задано — концовка срабатывает, когда эта шкала падает до нуля.
    public var stat: Stat?

    public init(id: String, title: String, text: String, stat: Stat? = nil) {
        self.id = id
        self.title = title
        self.text = text
        self.stat = stat
    }
}

public struct StartState: Codable, Equatable, Sendable {
    public var act: String
    public var card: String
    public var stats: Stats

    public init(act: String, card: String, stats: Stats) {
        self.act = act
        self.card = card
        self.stats = stats
    }
}

/// Файл `game.json`: всё, кроме карточек.
public struct GameFile: Codable, Equatable, Sendable {
    public var start: StartState
    public var acts: [Act]
    public var endings: [Ending]

    public init(start: StartState, acts: [Act], endings: [Ending]) {
        self.start = start
        self.acts = acts
        self.endings = endings
    }
}

/// Файл `cards/*.json`: карточки одного акта.
public struct CardFile: Codable, Equatable, Sendable {
    public var act: String
    public var cards: [Card]

    public init(act: String, cards: [Card]) {
        self.act = act
        self.cards = cards
    }
}

public enum ContentError: Error, Equatable {
    case duplicateCard(String)
    case badFile(name: String, reason: String)
    case missingBundle
}

/// Весь сценарий, собранный из файлов, с быстрым поиском по id.
public struct GameContent: Sendable {
    public let start: StartState
    public let acts: [Act]
    public let endings: [Ending]
    /// Порядок карточек стабилен (по файлам и внутри файла): от него
    /// зависит случайный выбор, а значит — воспроизводимость партий.
    public let cards: [Card]

    private let cardIndex: [String: Int]
    private let actIndex: [String: Act]
    private let endingIndex: [String: Ending]

    public init(game: GameFile, cardFiles: [CardFile]) throws {
        var cards: [Card] = []
        var index: [String: Int] = [:]
        for file in cardFiles {
            for var card in file.cards {
                guard index[card.id] == nil else { throw ContentError.duplicateCard(card.id) }
                card.act = file.act
                index[card.id] = cards.count
                cards.append(card)
            }
        }
        self.start = game.start
        self.acts = game.acts
        self.endings = game.endings
        self.cards = cards
        self.cardIndex = index
        // Дубли актов и концовок ловит валидатор; здесь побеждает первый.
        self.actIndex = Dictionary(game.acts.map { ($0.id, $0) }, uniquingKeysWith: { first, _ in first })
        self.endingIndex = Dictionary(game.endings.map { ($0.id, $0) }, uniquingKeysWith: { first, _ in first })
    }

    public func card(_ id: String) -> Card? {
        cardIndex[id].map { cards[$0] }
    }

    public func act(_ id: String) -> Act? {
        actIndex[id]
    }

    public func ending(_ id: String) -> Ending? {
        endingIndex[id]
    }
}
