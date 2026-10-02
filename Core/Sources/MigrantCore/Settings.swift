import Foundation

public enum AppLanguage: String, Codable, CaseIterable, Sendable {
    case ru, en, pt

    /// Название языка на нём самом: так его узнает тот, кто другого не читает.
    public var nativeName: String {
        switch self {
        case .ru: return "Русский"
        case .en: return "English"
        case .pt: return "Português"
        }
    }
}

public enum ColorTheme: String, Codable, CaseIterable, Sendable {
    /// Ночное небо — тема по умолчанию, в ней задуман весь пиксель-арт.
    case night
    /// Светлая: песок и охра, для чтения днём на солнце.
    case day
    /// Тёплая выцветшая — как карточки воспоминаний.
    case sepia
}

/// Настройки игрока. Хранятся на телефоне, никуда не отправляются.
public struct Settings: Codable, Equatable, Sendable {
    public var theme: ColorTheme
    public var language: AppLanguage
    public var musicOn: Bool
    /// 0…1. Значение за пределами зажимается при записи и при чтении.
    public var musicVolume: Double {
        didSet { musicVolume = Self.clamp(musicVolume) }
    }
    public var track: String

    public init(theme: ColorTheme = .night, language: AppLanguage = .ru, musicOn: Bool = true,
                musicVolume: Double = 0.6, track: String = MusicTrack.all[0].id) {
        self.theme = theme
        self.language = language
        self.musicOn = musicOn
        self.musicVolume = Self.clamp(musicVolume)
        self.track = track
    }

    private enum CodingKeys: String, CodingKey {
        case theme, language, musicOn, musicVolume, track
    }

    /// Старый или битый файл настроек не должен ломать запуск:
    /// всё, что не прочиталось, берётся по умолчанию.
    public init(from decoder: Decoder) throws {
        let defaults = Settings()
        let c = try decoder.container(keyedBy: CodingKeys.self)
        theme = (try? c.decodeIfPresent(ColorTheme.self, forKey: .theme)) ?? defaults.theme
        language = (try? c.decodeIfPresent(AppLanguage.self, forKey: .language)) ?? defaults.language
        musicOn = (try? c.decodeIfPresent(Bool.self, forKey: .musicOn)) ?? defaults.musicOn
        musicVolume = Self.clamp((try? c.decodeIfPresent(Double.self, forKey: .musicVolume)) ?? defaults.musicVolume)
        let saved = (try? c.decodeIfPresent(String.self, forKey: .track)) ?? defaults.track
        // Трек могли убрать из игры — тогда играет первый.
        track = MusicTrack.track(id: saved) == nil ? defaults.track : saved
    }

    public static func decode(_ data: Data?) -> Settings {
        guard let data, let settings = try? JSONDecoder().decode(Settings.self, from: data) else {
            return Settings()
        }
        return settings
    }

    private static func clamp(_ value: Double) -> Double {
        value.isFinite ? min(1, max(0, value)) : 0.6
    }
}
