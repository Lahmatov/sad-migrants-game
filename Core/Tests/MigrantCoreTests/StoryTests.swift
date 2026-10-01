import XCTest
@testable import MigrantCore

/// Ключевые истории настоящего сценария ведут туда, куда задумано.
///
/// Партия ставится прямо на нужную карточку с нужными флагами и шкалами —
/// так проверяется одна история, а не вся игра. Те же проверки есть
/// в tools/test_content.py, чтобы гонять их без Mac.
final class StoryTests: XCTestCase {
    private static let content = Result { try ContentLoader.bundled() }

    private func engine(at cardId: String, act: String, flags: Set<String> = [],
                        counters: [String: Int] = [:], money: Int = 20_000,
                        home: Int = 60, belonging: Int = 60) throws -> GameEngine {
        let content = try Self.content.get()
        let stats = Stats(money: money, nerves: 80, documents: 80, home: home, belonging: belonging)
        let state = GameState(stats: stats, act: act, rng: SeededRandom(seed: 7),
                              flags: flags, counters: counters, currentCardId: cardId)
        let engine = GameEngine(content: content, restoring: state)
        XCTAssertEqual(engine.currentCard?.id, cardId, "нет карточки \(cardId)")
        return engine
    }

    private func labels(_ engine: GameEngine) -> [String] {
        guard let card = engine.currentCard else { return [] }
        return engine.availableChoices.map { card.choices[$0].label }
    }

    @discardableResult
    private func tap(_ engine: inout GameEngine, _ label: String,
                     file: StaticString = #filePath, line: UInt = #line) throws -> Outcome {
        guard let card = engine.currentCard,
              let index = card.choices.firstIndex(where: { $0.label == label }) else {
            XCTFail("нет кнопки «\(label)» на \(engine.currentCard?.id ?? "-")", file: file, line: line)
            throw GameError.choiceOutOfRange
        }
        return try engine.choose(index)
    }

    /// Играет, пока не кончатся ходы или партия, и собирает показанные карточки.
    private func play(_ engine: inout GameEngine, turns: Int,
                      pick: ([Int]) -> Int?) throws -> Set<String> {
        var shown: Set<String> = []
        for _ in 0..<turns {
            guard !engine.isFinished, let card = engine.currentCard,
                  let index = pick(engine.availableChoices) else { break }
            shown.insert(card.id)
            try engine.choose(index)
        }
        return shown
    }

    // MARK: - Финал

    private func finalEnding(flags: Set<String> = [], home: Int, belonging: Int) throws -> String? {
        var engine = try self.engine(at: "oei_final", act: "oeiras", flags: flags,
                                     home: home, belonging: belonging)
        try tap(&engine, "Подписать")
        try engine.choose(0)
        return engine.ending?.id
    }

    func testKeptThingsOpenMuseum() throws {
        let kept: Set<String> = ["grandma_envelope", "batumi_stone", "has_album"]
        XCTAssertEqual(try finalEnding(flags: kept, home: 80, belonging: 80), "museum")
    }

    func testStoneThrownIntoOceanMeansNoMuseum() throws {
        XCTAssertEqual(try finalEnding(flags: ["grandma_envelope", "has_album"], home: 80, belonging: 80), "two_homes")
    }

    func testStrongHomeGivesTwoHomes() throws {
        XCTAssertEqual(try finalEnding(home: 70, belonging: 80), "two_homes")
    }

    func testFadedHomeAndRootsGiveOursHere() throws {
        XCTAssertEqual(try finalEnding(home: 40, belonging: 90), "ours_here")
    }

    func testMiddleHomeGivesThirtyYears() throws {
        XCTAssertEqual(try finalEnding(home: 60, belonging: 90), "thirty_years")
    }

    func testNoRootsGivesThirtyYears() throws {
        XCTAssertEqual(try finalEnding(home: 40, belonging: 30), "thirty_years")
    }

    func testReturnHomeHiddenWhenHomeIsWeak() throws {
        XCTAssertFalse(labels(try engine(at: "oei_final", act: "oeiras", home: 40)).contains("Вернуться в Петербург"))
    }

    func testReturnHomeEnding() throws {
        var engine = try self.engine(at: "oei_final", act: "oeiras", home: 60)
        let outcome = try tap(&engine, "Вернуться в Петербург")
        XCTAssertEqual(outcome.ending?.id, "return_home")
    }

    func testAmsterdamEnding() throws {
        var engine = try self.engine(at: "oei_final", act: "oeiras")
        let outcome = try tap(&engine, "Принять оффер в Амстердаме")
        XCTAssertEqual(outcome.ending?.id, "further")
    }

    func testRentingEnding() throws {
        var engine = try self.engine(at: "oei_final", act: "oeiras")
        let outcome = try tap(&engine, "Не подписывать. Пока")
        XCTAssertEqual(outcome.ending?.id, "renting")
    }

    func testAmericaOnlyWithAmericanJob() throws {
        XCTAssertFalse(labels(try engine(at: "oei_final", act: "oeiras")).contains("Принять оффер из Штатов"))
        var engine = try self.engine(at: "oei_final", act: "oeiras", flags: ["us_job"])
        let outcome = try tap(&engine, "Принять оффер из Штатов")
        XCTAssertEqual(outcome.ending?.id, "america")
    }

