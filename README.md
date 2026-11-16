# 23 кг

Пиксельная текстовая игра про эмиграцию. Смешная и немного грустная. Основано на реальных событиях. iPhone, SwiftUI.

Папа, мама и маленький сын уезжают из Петербурга. Три чемодана по двадцать три килограмма. Дальше будут
одна комната в Тбилиси, камни на пляже в Батуми, отказ во ВНЖ, шенген на исходе, Атлантика в Фигейре-да-Фош,
AIMA, потерянная биометрия и мама, которая спрашивает, тепло ли вам.

## Где что

| | |
|---|---|
| `docs/vision.md` | о чём игра, механика, тон, правила текста |
| `docs/tree.md` | дерево прогресса и дерево решений, концовки |
| `docs/roadmap.md` | трек: от MVP до App Store |
| `docs/art.md` | где брать графику, стиль, промпты на все сцены |
| `docs/art-brief.md` | бриф для художника или ИИ: всё, что нарисовать, по шагам (собирается скриптом) |
| `docs/content-format.md` | как писать карточки |
| `docs/stories.md` | реальные истории — сырьё для карточек |
| `docs/decisions.md` | архитектурные решения |
| `Core/` | движок и сценарий (Swift-пакет, тесты без симулятора) |
| `App/` | экраны на SwiftUI |
| `tools/` | проверка сценария, линтер, полная проверка |

## Быстрый старт

```sh
python3 tools/content.py --play   # сыграть в терминале, без Xcode
```

Сборка под айфон — `BUILD.md`.

## Сквозные тесты (e2e)

Игру на симуляторе iPhone проходят тесты [e2e](https://github.com/e2e-inc/e2e) с движком
`@e2e-dev/mobile`. Всё лежит в `e2e/` (свой `package.json`, конфиг `e2e.config.ts`, тесты
`e2e/tests/`). Нужен Mac с Xcode и Node.js 22.22+ или 24.8+:

```sh
xcodegen generate
xcodebuild build -project MigrantSad.xcodeproj -scheme MigrantSad -configuration Debug \
  -sdk iphonesimulator -destination "generic/platform=iOS Simulator" -derivedDataPath build \
  CODE_SIGNING_ALLOWED=NO
xcrun simctl boot "iPhone 17"
xcrun simctl install booted build/Build/Products/Debug-iphonesimulator/MigrantSad.app
cd e2e && npm ci
npx e2e doctor     # всё ли на месте
npx e2e run        # все тесты; отчёт и трейсы — в e2e/.e2e/
```

- Обычные тесты (`title`, `new-game`) жмут кнопки по идентификаторам доступности
  (`.accessibilityIdentifier` в `App/Sources`) — модель им не нужна.
- Тесты с шагами агента (`tests/agent.e2e.ts`) идут через Claude Code по подписке: локально
  нужен вход `claude`, в CI — секрет репозитория `CLAUDE_CODE_OAUTH_TOKEN` (получить:
  `claude setup-token`). Без секрета в CI они пропускаются.
- В CI тесты гоняет отдельный workflow `.github/workflows/e2e.yml` на macOS: собирает игру,
  поднимает симулятор, запускает e2e и выкладывает отчёт артефактом `e2e-ios`.

Как проверить изменение экрана и устроить баг-баш — скилл для агентов
`.agents/skills/verify-migrantsad/` (там же карта функций и все идентификаторы).
