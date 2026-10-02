import Foundation

/// Читает сценарий: `game.json` плюс все `cards/*.json`.
public enum ContentLoader {
    /// `language` — язык текстов. Русский — оригинал; для других поверх него
    /// накладывается `i18n/<язык>.json`, если он есть.
    public static func load(from directory: URL, language: AppLanguage = .ru) throws -> GameContent {
        var game: GameFile = try decode(directory.appendingPathComponent("game.json"))
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
        var cardFiles: [CardFile] = try files.map { try decode($0) }
        if let translation = try translation(in: directory, language: language) {
            translation.apply(to: &game, cards: &cardFiles)
        }
        return try GameContent(game: game, cardFiles: cardFiles)
    }

    /// Перевод на язык, если файл есть. Битый файл перевода — ошибка: молча
    /// показать русский вместо английского хуже, чем сразу узнать про запятую.
    public static func translation(in directory: URL, language: AppLanguage) throws -> ContentTranslation? {
        guard language != .ru else { return nil }
        let url = directory.appendingPathComponent("i18n").appendingPathComponent("\(language.rawValue).json")
        guard FileManager.default.fileExists(atPath: url.path) else { return nil }
        let translation: ContentTranslation = try decode(url)
        return translation
    }

    /// Сценарий, встроенный в пакет.
    public static func bundled(language: AppLanguage = .ru) throws -> GameContent {
        guard let url = bundleURL else { throw ContentError.missingBundle }
        return try load(from: url, language: language)
    }

    public static var bundleURL: URL? {
        Bundle.module.url(forResource: "Content", withExtension: nil)
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
