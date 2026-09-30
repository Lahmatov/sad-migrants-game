import XCTest
@testable import MigrantCore

final class StatsTests: XCTestCase {
    private var stats = Stats(money: 100, nerves: 50, documents: 50, home: 95, belonging: 3)

    func testApplyAddsChanges() {
        stats.apply(StatNumbers(money: 50, nerves: -10))
        XCTAssertEqual(stats.money, 150)
        XCTAssertEqual(stats.nerves, 40)
    }

    func testPercentStatIsCappedAt100() {
        stats.apply(StatNumbers(home: 20))
        XCTAssertEqual(stats.home, 100)
    }

    func testStatDoesNotGoBelowZero() {
        stats.apply(StatNumbers(belonging: -10))
        XCTAssertEqual(stats.belonging, 0)
    }

    func testMoneyHasNoUpperCap() {
        stats.apply(StatNumbers(money: 1_000_000))
        XCTAssertEqual(stats.money, 1_000_100)
    }

    func testMoneyDoesNotGoNegative() {
        stats.apply(StatNumbers(money: -500))
        XCTAssertEqual(stats.money, 0)
    }

    func testAppliedReportsActualChangeAfterClamping() {
        let applied = stats.apply(StatNumbers(home: 20, belonging: -10))
        XCTAssertEqual(applied.home, 5)
        XCTAssertEqual(applied.belonging, -3)
    }

    func testAppliedOmitsStatsThatDidNotMove() {
        stats.home = 100
        let applied = stats.apply(StatNumbers(nerves: 0, home: 10))
        XCTAssertTrue(applied.isEmpty)
    }

    func testEmptyDeltaChangesNothing() {
        let before = stats
        stats.apply(StatNumbers())
        XCTAssertEqual(stats, before)
    }

    func testHugeMoneyChangeDoesNotOverflow() {
        stats.money = Int.max - 1
        stats.apply(StatNumbers(money: 10))
        XCTAssertEqual(stats.money, Int.max)
    }

    func testSubscriptReadsAndWritesEveryStat() {
        for stat in Stat.allCases {
            stats[stat] = 7
            XCTAssertEqual(stats[stat], 7, "\(stat)")
        }
    }
}
