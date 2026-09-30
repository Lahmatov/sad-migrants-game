import XCTest
@testable import MigrantCore

final class RequirementTests: XCTestCase {
    private var state = GameState(
        stats: Stats(money: 500, nerves: 30, documents: 10, home: 60, belonging: 0),
        act: "a",
        rng: SeededRandom(seed: 1),
        flags: ["has_nif", "has_plaid"],
        counters: ["kg": 20],
        day: 40,
        actStartDay: 30
    )

    func testMissingRequirementIsMet() {
        XCTAssertTrue(state.meets(nil))
    }

    func testEmptyRequirementIsMet() {
        XCTAssertTrue(state.meets(Requirement()))
    }

    func testAllFlagsMustBeSet() {
        XCTAssertTrue(state.meets(Requirement(flags: ["has_nif", "has_plaid"])))
        XCTAssertFalse(state.meets(Requirement(flags: ["has_nif", "has_bank"])))
    }

    func testNotFlagsBlocksWhenAnyIsSet() {
        XCTAssertFalse(state.meets(Requirement(notFlags: ["has_bank", "has_plaid"])))
        XCTAssertTrue(state.meets(Requirement(notFlags: ["has_bank"])))
    }

    func testAnyFlagsNeedsAtLeastOne() {
        XCTAssertTrue(state.meets(Requirement(anyFlags: ["has_bank", "has_nif"])))
        XCTAssertFalse(state.meets(Requirement(anyFlags: ["has_bank", "has_job"])))
    }

    func testEmptyAnyFlagsIsNeverMet() {
        // «Хотя бы один из пустого списка» — невыполнимо, как и в py-копии.
        XCTAssertFalse(state.meets(Requirement(anyFlags: [])))
    }

    func testMinStatsIsInclusive() {
        XCTAssertTrue(state.meets(Requirement(minStats: StatNumbers(money: 500))))
        XCTAssertFalse(state.meets(Requirement(minStats: StatNumbers(money: 501))))
    }

    func testMaxStatsIsInclusive() {
        XCTAssertTrue(state.meets(Requirement(maxStats: StatNumbers(nerves: 30))))
        XCTAssertFalse(state.meets(Requirement(maxStats: StatNumbers(nerves: 29))))
    }

    func testMissingCounterCountsAsZero() {
        XCTAssertTrue(state.meets(Requirement(maxCounters: ["aima_calls": 0])))
        XCTAssertFalse(state.meets(Requirement(minCounters: ["aima_calls": 1])))
    }

    func testCounterBounds() {
        XCTAssertTrue(state.meets(Requirement(minCounters: ["kg": 20])))
        XCTAssertFalse(state.meets(Requirement(minCounters: ["kg": 24])))
        XCTAssertFalse(state.meets(Requirement(maxCounters: ["kg": 19])))
    }

    func testFromDayCountsFromGameStart() {
        XCTAssertTrue(state.meets(Requirement(fromDay: 40)))
        XCTAssertFalse(state.meets(Requirement(fromDay: 41)))
    }

    func testFromActDayCountsFromActStart() {
        XCTAssertEqual(state.actDay, 10)
        XCTAssertTrue(state.meets(Requirement(fromActDay: 10)))
        XCTAssertFalse(state.meets(Requirement(fromActDay: 11)))
    }

    func testAllPartsMustHoldTogether() {
        let requirement = Requirement(flags: ["has_nif"], minStats: StatNumbers(money: 1000))
        XCTAssertFalse(state.meets(requirement))
    }
}
