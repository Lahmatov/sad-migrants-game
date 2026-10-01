import Foundation

/// Минимальная анимация поверх нарисованной картинки.
///
/// Генераторы картинок не умеют стабильную пиксельную анимацию: кадры
/// «плывут». Поэтому картинка статичная, а движение — несколько пикселей,
/// которые рисует код: капли, блики, чайки. Названия совпадают с полем
/// `anim` в art/cards/*.json — их проверяет tools/test_content.py.
public enum ArtAnimation: String, CaseIterable, Codable, Sendable {
    case none, rain, snow, sea, gulls, steam, lights, dust, stars, confetti
}

/// Один «пиксель» анимации в координатах картинки 180×135.
public struct ArtParticle: Equatable, Sendable {
    /// Цвет задаётся ролью, а не значением: палитру знает приложение.
    public enum Tone: Sendable { case light, dark, warm, water, accent }

    public let x: Int
    public let y: Int
    public let width: Int
    public let height: Int
    public let tone: Tone
    public let alpha: Double

    public init(x: Int, y: Int, width: Int, height: Int, tone: Tone, alpha: Double) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.tone = tone
        self.alpha = alpha
    }
}

public enum ArtMotion {
    public static let width = 180
    public static let height = 135

    /// Частицы для кадра `frame` (8 кадров в секунду).
    ///
    /// Чистая функция от вида и номера кадра: одно и то же всегда даёт
    /// одну и ту же картинку, без таймеров и состояния.
    public static func particles(_ kind: ArtAnimation, frame: Int) -> [ArtParticle] {
        let f = max(0, frame)
        switch kind {
        case .none:
            return []
        case .rain:
            return (0..<40).map { i in
                ArtParticle(x: seed(i, 1) % width, y: (seed(i, 2) + f * 6) % height,
                            width: 1, height: 3, tone: .water, alpha: 0.6)
            }
        case .snow:
            return (0..<30).map { i in
                // Снежинка качается на пиксель влево-вправо, пока падает.
                let sway = (f / 4 + i) % 3 - 1
                return ArtParticle(x: wrap(seed(i, 1) + sway, width), y: (seed(i, 2) + f) % height,
                                   width: 1, height: 1, tone: .light, alpha: 0.9)
            }
        case .sea:
            // Блики живут в нижней трети, где на картинках вода.
            return (0..<14).compactMap { i in
                guard (f + seed(i, 3)) % 6 < 2 else { return nil }
                return ArtParticle(x: seed(i, 1) % (width - 2), y: 90 + seed(i, 2) % 45,
                                   width: 2, height: 1, tone: .light, alpha: 0.8)
            }
        case .gulls:
            return (0..<3).flatMap { i -> [ArtParticle] in
                let x = (seed(i, 1) + f * 2) % (width + 20) - 10
                let y = 10 + seed(i, 2) % 30
                let flap = (f + i) % 4 < 2 ? 0 : 1
                return [
                    ArtParticle(x: x - 1, y: y + flap, width: 1, height: 1, tone: .dark, alpha: 1),
                    ArtParticle(x: x, y: y + 1, width: 1, height: 1, tone: .dark, alpha: 1),
                    ArtParticle(x: x + 1, y: y + flap, width: 1, height: 1, tone: .dark, alpha: 1)
                ].filter { $0.x >= 0 && $0.x < width }
            }
        case .steam:
            return (0..<12).map { i in
                let rise = (seed(i, 2) + f * 2) % 50
                return ArtParticle(x: 75 + seed(i, 1) % 30 + (rise / 10) % 2, y: 100 - rise,
                                   width: 1, height: 1, tone: .light, alpha: 0.7 * Double(50 - rise) / 50)
            }
        case .lights:
            return (0..<12).compactMap { i in
                guard (f / 2 + seed(i, 3)) % 5 != 0 else { return nil }
                return ArtParticle(x: seed(i, 1) % width, y: seed(i, 2) % 90,
                                   width: 1, height: 1, tone: .warm, alpha: 1)
            }
        case .dust:
            return (0..<16).map { i in
                ArtParticle(x: (seed(i, 1) + f / 2) % width, y: (seed(i, 2) + f / 3) % height,
                            width: 1, height: 1, tone: .light, alpha: 0.5)
            }
        case .stars:
            return (0..<20).map { i in
                let bright = (f + seed(i, 3)) % 7 == 0
                return ArtParticle(x: seed(i, 1) % width, y: seed(i, 2) % 60,
                                   width: 1, height: 1, tone: .light, alpha: bright ? 1 : 0.4)
            }
        case .confetti:
            let tones: [ArtParticle.Tone] = [.warm, .accent, .water]
            return (0..<30).map { i in
                ArtParticle(x: wrap(seed(i, 1) + (f / 2 + i) % 3 - 1, width), y: (seed(i, 2) + f * 3) % height,
                            width: 2, height: 1, tone: tones[i % tones.count], alpha: 1)
            }
        }
    }

    /// Стабильное «случайное» число для частицы: своё у каждой пары (i, соль).
    static func seed(_ index: Int, _ salt: Int) -> Int {
        var z = UInt64(truncatingIfNeeded: index &* 0x9E37_79B9 &+ salt &* 0x85EB_CA6B)
        z = (z ^ (z >> 16)) &* 0x7FEB_352D
        z = (z ^ (z >> 15)) &* 0x846C_A68B
        z ^= z >> 16
        return Int(z % 100_000)
    }

    private static func wrap(_ value: Int, _ limit: Int) -> Int {
        ((value % limit) + limit) % limit
    }
}
