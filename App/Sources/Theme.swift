import CoreText
import MigrantCore
import SwiftUI

/// Цвета и шрифты интерфейса.
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

    // Шрифты: Press Start 2P — аркадный, для заголовков и подписей; Tiny5 — пиксельный
    // для текста и кнопок. Оба под SIL OFL, с кириллицей и португальскими буквами.
    // Размеры привязаны к системным стилям — работает увеличенный текст iOS.
    static let arcade = "PressStart2P-Regular"
    static let pixel = "Tiny5-Regular"

    static var body: Font {
        AppSettings.shared.value.pixelText
            ? .custom(pixel, size: 20, relativeTo: .body)
            : .system(.body, design: .monospaced)
    }
    static var caption: Font { .custom(arcade, size: 9, relativeTo: .caption) }
    static var title: Font { .custom(arcade, size: 24, relativeTo: .largeTitle) }
    static var button: Font {
        AppSettings.shared.value.pixelText
            ? .custom(pixel, size: 19, relativeTo: .callout)
            : .system(.callout, design: .monospaced).weight(.semibold)
    }

    /// Шрифты лежат в бандле файлами: регистрируем их при запуске,
    /// чтобы не прописывать в Info.plist (он у нас генерируется).
    static func registerFonts() {
        for name in [arcade, pixel] {
            if let url = Bundle.main.url(forResource: name, withExtension: "ttf") {
                CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
            }
        }
    }
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
