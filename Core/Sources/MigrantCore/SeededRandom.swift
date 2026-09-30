/// Генератор SplitMix64 с сохраняемым состоянием.
///
/// Системный генератор не подходит: состояние случайности должно лежать
/// в сохранении, иначе после перезапуска та же партия пойдёт по-другому,
/// а тесты не смогут воспроизвести прохождение.
public struct SeededRandom: RandomNumberGenerator, Codable, Equatable, Sendable {
    public private(set) var state: UInt64

    public init(seed: UInt64) {
        state = seed
    }

    public mutating func next() -> UInt64 {
        state &+= 0x9E37_79B9_7F4A_7C15
        var z = state
        z = (z ^ (z >> 30)) &* 0xBF58_476D_1CE4_E5B9
        z = (z ^ (z >> 27)) &* 0x94D0_49BB_1331_11EB
        return z ^ (z >> 31)
    }

    /// Случайное число в 0..<bound. Смещение от деления по модулю на наших
    /// размерах колоды (десятки карточек) пренебрежимо мало.
    public mutating func next(below bound: Int) -> Int {
        precondition(bound > 0, "bound должен быть положительным")
        return Int(next() % UInt64(bound))
    }
}
