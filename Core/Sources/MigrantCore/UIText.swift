import Foundation

/// Строки интерфейса на трёх языках. Сценарий переводится отдельно — `ContentTranslation`.
///
/// Свой словарь вместо Localizable.strings: язык выбирается внутри игры, а не
/// в настройках телефона, и все строки проверяются тестом на полноту.
public enum UIKey: String, CaseIterable, Sendable {
    case gameTitle, tagline, newGame, continueGame, settings, endingsOpened, scriptFailed
    case menu, day, next, start, skip, newEnding, daysAndChoices, playAgain, toMenu
    case statMoney, statNerves, statDocuments, statHome, statBelonging
    case theme, themeNight, themeDay, themeSepia
    case language, languageNote
    case music, musicOn, volume, track
    case privacy, privacyText, aboutStory, aboutStoryText, done
    case endings, endingLocked, telegram, telegramSoon, shareGame, shareText, rateGame
    case resetProgress, resetConfirm, resetWarning, newGameConfirm, newGameWarning, cancel, version
}

public enum UIText {
    /// `%d` в строке — число; порядок подстановок одинаков во всех языках.
    public static func text(_ key: UIKey, _ language: AppLanguage, _ numbers: Int...) -> String {
        text(key, language, numbers: numbers)
    }

    public static func text(_ key: UIKey, _ language: AppLanguage, numbers: [Int]) -> String {
        let format = table[language]?[key] ?? table[.ru]?[key] ?? key.rawValue
        return numbers.reduce(format) { text, number in
            guard let range = text.range(of: "%d") else { return text }
            return text.replacingCharacters(in: range, with: String(number))
        }
    }

