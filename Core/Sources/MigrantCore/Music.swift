import Foundation

/// Грустная музыка, которую синтезирует код: два голоса в духе старых
/// приставок. Никаких файлов и лицензий — и звучит в тон пиксель-арту.
/// Если положить настоящую запись `App/Resources/Music/<id>.m4a`,
/// приложение сыграет её вместо синтеза.
public struct MusicTrack: Equatable, Sendable, Identifiable {
    public let id: String
    public let titles: [AppLanguage: String]
    /// Ударов в минуту.
    public let tempo: Double
    /// Мелодия и бас в нотной записи — см. `Melody.parse`.
    public let lead: String
    public let bass: String

    public init(id: String, titles: [AppLanguage: String], tempo: Double, lead: String, bass: String) {
        self.id = id
        self.titles = titles
        self.tempo = tempo
        self.lead = lead
        self.bass = bass
    }

    public func title(_ language: AppLanguage) -> String {
        titles[language] ?? titles[.ru] ?? id
    }

    public static func track(id: String) -> MusicTrack? {
        all.first { $0.id == id }
    }

    public static let all: [MusicTrack] = [
        MusicTrack(
            id: "petersburg",
            titles: [.ru: "Петербург, февраль", .en: "Petersburg, February", .pt: "Petersburgo, fevereiro"],
            tempo: 66,
            lead: "A4:2 C5:1 E5:1 D5:2 C5:2 B4:2 G4:1 B4:1 A4:4 "
                + "E4:1 A4:1 C5:2 B4:1 A4:1 G4:2 F4:2 E4:2 A4:4",
            bass: "A2:4 F2:4 G2:4 E2:4 A2:4 D2:4 E2:4 A2:4"),
        MusicTrack(
            id: "black_sea",
            titles: [.ru: "Чёрное море", .en: "The Black Sea", .pt: "O Mar Negro"],
            tempo: 84,
            // Вальс на три четверти: море качает.
            lead: "D5:2 F5:1 E5:2 D5:1 C5:3 A4:3 Bb4:2 C5:1 D5:2 A4:1 G4:3 -:3 "
                + "F4:2 G4:1 A4:2 D5:1 C5:3 Bb4:3 A4:2 G4:1 F4:2 E4:1 D4:6",
            bass: "D3:3 D3:3 F2:3 F2:3 G2:3 G2:3 A2:3 A2:3 "
                + "D3:3 D3:3 Bb2:3 Bb2:3 G2:3 A2:3 D2:6"),
        MusicTrack(
            id: "atlantic",
            titles: [.ru: "Атлантика", .en: "The Atlantic", .pt: "O Atlântico"],
            tempo: 58,
            // Длинные ноты — как волны на пустом пляже.
            lead: "E5:3 B4:1 D5:4 C5:3 G4:1 B4:4 A4:3 E4:1 G4:2 F#4:2 E4:8",
            bass: "E2:4 E2:4 C2:4 C2:4 A2:4 B2:4 E2:8"),
        MusicTrack(
            id: "lullaby",
            titles: [.ru: "Колыбельная", .en: "Lullaby", .pt: "Canção de ninar"],
            tempo: 60,
            lead: "G4:2 Bb4:1 A4:1 G4:2 D4:2 Eb4:2 D4:1 C4:1 D4:4 "
                + "Bb3:2 C4:1 D4:1 G4:2 F4:2 Eb4:2 D4:2 G3:4",
            bass: "G2:4 C3:4 G2:4 D2:4 G2:4 Bb2:4 C3:4 G2:4")
    ]
}

/// Нота: высота в полутонах по MIDI (nil — пауза) и длительность в долях.
public struct Note: Equatable, Sendable {
    public let midi: Int?
    public let beats: Double

    public init(midi: Int?, beats: Double) {
        self.midi = midi
        self.beats = beats
    }

    public var frequency: Double? {
        midi.map { 440 * pow(2, Double($0 - 69) / 12) }
    }
}

