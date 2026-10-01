import MigrantCore
import SwiftUI

/// Цвета и шрифты. Пока моноширинный системный шрифт — пиксельный
/// подключим вместе с первыми картинками (см. docs/art.md).
enum Theme {
    // Цвета интерфейса взяты из палитры Endesga 32 — той же, что у сцен,
    // чтобы рамки и картинки не спорили друг с другом.
    /// Ночное небо.
    static let background = E32.night
    static let panel = E32.navy
    static let text = E32.sand
    static let dim = E32.mist
    /// Охра португальских домов.
    static let accent = E32.gold
    /// Синий азулежу.
    static let azulejo = E32.sky
    static let good = E32.lime
    static let bad = E32.red

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
