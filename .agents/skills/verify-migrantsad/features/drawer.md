# Боковое меню

Выезжает слева в партии: продолжить, в меню, новая игра, путь, альбом, воспоминания,
концовки, настройки, поделиться, оценить, об истории, приватность, сбросить прогресс, версия.

## Sub-features

- Открытие: ☰ (`game-menu`) или свайп от самого левого края (28 pt).
- Разделы-листы: путь, альбом, воспоминания, концовки, настройки, об истории, приватность.
- «Новая игра» и «Сбросить прогресс» — с подтверждением.

## How to get to it (user POV)

Начать партию (см. [new-game.md](new-game.md)), затем ☰.

## Driving it with e2e

Теста нет. Пункты меню без идентификаторов: `screen.getByRole('button', /^Альбом/)` и т. п.
— сначала `locate` в живой сессии. Закрытое меню скрыто от доступности
(`accessibilityHidden`), так что до открытия его пункты не находятся — это ожидаемо.

## Proof

После ☰ видны пункты меню; «В меню» возвращает на титул с `title-continue`.

## Charters

```
drawer-sections|ios|default|Starting on a game card, open the side menu and visit every section, then return to the game; report sections that cannot be closed or lose the current card
```

## Gotchas

- «Поделиться» и «Оценить» открывают системные окна вне игры.
- «Telegram» может быть неактивен («скоро») — это не баг.
