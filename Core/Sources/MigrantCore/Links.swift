import Foundation

/// Внешние ссылки из меню.
public enum Links {
    /// Телеграм-канал игры. Пусто — канала пока нет, кнопка в меню показывает «скоро».
    /// Подойдёт любая запись: `@channel`, `t.me/channel`, `https://t.me/channel`.
    public static let telegramChannel = ""

    /// Ссылка на телеграм из того, как её записал человек. Только t.me и telegram.me:
    /// кнопка «Телеграм» не должна открывать что попало.
    public static func telegramURL(_ raw: String) -> URL? {
        var text = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return nil }
        if text.hasPrefix("@") {
            text = "t.me/" + text.dropFirst()
        }
        for prefix in ["https://", "http://"] where text.lowercased().hasPrefix(prefix) {
            text = String(text.dropFirst(prefix.count))
        }
        let parts = text.split(separator: "/", maxSplits: 1).map(String.init)
        guard parts.count == 2, ["t.me", "telegram.me", "www.t.me"].contains(parts[0].lowercased()) else {
            return nil
        }
        let path = parts[1]
        let allowed = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: "_+-/"))
        guard !path.isEmpty, path.unicodeScalars.allSatisfy({ allowed.contains($0) && $0.isASCII }) else {
            return nil
        }
        return URL(string: "https://t.me/\(path)")
    }

    public static var telegram: URL? { telegramURL(telegramChannel) }
}