    func testNewAmericanJobRemembersAmerica() throws {
        var engine = try self.engine(at: "fig_job_found_me", act: "figueira")
        try tap(&engine, "Принять")
        XCTAssertTrue(engine.state.flags.contains("us_job"))
    }

    func testBuyingOutrightOnlyAfterBusinessTookOff() throws {
        XCTAssertFalse(labels(try engine(at: "oei_final", act: "oeiras", flags: ["business"])).contains("Купить без ипотеки"))
        var engine = try self.engine(at: "oei_final", act: "oeiras", flags: ["business_ok"])
        let outcome = try tap(&engine, "Купить без ипотеки")
        XCTAssertEqual(outcome.ending?.id, "rich")
    }

    func testMovingApartEndsInDivorce() throws {
        var engine = try self.engine(at: "oei_apart", act: "oeiras")
        let outcome = try tap(&engine, "Разъехаться")
        XCTAssertEqual(outcome.ending?.id, "divorce")
    }

    func testTalkingKeepsFamilyAndClosesTheQuestion() throws {
        var engine = try self.engine(at: "oei_apart", act: "oeiras")
        let outcome = try tap(&engine, "Поговорить по-настоящему")
        XCTAssertNil(outcome.ending)
        XCTAssertTrue(engine.state.flags.contains("apart_talked"))
    }

    func testEveryEndingIsReachableSomehow() throws {
        let content = try Self.content.get()
        var reachable = Set(content.endings.filter { $0.stat != nil }.map(\.id))
        for card in content.cards {
            for choice in card.choices {
                if let ending = choice.effects?.ending { reachable.insert(ending) }
            }
        }
        XCTAssertEqual(reachable, Set(content.endings.map(\.id)))
    }

    // MARK: - Посылка

    func testParcelNeedsNifToDeclare() throws {
        let engine = try self.engine(at: "ctt_notice", act: "figueira", flags: ["in_portugal"])
        XCTAssertFalse(labels(engine).contains("Задекларировать сейчас"))
    }

    func testUndeclaredParcelGoesBackToMom() throws {
        var engine = try self.engine(at: "ctt_notice", act: "figueira", flags: ["in_portugal"])
        try tap(&engine, "Потом разберусь")
        // Последняя кнопка: у напоминания это «Amanhã», то есть снова не декларируем.
        let shown = try play(&engine, turns: 40) { $0.last }
        XCTAssertTrue(shown.contains("parcel_returned"))
        XCTAssertFalse(shown.contains("parcel_arrives"))
    }

    func testDeclaredParcelArrives() throws {
        var engine = try self.engine(at: "ctt_notice", act: "figueira", flags: ["in_portugal", "has_nif"])
        try tap(&engine, "Задекларировать сейчас")
        let shown = try play(&engine, turns: 30) { $0.first }
        XCTAssertTrue(shown.contains("parcel_arrives"))
        XCTAssertFalse(shown.contains("parcel_returned"))
    }

    // MARK: - Чемодан

    func testOverweightLeadsToScales() throws {
        var engine = try self.engine(at: "pack_album", act: "packing", counters: ["kg": 50])
        try tap(&engine, "Сфотографировать страницы")
        XCTAssertEqual(engine.currentCard?.id, "scales_over")
    }

    func testNormalWeightSkipsScales() throws {
        var engine = try self.engine(at: "pack_album", act: "packing", counters: ["kg": 40])
        try tap(&engine, "Сфотографировать страницы")
        XCTAssertEqual(engine.currentCard?.id, "scales_ok")
    }

    func testPayingOverweightClosesSuitcase() throws {
        var engine = try self.engine(at: "scales_over", act: "packing", counters: ["kg": 75])
        try tap(&engine, "Доплатить за перевес")
        XCTAssertEqual(engine.currentCard?.id, "scales_ok")
    }

    func testDroppingBuckwheatOnlyIfPacked() throws {
        let without = try engine(at: "scales_over", act: "packing", counters: ["kg": 75])
        let with = try engine(at: "scales_over", act: "packing", flags: ["has_buckwheat"], counters: ["kg": 75])
        XCTAssertFalse(labels(without).contains("Выложить гречку"))
        XCTAssertTrue(labels(with).contains("Выложить гречку"))
    }

    // MARK: - Отложенные последствия

    func testGrandmaBanknoteOnlyIfEnvelopeWasKept() throws {
        let with = try engine(at: "f2_grandma", act: "figueira2", flags: ["grandma_envelope"])
        let without = try engine(at: "f2_grandma", act: "figueira2")
        XCTAssertTrue(labels(with).contains("Достать её купюру"))
        XCTAssertFalse(labels(without).contains("Достать её купюру"))
    }

