# Графика: где брать и что рисовать

## Где брать

| Способ | Плюсы | Минусы | Когда |
|---|---|---|---|
| **Нейросеть для пикселя + чистка в Aseprite** | быстро, дёшево, можно за пару вечеров закрыть все 44 сцены | «фальшивые» пиксели, плывущая сетка, разный стиль от картинки к картинке — без ручной чистки видно сразу | **MVP**: черновики для всех сцен |
| **Художник на заказ** | единый стиль, живые детали, это главное лицо игры | дорого и долго; цена сильно зависит от художника | **релиз**: титульный экран, иконка, 5–7 ключевых сцен |
| **Готовые паки** (itch.io, Kenney, OpenGameArt) | бесплатно или почти, лицензии обычно разрешают коммерцию | Батуми, Фигейры и AIMA там нет; стиль чужой | UI-элементы, иконки, шрифт |
| **Рисовать самому** | полный контроль, бесплатно | время | если зацепит — Aseprite стоит ~$20, Pixelorama бесплатна |

**Рекомендация для MVP:** генерировать в **Retro Diffusion** или **PixelLab** (обе заточены под пиксель-арт; у PixelLab есть плагин для Aseprite и генерация анимаций), потом в **Aseprite**:

1. уменьшить до целевого размера (Sprite → Sprite Size, алгоритм *Nearest neighbor*);
2. привести к общей палитре (Sprite → Color Mode → Indexed с загруженной палитрой);
3. руками убрать мусорные пиксели и полутона на контурах.

Общая палитра — главное, что склеивает картинки из разных источников в одну игру.

Перед публикацией **проверить лицензию** каждого инструмента и пака: для App Store нужно право на коммерческое использование. У Retro Diffusion и PixelLab коммерческое использование есть в платных тарифах, но условия меняются — смотреть на момент покупки. Художник на заказ передаёт права по договору (достаточно переписки с явной фразой «права на коммерческое использование передаются»).

Где искать художника: itch.io (раздел Pixel Art, у многих в профиле «commissions open»), ArtStation, r/gameDevClassifieds, телеграм-чаты релокантов (среди них полно художников, и им эта тема знакома лично).

## Стиль

