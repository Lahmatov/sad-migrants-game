import Foundation

/// Путь семьи на карте: точки загораются по мере игры.
public struct JourneyStop: Equatable, Sendable, Identifiable {
    public let id: String
    public let latitude: Double
    public let longitude: Double
    /// С какого акта точка считается пройденной.
    public let act: String
    public let names: [AppLanguage: String]

    public init(id: String, latitude: Double, longitude: Double, act: String, names: [AppLanguage: String]) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.act = act
        self.names = names
    }

    public func name(_ language: AppLanguage) -> String {
        names[language] ?? names[.ru] ?? id
    }
}

public enum Journey {
    /// Порядок актов — он же порядок пути.
    public static let actOrder = ["packing", "departure", "tbilisi", "batumi", "figueira", "figueira2", "oeiras"]

    public static let stops: [JourneyStop] = [
        JourneyStop(id: "spb", latitude: 59.94, longitude: 30.31, act: "packing",
                    names: [.ru: "Петербург", .en: "St Petersburg", .pt: "São Petersburgo"]),
        JourneyStop(id: "yerevan", latitude: 40.18, longitude: 44.51, act: "tbilisi",
                    names: [.ru: "Ереван", .en: "Yerevan", .pt: "Erevan"]),
        JourneyStop(id: "tbilisi", latitude: 41.72, longitude: 44.79, act: "tbilisi",
                    names: [.ru: "Тбилиси", .en: "Tbilisi", .pt: "Tbilisi"]),
        JourneyStop(id: "batumi", latitude: 41.64, longitude: 41.64, act: "batumi",
                    names: [.ru: "Батуми", .en: "Batumi", .pt: "Batumi"]),
        JourneyStop(id: "istanbul", latitude: 41.01, longitude: 28.98, act: "figueira",
                    names: [.ru: "Стамбул", .en: "Istanbul", .pt: "Istambul"]),
        JourneyStop(id: "lisbon", latitude: 38.72, longitude: -9.14, act: "figueira",
                    names: [.ru: "Лиссабон", .en: "Lisbon", .pt: "Lisboa"]),
        JourneyStop(id: "figueira", latitude: 40.15, longitude: -8.86, act: "figueira",
                    names: [.ru: "Фигейра-да-Фош", .en: "Figueira da Foz", .pt: "Figueira da Foz"]),
        JourneyStop(id: "oeiras", latitude: 38.69, longitude: -9.31, act: "oeiras",
                    names: [.ru: "Оэйраш", .en: "Oeiras", .pt: "Oeiras"])
    ]

    /// Пройденные точки по порядку для акта, до которого дошёл игрок.
    /// Неизвестный акт — путь ещё не начат.
    public static func visited(upTo act: String?) -> [JourneyStop] {
        guard let act, let reached = actOrder.firstIndex(of: act) else { return [] }
        return stops.filter { (actOrder.firstIndex(of: $0.act) ?? .max) <= reached }
    }

    /// Какой из двух актов дальше по пути. Нужен, чтобы карта помнила
    /// самую дальнюю точку из всех партий, а не только текущую.
    public static func further(_ a: String?, _ b: String?) -> String? {
        let ia = a.flatMap { actOrder.firstIndex(of: $0) } ?? -1
        let ib = b.flatMap { actOrder.firstIndex(of: $0) } ?? -1
        if ia < 0 && ib < 0 { return nil }
        return ia >= ib ? a : b
    }

    /// Точка на карте 0…1 по обеим осям: от Атлантики до Кавказа, от Средиземноморья до Петербурга.
    /// С запасом по краям, чтобы подписи не обрезались.
    public static func position(of stop: JourneyStop) -> (x: Double, y: Double) {
        let west = -14.0, east = 50.0, south = 35.0, north = 63.0
        let x = (stop.longitude - west) / (east - west)
        let y = (north - stop.latitude) / (north - south)
        return (min(1, max(0, x)), min(1, max(0, y)))
    }
}
