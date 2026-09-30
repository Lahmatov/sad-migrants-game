import XCTest
@testable import MigrantCore

final class GameEngineTests: XCTestCase {
    private typealias T = TestContent

    // MARK: - Старт и выбор

    func testStartsWithStartCardAndStats() throws {
        let engine = GameEngine(content: try T.make(cards: [T.event("start")]), seed: 1)
        XCTAssertEqual(engine.currentCard?.id, "start")
        XCTAssertEqual(engine.state.stats, T.startStats)
        XCTAssertEqual(engine.state.act, "a")
    }

    func testChoiceAppliesStatsFlagsAndCounters() throws {
        let effects = Effects(stats: StatNumbers(money: -100), setFlags: ["has_nif"], add: ["kg": 3])
        var engine = GameEngine(content: try T.make(cards: [T.event("start", effects: effects)]), seed: 1)
        let outcome = try engine.choose(0)
        XCTAssertEqual(engine.state.stats.money, 900)
        XCTAssertTrue(engine.state.flags.contains("has_nif"))
        XCTAssertEqual(engine.state.counter("kg"), 3)
        XCTAssertEqual(outcome.applied.money, -100)
    }

    func testClearRemovesFlag() throws {
        let cards = [
            T.event("start", effects: Effects(setFlags: ["x"], next: ["second"])),
            T.event("second", effects: Effects(clearFlags: ["x"]))
        ]
        var engine = GameEngine(content: try T.make(cards: cards), seed: 1)
        try engine.choose(0)
        try engine.choose(0)
        XCTAssertFalse(engine.state.flags.contains("x"))
    }

    func testOutcomeCarriesResultText() throws {
        let card = Card(id: "start", kind: .event, text: "т",
                        choices: [Choice(label: "к", result: "итог")])
        var engine = GameEngine(content: try T.make(cards: [card]), seed: 1)
        XCTAssertEqual(try engine.choose(0).result, "итог")
    }

    func testDaysDefaultToActPace() throws {
        var engine = GameEngine(content: try T.make(cards: [T.event("start")]), seed: 1)
        try engine.choose(0)
        XCTAssertEqual(engine.state.day, 1)
    }

    func testExplicitDaysOverrideActPace() throws {
        let effects = Effects(days: 20)
        var engine = GameEngine(content: try T.make(cards: [T.event("start", effects: effects)]), seed: 1)
        try engine.choose(0)
        XCTAssertEqual(engine.state.day, 20)
    }

    func testNegativeDaysDoNotTurnTimeBack() throws {
        var engine = GameEngine(content: try T.make(cards: [T.event("start", effects: Effects(days: -5))]), seed: 1)
        try engine.choose(0)
        XCTAssertEqual(engine.state.day, 0)
    }

    func testTurnCountsChoices() throws {
        var engine = GameEngine(content: try T.make(cards: [T.event("start")]), seed: 1)
        try engine.choose(0)
        try engine.choose(0)
        XCTAssertEqual(engine.state.turn, 2)
    }

    // MARK: - Ошибки выбора

    func testChoiceOutOfRangeThrows() throws {
        var engine = GameEngine(content: try T.make(cards: [T.event("start")]), seed: 1)
        XCTAssertThrowsError(try engine.choose(5)) { XCTAssertEqual($0 as? GameError, .choiceOutOfRange) }
    }

    func testUnavailableChoiceThrowsAndChangesNothing() throws {
        let card = Card(id: "start", kind: .event, text: "т", choices: [
            Choice(label: "с пледом", requires: Requirement(flags: ["has_plaid"]),
                   effects: Effects(stats: StatNumbers(nerves: 10))),
            Choice(label: "без")
        ])
        var engine = GameEngine(content: try T.make(cards: [card]), seed: 1)
        XCTAssertEqual(engine.availableChoices, [1])
        XCTAssertThrowsError(try engine.choose(0)) { XCTAssertEqual($0 as? GameError, .choiceUnavailable) }
        XCTAssertEqual(engine.state.stats.nerves, 50)
    }

    func testChoosingAfterEndingThrows() throws {
        let effects = Effects(ending: "happy")
        var engine = GameEngine(content: try T.make(cards: [T.event("start", effects: effects)]), seed: 1)
        try engine.choose(0)
        XCTAssertThrowsError(try engine.choose(0)) { XCTAssertEqual($0 as? GameError, .finished) }
    }

    // MARK: - Следующая карточка

