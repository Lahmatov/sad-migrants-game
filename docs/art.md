# Графика: где брать и что рисовать

## Где брать

| Способ | Плюсы | Минусы | Когда |
|---|---|---|---|
| **Нейросеть для пикселя + чистка в Aseprite** | быстро, дёшево, можно за вечер закрыть все 37 сцен | «фальшивые» пиксели, плывущая сетка, разный стиль от картинки к картинке — без ручной чистки видно сразу | **MVP**: черновики для всех сцен |
| **Художник на заказ** | единый стиль, живые детали, это главное лицо игры | дорого и долго; цена сильно зависит от художника | **релиз**: титульный экран, иконка, 5–7 ключевых сцен |
| **Готовые паки** (itch.io, Kenney, OpenGameArt) | бесплатно или почти, лицензии обычно разрешают коммерцию | Лиссабона и AIMA там нет; стиль чужой | UI-элементы, иконки, шрифт |
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
  - *дом* — холодные серо-синие, приглушённые, мало контраста, всегда немного сумерки;
  - *Португалия* — охра, терракота, синий азулежу, белёные стены, много солнца;
  - *бюрократия* (AIMA, Finanças, банк) — зеленовато-флуоресцентный офисный свет.
- **Герой** показан со спины или без лица (капюшон, рюкзак): игрок может быть любого пола, и герой не должен этому мешать.
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

### `room_home` · 8 карточек
Комната в панельке: чемодан раскрыт на полу, вещи разложены вокруг, за окном серый двор.
```
small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books,
window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall,
cold blue-grey muted colors, evening light from a desk lamp, quiet and sad
```

### `suitcase` · 8 карточек
Крупно: чемодан на весах, рядом кот, гречка, плед.
```
close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat,
a checkered wool blanket and a glass jar of apricot jam next to it, a grey cat sitting inside the suitcase,
muted cold palette, warm lamp highlight
```

### `kitchen_mom` · 3 карточки
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

### `yard_home` · 1
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

### `consulate` · 3
```
small visa center waiting room, numbered ticket display, rows of plastic chairs, people holding document
folders, a clerk behind a glass window, fluorescent light, tense bureaucratic mood
```

