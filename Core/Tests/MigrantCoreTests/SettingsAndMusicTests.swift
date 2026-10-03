import XCTest
@testable import MigrantCore

final class SettingsTests: XCTestCase {
    func testDefaultsAreNightRussianMusicOn() {
        let settings = Settings()
        XCTAssertEqual(settings.theme, .night)
        XCTAssertEqual(settings.language, .ru)
        XCTAssertTrue(settings.musicOn)
        XCTAssertEqual(settings.track, MusicTrack.all[0].id)
        XCTAssertTrue(settings.soundsOn)
        XCTAssertTrue(settings.pixelText)
    }

    func testRoundTripKeepsEverything() throws {
        let saved = Settings(theme: .sepia, language: .pt, musicOn: false, musicVolume: 0.3, track: "atlantic",
                             soundsOn: false, pixelText: false)
        let data = try JSONEncoder().encode(saved)
        XCTAssertEqual(Settings.decode(data), saved)
    }

    func testBrokenFileGivesDefaults() {
        XCTAssertEqual(Settings.decode(Data("{oops".utf8)), Settings())
        XCTAssertEqual(Settings.decode(nil), Settings())
    }

    func testMissingAndUnknownFieldsFallBackOneByOne() {
        let data = Data(#"{"theme":"neon","language":"en","musicVolume":0.2}"#.utf8)
        let settings = Settings.decode(data)
        XCTAssertEqual(settings.theme, .night)
        XCTAssertEqual(settings.language, .en)
        XCTAssertEqual(settings.musicVolume, 0.2)
        XCTAssertTrue(settings.musicOn)
    }

    func testVolumeIsClamped() {
        XCTAssertEqual(Settings(musicVolume: 3).musicVolume, 1)
        XCTAssertEqual(Settings(musicVolume: -1).musicVolume, 0)
        var settings = Settings()
        settings.musicVolume = 7
        XCTAssertEqual(settings.musicVolume, 1)
        XCTAssertEqual(Settings.decode(Data(#"{"musicVolume":-5}"#.utf8)).musicVolume, 0)
    }

    func testRemovedTrackFallsBackToFirst() {
        XCTAssertEqual(Settings.decode(Data(#"{"track":"deleted_song"}"#.utf8)).track, MusicTrack.all[0].id)
    }
}

final class MusicTests: XCTestCase {
    func testThereAreFourTracksWithUniqueIds() {
        XCTAssertEqual(MusicTrack.all.count, 4)
        XCTAssertEqual(Set(MusicTrack.all.map(\.id)).count, MusicTrack.all.count)
    }

    func testEveryTrackHasTitleInEveryLanguage() {
        for track in MusicTrack.all {
            for language in AppLanguage.allCases {
                XCTAssertNotNil(track.titles[language], "\(track.id) \(language)")
            }
        }
    }

    func testEveryNoteOfEveryTrackParses() {
        for track in MusicTrack.all {
            for line in [track.lead, track.bass] {
                let tokens = line.split(separator: " ").count
                XCTAssertEqual(Melody.parse(line).count, tokens, "\(track.id): опечатка в нотах")
            }
        }
    }

    func testMelodyAndBassHaveSameLength() {
        // Иначе на стыке петли один голос замолкает раньше другого.
        for track in MusicTrack.all {
            XCTAssertEqual(Melody.beats(Melody.parse(track.lead)), Melody.beats(Melody.parse(track.bass)), track.id)
        }
    }

    func testNoteNames() {
        XCTAssertEqual(Melody.midi("A4"), 69)
        XCTAssertEqual(Melody.midi("C4"), 60)
        XCTAssertEqual(Melody.midi("F#4"), 66)
        XCTAssertEqual(Melody.midi("Bb3"), 58)
        XCTAssertNil(Melody.midi("H4"))
        XCTAssertNil(Melody.midi("A"))
        XCTAssertNil(Melody.midi("A12"))
    }

    func testA4Is440Hz() {
        XCTAssertEqual(Note(midi: 69, beats: 1).frequency ?? 0, 440, accuracy: 0.001)
        XCTAssertNil(Note(midi: nil, beats: 1).frequency)
    }

    func testBrokenTokensAreSkipped() {
        XCTAssertEqual(Melody.parse("A4:1 X9:1 C5 -:2 D5:0"), [Note(midi: 69, beats: 1), Note(midi: nil, beats: 2)])
    }

    func testRenderedLoopHasRightLengthAndStaysInRange() {
        let track = MusicTrack.all[0]
        let samples = Chiptune.render(track, sampleRate: 8_000)
        let seconds = Melody.beats(Melody.parse(track.lead)) * 60 / track.tempo
        XCTAssertEqual(samples.count, Int(seconds * 8_000), accuracy: 2)
        XCTAssertTrue(samples.allSatisfy { (-1...1).contains($0) })
        XCTAssertGreaterThan(samples.map { abs($0) }.max() ?? 0, 0.1, "трек молчит")
    }

    func testLoopStartsAndEndsQuietToAvoidClick() {
        let samples = Chiptune.render(MusicTrack.all[2], sampleRate: 8_000)
        XCTAssertLessThan(abs(samples.first ?? 1), 0.05)
        XCTAssertLessThan(abs(samples.last ?? 1), 0.05)
    }
}

final class UITextTests: XCTestCase {
    func testEveryKeyIsTranslatedEverywhere() {
        for language in AppLanguage.allCases {
            for key in UIKey.allCases {
                let text = UIText.table[language]?[key]
                XCTAssertFalse(text?.isEmpty ?? true, "\(language) \(key)")
            }
        }
    }

    func testPlaceholdersMatchAcrossLanguages() {
        for key in UIKey.allCases {
            let counts = AppLanguage.allCases.map { (UIText.table[$0]?[key] ?? "").components(separatedBy: "%d").count }
            XCTAssertEqual(Set(counts).count, 1, "\(key): разное число подстановок")
        }
    }

    func testNumbersAreSubstitutedInOrder() {
        XCTAssertEqual(UIText.text(.endingsOpened, .ru, 3, 14), "Открыто концовок: 3 из 14")
        XCTAssertEqual(UIText.text(.day, .en, 42), "Day 42")
    }
}

final class TranslationTests: XCTestCase {
    private func sample() -> (GameFile, [CardFile]) {
        let stats = Stats(money: 1, nerves: 1, documents: 1, home: 1, belonging: 1)
        let game = GameFile(start: StartState(act: "a", card: "c", stats: stats),
                            acts: [Act(id: "a", title: "Акт")],
                            endings: [Ending(id: "e", title: "Конец", text: "Всё")],
                            intro: ["Привет"])
        let card = Card(id: "c", text: "Текст", choices: [Choice(label: "Да", result: "Ок"), Choice(label: "Нет")])
        return (game, [CardFile(act: "a", cards: [card])])
    }

    func testTranslationReplacesTexts() {
        var (game, files) = sample()
        let t = ContentTranslation(acts: ["a": "Act"], endings: ["e": .init(title: "End", text: "All")],
                                   intro: ["Hi"],
                                   cards: ["c": .init(text: "Text", choices: [.init(label: "Yes", result: "Ok"), .init(label: "No")])])
        t.apply(to: &game, cards: &files)
        XCTAssertEqual(game.acts[0].title, "Act")
        XCTAssertEqual(game.endings[0].title, "End")
        XCTAssertEqual(game.intro, ["Hi"])
        XCTAssertEqual(files[0].cards[0].text, "Text")
        XCTAssertEqual(files[0].cards[0].choices.map(\.label), ["Yes", "No"])
    }

    func testMissingPartsStayRussian() {
        var (game, files) = sample()
        ContentTranslation(cards: ["c": .init(text: "Text")]).apply(to: &game, cards: &files)
        XCTAssertEqual(game.acts[0].title, "Акт")
        XCTAssertEqual(files[0].cards[0].text, "Text")
        XCTAssertEqual(files[0].cards[0].choices.map(\.label), ["Да", "Нет"])
    }

    func testButtonsStayRussianWhenCountDiffers() {
        var (game, files) = sample()
        ContentTranslation(cards: ["c": .init(choices: [.init(label: "Yes")])]).apply(to: &game, cards: &files)
        XCTAssertEqual(files[0].cards[0].choices.map(\.label), ["Да", "Нет"])
    }

    func testTranslationNeverTouchesLogic() throws {
        var (game, files) = sample()
        let before = files[0].cards[0].choices.map(\.effects)
        ContentTranslation(cards: ["c": .init(choices: [.init(label: "Y"), .init(label: "N")])]).apply(to: &game, cards: &files)
        XCTAssertEqual(files[0].cards[0].choices.map(\.effects), before)
    }

    func testBundledTranslationsLoadWithSameCards() throws {
        let russian = try ContentLoader.bundled()
        for language in AppLanguage.allCases {
            let translated = try ContentLoader.bundled(language: language)
            XCTAssertEqual(translated.cards.map(\.id), russian.cards.map(\.id), "\(language)")
        }
    }

    func testEnglishIntroIsTranslated() throws {
        let english = try ContentLoader.bundled(language: .en)
        XCTAssertEqual(english.introStanzas.first?.first, "Everyone has their own life.")
    }
}

final class LinksTests: XCTestCase {
    func testAnyUsualSpellingOfChannelWorks() {
        let expected = URL(string: "https://t.me/sad_migrants")
        XCTAssertEqual(Links.telegramURL("@sad_migrants"), expected)
        XCTAssertEqual(Links.telegramURL("t.me/sad_migrants"), expected)
        XCTAssertEqual(Links.telegramURL("https://t.me/sad_migrants"), expected)
        XCTAssertEqual(Links.telegramURL("  http://telegram.me/sad_migrants \n"), expected)
    }

    func testInviteLinksAreKept() {
        XCTAssertEqual(Links.telegramURL("https://t.me/+AbC-123"), URL(string: "https://t.me/+AbC-123"))
    }

    func testEmptyMeansNoChannelYet() {
        XCTAssertNil(Links.telegramURL(""))
        XCTAssertNil(Links.telegramURL("   "))
        XCTAssertNil(Links.telegramURL("@"))
    }

    func testOtherSitesAreRejected() {
        XCTAssertNil(Links.telegramURL("https://evil.example/t.me/x"))
        XCTAssertNil(Links.telegramURL("t.me.evil.example/x"))
        XCTAssertNil(Links.telegramURL("t.me/канал"))
        XCTAssertNil(Links.telegramURL("t.me/a?b=c"))
    }
}
