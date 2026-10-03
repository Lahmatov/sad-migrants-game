import MigrantCore
import SwiftUI

/// Титульный экран: живые сцены всех городов по очереди — весь путь за полминуты.
struct TitlePanorama: View {
    private static let stops: [(scene: String, act: String, city: UIKey)] = [
        ("yard_home", "packing", .cityPetersburg),
        ("tbilisi_old_town", "tbilisi", .cityTbilisi),
        ("batumi_beach", "batumi", .cityBatumi),
        ("figueira_beach", "figueira", .cityFigueira),
        ("ocean_sunset", "oeiras", .cityOeiras)
    ]
    /// Сколько секунд показывается один город.
    private static let seconds = 6.0

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        TimelineView(.periodic(from: .now, by: Self.seconds)) { timeline in
            let index = reduceMotion ? 0 : Int(timeline.date.timeIntervalSinceReferenceDate / Self.seconds) % Self.stops.count
            let stop = Self.stops[index]
            VStack(spacing: 6) {
                LiveScene(scene: stop.scene, act: stop.act)
                    .aspectRatio(4.0 / 3.0, contentMode: .fit)
                    .clipped()
                    .pixelFrame()
                    .id(index)
                    .transition(.opacity)
                Text(L(stop.city))
                    .font(Theme.caption)
                    .foregroundStyle(Theme.dim)
                    .id("city\(index)")
                    .transition(.opacity)
            }
            .animation(.easeInOut(duration: 1.2), value: index)
        }
        .accessibilityHidden(true)
    }
}

/// Сцена над текстом концовки. Нарисованная картинка `ending_<id>.png` главнее.
enum EndingScene {
    static func of(_ ending: Ending) -> (scene: String, act: String) {
        switch ending.id {
        case "return_home", "broke": return ("airport_home", "packing")
        case "further", "america": return ("plane", "oeiras")
        case "renting": return ("flat", "oeiras")
        case "divorce": return ("oeiras_street", "batumi")
        case "burnout": return ("flat_cold", "figueira")
        case "paperless": return ("aima", "oeiras")
        case "forgot": return ("memory", "packing")
        case "ours_here", "thirty_years": return ("ocean_sunset", "oeiras")
        default: return ("lisbon_flat_keys", "oeiras")
        }
    }
}
