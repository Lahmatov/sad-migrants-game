public struct ScheduledCard: Codable, Equatable, Sendable {
    public var cardId: String
    public var dueDay: Int

    public init(cardId: String, dueDay: Int) {
        self.cardId = cardId
        self.dueDay = dueDay
    }
}

/// Всё, что меняется за партию. Целиком сохраняется на диск.
public struct GameState: Codable, Equatable, Sendable {
    public var stats: Stats
    public var flags: Set<String>
    public var counters: [String: Int]
    public var day: Int
    public var act: String
    /// День, когда начался текущий акт.
    public var actStartDay: Int
    public var seen: Set<String>
    public var scheduled: [ScheduledCard]
    public var currentCardId: String?
    public var endingId: String?
    /// Сколько выборов сделано. Для статистики и «часа игры».
    public var turn: Int
    public var rng: SeededRandom

    public init(stats: Stats, act: String, rng: SeededRandom,
                flags: Set<String> = [], counters: [String: Int] = [:], day: Int = 0,
                actStartDay: Int = 0,
                seen: Set<String> = [], scheduled: [ScheduledCard] = [],
                currentCardId: String? = nil, endingId: String? = nil, turn: Int = 0) {
        self.stats = stats
        self.flags = flags
        self.counters = counters
        self.day = day
        self.act = act
        self.actStartDay = actStartDay
        self.seen = seen
        self.scheduled = scheduled
        self.currentCardId = currentCardId
        self.endingId = endingId
        self.turn = turn
        self.rng = rng
    }

    /// Сколько дней прошло с начала текущего акта.
    public var actDay: Int { day - actStartDay }

    public func counter(_ name: String) -> Int {
        counters[name] ?? 0
    }

    /// Выполнено ли условие. Отсутствующее условие выполняется всегда.
    public func meets(_ requirement: Requirement?) -> Bool {
        guard let requirement else { return true }
        if let flags = requirement.flags, !flags.allSatisfy(self.flags.contains) {
            return false
        }
        if let notFlags = requirement.notFlags, notFlags.contains(where: self.flags.contains) {
            return false
        }
        if let anyFlags = requirement.anyFlags, !anyFlags.contains(where: self.flags.contains) {
            return false
        }
        for stat in Stat.allCases {
            if let bound = requirement.minStats?[stat], stats[stat] < bound { return false }
            if let bound = requirement.maxStats?[stat], stats[stat] > bound { return false }
        }
        for (name, bound) in requirement.minCounters ?? [:] where counter(name) < bound {
            return false
        }
        for (name, bound) in requirement.maxCounters ?? [:] where counter(name) > bound {
            return false
        }
        if let fromDay = requirement.fromDay, day < fromDay {
            return false
        }
        if let fromActDay = requirement.fromActDay, actDay < fromActDay {
            return false
        }
        return true
    }
}
