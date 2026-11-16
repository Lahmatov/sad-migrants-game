# Настройки

Лист поверх титула или партии: тема, язык, музыка и звуки, шрифт, приватность, об истории.

## Sub-features

- Тема: «Ночь» / «День» / «Сепия» (`settings-theme-*`), выбранная — selected.
- Язык: «Русский» / «English» / «Português» (`settings-language-*`); тексты меняются сразу.
- Музыка: переключатель «Играть музыку», громкость, выбор трека, «Звуки».
- Шрифт: пиксельный / обычный (`settings-font-*`).
- «Готово» (`settings-done`) закрывает лист.

## How to get to it (user POV)

Титул → «Настройки»; в партии — шестерёнка (`game-settings`); боковое меню → «Настройки».

## Driving it with e2e

`e2e/tests/title.e2e.ts` — «Готово» закрывает лист; English меняет подписи титула.
`e2e/tests/agent.e2e.ts` — агент открывает настройки и выбирает тему «День», проверка —
`expect(getByTestId('settings-theme-day')).toBeSelected()`. Переключатели музыки без id:
`screen.getByRole('switch', 'Играть музыку')` (проверь `locate`).

## Proof

После выбора — у кнопки признак selected; после «Готово» титул на выбранном языке
(`title-new-game` с именем `New game`). Настройки переживают перезапуск (`UserDefaults`,
ключ `settings`): `app.restart()` и та же подпись.

## Charters

```
settings-languages|ios|default|Starting on the title screen, open Settings and switch through every language and theme; report untranslated text, cut-off labels or a selection that does not stick after Done
```

## Gotchas

- Лист прокручивается: нижние секции (приватность, об истории) могут быть за краем —
  `scrollUntilVisible` или свайп.
- Без записей музыки в `App/Resources/Music` треки молчат — это не баг сборки CI.
