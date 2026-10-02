import Foundation

/// Перевод сценария: `Content/i18n/<язык>.json` поверх русского оригинала.
///
/// Логика карточек (условия, эффекты, ветки) живёт только в русских файлах;
/// перевод меняет одни тексты. Чего в переводе нет — показывается по-русски,
/// так что переводить можно по кусочку, и игра всё время остаётся целой.
public struct ContentTranslation: Codable, Equatable, Sendable {
    public struct CardText: Codable, Equatable, Sendable {
        public var text: String?
        public var speaker: String?
        /// По порядку кнопок в оригинале. Если число не совпало — кнопки остаются русскими:
        /// перевод ответа к чужой кнопке хуже, чем непереведённая кнопка.
        public var choices: [ChoiceText]?

        public init(text: String? = nil, speaker: String? = nil, choices: [ChoiceText]? = nil) {
            self.text = text
            self.speaker = speaker
            self.choices = choices
        }
    }

    public struct ChoiceText: Codable, Equatable, Sendable {
        public var label: String
        public var result: String?

        public init(label: String, result: String? = nil) {
            self.label = label
            self.result = result
        }
    }

    public struct EndingText: Codable, Equatable, Sendable {
        public var title: String
        public var text: String

        public init(title: String, text: String) {
            self.title = title
            self.text = text
        }
    }

    public var acts: [String: String]?
    public var endings: [String: EndingText]?
    public var intro: [String]?
    public var cards: [String: CardText]?

    public init(acts: [String: String]? = nil, endings: [String: EndingText]? = nil,
                intro: [String]? = nil, cards: [String: CardText]? = nil) {
        self.acts = acts
        self.endings = endings
        self.intro = intro
        self.cards = cards
    }

    public func apply(to game: inout GameFile, cards files: inout [CardFile]) {
        for index in game.acts.indices {
            if let title = acts?[game.acts[index].id] { game.acts[index].title = title }
        }
        for index in game.endings.indices {
            if let ending = endings?[game.endings[index].id] {
                game.endings[index].title = ending.title
                game.endings[index].text = ending.text
            }
        }
        if let intro, !intro.isEmpty { game.intro = intro }
        for f in files.indices {
            for c in files[f].cards.indices {
                guard let text = cards?[files[f].cards[c].id] else { continue }
                if let body = text.text { files[f].cards[c].text = body }
                if let speaker = text.speaker { files[f].cards[c].speaker = speaker }
                if let choices = text.choices, choices.count == files[f].cards[c].choices.count {
                    for k in choices.indices {
                        files[f].cards[c].choices[k].label = choices[k].label
                        if let result = choices[k].result { files[f].cards[c].choices[k].result = result }
                    }
                }
            }
        }
    }

    /// Доля переведённых карточек — для настроек и отчёта.
    public func coverage(of content: GameContent) -> Double {
        guard !content.cards.isEmpty else { return 0 }
        let done = content.cards.filter { cards?[$0.id]?.text != nil }.count
        return Double(done) / Double(content.cards.count)
    }
}
