import MigrantCore
import SwiftUI

/// Цвета и шрифты. Пока моноширинный системный шрифт — пиксельный
/// подключим вместе с первыми картинками (см. docs/art.md).
enum Theme {
    /// Текущая тема. Чтение идёт через наблюдаемые настройки, поэтому любой
    /// экран, взявший цвет, сам перерисуется, когда тему поменяют.
    static var palette: Palette { Palette.of(AppSettings.shared.value.theme) }

    static var background: Color { palette.background }
    static var panel: Color { palette.panel }
    static var text: Color { palette.text }
    static var dim: Color { palette.dim }
    static var accent: Color { palette.accent }
    static var azulejo: Color { palette.azulejo }
    static var good: Color { palette.good }
    static var bad: Color { palette.bad }

    static let body = Font.system(.body, design: .monospaced)
    static let caption = Font.system(.caption, design: .monospaced).weight(.semibold)
    static let title = Font.system(.largeTitle, design: .monospaced).weight(.heavy)
    static let button = Font.system(.callout, design: .monospaced).weight(.semibold)
}

/// Набор цветов интерфейса. Все из палитры Endesga 32 — той же, что у сцен,
/// чтобы рамки и картинки не спорили друг с другом.
struct Palette {
    let background, panel, text, dim, accent, azulejo, good, bad: Color
    let scheme: ColorScheme

    /// Ночное небо, охра португальских домов, синий азулежу.
    static let night = Palette(background: E32.night, panel: E32.navy, text: E32.sand, dim: E32.mist,
                               accent: E32.gold, azulejo: E32.sky, good: E32.lime, bad: E32.red, scheme: .dark)
    /// Белёная стена и терракота — читать днём на пляже.
    static let day = Palette(background: E32.sand, panel: E32.peach, text: E32.night, dim: E32.slate,
                             accent: E32.rust, azulejo: E32.ocean, good: E32.pine, bad: E32.red, scheme: .light)
    /// Выцветшая фотография из альбома.
    static let sepia = Palette(background: E32.plum, panel: E32.brown, text: E32.sand, dim: E32.tan,
                               accent: E32.gold, azulejo: E32.peach, good: E32.lime, bad: E32.pink, scheme: .dark)

    static func of(_ theme: ColorTheme) -> Palette {
        switch theme {
        case .night: return .night
        case .day: return .day
        case .sepia: return .sepia
        }
    }
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
        case .money: return L(.statMoney)
        case .nerves: return L(.statNerves)
        case .documents: return L(.statDocuments)
        case .home: return L(.statHome)
        case .belonging: return L(.statBelonging)
        }
    }
}

/// Пиксельная рамка вместо скруглений: весь интерфейс в духе картинок.
struct PixelFrame: ViewModifier {
    var color: Color
    var fill: Color

    func body(content: Content) -> some View {
        content
            .background(fill)
            .overlay(Rectangle().strokeBorder(color, lineWidth: 2))
    }
}

extension View {
    func pixelFrame(color: Color? = nil, fill: Color? = nil) -> some View {
        modifier(PixelFrame(color: color ?? Theme.dim, fill: fill ?? Theme.panel))
    }
}
