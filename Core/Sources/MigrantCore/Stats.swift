/// Пять шкал игры. Любая, упавшая до нуля, заканчивает игру своей концовкой.
public enum Stat: String, CaseIterable, Codable, Sendable {
    /// Евро на счету. Без верхней границы: разбогатеть в эмиграции не запрещено.
    case money
    /// «Кукуха» — ментальное здоровье.
    case nerves
    /// Документы и статус: визы, NIF, ВНЖ.
    case documents
    /// Связь с домом: мама, друзья, прошлое.
    case home
    /// «Своя тут»: язык, друзья, укоренённость.
    case belonging

    /// Верхняя граница шкалы. Всё, кроме денег, — проценты.
    public var upperBound: Int { self == .money ? Int.max : 100 }
}

/// Набор чисел по шкалам, где любая может отсутствовать.
///
/// Одна структура на три случая: изменения от выбора, пороги в условиях
/// и фактически применённый результат. Отдельные типы дали бы три копии
/// одного и того же Codable с одинаковыми ключами.
public struct StatNumbers: Codable, Equatable, Sendable {
    public var money: Int?
    public var nerves: Int?
    public var documents: Int?
    public var home: Int?
    public var belonging: Int?

    public init(money: Int? = nil, nerves: Int? = nil, documents: Int? = nil,
                home: Int? = nil, belonging: Int? = nil) {
        self.money = money
        self.nerves = nerves
        self.documents = documents
        self.home = home
        self.belonging = belonging
    }

    public subscript(stat: Stat) -> Int? {
        get {
            switch stat {
            case .money: return money
            case .nerves: return nerves
            case .documents: return documents
            case .home: return home
            case .belonging: return belonging
            }
        }
        set {
            switch stat {
            case .money: money = newValue
            case .nerves: nerves = newValue
            case .documents: documents = newValue
            case .home: home = newValue
            case .belonging: belonging = newValue
            }
        }
    }

    public var isEmpty: Bool { Stat.allCases.allSatisfy { self[$0] == nil } }
}

/// Текущие значения шкал.
public struct Stats: Codable, Equatable, Sendable {
    public var money: Int
    public var nerves: Int
    public var documents: Int
    public var home: Int
    public var belonging: Int

    public init(money: Int, nerves: Int, documents: Int, home: Int, belonging: Int) {
        self.money = money
        self.nerves = nerves
        self.documents = documents
        self.home = home
        self.belonging = belonging
    }

    public subscript(stat: Stat) -> Int {
        get {
            switch stat {
            case .money: return money
            case .nerves: return nerves
            case .documents: return documents
            case .home: return home
            case .belonging: return belonging
            }
        }
        set {
            switch stat {
            case .money: money = newValue
            case .nerves: nerves = newValue
            case .documents: documents = newValue
            case .home: home = newValue
            case .belonging: belonging = newValue
            }
        }
    }

    /// Применяет изменения, зажимая шкалы в границы, и возвращает то,
    /// что изменилось на самом деле.
    ///
    /// Игроку показываем фактическое изменение: «+20 кукухи» при уже полной
    /// шкале выглядело бы обманом.
    @discardableResult
    public mutating func apply(_ delta: StatNumbers) -> StatNumbers {
        var applied = StatNumbers()
        for stat in Stat.allCases {
            guard let change = delta[stat], change != 0 else { continue }
            let before = self[stat]
            let (sum, overflow) = before.addingReportingOverflow(change)
            let raw = overflow ? (change > 0 ? Int.max : Int.min) : sum
            let after = Swift.min(Swift.max(raw, 0), stat.upperBound)
            self[stat] = after
            if after != before {
                applied[stat] = after - before
            }
        }
        return applied
    }
}
