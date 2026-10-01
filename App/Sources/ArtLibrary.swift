import MigrantCore
import SwiftUI
import UIKit

/// Нарисованные картинки карточек и выборов из папки App/Resources/Art.
///
/// Папка подключена к проекту ссылкой: новый PNG подхватывается сборкой
/// без перегенерации проекта. Имена: `<карточка>.png` и `<карточка>__<номер выбора>.png`.
/// Нет картинки — показываем фон сцены, нет и его — живую сцену из кода.
enum ArtLibrary {
    private static let folder = Bundle.main.resourceURL?.appending(path: "Art")

    /// Имена файлов без расширения — один раз при запуске, чтобы не ходить на диск за каждой карточкой.
    private static let available: Set<String> = {
        guard let folder,
              let files = try? FileManager.default.contentsOfDirectory(atPath: folder.path(percentEncoded: false))
        else { return [] }
        return Set(files.filter { $0.hasSuffix(".png") }.map { String($0.dropLast(4)) })
    }()

    /// Какая анимация лежит поверх какой картинки. Собирает tools/make_card_art.py.
    private static let animations: [String: ArtAnimation] = {
        guard let url = folder?.appending(path: "anim.json"),
              let data = try? Data(contentsOf: url),
              let map = try? JSONDecoder().decode([String: ArtAnimation].self, from: data)
        else { return [:] }
        return map
    }()

    private static let cache = NSCache<NSString, UIImage>()

    static func has(_ name: String) -> Bool { available.contains(name) }

    static func image(_ name: String) -> UIImage? {
        guard has(name), let folder else { return nil }
        if let cached = cache.object(forKey: name as NSString) { return cached }
        guard let image = UIImage(contentsOfFile: folder.appending(path: "\(name).png").path(percentEncoded: false))
        else { return nil }
        cache.setObject(image, forKey: name as NSString)
        return image
    }

    static func animation(for name: String) -> ArtAnimation {
        animations[name] ?? .none
    }

    /// Номер выбора в имени файла считается с единицы — как в списке промптов.
    static func choiceName(card: String, choice: Int) -> String {
        "\(card)__\(choice + 1)"
    }
}

/// Анимация поверх картинки: несколько пикселей, 8 кадров в секунду.
struct ArtOverlay: View {
    let kind: ArtAnimation

    var body: some View {
        if kind != .none {
            TimelineView(.periodic(from: .now, by: 1.0 / 8)) { timeline in
                Canvas { context, size in
                    let frame = Int(timeline.date.timeIntervalSinceReferenceDate * 8)
                    let pixel = size.width / CGFloat(ArtMotion.width)
                    for particle in ArtMotion.particles(kind, frame: frame) {
                        let rect = CGRect(x: CGFloat(particle.x) * pixel, y: CGFloat(particle.y) * pixel,
                                          width: CGFloat(particle.width) * pixel,
                                          height: CGFloat(particle.height) * pixel)
                        context.fill(Path(rect), with: .color(color(particle.tone).opacity(particle.alpha)))
                    }
                }
            }
            .allowsHitTesting(false)
            .accessibilityHidden(true)
        }
    }

    private func color(_ tone: ArtParticle.Tone) -> Color {
        switch tone {
        case .light: return E32.cloud
        case .dark: return E32.night
        case .warm: return E32.gold
        case .water: return E32.mist
        case .accent: return E32.red
        }
    }
}
