# Карта функций

Один файл на функцию игры с точки зрения игрока: как до неё дойти, какой тест её держит,
какие идентификаторы важны, что считается доказательством, чартеры баг-баша.

| Функция | Экран | Тест | Статус |
| --- | --- | --- | --- |
| [Титул](title.md) | запуск игры | `e2e/tests/title.e2e.ts` | tested |
| [Настройки](settings.md) | титул → «Настройки»; в партии — шестерёнка | `e2e/tests/title.e2e.ts`, `e2e/tests/agent.e2e.ts` | tested |
| [Новая партия](new-game.md) | титул → «Новая игра» → вступление → карточка | `e2e/tests/new-game.e2e.ts`, `e2e/tests/agent.e2e.ts` | tested |
| [Боковое меню](drawer.md) | в партии — ☰ или свайп от левого края | — | untested |

Не размечены: концовки (`EndingView`), альбом, путь, воспоминания, галерея концовок —
до них долго играть; размечать, когда понадобятся.

## Идентификаторы доступности

| id | Где |
| --- | --- |
| `title-continue`, `title-new-game`, `title-settings` | кнопки титула (`TitleView.swift`) |
| `settings-done` | «Готово» в настройках (`SettingsView.swift`) |
| `settings-theme-night`, `-day`, `-sepia` | тема; выбранная несёт признак selected |
| `settings-language-ru`, `-en`, `-pt` | язык |
| `settings-font-pixel`, `settings-font-plain` | шрифт текста |
| `intro-skip`, `intro-start` | «Пропустить», «Начать» на вступлении (`IntroView.swift`) |
| `game-menu`, `game-settings` | ☰ и шестерёнка в партии (`GameView.swift`) |
| `choice-<n>` | кнопка ответа; `n` — номер выбора в карточке, недоступные скрыты |