    func testBrotherComesOnlyAfterWedding() throws {
        let content = try Self.content.get()
        let call = try XCTUnwrap(content.card("bat_brother_call"))
        var state = GameState(stats: Stats(money: 1, nerves: 1, documents: 1, home: 1, belonging: 1),
                              act: "batumi", rng: SeededRandom(seed: 1), day: 400)
        XCTAssertFalse(state.meets(call.requires))
        state.flags.insert("wedding_done")
        XCTAssertTrue(state.meets(call.requires))
    }

    func testLegoCanBeLeftOnlyOnce() throws {
        var engine = try self.engine(at: "scales_over", act: "packing", flags: ["has_toys"], counters: ["kg": 60])
        try tap(&engine, "Выложить Лего")
        XCTAssertEqual(engine.currentCard?.id, "scales_over")
        XCTAssertFalse(labels(engine).contains("Выложить Лего"))
    }

    func testExpensiveCarNeedsMoney() throws {
        let poor = labels(try engine(at: "bat_car", act: "batumi", money: 5_000))
        XCTAssertFalse(poor.contains("Взять то, что хочется"))
        XCTAssertTrue(labels(try engine(at: "bat_car", act: "batumi", money: 20_000)).contains("Взять то, что хочется"))
        XCTAssertTrue(poor.contains("Обойдёмся такси"))
    }

    func testBrotherLeavesTogetherWithYou() throws {
        var engine = try self.engine(at: "bat_schengen", act: "batumi", flags: ["brother_here", "portugal_idea"])
        try tap(&engine, "В Португалию")
        XCTAssertEqual(engine.currentCard?.id, "bat_brother_leaves")
    }

    func testWithoutBrotherYouGoStraightToPacking() throws {
        var engine = try self.engine(at: "bat_schengen", act: "batumi", flags: ["portugal_idea"])
        try tap(&engine, "В Португалию")
        XCTAssertEqual(engine.currentCard?.id, "bat_last_stones")
    }

    func testExactlyOneMoneyCardFitsEachJobSituation() throws {
        let content = try Self.content.get()
        for (prefix, place) in [("bat_month_", "in_batumi"), ("fig_month_", "in_portugal")] {
            let cards = content.cards.filter { $0.id.hasPrefix(prefix) }
            XCTAssertEqual(cards.count, 4, prefix)
            let situations: [Set<String>] = [[], ["job_me"], ["job_wife"], ["job_me", "job_wife"]]
            for jobs in situations {
                let state = GameState(stats: Stats(money: 1, nerves: 1, documents: 1, home: 1, belonging: 1),
                                      act: "x", rng: SeededRandom(seed: 1), flags: jobs.union([place]))
                let fitting = cards.filter { state.meets($0.requires) }.map(\.id)
                XCTAssertEqual(fitting.count, 1, "\(prefix) \(jobs.sorted()): \(fitting)")
            }
        }
    }

    // MARK: - Отложенные отклики

    func testDadCallIsRemembered() throws {
        XCTAssertFalse(labels(try engine(at: "oei_father", act: "oeiras")).contains("Вспомнить тот звонок"))
        var engine = try self.engine(at: "call_dad", act: "packing")
        try tap(&engine, "Позвать его с собой")
        XCTAssertTrue(engine.state.flags.contains("asked_dad"))
        XCTAssertTrue(labels(try self.engine(at: "oei_father", act: "oeiras", flags: ["asked_dad"])).contains("Вспомнить тот звонок"))
    }

    func testMomsFirstVisitOpensTrips() throws {
        var engine = try self.engine(at: "f2_mom_visit", act: "figueira2")
        try tap(&engine, "Просто быть дома")
        XCTAssertTrue(engine.state.flags.contains("mom_visited"))
        let paris = try XCTUnwrap(try Self.content.get().card("oei_mom_paris"))
        XCTAssertEqual(paris.requires?.flags, ["mom_visited", "residence_card"])
    }

    func testDriveToMalagaOnlyWithTheOldPeugeot() throws {
        XCTAssertFalse(labels(try engine(at: "f2_inlaws_malaga", act: "figueira2")).contains("Ехать на Пежо"))
        XCTAssertTrue(labels(try engine(at: "f2_inlaws_malaga", act: "figueira2", flags: ["old_car"])).contains("Ехать на Пежо"))
    }

    func testGrandmaDanceVideoOnlyIfYouDanced() throws {
        XCTAssertFalse(labels(try engine(at: "f2_grandma", act: "figueira2")).contains("Пересмотреть её танец"))
        XCTAssertTrue(labels(try engine(at: "f2_grandma", act: "figueira2", flags: ["grandma_dance"])).contains("Пересмотреть её танец"))
    }

    // MARK: - Форма

    /// Один вариант — судьба, два — монетка, три — выбор.
    /// Два допустимы, только если второй открывается прошлым решением.
    func testNoCardIsACoinFlip() throws {
        let flips = try Self.content.get().cards
            .filter { $0.choices.count == 2 && $0.choices.allSatisfy { $0.requires == nil } }
            .map(\.id)
        XCTAssertEqual(flips, [])
    }

    func testButtonsFitOnScreen() throws {
        for card in try Self.content.get().cards {
            for choice in card.choices {
                XCTAssertLessThanOrEqual(choice.label.count, 32, "\(card.id): \(choice.label)")
            }
        }
    }
}
