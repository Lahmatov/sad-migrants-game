import XCTest
@testable import MigrantCore

final class JourneyTests: XCTestCase {
    func testNothingVisitedBeforeStart() {
        XCTAssertTrue(Journey.visited(upTo: nil).isEmpty)
        XCTAssertTrue(Journey.visited(upTo: "unknown_act").isEmpty)
    }

    func testPackingIsOnlyPetersburg() {
        XCTAssertEqual(Journey.visited(upTo: "packing").map(\.id), ["spb"])
    }

    func testFigueiraIncludesTransitButNotOeiras() {
        let ids = Journey.visited(upTo: "figueira").map(\.id)
        XCTAssertEqual(ids, ["spb", "yerevan", "tbilisi", "batumi", "istanbul", "lisbon", "figueira"])
        XCTAssertFalse(ids.contains("oeiras"))
    }

    func testOeirasLightsTheWholeWay() {
        XCTAssertEqual(Journey.visited(upTo: "oeiras").count, Journey.stops.count)
    }

    func testEveryStopActExists() {
        for stop in Journey.stops {
            XCTAssertNotNil(Journey.actOrder.firstIndex(of: stop.act), stop.id)
        }
    }

    func testFurtherKeepsTheFurthestAct() {
        XCTAssertEqual(Journey.further("batumi", "tbilisi"), "batumi")
        XCTAssertEqual(Journey.further(nil, "packing"), "packing")
        XCTAssertEqual(Journey.further("oeiras", "nonsense"), "oeiras")
        XCTAssertNil(Journey.further(nil, nil))
    }

    func testStopsLandInsideMapAndWestIsLeft() {
        for stop in Journey.stops {
            let p = Journey.position(of: stop)
            XCTAssertTrue((0...1).contains(p.x) && (0...1).contains(p.y), stop.id)
        }
        let lisbon = Journey.position(of: Journey.stops.first { $0.id == "lisbon" }!)
        let tbilisi = Journey.position(of: Journey.stops.first { $0.id == "tbilisi" }!)
        let spb = Journey.position(of: Journey.stops.first { $0.id == "spb" }!)
        XCTAssertLessThan(lisbon.x, tbilisi.x)
        XCTAssertLessThan(spb.y, lisbon.y, "север выше юга")
    }

    func testEveryStopNamedInEveryLanguage() {
        for stop in Journey.stops {
            for language in AppLanguage.allCases { XCTAssertNotNil(stop.names[language], stop.id) }
        }
    }

    func testBundledActsMatchJourneyOrder() throws {
        let content = try ContentLoader.bundled()
        XCTAssertEqual(content.acts.map(\.id), Journey.actOrder)
    }
}

final class AlbumTests: XCTestCase {
    func testKeepsakeOpensOnceAndIsReportedOnce() {
        var album = Album()
        let first = album.record(card: "x", flags: ["batumi_stone"], act: "batumi")
        XCTAssertEqual(first.map(\.id), ["batumi_stone"])
        XCTAssertTrue(album.record(card: "y", flags: ["batumi_stone"], act: "batumi").isEmpty)
        XCTAssertTrue(album.keepsakes.contains("batumi_stone"))
    }

    func testCardCanOpenKeepsake() {
        var album = Album()
        XCTAssertEqual(album.record(card: "pack_toys", flags: [], act: "packing").map(\.id), ["grey_cat"])
    }

    func testMemoriesAreRecognisedByPrefix() {
        var album = Album()
        album.record(card: "mem_sled", flags: [], act: "batumi")
        album.record(card: "bat_snow", flags: [], act: "batumi")
        XCTAssertEqual(album.memories, ["mem_sled"])
    }

    func testFurthestActNeverGoesBack() {
        var album = Album()
        album.record(card: nil, flags: [], act: "figueira")
        album.record(card: nil, flags: [], act: "packing")
        XCTAssertEqual(album.furthestAct, "figueira")
    }

    func testOldSaveWithoutFieldsStillLoads() throws {
        let album = try JSONDecoder().decode(Album.self, from: Data(#"{"keepsakes":[],"memories":[]}"#.utf8))
        XCTAssertNil(album.furthestAct)
    }

    func testMemoryProgressCountsRealMemoryCards() throws {
        let content = try ContentLoader.bundled()
        var album = Album()
        album.record(card: "mem_sled", flags: [], act: "batumi")
        let progress = album.memoryProgress(in: content)
        XCTAssertEqual(progress.found, 1)
        XCTAssertEqual(progress.total, content.cards.filter { $0.id.hasPrefix("mem_") }.count)
        XCTAssertGreaterThanOrEqual(progress.total, 7)
    }

    func testEveryKeepsakeCanActuallyBeEarned() throws {
        // Вещь, флаг которой нигде не ставится, навсегда осталась бы замком в альбоме.
        let content = try ContentLoader.bundled()
        let ids = Set(content.cards.map(\.id))
        var setFlags: Set<String> = []
        for card in content.cards {
            for choice in card.choices { setFlags.formUnion(choice.effects?.setFlags ?? []) }
        }
        for keepsake in Keepsake.all {
            let byFlag = keepsake.flags.contains(where: setFlags.contains)
            let byCard = keepsake.cards.contains(where: ids.contains)
            XCTAssertTrue(byFlag || byCard, keepsake.id)
        }
    }

    func testKeepsakesHaveTextsInEveryLanguageAndUniqueIds() {
        XCTAssertEqual(Set(Keepsake.all.map(\.id)).count, Keepsake.all.count)
        for keepsake in Keepsake.all {
            for language in AppLanguage.allCases {
                XCTAssertNotNil(keepsake.titles[language], keepsake.id)
                XCTAssertNotNil(keepsake.notes[language], keepsake.id)
            }
        }
    }
}

final class SoundTests: XCTestCase {
    func testClickIsShortAndAudible() {
        let click = SoundSynth.render(.click, sampleRate: 8_000)
        XCTAssertLessThan(click.count, 8_000 / 10)
        XCTAssertGreaterThan(click.map { abs($0) }.max() ?? 0, 0.1)
    }

    func testAmbienceLoopsStayInRangeAndAreNotSilent() {
        for ambience in Ambience.allCases {
            let samples = SoundSynth.render(ambience, seconds: 2, sampleRate: 8_000)
            XCTAssertFalse(samples.isEmpty, ambience.rawValue)
            XCTAssertTrue(samples.allSatisfy { (-1...1).contains($0) }, ambience.rawValue)
            XCTAssertGreaterThan(samples.map { abs($0) }.max() ?? 0, 0.02, ambience.rawValue)
        }
    }

    func testSameAmbienceRendersTheSameEveryTime() {
        XCTAssertEqual(SoundSynth.render(.rain, seconds: 1, sampleRate: 4_000),
                       SoundSynth.render(.rain, seconds: 1, sampleRate: 4_000))
    }

    func testBeachesSoundLikeSeaAndOfficesAreQuiet() {
        XCTAssertEqual(Ambience.of(scene: "figueira_beach"), .seaGulls)
        XCTAssertEqual(Ambience.of(scene: "batumi_beach"), .sea)
        XCTAssertEqual(Ambience.of(scene: "batumi_rain"), .rain)
        XCTAssertNil(Ambience.of(scene: "aima"))
        XCTAssertNil(Ambience.of(scene: nil))
    }
}
