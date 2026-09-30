import Foundation
import XCTest
@testable import MigrantCore

final class ContentLoaderTests: XCTestCase {
    private var directory: URL!

    override func setUpWithError() throws {
        directory = FileManager.default.temporaryDirectory
            .appendingPathComponent("migrant-content-\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: directory.appendingPathComponent("cards"),
                                                withIntermediateDirectories: true)
    }

    override func tearDownWithError() throws {
        try? FileManager.default.removeItem(at: directory)
    }

    private let gameJSON = """
    {
      "start": { "act": "a", "card": "c1",
                 "stats": { "money": 1, "nerves": 1, "documents": 1, "home": 1, "belonging": 0 } },
      "acts": [ { "id": "a", "title": "А", "fallback": "c1" } ],
      "endings": [ { "id": "broke", "title": "Т", "text": "Т", "stat": "money" } ]
    }
    """

    private func write(_ text: String, to name: String) throws {
        try text.write(to: directory.appendingPathComponent(name), atomically: true, encoding: .utf8)
    }

    func testLoadsGameAndCardsAndStampsAct() throws {
        try write(gameJSON, to: "game.json")
        try write("""
        { "act": "a", "cards": [
          { "id": "c1", "repeatable": true, "text": "т",
            "choices": [ { "label": "к", "effects": { "set": ["x"], "clear": ["y"], "next": ["c1"] } } ] }
        ] }
        """, to: "cards/1.json")
        let content = try ContentLoader.load(from: directory)
        let card = try XCTUnwrap(content.card("c1"))
        XCTAssertEqual(card.act, "a")
        XCTAssertEqual(card.choices[0].effects?.setFlags, ["x"])
        XCTAssertEqual(card.choices[0].effects?.clearFlags, ["y"])
        XCTAssertEqual(content.ending("broke")?.stat, .money)
    }

