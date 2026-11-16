---
name: verify-migrantsad
description: Запустить, проверить, пройти и доказать на симуляторе iPhone игру «23 кг» (MigrantSad, SwiftUI, bundle com.lahmatov.migrantsad) через e2e и движок @e2e-dev/mobile. Использовать перед тем, как утверждать, что изменение экранов в App/ работает, когда просят проверить или снять экран игры, или устроить баг-баш. Нужен Mac с Xcode; на Linux — только macOS-джоба e2e в CI.
---

# Проверка игры «23 кг»

Сначала прочитай скилл e2e (`cd e2e && npx e2e guide` печатает его из установленного пакета;
темы `setup`, `writing-tests`, `mcp`, `running`, `debugging`, `bug-bash`). Здесь — только то,
что верно для этой игры. Всё e2e живёт в подпакете `e2e/`: конфиг `e2e/e2e.config.ts`
(одна цель `ios`, движок `mobile({ platform: 'ios' })`), тесты `e2e/tests/**/*.e2e.ts`.
Команды ниже запускаются из `e2e/`.

## Где это работает

Только macOS с Xcode и рантаймом iOS-симулятора. На Linux (облачная сессия) симулятора нет:
`npx e2e doctor` падает на `device`, `npx e2e list` и `npm run typecheck` работают. Тогда
доказательство — зелёная джоба `e2e — iOS-симулятор` в `.github/workflows/e2e.yml` и её
артефакт `e2e-ios` (папка `.e2e/`). Пуш в ветку запускает её сам.

## Launch

У цели нет `app.command`: e2e запускает установленное приложение по `bundleId`
(`com.lahmatov.migrantsad`) и ничего не ставит сам. Один раз на симулятор:

```sh
xcodegen generate          # из корня репозитория
xcodebuild build -project MigrantSad.xcodeproj -scheme MigrantSad -configuration Debug \
  -sdk iphonesimulator -destination "generic/platform=iOS Simulator" -derivedDataPath build \
  CODE_SIGNING_ALLOWED=NO
xcrun simctl boot "iPhone 17"   # любой iPhone; или открыть Simulator.app
xcrun simctl install booted build/Build/Products/Debug-iphonesimulator/MigrantSad.app
cd e2e && npm ci
```

После каждой правки в `App/` или `Core/` — пересобрать и снова `simctl install`, иначе тесты
гоняют старую сборку. `IOS_DEVICE=<имя или UDID>` выбирает симулятор; без него берётся
загруженный iPhone. Игра без сети, аккаунтов и сервера; сид не нужен.

## Doctor

```sh
npx e2e doctor                                   # Xcode, agent-device, симулятор, установлена ли игра
npx e2e list                                     # грузит конфиг, ничего не запускает; 7 тестов на [ios]
npx e2e run tests/title.e2e.ts:11 --retries 0    # smoke: свежая установка, на титуле «Новая игра»
```

`list` падает — конфиг или зависимости. `doctor` ругается на `bundleId` — игра не установлена
на загруженный симулятор. Smoke падает с `LOCATOR_NOT_FOUND` на `title-new-game` — сломан сам
титульный экран (или сценарий не загрузился: тогда на экране текст `scriptFailed`). Doctor —
первым делом, когда что-то выглядит странно.

## Drive

Каждый тест начинает с `app.clearState()` + `app.open()`: свежая установка, язык русский, тема
«Ночь», сохранения нет. Опора — идентификаторы доступности (`.accessibilityIdentifier`),
не тексты: тексты зависят от языка. Полный список — в [features/](features/README.md).
Новый экран — новый идентификатор в коде SwiftUI, в том же коммите.

- Скриптом: `screen.getByTestId('…')` для всего, у чего есть id; `toHaveAccessibleName` —
  когда важен текст на конкретном языке.
- Агентом: `agent.act` для «дойти до X» (тест `tests/agent.e2e.ts`), исполнитель — Claude Code
  по подписке (`claudeCode({ model: 'sonnet' })` из `@e2e-dev/acp`). Локально нужен вход
  `claude`; в CI — секрет `CLAUDE_CODE_OAUTH_TOKEN`, без него эти тесты пропускаются
  (`tests/support.ts`). `agent.waitFor` и `agent.extract` с этим исполнителем не работают
  (им нужна `model`) — не пиши их.
- Вживую: `npx e2e mcp` (тема `mcp`), `open_session` на цели `ios`, затем `observe` и `locate`
  перед тем, как писать локатор. Сессия устройства стартует с экрана запуска игры.
- Не завязывайся на тайминги: вступление печатается по буквам ~минуту — жми `intro-skip`;
  итог выбора и карточки случайны (сид партии случайный), поэтому проверяй структуру
  (`game-menu`, `choice-<n>`), а не текст конкретной карточки.

## Evidence

Каждый прогон пишет `e2e/.e2e/report.json`; упавший тест — `e2e/.e2e/results/<test>/trace.md`
со снимком экрана и деревом доступности на момент падения. `--trace on` — трейс и для
прошедших, `--video` — видео попытки, `app.screenshot('<имя>')` — именованный кадр.
Следующий прогон чистит `results/` (Doctor тоже), поэтому доказательство, которое должно
пережить его, гоняй с `--output .e2e/proof/<имя>`. Доказательство проходит путь игрока
(титул → кнопка → экран) и фиксирует действие и состояние после него, а не только финальный
экран. Побочные эффекты игры — файлы в Application Support контейнера приложения
(`save.json` — партия, `endings.json`, `album.json`) и настройки в `UserDefaults` (ключ
`settings`); снаружи их видно как результат: после перезапуска есть «Продолжить»
(`title-continue`), язык сохраняется. В CI всё это — артефакт `e2e-ios`.

## Bug bash

Чартеры — в файлах [features/](features/), строка `slug|target|agent|charter` (тема
`bug-bash`). `npx e2e explore '<charter>' --target ios --max-steps 20 --output .e2e/bugbash/<slug>`
идёт на конфиге `e2e.config.ts` с агентом Claude Code; отдельный конфиг для баг-баша не нужен,
пока нет персон. Один симулятор — один исследователь: параллельно — только с отдельным
симулятором на каждого (по цели с `device` на каждого, тема `bug-bash`). Не баг: случайные
карточки, музыка при запуске, русский язык по умолчанию, отсутствие картинок у части карточек
(`App/Resources/Art` пополняется). Находка — баг, только когда
`tests/bugbash/<slug>.e2e.ts` падает на описанном дефекте. Баг-баш здесь ещё ни разу не
запускался (не было macOS и входа в Claude) — первый прогон его и доказывает.

## Cleanup

Раннер закрывает игру после прогона; `close_session` — после сессии MCP. Симулятор, который
ты загрузил, гаси сам (`xcrun simctl shutdown <UDID>`), чужой не трогай. Удали
`.e2e/bugbash/<slug>/` чартера, все находки которого отклонены. `results/`, `proof/`,
`report.json` — это доказательство, не удаляй; всё в `.gitignore`.

## Helpers

Нет. Помощник — CLI e2e; сборка и установка — команды из Launch.