### `vet` · 1
```
small veterinary clinic room, grey cat in a pet carrier on the examination table, kind vet with papers,
posters on the wall (unreadable), soft light
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

### `transit` · 1
```
huge transit airport terminal at night, people sleeping on benches with backpacks, a simit bread stall,
big glass windows with airplanes outside, warm artificial light, liminal space feeling
```

## Сцены — Португалия (тёплая палитра)

### `lisbon_airport` · 1
```
arrival exit of lisbon airport, palm trees, bright sunny sky, yellow taxis waiting, traveler with a
suitcase and pet carrier seen from behind, warm ochre and blue colors, hopeful
```

### `hostel` · 2
```
cramped hostel dorm with bunk beds, backpacks everywhere, a suitcase open on the floor, tiled floor,
small window with sunlight and a lisbon rooftop view, slightly chaotic
```

### `flat_viewing` · 2
```
empty small lisbon apartment with a window facing a blank wall, real estate agent holding keys,
visible mold stain in the ceiling corner, old tiles, bare lightbulb, ironic mood
```

### `flat` · 9
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

### `financas` · 3
```
portuguese tax office waiting room, ticket number screen, long rows of chairs, people waiting with papers,
tired clerk at a desk, greenish fluorescent light, bureaucratic comedy
```

### `bank` · 1
```
small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried
look, stack of forms, glass partition, neutral cold light
```

### `aima` · 5
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

### `phone` · 11
Экран телефона — самая частая сцена после квартиры. Одна картинка на всё: письма, зарплата, банк.
```
close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text),
blurred room background, pixel art UI icons on screen
```

### `phone_chat` · 2
```
smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text),
hand holding the phone, night lighting
```

### `phone_video` · 5
```
smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the
caller's cold lisbon room, emotional contrast warm screen vs cold room
```

### `street` · 2
```
narrow lisbon street with colorful facades, laundry hanging from balconies, yellow tram in the distance,
cobblestones, afternoon sun
```

### `street_rain` · 1
```
same narrow lisbon street in heavy rain, empty, puddles reflecting streetlights, one figure with a cheap
umbrella seen from behind, grey-blue tint
```

### `miradouro` · 1
```
lisbon viewpoint terrace at sunset, terracotta rooftops, river tagus and a red suspension bridge in the
distance, street musician with a guitar, warm golden light, peaceful
```

### `ocean` · 1
```
atlantic ocean coast with rocks, figure sitting alone on a rock seen from behind looking at the horizon,
big waves, overcast soft light, melancholic and vast
```

### `ocean_sunset` · 1 (финал демо)
```
atlantic beach at sunset, figure sitting on the sand next to a cat, orange and pink sky, calm waves,
feeling of quiet hope
```

### `university` · 1
```
old university lecture hall in lisbon, professor at a blackboard with unreadable chalk writing, students
at wooden desks, sunlight through tall windows
```

### `cafe` · 1
```
small portuguese cafe with a counter, person in an apron carrying espresso cups, tables outside on a
sunny sidewalk, busy
```

### `car` · 1
```
inside a ride-share car, driver smiling in the rear-view mirror, lisbon street passing by through windows,
brazilian flag air freshener, sunny
```

### `playground` · 1
```
small lisbon playground with palm trees, woman on a bench talking on the phone, children playing,
sunny afternoon, figure passing by
```

---

## Персонажи (спрайты на будущее)

В MVP персонажи только внутри сцен. Отдельные спрайты понадобятся для «говорящей головы» рядом с репликой. Размер — **48 × 48**, три-четыре эмоции на персонажа.

| Персонаж | Промпт |
|---|---|
| Герой | `pixel art character portrait 48x48, person in an oversized hoodie with hood up, face in shadow, backpack straps, neutral gender, emotions: tired, smiling, crying, surprised` |
| Мама | `pixel art portrait 48x48, russian woman in her sixties, short dyed hair, reading glasses on a chain, home cardigan, emotions: worried, happy, pretending to be fine` |
| Бабушка | `pixel art portrait 48x48, old russian grandmother, headscarf, kind wrinkles, holding a checkered blanket` |
| Кот | `pixel art 48x48, fluffy grey cat, emotions: judging, sleeping, suspicious, content` |
| Сотрудник AIMA | `pixel art portrait 48x48, bored portuguese immigration clerk, lanyard badge, coffee cup` |
| Сеньора Фатима | `pixel art portrait 48x48, elderly portuguese neighbor woman, black dress, warm smile, gold earrings` |
| Диогу | `pixel art portrait 48x48, young brazilian student, curly hair, big smile, headphones around neck` |
| Хозяин квартиры | `pixel art portrait 48x48, middle-aged portuguese landlord, mustache, shrugging, "é normal" attitude` |

## Анимации

Короткие циклы по 2–6 кадров, 6–8 кадров в секунду: пиксель-арт не любит плавность. В коде подключим, когда будут картинки.

| Где | Что двигается | Кадров | Промпт/заметка |
|---|---|---|---|
| `ocean`, `ocean_sunset` | волны | 4 | `seamless loop animation of pixel art waves, 4 frames` |
| `street_rain` | дождь | 3 | слой капель поверх сцены, сдвиг вниз на 3 px за кадр |
| `pastelaria` | пар над кофе | 4 | `pixel art steam rising from espresso cup, 4 frame loop` |
| `suitcase` | кот моргает и машет хвостом | 4 | `pixel art grey cat idle animation, tail swish and blink, 4 frames` |
| `plane` | облака плывут | 2 слоя | параллакс: два слоя облаков с разной скоростью |
| `phone*` | экран мерцает, приходит уведомление | 3 | подпрыгивающий баннер |
| `aima` | табло с номерами мигает | 2 | |
| `flat_cold` | пар изо рта | 3 | |
| `miradouro` | трамвай проезжает | 8 | единственная «длинная» анимация, можно отложить |
| Интерфейс | изменения шкал всплывают и улетают вверх | — | делается кодом, картинки не нужны |
| Интерфейс | кнопка при нажатии проседает на 2 px | — | кодом |
| Концовка | затемнение в цвет концовки | — | кодом |

## Иконка приложения

1024 × 1024, рисуется в 64 × 64 и масштабируется ×16.
```
pixel art app icon 64x64, a big old suitcase with a luggage tag "23 kg", on a background of blue portuguese
azulejo tile pattern, a small grey cat peeking out of the suitcase, bold readable silhouette, no other text
```

## Шрифт

Пиксельный шрифт с кириллицей. Кандидаты с открытой лицензией OFL (перед подключением проверить, что кириллица полная, включая «ё» и ««»»): **Press Start 2P** (есть кириллица, очень «аркадный», хорош для заголовков), **Pixelify Sans** (мягче, хорошо читается в длинном тексте). Для основного текста карточек — Pixelify Sans, для заголовков концовок — Press Start 2P.