    public static let table: [AppLanguage: [UIKey: String]] = [
        .ru: [
            .gameTitle: "23 кг",
            .tagline: "История про эмиграцию.\nСмешная и немного грустная.\nОснована на реальных событиях.",
            .newGame: "Новая игра",
            .continueGame: "Продолжить",
            .settings: "Настройки",
            .endingsOpened: "Открыто концовок: %d из %d",
            .scriptFailed: "Сценарий не загрузился:",
            .menu: "Меню",
            .day: "День %d",
            .next: "Дальше",
            .start: "Начать",
            .skip: "Пропустить",
            .newEnding: "Новая концовка",
            .daysAndChoices: "Дней в пути: %d · решений: %d",
            .playAgain: "Начать заново",
            .toMenu: "В меню",
            .statMoney: "Деньги",
            .statNerves: "Кукуха",
            .statDocuments: "Документы",
            .statHome: "Дом",
            .statBelonging: "Свой тут",
            .theme: "Цвета",
            .themeNight: "Ночь",
            .themeDay: "День",
            .themeSepia: "Сепия",
            .language: "Язык",
            .languageNote: "Перевод карточек появится постепенно. Пока его нет, карточка показывается по-русски.",
            .music: "Музыка",
            .musicOn: "Играть музыку",
            .volume: "Громкость",
            .track: "Мелодия",
            .privacy: "Приватность",
            .privacyText: "Игра ничего не собирает и никуда не отправляет. Нет рекламы, аналитики и аккаунтов. Сохранение, открытые концовки и настройки хранятся только на этом телефоне и удаляются вместе с игрой.",
            .aboutStory: "Об истории",
            .aboutStoryText: "Игра основана на реальной истории одной семьи: Петербург, Тбилиси, Батуми, Фигейра-да-Фош, Оэйраш. Имена убраны, люди названы по ролям. Главные события настоящие; часть вариантов выбора — то, как могло бы быть.",
            .done: "Готово",
            .endings: "Концовки",
            .endingLocked: "Ещё не открыта",
            .telegram: "Телеграм-канал",
            .telegramSoon: "Телеграм-канал — скоро",
            .shareGame: "Поделиться игрой",
            .shareText: "«23 кг» — игра про эмиграцию. Смешная и немного грустная. Основана на реальной истории.",
            .rateGame: "Оценить игру",
            .resetProgress: "Сбросить прогресс",
            .resetConfirm: "Сбросить",
            .resetWarning: "Удалятся текущая партия и открытые концовки. Настройки останутся.",
            .newGameConfirm: "Начать заново",
            .newGameWarning: "Текущая партия закончится. Открытые концовки останутся.",
            .cancel: "Отмена",
            .version: "Версия"
        ],
        .en: [
            .gameTitle: "23 kg",
            .tagline: "A story about emigration.\nFunny and a little sad.\nBased on real events.",
            .newGame: "New game",
            .continueGame: "Continue",
            .settings: "Settings",
            .endingsOpened: "Endings found: %d of %d",
            .scriptFailed: "The story failed to load:",
            .menu: "Menu",
            .day: "Day %d",
            .next: "Next",
            .start: "Start",
            .skip: "Skip",
            .newEnding: "New ending",
            .daysAndChoices: "Days on the road: %d · choices: %d",
            .playAgain: "Play again",
            .toMenu: "Main menu",
            .statMoney: "Money",
            .statNerves: "Nerves",
            .statDocuments: "Papers",
            .statHome: "Home",
            .statBelonging: "Belonging",
            .theme: "Colors",
            .themeNight: "Night",
            .themeDay: "Day",
            .themeSepia: "Sepia",
            .language: "Language",
            .languageNote: "Cards are being translated step by step. Until a card is translated, it is shown in Russian.",
            .music: "Music",
            .musicOn: "Play music",
            .volume: "Volume",
            .track: "Melody",
            .privacy: "Privacy",
            .privacyText: "The game collects nothing and sends nothing anywhere. No ads, no analytics, no accounts. Your save, endings and settings stay on this phone and are deleted with the game.",
            .aboutStory: "About the story",
            .aboutStoryText: "The game is based on the real story of one family: Saint Petersburg, Tbilisi, Batumi, Figueira da Foz, Oeiras. Names are removed; people are called by their roles. The main events are real; some of the choices are what could have been.",
            .done: "Done",
            .endings: "Endings",
            .endingLocked: "Not found yet",
            .telegram: "Telegram channel",
            .telegramSoon: "Telegram channel — soon",
            .shareGame: "Share the game",
            .shareText: "“23 kg” — a game about emigration. Funny and a little sad. Based on a true story.",
            .rateGame: "Rate the game",
            .resetProgress: "Reset progress",
            .resetConfirm: "Reset",
            .resetWarning: "Your current game and found endings will be deleted. Settings stay.",
            .newGameConfirm: "Start over",
            .newGameWarning: "Your current game will end. Found endings stay.",
            .cancel: "Cancel",
            .version: "Version"
        ],
        .pt: [
            .gameTitle: "23 kg",
            .tagline: "Uma história sobre emigração.\nEngraçada e um pouco triste.\nBaseada em factos reais.",
            .newGame: "Novo jogo",
            .continueGame: "Continuar",
            .settings: "Definições",
            .endingsOpened: "Finais descobertos: %d de %d",
            .scriptFailed: "A história não carregou:",
            .menu: "Menu",
            .day: "Dia %d",
            .next: "Seguinte",
            .start: "Começar",
            .skip: "Saltar",
            .newEnding: "Novo final",
            .daysAndChoices: "Dias de viagem: %d · escolhas: %d",
            .playAgain: "Recomeçar",
            .toMenu: "Menu principal",
            .statMoney: "Dinheiro",
            .statNerves: "Nervos",
            .statDocuments: "Papéis",
            .statHome: "Casa",
            .statBelonging: "Pertença",
            .theme: "Cores",
            .themeNight: "Noite",
            .themeDay: "Dia",
            .themeSepia: "Sépia",
            .language: "Idioma",
            .languageNote: "Os cartões estão a ser traduzidos aos poucos. Até lá, aparecem em russo.",
            .music: "Música",
            .musicOn: "Tocar música",
            .volume: "Volume",
            .track: "Melodia",
            .privacy: "Privacidade",
            .privacyText: "O jogo não recolhe nada nem envia nada para lado nenhum. Sem anúncios, sem análises, sem contas. O progresso, os finais e as definições ficam só neste telemóvel e são apagados com o jogo.",
            .aboutStory: "Sobre a história",
            .aboutStoryText: "O jogo baseia-se na história real de uma família: São Petersburgo, Tbilisi, Batumi, Figueira da Foz, Oeiras. Os nomes foram retirados; as pessoas são chamadas pelos seus papéis. Os acontecimentos principais são reais; algumas escolhas são o que poderia ter sido.",
            .done: "Feito",
            .endings: "Finais",
            .endingLocked: "Ainda por descobrir",
            .telegram: "Canal no Telegram",
            .telegramSoon: "Canal no Telegram — em breve",
            .shareGame: "Partilhar o jogo",
            .shareText: "«23 kg» — um jogo sobre emigração. Engraçado e um pouco triste. Baseado numa história real.",
            .rateGame: "Avaliar o jogo",
            .resetProgress: "Apagar progresso",
            .resetConfirm: "Apagar",
            .resetWarning: "O jogo atual e os finais descobertos serão apagados. As definições ficam.",
            .newGameConfirm: "Recomeçar",
            .newGameWarning: "O jogo atual vai terminar. Os finais descobertos ficam.",
            .cancel: "Cancelar",
            .version: "Versão"
        ]
    ]
}
