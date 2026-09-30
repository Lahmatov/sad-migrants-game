public enum GameError: Error, Equatable {
    case finished
    case noCard
    case choiceOutOfRange
    case choiceUnavailable
}

/// Итог одного выбора — то, что экран показывает между карточками.
public struct Outcome: Equatable, Sendable {
    public let result: String?
    /// Фактические изменения шкал (после зажима в границы).
    public let applied: StatNumbers
    public let ending: Ending?

    public init(result: String?, applied: StatNumbers, ending: Ending?) {
        self.result = result
        self.applied = applied
        self.ending = ending
    }
}

/// Правила игры: какая карточка сейчас, что делает выбор, какая следующая.
///
/// Порядок выбора следующей карточки:
/// 1. `next` из эффектов — первая карточка, чьё условие выполнено;
/// 2. отложенные карточки, чей день наступил (сначала самые ранние);
/// 3. случайная карточка из колоды текущего акта (по весам);
/// 4. запасная карточка акта.
public struct GameEngine: Sendable {
    public let content: GameContent
    public private(set) var state: GameState

    public init(content: GameContent, seed: UInt64) {
        self.content = content
        var state = GameState(stats: content.start.stats, act: content.start.act,
                              rng: SeededRandom(seed: seed))
        state.currentCardId = content.start.card
        self.state = state
    }

    /// Восстанавливает партию из сохранения. Если после обновления сценария
    /// сохранённой карточки больше нет, тянет новую, а не ломает партию.
    public init(content: GameContent, restoring state: GameState) {
        self.content = content
        self.state = state
        if state.endingId == nil, state.currentCardId.flatMap(content.card) == nil {
            self.state.currentCardId = drawNext(preferred: [], after: nil)
        }
    }

    public var currentCard: Card? {
        state.currentCardId.flatMap(content.card)
    }

    public var currentAct: Act? {
        content.act(state.act)
    }

    public var ending: Ending? {
        state.endingId.flatMap(content.ending)
    }

    public var isFinished: Bool {
        state.endingId != nil
    }

    /// Индексы вариантов текущей карточки, которые сейчас можно нажать.
    public var availableChoices: [Int] {
        guard let card = currentCard else { return [] }
        return card.choices.indices.filter { state.meets(card.choices[$0].requires) }
    }

    @discardableResult
    public mutating func choose(_ index: Int) throws -> Outcome {
        guard state.endingId == nil else { throw GameError.finished }
        guard let card = currentCard else { throw GameError.noCard }
        guard card.choices.indices.contains(index) else { throw GameError.choiceOutOfRange }
        let choice = card.choices[index]
        guard state.meets(choice.requires) else { throw GameError.choiceUnavailable }
        let effects = choice.effects ?? Effects()

        state.seen.insert(card.id)
        state.turn += 1
        let applied = effects.stats.map { state.stats.apply($0) } ?? StatNumbers()
        for flag in effects.setFlags ?? [] { state.flags.insert(flag) }
        for flag in effects.clearFlags ?? [] { state.flags.remove(flag) }
        for (name, amount) in effects.add ?? [:] { state.counters[name, default: 0] += amount }
        // Дни считаются по акту, в котором карточка сыграна, а не в который ведёт.
        state.day += Swift.max(effects.days ?? currentAct?.daysPerCard ?? 1, 0)
        for entry in effects.schedule ?? [] {
            state.scheduled.append(ScheduledCard(cardId: entry.card, dueDay: state.day + entry.inDays))
        }
        if let act = effects.act, act != state.act {
            state.act = act
            state.actStartDay = state.day
        }

        if let ending = resolveEnding(explicit: effects.ending) {
            state.endingId = ending.id
            state.currentCardId = nil
            return Outcome(result: choice.result, applied: applied, ending: ending)
        }
        state.currentCardId = drawNext(preferred: effects.next ?? [], after: card.id)
        return Outcome(result: choice.result, applied: applied, ending: nil)
    }

    /// Обнулившаяся шкала важнее сюжетной концовки: нельзя «счастливо
    /// обосноваться» с нулём на счету.
    private func resolveEnding(explicit: String?) -> Ending? {
        for ending in content.endings {
            if let stat = ending.stat, state.stats[stat] <= 0 { return ending }
        }
        return explicit.flatMap(content.ending)
    }

    private mutating func drawNext(preferred: [String], after previous: String?) -> String? {
        for id in preferred {
            if let card = content.card(id), state.meets(card.requires) { return id }
        }
        while let index = earliestDueIndex() {
            let entry = state.scheduled.remove(at: index)
            // Условие проверяется в момент показа: посылку, которую успели
            // задекларировать, обратно уже не отправят.
            if let card = content.card(entry.cardId), state.meets(card.requires) { return card.id }
        }
        let pool = content.cards.filter { card in
            card.act == state.act
                && (card.kind ?? .pool) == .pool
                && card.id != previous
                && (card.repeatable == true || !state.seen.contains(card.id))
                && state.meets(card.requires)
        }
        if let picked = pickWeighted(pool) { return picked.id }
        if let fallback = currentAct?.fallback, content.card(fallback) != nil { return fallback }
        return nil
    }

    private func earliestDueIndex() -> Int? {
        var best: Int?
        for (index, entry) in state.scheduled.enumerated() where entry.dueDay <= state.day {
            if let current = best, state.scheduled[current].dueDay <= entry.dueDay { continue }
            best = index
        }
        return best
    }

    private mutating func pickWeighted(_ cards: [Card]) -> Card? {
        let weights = cards.map { Swift.max($0.weight ?? 1, 0) }
        let total = weights.reduce(0, +)
        guard total > 0 else { return nil }
        var roll = state.rng.next(below: total)
        for (card, weight) in zip(cards, weights) {
            if roll < weight { return card }
            roll -= weight
        }
        return nil
    }
}
