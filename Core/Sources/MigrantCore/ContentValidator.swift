/// Проверка сценария на битые ссылки и тупики.
///
/// Сценарий пишется руками, карточек будут сотни — опечатка в `next`
/// обнаружилась бы только на сороковой минуте игры. Тот же набор проверок
/// повторяет `tools/content.py`, чтобы писать карточки без Xcode.
public enum ContentValidator {
    public static func problems(in content: GameContent) -> [String] {
        var problems: [String] = []
        let cardIds = Set(content.cards.map(\.id))
        let actIds = Set(content.acts.map(\.id))
        let endingIds = Set(content.endings.map(\.id))

        func duplicates(_ ids: [String]) -> [String] {
            var seen = Set<String>()
            return ids.filter { !seen.insert($0).inserted }
        }
        for id in duplicates(content.acts.map(\.id)) { problems.append("акт \(id) объявлен дважды") }
        for id in duplicates(content.endings.map(\.id)) { problems.append("концовка \(id) объявлена дважды") }

        if !actIds.contains(content.start.act) {
            problems.append("старт: нет акта \(content.start.act)")
        }
        if !cardIds.contains(content.start.card) {
            problems.append("старт: нет карточки \(content.start.card)")
        }
        for act in content.acts {
            if let fallback = act.fallback {
                if let card = content.card(fallback) {
                    if card.repeatable != true {
                        problems.append("акт \(act.id): запасная карточка \(fallback) не повторяемая")
                    }
                } else {
                    problems.append("акт \(act.id): нет запасной карточки \(fallback)")
                }
            } else {
                problems.append("акт \(act.id): нет запасной карточки — игра может встать")
            }
        }
        for card in content.cards {
            let place = "карточка \(card.id)"
            if let act = card.act, !actIds.contains(act) {
                problems.append("\(place): неизвестный акт \(act)")
            }
            if card.choices.isEmpty {
                problems.append("\(place): нет вариантов ответа")
            }
            // Хотя бы одна кнопка должна быть всегда — иначе игрок застрянет.
            if !card.choices.isEmpty, !card.choices.contains(where: { $0.requires == nil }) {
                problems.append("\(place): все варианты с условиями, игрок может застрять")
            }
            for choice in card.choices {
                let effects = choice.effects ?? Effects()
                for id in effects.next ?? [] where !cardIds.contains(id) {
                    problems.append("\(place): next ведёт на несуществующую \(id)")
                }
                for entry in effects.schedule ?? [] where !cardIds.contains(entry.card) {
                    problems.append("\(place): отложена несуществующая \(entry.card)")
                }
                if let act = effects.act, !actIds.contains(act) {
                    problems.append("\(place): переход в несуществующий акт \(act)")
                }
                if let ending = effects.ending, !endingIds.contains(ending) {
                    problems.append("\(place): несуществующая концовка \(ending)")
                }
            }
        }
        return problems
    }
}
