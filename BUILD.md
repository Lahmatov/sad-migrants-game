# Сборка

## Один раз

```sh
brew install xcodegen
```

Впиши свой Team ID в `Config/Signing.xcconfig` (Xcode → Settings → Accounts → твой Apple ID → колонка Team ID).

## Одна команда, которая проверит всё

```sh
./tools/check.sh
```

Проверит сценарий, прогонит линтер и тесты ядра, сгенерирует проект и соберёт приложение под симулятор.
Если что-то сломалось — сложит **только ошибки** в `build-errors.txt`. Этот файл можно прислать целиком.

```sh
./tools/check.sh core           # только тесты ядра, пара секунд
./tools/check.sh app            # только сборка приложения
python3 tools/content.py        # сценарий: ссылки, тупики, баланс — без Xcode
python3 tools/lint.py           # статические проверки Swift — без Xcode
```

Код ни разу не компилировался — он писался без Mac. В первый раз ошибки почти наверняка будут:
пришли `build-errors.txt`, поправлю.

## Запуск

```sh
xcodegen generate
open MigrantSad.xcodeproj
```

Выбери iPhone и нажми ⌘R. `MigrantSad.xcodeproj` не лежит в репозитории — он собирается из `project.yml`.
