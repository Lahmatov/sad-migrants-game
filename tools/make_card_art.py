#!/usr/bin/env python3
"""Промпты на картинку для каждой карточки и каждого выбора.

    python3 tools/make_card_art.py           # собрать всё
    python3 tools/make_card_art.py --check   # только проверить, что ничего не пропущено

Источник — art/cards/*.json: по файлу на акт, в каждом карточки с полями
`image` (что нарисовать, по-английски), `anim` (какая анимация поверх)
и необязательным `key` — ключевая карточка, её рисуют во вторую очередь,
и такие же поля у каждого выбора. Там же лежит `label` кнопки: если текст
кнопки в сценарии поменялся, скрипт это заметит — значит, картинку выбора
пора пересмотреть.

Собирает:
- docs/card-prompts.md — по порядку игры, с готовыми промптами;
- art/prompts.csv — то же таблицей, чтобы скармливать генератору пачкой;
- App/Resources/Art/anim.json — какую анимацию приложение рисует поверх какой картинки.
"""
import csv
import glob
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import content  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SOURCE = os.path.join(ROOT, 'art', 'cards')
DOC = os.path.join(ROOT, 'docs', 'card-prompts.md')
CSV = os.path.join(ROOT, 'art', 'prompts.csv')
ANIM = os.path.join(ROOT, 'App', 'Resources', 'Art', 'anim.json')
ART_MD = os.path.join(ROOT, 'docs', 'art.md')

# Совпадает с ArtAnimation в Core/Sources/MigrantCore/ArtMotion.swift — это проверяет тест.
ANIMATIONS = ['none', 'rain', 'snow', 'sea', 'gulls', 'steam', 'lights', 'dust', 'stars', 'confetti']

ANIM_RU = {
    'none': 'без анимации',
    'rain': 'дождь по всему кадру',
    'snow': 'падающий снег',
    'sea': 'блики на воде в нижней трети',
    'gulls': 'чайки пролетают в верхней части',
    'steam': 'пар поднимается из центра',
    'lights': 'мигают огоньки в верхних двух третях',
    'dust': 'пылинки медленно плывут',
    'stars': 'мерцают звёзды в верхней части',
    'confetti': 'конфетти падает',
}

# Где у анимации «живое место» — чтобы художник оставил там пустоту или воду.
ANIM_HINT = {
    'sea': 'keep water in the lower third of the frame',
    'gulls': 'keep open sky in the upper part of the frame',
    'stars': 'keep dark night sky in the upper part of the frame',
    'steam': 'a steaming cup or pot near the center of the frame',
    'lights': 'small lit windows or lamps scattered in the upper two thirds',
}


def scene_prompts():
    """Описания сцен из docs/art.md: место действия, общее для многих карточек."""
    with open(ART_MD, encoding='utf-8') as handle:
        art = handle.read()
    prefix = ' '.join(re.search(r'\*\*Общий префикс:\*\*\s*```\n(.*?)\n```', art, re.S).group(1).split())
    negative = ' '.join(re.search(r'\*\*Негатив\*\*[^\n]*\s*```\n(.*?)\n```', art, re.S).group(1).split())
    scenes = {m.group(1): ' '.join(m.group(2).split())
              for m in re.finditer(r'^### `([a-z_]+)`[^\n]*\n(?:[^`\n][^\n]*\n)?```\n(.*?)\n```', art, re.M | re.S)}
    return prefix, negative, scenes


def load_art():
    acts = []
    for path in sorted(glob.glob(os.path.join(SOURCE, '*.json'))):
        with open(path, encoding='utf-8') as handle:
            acts.append((os.path.basename(path), json.load(handle)))
    return acts


