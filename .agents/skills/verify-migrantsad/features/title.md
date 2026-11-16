# Титул

Первый экран: панорама, название «23 кг», подзаголовок и меню.

## Sub-features

- «Продолжить» (`title-continue`) — только если есть незаконченная партия.
- «Новая игра» (`title-new-game`) — залита цветом, когда продолжать нечего.
- «Настройки» (`title-settings`) — открывает лист настроек.
- «Открыто N из M» — после первой концовки; ошибка загрузки сценария — красным текстом.

## How to get to it (user POV)

Запуск игры. Из партии — боковое меню → «В меню». Аккаунт не нужен.

## Driving it with e2e

`e2e/tests/title.e2e.ts`: свежая установка (`app.clearState()`), три теста. Локаторы:
`screen.getByTestId('title-new-game')`, `'title-settings'`, `'title-continue'`; текст —
`toHaveAccessibleName('Новая игра')`. Вживую: `open_session`, `observe` — игра стартует на титуле.

## Proof

На свежей установке видны `title-new-game` и `title-settings`, `title-continue` нет
(`toHaveCount(0)`). После начатой партии и `app.restart()` — есть `title-continue`.

## Charters

```
title-fresh|ios|default|Starting on the title screen of a fresh install, open every menu entry and come back; report buttons that do nothing, overlap or are cut off
```

## Gotchas

- При запуске играет музыка — это не баг.
- Язык по умолчанию русский, даже на английском симуляторе: язык — настройка игры, не системы.
