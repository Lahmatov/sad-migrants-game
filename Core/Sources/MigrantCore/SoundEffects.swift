import Foundation

/// Звуки, которые синтезирует код: щелчок кнопки и фоны мест — море,
/// море с чайками, дождь. Как и музыка, без файлов и лицензий.
public enum SoundEffect: String, CaseIterable, Sendable {
    case click
}

public enum Ambience: String, CaseIterable, Sendable {
    case sea, seaGulls, rain

    /// Фон для сцены карточки. `nil` — тишина: в комнате и в очереди AIMA моря не слышно.
    public static func of(scene: String?) -> Ambience? {
        switch scene ?? "" {
        case "figueira_beach", "ocean_sunset", "oeiras_beach", "cabo_da_roca":
            return .seaGulls
        case "batumi_beach", "batumi_boulevard", "ocean", "malaga_beach", "azores", "figueira_lake":
            return .sea
        case "batumi_rain", "batumi_street":
            return .rain
        default:
            return nil
        }
    }
}

public enum SoundSynth {
    /// Короткий мягкий «тык» — квадрат, который быстро гаснет.
    public static func render(_ effect: SoundEffect, sampleRate: Double = 22_050) -> [Float] {
        switch effect {
        case .click:
            let count = Int(0.045 * sampleRate)
            return (0..<count).map { i in
                let t = Double(i) / sampleRate
                let phase = (t * 660).truncatingRemainder(dividingBy: 1)
                let envelope = exp(-t * 90)
                return Float((phase < 0.5 ? 0.25 : -0.25) * envelope)
            }
        }
    }

    /// Петля фона. Начало и конец сведены, чтобы на повторе не было щелчка.
    public static func render(_ ambience: Ambience, seconds: Double = 8, sampleRate: Double = 22_050) -> [Float] {
        let count = Int(seconds * sampleRate)
        guard count > 0 else { return [] }
        var random = SeededRandom(seed: 23)
        var low = 0.0
        var samples = [Float](repeating: 0, count: count)
        for i in 0..<count {
            let white = Double(random.next() % 2_000_001) / 1_000_000 - 1
            let t = Double(i) / Double(count)
            switch ambience {
            case .sea, .seaGulls:
                // Шум через мягкий фильтр — гул прибоя; громкость дышит, как волны.
                low += 0.02 * (white - low)
                let swell = 0.55 + 0.45 * sin(2 * .pi * t * 2)
                samples[i] = Float(low * 2.2 * swell)
            case .rain:
                // Дождь — светлый шум с редкими каплями.
                low += 0.35 * (white - low)
                let drop = random.next() % 900 == 0 ? 0.6 : 0
                samples[i] = Float(low * 0.18 + drop * white)
            }
        }
        if ambience == .seaGulls {
            for start in [0.15, 0.62] { addGull(to: &samples, at: start, sampleRate: sampleRate) }
        }
        crossfade(&samples, length: Int(0.4 * sampleRate))
        return samples.map { max(-1, min(1, $0)) }
    }

    /// Крик чайки: два коротких свиста вниз.
    private static func addGull(to samples: inout [Float], at position: Double, sampleRate: Double) {
        let start = Int(position * Double(samples.count))
        for call in 0..<2 {
            let offset = start + call * Int(0.28 * sampleRate)
            let length = Int(0.2 * sampleRate)
            var phase = 0.0
            for i in 0..<length where offset + i < samples.count {
                let t = Double(i) / Double(length)
                let frequency = 1_900 - 700 * t
                phase += frequency / sampleRate
                let envelope = sin(.pi * t) * 0.12
                samples[offset + i] += Float(sin(2 * .pi * phase) * envelope)
            }
        }
    }

    /// Конец петли плавно перетекает в начало.
    private static func crossfade(_ samples: inout [Float], length: Int) {
        let n = min(length, samples.count / 2)
        guard n > 0 else { return }
        for i in 0..<n {
            let k = Float(i) / Float(n)
            let tail = samples.count - n + i
            samples[i] = samples[i] * k + samples[tail] * (1 - k)
        }
        samples.removeLast(n)
    }
}
