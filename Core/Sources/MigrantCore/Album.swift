import Foundation

/// Памятная вещь, которую семья пронесла через переезд. Открывается флагом
/// сценария или показанной карточкой.
public struct Keepsake: Equatable, Sendable, Identifiable {
    public let id: String
    /// Достаточно любого из флагов.
    public let flags: [String]
    /// Или показа одной из карточек.
    public let cards: [String]
    public let titles: [AppLanguage: String]
    public let notes: [AppLanguage: String]

    public init(id: String, flags: [String] = [], cards: [String] = [],
                titles: [AppLanguage: String], notes: [AppLanguage: String]) {
        self.id = id
        self.flags = flags
        self.cards = cards
        self.titles = titles
        self.notes = notes
    }

    public func title(_ language: AppLanguage) -> String { titles[language] ?? titles[.ru] ?? id }
    public func note(_ language: AppLanguage) -> String { notes[language] ?? notes[.ru] ?? "" }

    public func isEarned(flags owned: Set<String>, card: String?) -> Bool {
        flags.contains(where: owned.contains) || (card.map(cards.contains) ?? false)
    }

    public static let all: [Keepsake] = [
        Keepsake(id: "grey_cat", cards: ["pack_toys"],
                 titles: [.ru: "Серый кот", .en: "The grey cat", .pt: "O gato cinzento"],
                 notes: [.ru: "Без него сын не засыпает. Едет всегда.", .en: "The boy can't sleep without him. He always comes along.", .pt: "O filho não adormece sem ele. Vai sempre."]),
        Keepsake(id: "grandma_banknote", flags: ["grandma_envelope"],
                 titles: [.ru: "Бабушкина купюра", .en: "Grandma's banknote", .pt: "A nota da avó"],
                 notes: [.ru: "Из конверта «на первое время». Так и не потрачена.", .en: "From the envelope “for the first days”. Never spent.", .pt: "Do envelope «para os primeiros tempos». Nunca gasta."]),
        Keepsake(id: "photo_album", flags: ["has_album"],
                 titles: [.ru: "Фотоальбом", .en: "The photo album", .pt: "O álbum de fotos"],
                 notes: [.ru: "Ты в трусах, с огурцом и ведром. Папа молодой. Все живые.", .en: "You in your underpants with a cucumber and a bucket. Dad is young. Everyone is alive.", .pt: "Tu de cuecas, com um pepino e um balde. O pai jovem. Todos vivos."]),
        Keepsake(id: "batumi_stone", flags: ["batumi_stone"],
                 titles: [.ru: "Камень из Батуми", .en: "A stone from Batumi", .pt: "Uma pedra de Batumi"],
                 notes: [.ru: "Плоский, с Чёрного моря. Самый лёгкий груз и самый тяжёлый.", .en: "Flat, from the Black Sea. The lightest load and the heaviest.", .pt: "Lisa, do Mar Negro. A carga mais leve e a mais pesada."]),
        Keepsake(id: "first_word", flags: ["first_word"],
                 titles: [.ru: "Видео: первое слово", .en: "Video: the first word", .pt: "Vídeo: a primeira palavra"],
                 notes: [.ru: "«Мама». Снято дрожащими руками.", .en: "“Mama”. Filmed with shaking hands.", .pt: "«Mamã». Filmado com as mãos a tremer."]),
        Keepsake(id: "grandma_dance", flags: ["grandma_dance"],
                 titles: [.ru: "Видео: бабушка танцует", .en: "Video: grandma dancing", .pt: "Vídeo: a avó a dançar"],
                 notes: [.ru: "Свадьба брата. Она держится за тебя и смеётся.", .en: "Your brother's wedding. She holds on to you and laughs.", .pt: "O casamento do irmão. Ela agarra-se a ti e ri."]),
        Keepsake(id: "ford_ka", flags: ["ford_ka"],
                 titles: [.ru: "Машинка Ford Ka", .en: "A toy Ford Ka", .pt: "Um carrinho Ford Ka"],
                 notes: [.ru: "Такая же, как та, что мама купила на последние деньги.", .en: "Just like the one Mom bought with her last money.", .pt: "Igual à que a mãe comprou com o último dinheiro."]),
        Keepsake(id: "residence_card", flags: ["residence_card"],
                 titles: [.ru: "Карточка ВНЖ", .en: "Residence card", .pt: "Cartão de residência"],
                 notes: [.ru: "Из Порту, через девять месяцев. Фамилия написана правильно.", .en: "From Porto, nine months later. The surname is spelled right.", .pt: "Do Porto, nove meses depois. O apelido está bem escrito."]),
        Keepsake(id: "sporting_scarf", flags: ["sporting"],
                 titles: [.ru: "Шарф «Спортинга»", .en: "A Sporting scarf", .pt: "Um cachecol do Sporting"],
                 notes: [.ru: "Зелёно-белый. Сорок тысяч человек поют, и вы тоже.", .en: "Green and white. Forty thousand people singing, and you too.", .pt: "Verde e branco. Quarenta mil a cantar, e vocês também."]),
        Keepsake(id: "legoland", flags: ["legoland"],
                 titles: [.ru: "Билет в Леголенд", .en: "A Legoland ticket", .pt: "Um bilhete da Legoland"],
                 notes: [.ru: "Биллунн. Двенадцать раз на одних и тех же горках.", .en: "Billund. Twelve times on the same coaster.", .pt: "Billund. Doze vezes na mesma montanha-russa."]),
        Keepsake(id: "dads_watch", flags: ["father_watch"],
                 titles: [.ru: "Папины часы", .en: "Dad's watch", .pt: "O relógio do pai"],
                 notes: [.ru: "Romanson. Стоят. Ты всё собираешься их починить.", .en: "A Romanson. Stopped. You keep meaning to fix it.", .pt: "Um Romanson. Parado. Continuas a querer arranjá-lo."])
    ]
}

/// Что игрок собрал за все партии: вещи, воспоминания и самую дальнюю точку пути.
/// Хранится отдельно от партии — «Начать заново» его не стирает.
public struct Album: Codable, Equatable, Sendable {
    public private(set) var keepsakes: Set<String>
    public private(set) var memories: Set<String>
    public private(set) var furthestAct: String?

    public init(keepsakes: Set<String> = [], memories: Set<String> = [], furthestAct: String? = nil) {
        self.keepsakes = keepsakes
        self.memories = memories
        self.furthestAct = furthestAct
    }

    /// Карточки воспоминаний узнаются по приставке id.
    public static func isMemory(_ cardId: String) -> Bool {
        cardId.hasPrefix("mem_")
    }

    /// Записывает показанную карточку и текущее состояние партии.
    /// Возвращает вещи, открытые впервые, — чтобы сказать о них игроку.
    @discardableResult
    public mutating func record(card: String?, flags: Set<String>, act: String) -> [Keepsake] {
        if let card, Self.isMemory(card) { memories.insert(card) }
        furthestAct = Journey.further(furthestAct, act)
        var fresh: [Keepsake] = []
        for keepsake in Keepsake.all where !keepsakes.contains(keepsake.id) {
            if keepsake.isEarned(flags: flags, card: card) {
                keepsakes.insert(keepsake.id)
                fresh.append(keepsake)
            }
        }
        return fresh
    }

    /// Сколько воспоминаний есть в сценарии и сколько из них найдено.
    public func memoryProgress(in content: GameContent) -> (found: Int, total: Int) {
        let all = content.cards.filter { Self.isMemory($0.id) }
        return (all.filter { memories.contains($0.id) }.count, all.count)
    }
}
