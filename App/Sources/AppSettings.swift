import MigrantCore
import Observation
import SwiftUI

/// Настройки игрока на этом телефоне: тема, язык, музыка.
///
/// Одна общая копия — строки интерфейса и цвета читают её отовсюду,
/// не протаскивая через каждый экран.
@Observable
final class AppSettings {
    static let shared = AppSettings()

    private static let key = "settings"

    // Полное имя: в SwiftUI есть свой Settings (сцена для macOS).
    var value: MigrantCore.Settings {
        didSet {
            if let data = try? JSONEncoder().encode(value) {
                UserDefaults.standard.set(data, forKey: Self.key)
            }
        }
    }

    private init() {
        value = MigrantCore.Settings.decode(UserDefaults.standard.data(forKey: Self.key))
    }
}

/// Строка интерфейса на выбранном языке: `L(.newGame)`, `L(.day, 12)`.
func L(_ key: UIKey, _ numbers: Int...) -> String {
    UIText.text(key, AppSettings.shared.value.language, numbers: numbers)
}

extension ColorTheme {
    var titleKey: UIKey {
        switch self {
        case .night: return .themeNight
        case .day: return .themeDay
        case .sepia: return .themeSepia
        }
    }
}
