#!/usr/bin/env python3
"""Собирает docs/art-brief.md — бриф для художника или ИИ, который рисует картинки.

    python3 tools/make_art_brief.py

Промпты сцен и персонажей берутся из docs/art.md: там их правим, здесь
только собираем в порядок работы. Иначе два файла разошлись бы на первой
же правке.
"""
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ART = os.path.join(ROOT, 'docs', 'art.md')
OUT = os.path.join(ROOT, 'docs', 'art-brief.md')

# Опорные сцены: в них стиль виден целиком. Рисуются первыми и служат
# референсом для всех остальных.
ANCHORS = ['batumi_beach', 'figueira_beach', 'room_home']

MASTER = """You are the pixel artist for "23 kg" — a narrative mobile game (iPhone, portrait) based on a real story:
a Russian family of three — father (the hero), mother and their 2-year-old son — leaves Saint Petersburg,
lives two weeks in one hotel room in Tbilisi, nine months by the sea in Batumi (Georgia), then moves to Portugal:
the small ocean town of Figueira da Foz, later Oeiras near Lisbon, where a baby daughter is born.
The tone is funny and a little sad: everyday absurdity, bureaucracy, the sea, missing home.

STYLE BIBLE (follow for every image):
- Pixel art. Scenes are exactly 180x135 px (4:3). Characters/icons as specified.
- Palette: Endesga 32 only. No colors outside it. No gradients, no anti-aliasing, no dithering on large fills.
- 1px outlines in the darkest palette color (not pure black).
- No readable text anywhere (signs are illegible pixel strokes). Exceptions: "AIMA" and "CTT" signs.
- The family is shown from behind or from a distance; no detailed face close-ups.
  Father: man in his 30s, oversized hoodie, laptop backpack, stubble.
  Mother: woman in her 30s, messy bun, cardigan.
  Son: toddler (2-3 y.o.) in Georgia, preschooler (4-6) in Portugal; always has a plush hare with ONE ear.
  Baby daughter appears only in the final scenes.
- Color worlds:
  Saint Petersburg — cold blue-grey, muted, always a bit of dusk.
  Georgia — greens, wet asphalt, Batumi neon, warm wooden balconies of Tbilisi, grey-green Black Sea.
  Portugal — ochre, terracotta, white walls, blue azulejo tiles, lots of sun; the Atlantic is big and cold.
  Bureaucracy (AIMA, Finanças, bank) — greenish fluorescent office light.
- Mood: cozy and melancholic, quiet humor. Side or three-quarter view."""


def read(path):
    with open(path, encoding='utf-8') as handle:
        return handle.read()


def code_block_after(text, start):
    match = re.compile(r'```\n(.*?)\n```', re.S).search(text, start)
    return ' '.join(match.group(1).split()) if match else ''


def parse(art):
    prefix = code_block_after(art, art.index('**Общий префикс:**'))
    negative = code_block_after(art, art.index('**Негатив**'))
    groups = []
    for section in re.finditer(r'^## (Сцены — .+)$', art, re.M):
        end = art.find('\n## ', section.end())
        body = art[section.end(): end if end > 0 else len(art)]
        scenes = []
        for scene in re.finditer(r'^### `([a-z_]+)`[^\n]*\n(?:([^`\n][^\n]*)\n)?```\n(.*?)\n```', body, re.M | re.S):
            scenes.append((scene.group(1), (scene.group(2) or '').strip(), ' '.join(scene.group(3).split())))
        groups.append((section.group(1), scenes))
    characters = re.findall(r'^\| ([^|]+?) \| `([^`]+)` \|$',
                            art[art.index('## Персонажи'): art.index('## Анимации')], re.M)
    intro = re.findall(r'^\| («[^|]+») \| ([^|]+?) \| `([^`]+)` \|$',
                       art[art.index('## Вступление'): art.index('## Иконка')], re.M)
    icon = code_block_after(art, art.index('## Иконка приложения'))
    return prefix, negative, groups, characters, intro, icon


def used_scenes():
    result = subprocess.run([sys.executable, os.path.join(ROOT, 'tools', 'content.py'), '--scenes'],
                            capture_output=True, text=True, check=True)
    return {line.split()[0] for line in result.stdout.splitlines() if line.strip()}