    func testNextPicksFirstCandidateWhoseRequirementHolds() throws {
        let cards = [
            T.event("start", effects: Effects(next: ["over", "ok"])),
            T.event("over", requires: Requirement(minCounters: ["kg": 24])),
            T.event("ok")
        ]
        var engine = GameEngine(content: try T.make(cards: cards), seed: 1)
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "ok")
    }

    func testNextMayRepeatAlreadySeenCard() throws {
        // Цикл «перевес → выложить → снова весы» держится на этом правиле.
        let cards = [
            T.event("start", effects: Effects(add: ["kg": 30], next: ["scales"])),
            Card(id: "scales", kind: .event, text: "весы",
                 requires: Requirement(minCounters: ["kg": 24]),
                 choices: [Choice(label: "выложить", effects: Effects(add: ["kg": -3], next: ["scales", "done"]))]),
            T.event("done")
        ]
        var engine = GameEngine(content: try T.make(cards: cards), seed: 1)
        try engine.choose(0)
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "scales")
        try engine.choose(0)
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "done")
    }

    func testFallsBackToPoolWhenNoCandidateHolds() throws {
        let cards = [
            T.event("start", effects: Effects(next: ["locked"])),
            T.event("locked", requires: Requirement(flags: ["never"])),
            T.pool("pooled")
        ]
        var engine = GameEngine(content: try T.make(cards: cards), seed: 1)
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "pooled")
    }

    func testPoolSkipsEventCards() throws {
        let cards = [T.event("start"), T.event("only_by_link")]
        var engine = GameEngine(content: try T.make(cards: cards), seed: 1)
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "fallback_a")
    }

    func testPoolCardIsShownOnlyOnce() throws {
        let cards = [T.event("start", effects: Effects(next: ["once"])), T.pool("once")]
        var engine = GameEngine(content: try T.make(cards: cards), seed: 1)
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "once")
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "fallback_a")
    }

    func testRepeatableCardDoesNotFollowItself() throws {
        let cards = [T.event("start"), T.pool("again", repeatable: true)]
        var engine = GameEngine(content: try T.make(cards: cards), seed: 1)
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "again")
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "fallback_a")
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "again")
    }

    func testZeroWeightCardNeverDrawn() throws {
        let cards = [T.event("start"), T.pool("hidden", weight: 0)]
        var engine = GameEngine(content: try T.make(cards: cards), seed: 1)
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "fallback_a")
    }

    func testPoolRespectsCardRequirement() throws {
        let cards = [T.event("start"), T.pool("needs_nif", requires: Requirement(flags: ["has_nif"]))]
        var engine = GameEngine(content: try T.make(cards: cards), seed: 1)
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "fallback_a")
    }

    func testPoolDrawsOnlyFromCurrentAct() throws {
        let other = CardFile(act: "b", cards: [T.pool("in_b")])
        let cards = [T.event("start", effects: Effects(act: "b"))]
        var engine = GameEngine(content: try T.make(cards: cards, extraFiles: [other]), seed: 1)
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "in_b")
    }

    // MARK: - Акты

    func testActChangeResetsActDay() throws {
        let cards = [T.event("start", effects: Effects(act: "b", days: 10))]
        var engine = GameEngine(content: try T.make(cards: cards), seed: 1)
        try engine.choose(0)
        XCTAssertEqual(engine.state.act, "b")
        XCTAssertEqual(engine.state.day, 10)
        XCTAssertEqual(engine.state.actDay, 0)
    }

    func testDaysAreCountedByActWhereCardWasPlayed() throws {
        // Акт «б» идёт по 3 дня за карточку, но переход в него стоит дни акта «а».
        let cards = [T.event("start", effects: Effects(act: "b"))]
        var engine = GameEngine(content: try T.make(cards: cards), seed: 1)
        try engine.choose(0)
        XCTAssertEqual(engine.state.day, 1)
        try engine.choose(0)
        XCTAssertEqual(engine.state.day, 4)
    }

    // MARK: - Отложенные карточки

    func testScheduledCardAppearsWhenDue() throws {
        let cards = [
            // День отсчёта — после хода: выбор на дне 1 с inDays 1 созревает на дне 2.
            T.event("start", effects: Effects(schedule: [Schedule(card: "parcel", inDays: 1)])),
            T.event("parcel")
        ]
        var engine = GameEngine(content: try T.make(cards: cards), seed: 1)
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "fallback_a", "день 1 — рано")
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "parcel", "день 2 — пора")
    }

    func testScheduledCardIsDroppedIfRequirementFailsWhenDue() throws {
        // Задекларировал посылку — обратно её уже не отправят.
        let cards = [
            T.event("start", effects: Effects(next: ["declare"],
                                              schedule: [Schedule(card: "returned", inDays: 1)])),
            T.event("declare", effects: Effects(setFlags: ["declared"])),
            T.event("returned", requires: Requirement(notFlags: ["declared"]))
        ]
        var engine = GameEngine(content: try T.make(cards: cards), seed: 1)
        try engine.choose(0)
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "fallback_a")
        XCTAssertTrue(engine.state.scheduled.isEmpty)
    }

    func testEarliestScheduledCardGoesFirst() throws {
        let cards = [
            T.event("start", effects: Effects(next: ["jump"],
                                              schedule: [Schedule(card: "late", inDays: 3),
                                                         Schedule(card: "early", inDays: 1)],
                                              days: 0)),
            T.event("jump", effects: Effects(days: 5)),
            T.event("early"),
            T.event("late")
        ]
        var engine = GameEngine(content: try T.make(cards: cards), seed: 1)
        try engine.choose(0)
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "early")
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "late")
    }

    func testForcedNextBeatsScheduledCard() throws {
        let cards = [
            T.event("start", effects: Effects(next: ["now"], schedule: [Schedule(card: "later", inDays: 0)])),
            T.event("now"),
            T.event("later")
        ]
        var engine = GameEngine(content: try T.make(cards: cards), seed: 1)
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "now")
        try engine.choose(0)
        XCTAssertEqual(engine.currentCard?.id, "later")
    }

    // MARK: - Концовки

    func testStatEndingWhenMoneyHitsZero() throws {
        let effects = Effects(stats: StatNumbers(money: -5000))
        var engine = GameEngine(content: try T.make(cards: [T.event("start", effects: effects)]), seed: 1)
        let outcome = try engine.choose(0)
        XCTAssertEqual(outcome.ending?.id, "broke")
        XCTAssertTrue(engine.isFinished)
        XCTAssertNil(engine.currentCard)
    }

    func testStatEndingBeatsStoryEnding() throws {
        let effects = Effects(stats: StatNumbers(nerves: -100), ending: "happy")
        var engine = GameEngine(content: try T.make(cards: [T.event("start", effects: effects)]), seed: 1)
        XCTAssertEqual(try engine.choose(0).ending?.id, "burnout")
    }

    func testStoryEnding() throws {
        var engine = GameEngine(content: try T.make(cards: [T.event("start", effects: Effects(ending: "happy"))]), seed: 1)
        XCTAssertEqual(try engine.choose(0).ending?.id, "happy")
        XCTAssertEqual(engine.ending?.id, "happy")
    }

    func testStatWithoutEndingDoesNotFinishGame() throws {
        // У «своей тут» нет концовки: ноль там — это старт, а не поражение.
        let effects = Effects(stats: StatNumbers(belonging: -10))
        var engine = GameEngine(content: try T.make(cards: [T.event("start", effects: effects)]), seed: 1)
        XCTAssertNil(try engine.choose(0).ending)
        XCTAssertFalse(engine.isFinished)
    }

    // MARK: - Случайность и сохранение

    func testSameSeedGivesSameGame() throws {
        let cards = [T.event("start")] + (1...10).map { T.pool("p\($0)") }
        let content = try T.make(cards: cards)
        func play(seed: UInt64) throws -> [String] {
            var engine = GameEngine(content: content, seed: seed)
            var shown: [String] = []
            for _ in 0..<10 {
                try engine.choose(0)
                shown.append(engine.currentCard?.id ?? "-")
            }
            return shown
        }
        XCTAssertEqual(try play(seed: 42), try play(seed: 42))
        XCTAssertNotEqual(try play(seed: 42), try play(seed: 43))
    }

    func testRestoredGameContinuesIdentically() throws {
        let cards = [T.event("start")] + (1...10).map { T.pool("p\($0)") }
        let content = try T.make(cards: cards)
        var original = GameEngine(content: content, seed: 7)
        try original.choose(0)
        let saved = try JSONEncoder().encode(original.state)
        var restored = GameEngine(content: content,
                                  restoring: try JSONDecoder().decode(GameState.self, from: saved))
        try original.choose(0)
        try restored.choose(0)
        XCTAssertEqual(original.state, restored.state)
    }

    func testRestoringWithRemovedCardDrawsNewOne() throws {
        let content = try T.make(cards: [T.event("start"), T.pool("still_here")])
        var state = GameEngine(content: content, seed: 1).state
        state.currentCardId = "deleted_in_update"
        let engine = GameEngine(content: content, restoring: state)
        XCTAssertEqual(engine.currentCard?.id, "still_here")
    }
}