- **Размер сцены: 180 × 135 px** (4:3). На экране растягивается примерно в 2 раза в точках, без сглаживания (`interpolation(.none)` уже стоит в коде).
- **Палитра: [Endesga 32](https://lospec.com/palette-list/endesga-32)**. Запасной вариант — [Resurrect 64](https://lospec.com/palette-list/resurrect-64), если 32 цветов не хватит.
- **Два мира цветом:**
  - *Петербург* — холодные серо-синие, приглушённые, мало контраста, всегда немного сумерки;
  - *Грузия* — зелень, мокрый асфальт, неон Батуми, тёплые деревянные балконы Тбилиси, серо-зелёное Чёрное море;
  - *Португалия* — охра, терракота, синий азулежу, белёные стены, много солнца;
  - *бюрократия* (AIMA, Finanças, банк) — зеленовато-флуоресцентный офисный свет.
- **Семья:** папа (герой), мама и маленький сын. Лица крупно не рисуем — чаще со спины или издалека: так игрок узнаёт в них себя, а реальная семья остаётся неузнаваемой. Постоянные детали: у сына — плюшевый заяц без уха и самокат, у папы — рюкзак с ноутбуком.
- Контур — тёмный, но не чёрный (самый тёмный цвет палитры). Без дизеринга на больших заливках.
- Ни слова текста на картинках: он в карточке. Вывески — неразборчивыми пиксельными штрихами (исключение — «CTT» и «AIMA», они узнаваемы).

## Как пользоваться промптами

Каждый промпт = **общий префикс** + описание сцены. Промпты на английском: генераторы понимают его лучше. Строкой выше — по-русски, что должно читаться с первого взгляда.

**Общий префикс:**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing,
no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game,
```

**Негатив** (если генератор поддерживает):

```
blurry, gradient, photorealistic, 3d render, text, letters, watermark, jpeg artifacts, extra fingers, face close-up
```

Имя файла = имя сцены из карточек. В Xcode положить в `App/Resources/Assets.xcassets/Scenes/` как Image Set с тем же именем; пока картинки нет, игра показывает имя сцены на заглушке.

---

## Сцены — дом (холодная палитра)

### `room_home` · 6 карточек
Комната в панельке: чемодан раскрыт на полу, вещи разложены вокруг, за окном серый двор.
```
small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books,
window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall,
cold blue-grey muted colors, evening light from a desk lamp, quiet and sad
```

### `suitcase` · 7 карточек
Крупно: чемодан на весах, сверху сидит сын, рядом гречка и плед.
```
close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat,
a checkered wool blanket and a glass jar of apricot jam next to it, a small boy sitting on top of the suitcase to close it, a plush hare with one ear,
muted cold palette, warm lamp highlight
```

### `kitchen_mom` · 2 карточки
Кухня мамы: стол, заставленный едой, мама со спины у плиты, клеёнка.
```
cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth
tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening,
warm yellow lamp inside, cold blue outside
```

### `friends_kitchen` · 1
```
crowded small kitchen at night, silhouettes of friends around a table with wine bottles and snacks,
cigarette smoke near the window, fairy lights, warm but tired atmosphere
```

### `yard_home` · 2
Двор: панельки, качели, ларёк, голые деревья.
```
russian apartment block courtyard in late autumn, rusty playground swing, small kiosk, bare trees,
puddles, grey sky, lonely figure in a hoodie with a backpack seen from behind taking a photo with a phone
```

### `exchange` · 2
```
currency exchange booth near a metro entrance, glowing rate board with unreadable digits, queue of people
in dark coats, one person in a hoodie seen from behind, cold evening, neon green digits
```

### `airport_home` · 1
```
airport departure hall at night, long quiet queue to passport control, people with big suitcases,
departure board with unreadable text, cold white light, figure with a backpack seen from behind
```

### `border` · 1
```
passport control booth seen from traveler's point of view, border officer behind glass looking at a passport,
stamp in hand, harsh fluorescent light, tense
```

### `plane` · 1
```
view from an airplane window seat, clouds below, wing visible, a hand resting on the window frame,
soft sunrise colors, calm and bittersweet
```

### `transit` · 2
```
huge transit airport terminal at night, people sleeping on benches with backpacks, a simit bread stall,
big glass windows with airplanes outside, warm artificial light, liminal space feeling
```

## Сцены — Грузия

### `tbilisi_hotel` · 6
Одна комната на троих: два ноутбука, ребёнок в наушниках, чемоданы.
```
small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy
with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard
with old wooden balconies, warm lamp light, crowded but cozy
```

### `tbilisi_old_town` · 2
```
tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes,
narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights
```

### `batumi_flat` · 9
Квартира на высоком этаже, море во всё окно — главная сцена акта.
```
high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented
furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light
```

### `batumi_beach` · 5
Галька и камни — центральная сцена всей игры.
```
pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples,
mountains and high-rise towers in the background, evening light, peaceful and tender
```

### `batumi_boulevard` · 4
```
batumi seaside boulevard with palm trees, the moving metal statues of ali and nino in the distance, a boy on a
kick scooter, lanterns, sunset over the sea
```

### `batumi_street` · 4
```
batumi street with a mix of old houses and glass towers, used cars parked along the road, wet asphalt, neon
signs (unreadable), a car market vibe, cloudy sky
```

### `batumi_bar` · 2
```
small cozy bar in batumi, wooden tables, friends with beer glasses laughing, warm yellow light, rain on the
window, string lights
```

### `batumi_rain` · 1
```
batumi in heavy rain seen from a high balcony, grey sea merging with the sky, a child's drawing of a sunny sea
taped to the window glass, cozy inside, gloomy outside
```

### `batumi_cafe` · 1
```
georgian cafe table with a boat-shaped adjarian khachapuri with egg and butter, a small boy eating only the
crust, father's hand with a fork, warm light
```

### `batumi_kindergarten` · 2
```
kindergarten gate in batumi, colorful fence, a teacher holding hands with children, a small boy walking in
without looking back, father standing outside the gate, morning
```

### `batumi_supermarket` · 1
```
georgian supermarket shelf full of buckwheat packs, a man in a hoodie staring at it, ironic mood
```

### `public_service_hall` · 1
```
modern georgian public service hall, glass and wood, electronic queue screens, coffee corner, people with
document folders, futuristic bureaucracy, bright clean light
```

## Сцены — Португалия (тёплая палитра)

### `lisbon_street` · 1
```
steep lisbon street with a yellow tram, colorful tiled facades, a family of three with three suitcases and a
kick scooter climbing uphill, sunny, slightly comic
```

### `figueira_beach` · 4
```
extremely wide empty sandy beach of figueira da foz, atlantic waves far away, a small boy running toward the
ocean, seagulls, off-season grey-blue light, vast and quiet
```

### `figueira_street` · 4
```
small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car
parked, a bus stop, palm tree, windy afternoon
```

### `figueira_school` · 3
```
small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his
father's hand, azulejo wall with a school emblem (no text), morning
```

### `lawyer` · 1
```
small immigration lawyer office, stacks of folders, a lawyer in glasses explaining something with a pen,
a couple across the desk looking confused, portuguese flag in the corner
```

### `hostel` · 1
```
cramped hostel dorm with bunk beds, backpacks everywhere, a suitcase open on the floor, tiled floor,
small window with sunlight and a lisbon rooftop view, slightly chaotic
```

### `flat_viewing` · 3
```
empty small lisbon apartment with a window facing a blank wall, real estate agent holding keys,
visible mold stain in the ceiling corner, old tiles, bare lightbulb, ironic mood
```

### `flat` · 5
Своя квартира (самая частая сцена — её лучше заказать у художника).
```
small rented lisbon apartment room, mattress with a checkered wool blanket, laptop on a box used as a table,
a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops,
evening, lived-in but temporary feeling
```

### `flat_cold` · 1
```
same small lisbon apartment at night, cold blue tint, figure wrapped in a blanket and a winter jacket
sitting on the mattress, visible breath vapor, a small electric heater glowing orange
```

### `stairs` · 1
```
old lisbon building staircase with azulejo tiles on the walls, neighbor's door open with warm light and
a child peeking out, smell-lines of cooking, cozy
```

### `financas` · 2
```
portuguese tax office waiting room, ticket number screen, long rows of chairs, people waiting with papers,
tired clerk at a desk, greenish fluorescent light, bureaucratic comedy
```

### `bank` · 2
```
small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried
look, stack of forms, glass partition, neutral cold light
```

### `aima` · 6
Главная бюрократическая сцена — AIMA узнаваема.
```
immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries,
number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring
```

### `ctt_post` · 3
```
portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with
russian stickers, clerk behind the counter, sunny window
```

### `clinic` · 1
```
small private clinic reception in lisbon, white walls, azulejo tile strip, receptionist, patient with a scarf
holding a throat, calm
```

### `pastelaria` · 1
```
traditional portuguese pastry shop counter, trays of pastel de nata, espresso cups, glass display,
azulejo walls, warm golden morning light, happy mood
```

### `supermarket` · 2
```
portuguese supermarket aisle, a small "world foods" shelf with slavic products, person standing still looking
at a small curd snack, fluorescent light, quiet loneliness
```

### `phone` · 19
Экран телефона — самая частая сцена после квартиры. Одна картинка на всё: письма, зарплата, банк.
```
close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text),
blurred room background, pixel art UI icons on screen
```

### `phone_chat` · 4
```
smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text),
hand holding the phone, night lighting
```

### `phone_video` · 5
```
smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the
caller's cold lisbon room, emotional contrast warm screen vs cold room
```

### `ocean` · 1
```
atlantic ocean coast with rocks, figure sitting alone on a rock seen from behind looking at the horizon,
big waves, overcast soft light, melancholic and vast
```

### `ocean_sunset` · 1 (финал демо)
```
wide atlantic beach at sunset, family of three (father, mother, small boy) sitting on the sand seen from behind, orange and pink sky, calm waves,
feeling of quiet hope
```

## Персонажи (спрайты на будущее)

В MVP персонажи только внутри сцен. Отдельные спрайты понадобятся для «говорящей головы» рядом с репликой. Размер — **48 × 48**, три-четыре эмоции на персонажа.

| Персонаж | Промпт |
|---|---|
| Папа (герой) | `pixel art character portrait 48x48, man in his thirties in an oversized hoodie, laptop backpack strap, tired kind eyes, stubble, emotions: tired, smiling, worried, laughing` |
| Жена | `pixel art portrait 48x48, woman in her thirties, hair in a messy bun, cardigan, determined look, emotions: focused, worried, relieved, laughing` |
| Сын | `pixel art portrait 48x48, small boy about five years old, holding a plush hare with one ear, emotions: curious, proud, sulking, delighted` |
| Мама | `pixel art portrait 48x48, russian woman in her sixties, short dyed hair, reading glasses on a chain, home cardigan, emotions: worried, happy, pretending to be fine` |
| Бабушка | `pixel art portrait 48x48, old russian grandmother, headscarf, kind wrinkles, holding a checkered blanket` |
| Брат | `pixel art portrait 48x48, young man with a small backpack, tired smile, looking away, muted colors` |
| Гоги | `pixel art portrait 48x48, georgian neighbor in his fifties, mustache, big smile, holding a wine glass` |
| Сеньора Фатима | `pixel art portrait 48x48, elderly portuguese neighbor woman, black dress, warm smile, gold earrings` |
| Сотрудник AIMA | `pixel art portrait 48x48, bored portuguese immigration clerk, lanyard badge, coffee cup` |
| Хозяин квартиры | `pixel art portrait 48x48, middle-aged portuguese landlord, mustache, shrugging, "é normal" attitude` |

## Анимации

Короткие циклы по 2–6 кадров, 6–8 кадров в секунду: пиксель-арт не любит плавность. В коде подключим, когда будут картинки.

| Где | Что двигается | Кадров | Промпт/заметка |
|---|---|---|---|
| `ocean`, `ocean_sunset`, `figueira_beach` | волны | 4 | `seamless loop animation of pixel art waves, 4 frames` |
| `batumi_rain` | дождь | 3 | слой капель поверх сцены, сдвиг вниз на 3 px за кадр |
| `pastelaria` | пар над кофе | 4 | `pixel art steam rising from espresso cup, 4 frame loop` |
| `batumi_beach` | камень летит и делает «блинчики» | 6 | `pixel art skipping stone animation over waves, 6 frames` |
| `plane` | облака плывут | 2 слоя | параллакс: два слоя облаков с разной скоростью |
| `phone*` | экран мерцает, приходит уведомление | 3 | подпрыгивающий баннер |
| `aima` | табло с номерами мигает | 2 | |
| `flat_cold` | пар изо рта | 3 | |
| `batumi_boulevard` | Али и Нино съезжаются и расходятся | 8 | единственная «длинная» анимация, можно отложить |
| Интерфейс | изменения шкал всплывают и улетают вверх | — | делается кодом, картинки не нужны |
| Интерфейс | кнопка при нажатии проседает на 2 px | — | кодом |
| Концовка | затемнение в цвет концовки | — | кодом |

## Иконка приложения

1024 × 1024, рисуется в 64 × 64 и масштабируется ×16.
```
pixel art app icon 64x64, a big old suitcase with a luggage tag "23 kg", on a background of blue portuguese
azulejo tile pattern, a small plush hare with one ear peeking out of the suitcase, bold readable silhouette, no other text
```

## Шрифт

Пиксельный шрифт с кириллицей. Кандидаты с открытой лицензией OFL (перед подключением проверить, что кириллица полная, включая «ё» и ««»»): **Press Start 2P** (есть кириллица, очень «аркадный», хорош для заголовков), **Pixelify Sans** (мягче, хорошо читается в длинном тексте). Для основного текста карточек — Pixelify Sans, для заголовков концовок — Press Start 2P.