def build():
    art = read(ART)
    prefix, negative, groups, characters, intro, icon = parse(art)
    all_scenes = {name: (note, prompt) for _, scenes in groups for name, note, prompt in scenes}

    missing = used_scenes() - set(all_scenes)
    if missing:
        sys.exit(f'В docs/art.md нет промптов для сцен: {", ".join(sorted(missing))}')

    out = []
    w = out.append
    w('# Бриф для художника или ИИ')
    w('')
    w('> Файл собран скриптом `tools/make_art_brief.py` из `docs/art.md`. Править промпты — там, потом пересобрать.')
    w('')
    w('Всё, что нужно нарисовать для игры, в порядке работы. Промпты на английском: генераторы понимают его лучше.')
    w('Каждый промпт самодостаточный — его можно вставлять в генератор без предыдущего контекста.')
    w('')
    w('**Чем рисовать.** Лучше всего — генераторы, заточенные под пиксель-арт: **PixelLab** (умеет персонажей и анимации, есть плагин для Aseprite) или **Retro Diffusion**. Универсальные (ChatGPT, Midjourney) тоже подойдут, но их результат почти всегда придётся уменьшать до 180×135 и приводить к палитре в Aseprite — см. «Как сдавать».')
    w('')
    w('## Шаг 0. Первое сообщение')
    w('')
    w('Если генератор умеет вести диалог (ChatGPT, Claude с генерацией, PixelLab chat) — вставь это первым сообщением. Дальше промпты можно давать по одному.')
    w('')
    w('```')
    w(MASTER)
    w('```')
    w('')
    w('## Шаг 1. Три опорные картинки')
    w('')
    w('В них стиль виден целиком. Добейся, чтобы эти три нравились, — и дальше прикладывай их как **референс стиля** к каждой следующей картинке (в PixelLab — style reference, в Midjourney — `--sref`, в ChatGPT — просто приложи файл и напиши «in exactly this style»).')
    w('')
    for name in ANCHORS:
        note, prompt = all_scenes[name]
        w(f'### `{name}.png`' + (f' — {note}' if note else ''))
        w('')
        w('```')
        w(f'{prefix} {prompt}')
        w('```')
        w('')
    w('## Шаг 2. Лист персонажей')
    w('')
    w('Чтобы семья была одной и той же на всех картинках. Сначала общий лист, потом портреты 48×48 для подписей к репликам (портреты можно отложить — игра работает и без них).')
    w('')
    w('### `characters_sheet.png` — семья целиком')
    w('')
    w('```')
    w('pixel art character sheet, Endesga 32 palette, no anti-aliasing, white background, the same family shown '
      'front, side and back, full body, 32 px tall adults: father in his 30s in an oversized hoodie with a laptop '
      'backpack and stubble; mother in her 30s with a messy bun and a cardigan; toddler son about 2 years old holding '
      'a plush hare with one ear; second row: the same son at 5 years old with a kick scooter; mother holding a baby girl')
    w('```')
    w('')
    for who, prompt in characters:
        w(f'- **{who}** — `{prompt}`')
    w('')
    w('## Шаг 3. Сцены — по порядку игры')
    w('')
    w(f'Размер — **180 × 135**. Имя файла — как в заголовке. Всего {len(all_scenes)}.')
    w('')
    w('Негатив (если генератор поддерживает отдельное поле):')
    w('')
    w('```')
    w(negative)
    w('```')
    w('')
    for title, scenes in groups:
        w(f'### {title}')
        w('')
        for name, note, prompt in scenes:
            mark = ' *(опорная, уже есть)*' if name in ANCHORS else ''
            w(f'**`{name}.png`**{mark}' + (f' — {note}' if note else ''))
            w('')
            w('```')
            w(f'{prefix} {prompt}')
            w('```')
            w('')
    w('## Шаг 4. Анимации')
    w('')
    w('Короткие циклы, 6–8 кадров в секунду: пиксель-арт не любит плавности. Сдавать **горизонтальной полосой кадров** (sprite strip) — один PNG, кадры слева направо, без отступов. Фон прозрачный, если не сказано иначе.')
    w('')
    w('| Файл | Что | Кадр | Кадров | Промпт / заметка |')
    w('|---|---|---|---|---|')
    w('| `anim_waves.png` | волны поверх `ocean`, `ocean_sunset`, `figueira_beach` | 180×40 | 4 | `seamless looping pixel art ocean waves strip, 4 frames, transparent background, Endesga 32` |')
    w('| `anim_rain.png` | дождь поверх `batumi_rain` | 180×135 | 3 | слой капель, сдвиг вниз на 3 px за кадр, прозрачный фон |')
    w('| `anim_stone.png` | камень делает «блинчики» на `batumi_beach` | 64×24 | 6 | `pixel art flat stone skipping over water with small splashes, 6 frames, transparent background` |')
    w('| `anim_ali_nino.png` | статуи Али и Нино съезжаются и расходятся | 48×64 | 8 | `pixel art two tall metal ring statues of a man and a woman slowly moving toward each other, passing through, and apart, 8 frames` |')
    w('| `anim_steam.png` | пар над кофе в `pastelaria` | 16×16 | 4 | `pixel art steam rising from an espresso cup, 4 frame loop, transparent` |')
    w('| `anim_phone.png` | уведомление на экране телефона | 32×16 | 3 | баннер подпрыгивает: вниз на 2 px, обратно, пауза |')
    w('| `anim_board.png` | табло с номерами в `aima`, `financas` | 24×12 | 2 | мигание цифр |')
    w('| `anim_breath.png` | пар изо рта в `flat_cold` | 16×16 | 3 | |')
    w('')
    w('Анимации интерфейса (печать текста, всплывающие «+10», плывущие пиксели вступления, переходы) делаются кодом — рисовать не нужно.')
    w('')
    w('## Шаг 5. Фоны вступления (по желанию)')
    w('')
    w('Вступление уже анимировано кодом. Если хочется богаче — по фону на строфу, размер 180×135, очень тёмные и минималистичные: поверх них печатается текст.')
    w('')
    for stanza, what, prompt in intro:
        w(f'- {stanza} — {what}: `{prompt}`')
    w('')
    w('## Шаг 6. Иконки')
    w('')
    w('### `AppIcon.png` — иконка приложения, 1024×1024 (рисовать 64×64, увеличить ×16 без сглаживания)')
    w('')
    w('```')
    w(icon)
    w('```')
    w('')
    w('### Иконки шкал — 16×16, прозрачный фон, по одной на файл')
    w('')
    w('Сейчас в игре стоят системные иконки Apple — гладкие, выбиваются из пикселя.')
    w('')
    w('| Файл | Шкала | Промпт |')
    w('|---|---|---|')
    for name, what, prompt in [
        ('stat_money', 'Деньги', 'a gold euro coin'),
        ('stat_nerves', 'Кукуха', 'a small cartoon brain with a tiny spark'),
        ('stat_documents', 'Документы', 'a folder with papers and a stamp'),
        ('stat_home', 'Дом', 'a small house with a lit window'),
        ('stat_belonging', 'Свой тут', 'a sun over a tiny azulejo tile'),
    ]:
        w(f'| `{name}.png` | {what} | `pixel art icon 16x16, Endesga 32, transparent background, {prompt}` |')
    w('')
    w('Логотип «23 кг» и весь текст интерфейса **не рисовать** — это делается кодом пиксельным шрифтом.')
    w('')
    w('## Как сдавать')
    w('')
    w('1. **PNG, точный размер** (сцены 180×135, иконки шкал 16×16, портреты 48×48). Не 1024×768 «в пиксельном стиле», а настоящие 180×135.')
    w('2. **Палитра Endesga 32.** В Aseprite: Sprite → Color Mode → Indexed с загруженной палитрой.')
    w('3. **Имя файла** — ровно как в брифе.')
    w('4. Положить в `App/Resources/Assets.xcassets/Scenes/` (сцены) или прислать архивом — разложу сам.')
    w('')
    w('### Частые дефекты — проверить перед сдачей')
    w('')
    w('- **Фальшивые пиксели:** «пиксели» разного размера, сетка плывёт. Признак уменьшения картинки с ИИ без привязки к сетке. Лечится: Sprite Size с *Nearest neighbor* и ручная чистка.')
    w('- **Сглаживание на контурах** — полупрозрачные полутона вокруг линий.')
    w('- **Текст-каша** на вывесках и экранах. Затереть.')
    w('- **Чужая семья:** у сына заяц с двумя ушами, отец без рюкзака, у мамы распущенные волосы. Сверять с листом персонажей.')
    w('- **Лица крупным планом** — по стилю их нет.')
    w('')
    with open(OUT, 'w', encoding='utf-8') as handle:
        handle.write('\n'.join(out))
    return len(all_scenes)


if __name__ == '__main__':
    count = build()
    print(f'docs/art-brief.md собран: {count} сцен')
