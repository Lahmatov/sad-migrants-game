/// Концовки, которые игрок уже видел, — между партиями.
///
/// Повод пройти ещё раз: «открыто 3 из 9». Хранится отдельно от партии,
/// потому что «Начать заново» стирает партию, но не воспоминания о ней.
public struct EndingGallery: Codable, Equatable, Sendable {
    public private(set) var seen: Set<String>

    public init(seen: Set<String> = []) {
        self.seen = seen
    }

    /// Записывает концовку. Возвращает `true`, если она открыта впервые.
    @discardableResult
    public mutating func record(_ endingId: String) -> Bool {
        seen.insert(endingId).inserted
    }

    /// Сколько концовок сценария открыто. Концовки, которых больше нет
    /// в сценарии (убрали при обновлении), не считаются.
    public func openedCount(in content: GameContent) -> Int {
        content.endings.filter { seen.contains($0.id) }.count
    }

    public func isOpened(_ ending: Ending) -> Bool {
        seen.contains(ending.id)
    }
}
