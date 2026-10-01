import MigrantCore
import SwiftUI

/// Цвета и шрифты. Пока моноширинный системный шрифт — пиксельный
/// подключим вместе с первыми картинками (см. docs/art.md).
enum Theme {
    /// Тёмно-синий, как океан ночью.
    static let background = Color(red: 0.08, green: 0.10, blue: 0.16)
    static let panel = Color(red: 0.13, green: 0.16, blue: 0.24)
    static let text = Color(red: 0.95, green: 0.92, blue: 0.85)
    static let dim = Color(red: 0.62, green: 0.64, blue: 0.70)
    /// Охра португальских домов.
    static let accent = Color(red: 0.93, green: 0.66, blue: 0.29)
    /// Синий азулежу.
    static let azulejo = Color(red: 0.24, green: 0.47, blue: 0.85)
    static let good = Color(red: 0.49, green: 0.80, blue: 0.47)
    static let bad = Color(red: 0.91, green: 0.38, blue: 0.36)

    static let body = Font.system(.body, design: .monospaced)
    static let caption = Font.system(.caption, design: .monospaced).weight(.semibold)
    static let title = Font.system(.largeTitle, design: .monospaced).weight(.heavy)
    static let button = Font.system(.callout, design: .monospaced).weight(.semibold)
}

extension Stat {
    var symbol: String {
        switch self {
        case .money: return "eurosign.circle"
        case .nerves: return "brain.head.profile"
        case .documents: return "doc.text"
        case .home: return "house"
        case .belonging: return "sun.max"
        }
    }

    var title: String {
        switch self {
        case .money: return "Деньги"
        case .nerves: return "Кукуха"
        case .documents: return "Документы"
        case .home: return "Дом"
        case .belonging: return "Свой тут"
        }
    }
}

/// Пиксельная рамка вместо скруглений: весь интерфейс в духе картинок.
struct PixelFrame: ViewModifier {
    var color: Color = Theme.dim
    var fill: Color = Theme.panel

    func body(content: Content) -> some View {
        content
            .background(fill)
            .overlay(Rectangle().strokeBorder(color, lineWidth: 2))
    }
}

extension View {
    func pixelFrame(color: Color = Theme.dim, fill: Color = Theme.panel) -> some View {
        modifier(PixelFrame(color: color, fill: fill))
    }
}