def problems(cards, acts):
    """Всё, из-за чего у карточки или выбора не будет своей картинки."""
    found = []
    art = {}
    for name, data in acts:
        for entry in data['cards']:
            if entry['id'] in art:
                found.append(f'{name}: карточка {entry["id"]} описана дважды')
            art[entry['id']] = entry
    ids = {c['id'] for c in cards}
    for extra in sorted(set(art) - ids):
        found.append(f'art: {extra} — такой карточки в сценарии нет')
    for card in cards:
        entry = art.get(card['id'])
        if entry is None:
            found.append(f'{card["id"]}: нет промпта')
            continue
        check_one(found, card['id'], entry)
        drawn = entry.get('choices', [])
        if len(drawn) != len(card['choices']):
            found.append(f'{card["id"]}: выборов в сценарии {len(card["choices"])}, промптов {len(drawn)}')
        for index, (choice, pic) in enumerate(zip(card['choices'], drawn), 1):
            if pic.get('label') != choice['label']:
                found.append(f'{card["id"]}__{index}: кнопка теперь «{choice["label"]}», '
                             f'а промпт писался для «{pic.get("label")}»')
            check_one(found, f'{card["id"]}__{index}', pic)
    return found


def check_one(found, name, entry):
    if not entry.get('image', '').strip():
        found.append(f'{name}: пустой промпт')
    if 'key' in entry and entry['key'] is not True:
        found.append(f'{name}: key бывает только true')
    if entry.get('anim') not in ANIMATIONS:
        found.append(f'{name}: неизвестная анимация {entry.get("anim")!r}')


def tier(name, entry, is_card):
    """Очередь рисования: 1 — фоны сцен (в docs/art-brief.md), 2 — ключевые карточки, 3 — остальное."""
    return 2 if is_card and entry.get('key') else 3


def full_prompt(prefix, scenes, scene, moment, anim):
    place = scenes.get(scene, '')
    # Место сцены — для единства картинок одного места; момент карточки главнее.
    parts = [prefix, f'Moment: {moment}',
             f'Usual place, adapt if the moment says otherwise: {place}' if place else '',
             ANIM_HINT.get(anim, '')]
    return ' '.join(p.strip().rstrip('.,') + '.' for p in parts if p.strip())


