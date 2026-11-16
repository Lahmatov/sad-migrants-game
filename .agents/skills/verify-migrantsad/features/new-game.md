# Новая партия

«Новая игра» → вступление (строфы печатаются по буквам) → первая карточка с ответами.

## Sub-features

- Вступление: «Пропустить» (`intro-skip`) сразу в игру; в конце — «Начать» (`intro-start`);
  тап по экрану ускоряет печать.
- Карточка: шкалы сверху, ☰ (`game-menu`), день, шестерёнка (`game-settings`), картинка,
  текст, кнопки ответов (`choice-<n>`).
- Итог выбора — панель поверх карточки; партия сохраняется после каждого выбора.

## How to get to it (user POV)

Титул → «Новая игра». Посреди партии — боковое меню → «Новая игра» (с подтверждением).

## Driving it with e2e

`e2e/tests/new-game.e2e.ts`: «Пропустить» открывает карточку; после `app.restart()` на титуле
есть «Продолжить». Локаторы: `getByTestId('intro-skip')`, `'game-menu'`,
`getByTestId(/^choice-\d+$/).first()`. `e2e/tests/agent.e2e.ts` — то же агентом
(«start a new game», «skip the intro») и `agent.assert` о карточке.

## Proof

После «Пропустить» видны `game-menu`, `game-settings` и хотя бы одна `choice-<n>`. Партия
записана в `save.json`: после перезапуска есть `title-continue`.

## Charters

```
first-choices|ios|default|Starting on the title screen, start a new game, skip the intro and make five choices; report a choice that does nothing, an outcome panel that cannot be dismissed or stats that do not change
```

## Gotchas

- Сид партии случайный: первая карточка одна, но дальше тексты и итоги различаются от прогона
  к прогону. Проверяй структуру, не текст.
- Без «Пропустить» вступление идёт около минуты — не жди его в тестах.
- У части карточек ещё нет картинки — место под картинку пустое, это не баг.