public enum Melody {
    /// Запись вида `A4:2 C#5:1 Bb3:0.5 -:1`: нота, октава, длительность в долях; `-` — пауза.
    /// Нечитаемый кусок пропускается: мелодия с опечаткой играет, а тест её ловит.
    public static func parse(_ text: String) -> [Note] {
        text.split(separator: " ").compactMap { token in
            let parts = token.split(separator: ":")
            guard parts.count == 2, let beats = Double(parts[1]), beats > 0 else { return nil }
            if parts[0] == "-" { return Note(midi: nil, beats: beats) }
            guard let midi = midi(String(parts[0])) else { return nil }
            return Note(midi: midi, beats: beats)
        }
    }

    public static func midi(_ name: String) -> Int? {
        let steps: [Character: Int] = ["C": 0, "D": 2, "E": 4, "F": 5, "G": 7, "A": 9, "B": 11]
        guard let letter = name.first, let step = steps[letter] else { return nil }
        var rest = name.dropFirst()
        var shift = 0
        if rest.first == "#" { shift = 1; rest = rest.dropFirst() }
        else if rest.first == "b" { shift = -1; rest = rest.dropFirst() }
        guard let octave = Int(rest), (0...8).contains(octave) else { return nil }
        return (octave + 1) * 12 + step + shift
    }

    public static func beats(_ notes: [Note]) -> Double {
        notes.reduce(0) { $0 + $1.beats }
    }
}

public enum Chiptune {
    /// Один проход трека в моно-сэмплах −1…1. Приложение крутит его по кругу.
    ///
    /// Мелодия — мягкий квадрат, бас — треугольник. У каждой ноты короткая
    /// атака и затухание: без них на стыках нот слышны щелчки.
    public static func render(_ track: MusicTrack, sampleRate: Double = 22_050) -> [Float] {
        let secondsPerBeat = 60 / track.tempo
        let lead = Melody.parse(track.lead)
        let bass = Melody.parse(track.bass)
        let beats = max(Melody.beats(lead), Melody.beats(bass))
        let count = Int(beats * secondsPerBeat * sampleRate)
        guard count > 0 else { return [] }
        var samples = [Float](repeating: 0, count: count)
        add(lead, to: &samples, sampleRate: sampleRate, secondsPerBeat: secondsPerBeat, volume: 0.22, wave: square)
        add(bass, to: &samples, sampleRate: sampleRate, secondsPerBeat: secondsPerBeat, volume: 0.28, wave: triangle)
        return samples.map { max(-1, min(1, $0)) }
    }

    private static func add(_ notes: [Note], to samples: inout [Float], sampleRate: Double,
                            secondsPerBeat: Double, volume: Double, wave: (Double) -> Double) {
        var start = 0
        for note in notes {
            let length = Int(note.beats * secondsPerBeat * sampleRate)
            defer { start += length }
            guard let frequency = note.frequency else { continue }
            let attack = min(Int(0.01 * sampleRate), length / 4)
            let release = min(Int(0.12 * sampleRate), length / 2)
            for i in 0..<length where start + i < samples.count {
                let phase = Double(i) * frequency / sampleRate
                var envelope = 1.0
                if i < attack { envelope = Double(i) / Double(max(attack, 1)) }
                if i > length - release { envelope = Double(length - i) / Double(max(release, 1)) }
                // Нота тихо гаснет и пока звучит: так квадрат не режет ухо.
                envelope *= 1 - 0.35 * Double(i) / Double(length)
                samples[start + i] += Float(wave(phase) * envelope * volume)
            }
        }
    }

    private static func square(_ phase: Double) -> Double {
        phase.truncatingRemainder(dividingBy: 1) < 0.5 ? 0.6 : -0.6
    }

    private static func triangle(_ phase: Double) -> Double {
        let p = phase.truncatingRemainder(dividingBy: 1)
        return 4 * abs(p - 0.5) - 1
    }
}