def build():
    game, cards = content.load()
    acts = load_art()
    found = problems(cards, acts)
    if found:
        print(f'Промпты неполные ({len(found)}):')
        for line in found[:40]:
            print(f'  • {line}')
        if len(found) > 40:
            print(f'  … и ещё {len(found) - 40}')
        return 1
    if '--check' in sys.argv:
        print(f'Промпты на месте: {sum(1 + len(c["choices"]) for c in cards)} картинок')
        return 0

    prefix, negative, scenes = scene_prompts()
    art = {e['id']: e for _, data in acts for e in data['cards']}
    act_titles = {a['id']: a['title'] for a in game['acts']}
    rows, anims = [], {}
    key_cards = [c for c in cards if art[c['id']].get('key')]
    out = []
    w = out.append
    w('# Картинки карточек и выборов')
    w('')
    w('> Собрано скриптом `tools/make_card_art.py` из `art/cards/*.json`. Править промпты — там.')
    w('')
    w('**Как сдавать.** PNG 180×135 (или крупнее строго 4:3 — приложение растянет без сглаживания).')
    w('Файл кладётся в `App/Resources/Art/` под именем из заголовка. Пересобирать проект не нужно — '
      'достаточно запустить сборку в Xcode.')
    w('')
    w('Порядок показа: картинка выбора → картинка карточки → фон сцены из `docs/art-brief.md` → живая сцена из кода. '
      'Поэтому рисовать можно в любом порядке: пропущенное подменится.')
    w('')
    w('**Стиль.** Перед первой картинкой дай генератору «первое сообщение» и три опорные картинки из '
      '`docs/art-brief.md` (шаги 0–2) — и прикладывай их как референс стиля к каждой. Иначе 711 картинок '
      'разъедутся по стилю.')
    w('')
    w('**Анимацию рисовать не нужно.** Её добавляет код поверх картинки — в каждой строке указано какую, '
      'чтобы оставить для неё место (воду внизу, небо вверху).')
    w('')
    w(f'**Негатив** (если генератор поддерживает): `{negative}`')
    w('')
    w(f'Всего картинок: **{sum(1 + len(c["choices"]) for c in cards)}** — '
      f'{len(cards)} карточек и {sum(len(c["choices"]) for c in cards)} выборов.')
    w('')
    w('## Порядок работы — три уровня')
    w('')
    w('1. **Фоны сцен** — `docs/art-brief.md`, шаг 3 (и первые строки `art/prompts.csv`). Их немного, '
      'а с ними картинка есть у каждой карточки сразу. Файл — `<сцена>.png` в ту же папку `App/Resources/Art/`.')
    w(f'2. **Ключевые карточки** — {len(key_cards)} штук, отмечены ★ ниже. Поворотные моменты истории: '
      'отъезд, граница, первое слово, свадьба брата, папа, рождение дочки, финалы.')
    w('3. **Всё остальное** — карточки и выборы по порядку игры. Каждая готовая картинка сразу видна в игре.')
    w('')
    w('В `art/prompts.csv` есть колонка `tier` — можно отсортировать и генерировать пачками по уровню.')
    w('')
    w('### Ключевые карточки')
    w('')
    for card in key_cards:
        w(f'- `{card["id"]}.png` — {card["text"][:70].rstrip()}…')
    w('')
    current_act = None
    for card in cards:
        if card['act'] != current_act:
            current_act = card['act']
            w(f'## {act_titles.get(current_act, current_act)}')
            w('')
        entry = art[card['id']]
        scene = card.get('scene', '')
        prompt = full_prompt(prefix, scenes, scene, entry['image'], entry['anim'])
        rows.append((f'{card["id"]}.png', prompt, entry['anim'], tier(card['id'], entry, True)))
        if entry['anim'] != 'none':
            anims[card['id']] = entry['anim']
        w(f'### `{card["id"]}.png`' + (' ★' if entry.get('key') else ''))
        w('')
        w(f'> {card["text"]}')
        w('')
        w(f'Анимация: {ANIM_RU[entry["anim"]]}. Сцена: `{scene or "—"}`.')
        w('')
        w('```')
        w(prompt)
        w('```')
        w('')
        for index, (choice, pic) in enumerate(zip(card['choices'], entry['choices']), 1):
            name = f'{card["id"]}__{index}'
            prompt = full_prompt(prefix, scenes, scene, pic['image'], pic['anim'])
            rows.append((f'{name}.png', prompt, pic['anim'], tier(name, pic, False)))
            if pic['anim'] != 'none':
                anims[name] = pic['anim']
            w(f'#### `{name}.png` — «{choice["label"]}»')
            w('')
            if choice.get('result'):
                w(f'> {choice["result"]}')
                w('')
            w(f'Анимация: {ANIM_RU[pic["anim"]]}.')
            w('')
            w('```')
            w(prompt)
            w('```')
            w('')

    with open(DOC, 'w', encoding='utf-8') as handle:
        handle.write('\n'.join(out))
    # Уровень 1 — фоны сцен: те же промпты, что в docs/art-brief.md, чтобы вся очередь была в одной таблице.
    used = sorted({c.get('scene') for c in cards if c.get('scene')})
    for scene in used:
        rows.append((f'{scene}.png', f'{prefix.rstrip(", ")}. {scenes[scene]}', 'none', 1))
    os.makedirs(os.path.dirname(CSV), exist_ok=True)
    with open(CSV, 'w', encoding='utf-8', newline='') as handle:
        writer = csv.writer(handle)
        writer.writerow(['file', 'tier', 'prompt', 'negative', 'animation'])
        for file, prompt, anim, level in sorted(rows, key=lambda r: r[3]):
            writer.writerow([file, level, prompt, negative, anim])
    os.makedirs(os.path.dirname(ANIM), exist_ok=True)
    with open(ANIM, 'w', encoding='utf-8') as handle:
        json.dump(dict(sorted(anims.items())), handle, ensure_ascii=False, indent=1)
        handle.write('\n')
    print(f'Собрано: {len(rows)} промптов (из них фонов сцен: {len(used)}) → docs/card-prompts.md, art/prompts.csv; анимаций: {len(anims)}')
    return 0


if __name__ == '__main__':
    sys.exit(build())
