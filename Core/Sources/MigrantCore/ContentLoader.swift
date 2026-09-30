import Foundation

/// Читает сценарий: `game.json` плюс все `cards/*.json`.
public enum ContentLoader {
    public static func load(from directory: URL) throws -> GameContent {
        let game: GameFile = try decode(directory.appendingPathComponent("game.json"))
        let cardsDirectory = directory.appendingPathComponent("cards")
        let files: [URL]
        do {
            files = try FileManager.default
                .contentsOfDirectory(at: cardsDirectory, includingPropertiesForKeys: nil)
                .filter { $0.pathExtension == "json" }
                // Порядок файлов влияет на случайный выбор — фиксируем его.
                .sorted { $0.lastPathComponent < $1.lastPathComponent }
        } catch {
            throw ContentError.badFile(name: "cards", reason: error.localizedDescription)
        }
        let cardFiles: [CardFile] = try files.map { try decode($0) }
        return try GameContent(game: game, cardFiles: cardFiles)
    }

    /// Сценарий, встроенный в пакет.
    public static func bundled() throws -> GameContent {
        guard let url = Bundle.module.url(forResource: "Content", withExtension: nil) else {
            throw ContentError.missingBundle
        }
        return try load(from: url)
    }

    /// Ошибка разбора называет файл: среди десятка JSON иначе не найти,
    /// где пропущена запятая.
    private static func decode<T: Decodable>(_ url: URL) throws -> T {
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw ContentError.badFile(name: url.lastPathComponent, reason: String(describing: error))
        }
    }
}