    func testCardFilesAreReadInNameOrder() throws {
        try write(gameJSON, to: "game.json")
        try write(#"{ "act": "a", "cards": [ { "id": "second", "text": "т", "choices": [] } ] }"#, to: "cards/2.json")
        try write(#"{ "act": "a", "cards": [ { "id": "c1", "text": "т", "choices": [] } ] }"#, to: "cards/1.json")
        let content = try ContentLoader.load(from: directory)
        XCTAssertEqual(content.cards.map(\.id), ["c1", "second"])
    }

    func testNonJSONFilesInCardsAreIgnored() throws {
        try write(gameJSON, to: "game.json")
        try write(#"{ "act": "a", "cards": [ { "id": "c1", "text": "т", "choices": [] } ] }"#, to: "cards/1.json")
        try write("заметки сценариста", to: "cards/notes.txt")
        XCTAssertEqual(try ContentLoader.load(from: directory).cards.count, 1)
    }

    func testBrokenJSONNamesTheFile() throws {
        try write(gameJSON, to: "game.json")
        try write(#"{ "act": "a", "cards": [ { "id": "c1", } ] }"#, to: "cards/broken.json")
        XCTAssertThrowsError(try ContentLoader.load(from: directory)) { error in
            guard case ContentError.badFile(let name, _) = error else {
                return XCTFail("ожидалась badFile, пришло \(error)")
            }
            XCTAssertEqual(name, "broken.json")
        }
    }

    func testMissingRequiredFieldFails() throws {
        try write(gameJSON, to: "game.json")
        try write(#"{ "act": "a", "cards": [ { "id": "c1", "choices": [] } ] }"#, to: "cards/1.json")
        XCTAssertThrowsError(try ContentLoader.load(from: directory))
    }

    func testUnknownCardKindFails() throws {
        try write(gameJSON, to: "game.json")
        try write(#"{ "act": "a", "cards": [ { "id": "c1", "kind": "boss", "text": "т", "choices": [] } ] }"#,
                  to: "cards/1.json")
        XCTAssertThrowsError(try ContentLoader.load(from: directory))
    }

    func testUnknownStatInEndingFails() throws {
        try write(gameJSON.replacingOccurrences(of: #""stat": "money""#, with: #""stat": "karma""#),
                  to: "game.json")
        XCTAssertThrowsError(try ContentLoader.load(from: directory)) { error in
            guard case ContentError.badFile(let name, _) = error else {
                return XCTFail("ожидалась badFile, пришло \(error)")
            }
            XCTAssertEqual(name, "game.json")
        }
    }

    func testMissingGameFileFails() {
        XCTAssertThrowsError(try ContentLoader.load(from: directory))
    }

    func testDuplicateCardIdFails() throws {
        try write(gameJSON, to: "game.json")
        try write(#"{ "act": "a", "cards": [ { "id": "c1", "text": "т", "choices": [] } ] }"#, to: "cards/1.json")
        try write(#"{ "act": "a", "cards": [ { "id": "c1", "text": "т", "choices": [] } ] }"#, to: "cards/2.json")
        XCTAssertThrowsError(try ContentLoader.load(from: directory)) {
            XCTAssertEqual($0 as? ContentError, .duplicateCard("c1"))
        }
    }
}

final class ContentValidatorTests: XCTestCase {
    private typealias T = TestContent

    func testCleanContentHasNoProblems() throws {
        let content = try T.make(cards: [T.event("start")])
        XCTAssertEqual(ContentValidator.problems(in: content), [])
    }

    func testBrokenNextIsReported() throws {
        let content = try T.make(cards: [T.event("start", effects: Effects(next: ["nowhere"]))])
        XCTAssertTrue(ContentValidator.problems(in: content).contains { $0.contains("nowhere") })
    }

    func testBrokenScheduleActAndEndingAreReported() throws {
        let effects = Effects(schedule: [Schedule(card: "ghost", inDays: 1)], act: "mars", ending: "fin")
        let problems = ContentValidator.problems(in: try T.make(cards: [T.event("start", effects: effects)]))
        XCTAssertTrue(problems.contains { $0.contains("ghost") })
        XCTAssertTrue(problems.contains { $0.contains("mars") })
        XCTAssertTrue(problems.contains { $0.contains("fin") })
    }

    func testCardWhereEveryChoiceIsConditionalIsReported() throws {
        let card = Card(id: "start", kind: .event, text: "т", choices: [
            Choice(label: "с пледом", requires: Requirement(flags: ["has_plaid"]))
        ])
        let problems = ContentValidator.problems(in: try T.make(cards: [card]))
        XCTAssertTrue(problems.contains { $0.contains("застрять") })
    }

    func testCardWithoutChoicesIsReported() throws {
        let card = Card(id: "start", kind: .event, text: "т", choices: [])
        let problems = ContentValidator.problems(in: try T.make(cards: [card]))
        XCTAssertTrue(problems.contains { $0.contains("нет вариантов") })
    }

    func testMissingStartCardIsReported() throws {
        let content = try T.make(cards: [T.event("start")], startCard: "nope")
        XCTAssertTrue(ContentValidator.problems(in: content).contains { $0.contains("nope") })
    }

    func testActWithoutFallbackIsReported() throws {
        let content = try T.make(cards: [T.event("start")],
                                 acts: [Act(id: "a", title: "А"), Act(id: "b", title: "Б", fallback: "fallback_b")])
        XCTAssertTrue(ContentValidator.problems(in: content).contains { $0.contains("акт a") })
    }

    func testNonRepeatableFallbackIsReported() throws {
        let content = try T.make(cards: [T.event("start"), T.event("once")],
                                 acts: [Act(id: "a", title: "А", fallback: "once"),
                                        Act(id: "b", title: "Б", fallback: "fallback_b")])
        XCTAssertTrue(ContentValidator.problems(in: content).contains { $0.contains("не повторяемая") })
    }
}

/// Проверки настоящего сценария из бандла.
final class BundledContentTests: XCTestCase {
    func testBundledContentLoads() throws {
        let content = try ContentLoader.bundled()
        XCTAssertGreaterThan(content.cards.count, 50)
    }

    func testBundledContentHasNoProblems() throws {
        let problems = ContentValidator.problems(in: try ContentLoader.bundled())
        XCTAssertEqual(problems, [], problems.joined(separator: "\n"))
    }

    /// Случайные прохождения: игра всегда заканчивается концовкой и ни разу
    /// не остаётся без карточки. Ловит тупики, которые не видны по ссылкам.
    func testRandomPlaythroughsAlwaysReachAnEnding() throws {
        let content = try ContentLoader.bundled()
        for seed in UInt64(0)..<200 {
            var engine = GameEngine(content: content, seed: seed)
            var picker = SeededRandom(seed: seed &+ 1000)
            var turns = 0
            while !engine.isFinished && turns < 1000 {
                let options = engine.availableChoices
                XCTAssertFalse(options.isEmpty, "сид \(seed): нет доступных кнопок на \(engine.currentCard?.id ?? "-")")
                guard !options.isEmpty else { break }
                try engine.choose(options[picker.next(below: options.count)])
                turns += 1
            }
            XCTAssertTrue(engine.isFinished, "сид \(seed): партия не закончилась за \(turns) ходов")
        }
    }
}

final class SeededRandomTests: XCTestCase {
    func testSameSeedSameSequence() {
        var a = SeededRandom(seed: 99)
        var b = SeededRandom(seed: 99)
        XCTAssertEqual((0..<5).map { _ in a.next() }, (0..<5).map { _ in b.next() })
    }

    func testBoundOfOneAlwaysGivesZero() {
        var random = SeededRandom(seed: 3)
        XCTAssertTrue((0..<50).allSatisfy { _ in random.next(below: 1) == 0 })
    }

    func testValuesStayBelowBound() {
        var random = SeededRandom(seed: 5)
        XCTAssertTrue((0..<500).allSatisfy { _ in (0..<7).contains(random.next(below: 7)) })
    }
}
