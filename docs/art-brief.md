# Бриф для художника или ИИ

> Файл собран скриптом `tools/make_art_brief.py` из `docs/art.md`. Править промпты — там, потом пересобрать.

Всё, что нужно нарисовать для игры, в порядке работы. Промпты на английском: генераторы понимают его лучше.
Каждый промпт самодостаточный — его можно вставлять в генератор без предыдущего контекста.

**Чем рисовать.** Лучше всего — генераторы, заточенные под пиксель-арт: **PixelLab** (умеет персонажей и анимации, есть плагин для Aseprite) или **Retro Diffusion**. Универсальные (ChatGPT, Midjourney) тоже подойдут, но их результат почти всегда придётся уменьшать до 180×135 и приводить к палитре в Aseprite — см. «Как сдавать».

## Шаг 0. Первое сообщение

Если генератор умеет вести диалог (ChatGPT, Claude с генерацией, PixelLab chat) — вставь это первым сообщением. Дальше промпты можно давать по одному.

```
You are the pixel artist for "23 kg" — a narrative mobile game (iPhone, portrait) based on a real story:
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
  Son: toddler (2-3 y.o.) in Georgia, preschooler (4-6) in Portugal; always has a grey plush cat toy. The son does not talk until Batumi.
  Baby daughter appears only in the final scenes.
- Color worlds:
  Saint Petersburg — cold blue-grey, muted, always a bit of dusk.
  Georgia — greens, wet asphalt, Batumi neon, warm wooden balconies of Tbilisi, grey-green Black Sea.
  Portugal — ochre, terracotta, white walls, blue azulejo tiles, lots of sun; the Atlantic is big and cold.
  Bureaucracy (AIMA, Finanças, bank) — greenish fluorescent office light.
- Mood: cozy and melancholic, quiet humor. Side or three-quarter view.
```

## Шаг 1. Три опорные картинки

В них стиль виден целиком. Добейся, чтобы эти три нравились, — и дальше прикладывай их как **референс стиля** к каждой следующей картинке (в PixelLab — style reference, в Midjourney — `--sref`, в ChatGPT — просто приложи файл и напиши «in exactly this style»).

### `batumi_beach.png` — Галька и камни — центральная сцена всей игры.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender
```

### `figueira_beach.png`

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, extremely wide empty sandy beach of figueira da foz, atlantic waves far away, a small boy running toward the ocean, seagulls, off-season grey-blue light, vast and quiet
```

### `room_home.png` — Комната в панельке: чемодан раскрыт на полу, вещи разложены вокруг, за окном серый двор.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad
```

## Шаг 2. Лист персонажей

Чтобы семья была одной и той же на всех картинках. Сначала общий лист, потом портреты 48×48 для подписей к репликам (портреты можно отложить — игра работает и без них).

### `characters_sheet.png` — семья целиком

```
pixel art character sheet, Endesga 32 palette, no anti-aliasing, white background, the same family shown front, side and back, full body, 32 px tall adults: father in his 30s in an oversized hoodie with a laptop backpack and stubble; mother in her 30s with a messy bun and a cardigan; toddler son about 2 years old holding a grey plush cat toy; second row: the same son at 5 years old in a school backpack; mother holding a baby girl
```

- **Папа (герой)** — `pixel art character portrait 48x48, man in his thirties in an oversized hoodie, laptop backpack strap, tired kind eyes, stubble, emotions: tired, smiling, worried, laughing`
- **Жена** — `pixel art portrait 48x48, woman in her thirties, hair in a messy bun, cardigan, determined look, emotions: focused, worried, relieved, laughing`
- **Дочка** — `pixel art portrait 48x48, baby girl, big curious eyes, tiny fist, emotions: sleeping, laughing, grabbing`
- **Сын (две версии: 2–3 года в Грузии, 5–6 лет в Оэйраше)** — `pixel art portrait 48x48, small boy (toddler version and preschool version), holding a grey plush cat toy, emotions: curious, proud, sulking, delighted`
- **Мама** — `pixel art portrait 48x48, russian woman in her sixties, short dyed hair, reading glasses on a chain, home cardigan, emotions: worried, happy, pretending to be fine`
- **Бабушка** — `pixel art portrait 48x48, old russian grandmother, headscarf, kind wrinkles, holding an envelope with money`
- **Брат** — `pixel art portrait 48x48, young man with a small backpack, tired smile, looking away, muted colors`
- **Хозяева квартиры в Батуми** — `pixel art portrait 48x48, georgian middle-aged couple, warm smiles, holding two bags of persimmons`
- **Сеньора Фатима** — `pixel art portrait 48x48, elderly portuguese neighbor woman, black dress, warm smile, gold earrings`
- **Сотрудник AIMA** — `pixel art portrait 48x48, bored portuguese immigration clerk, lanyard badge, coffee cup`
- **Хозяин квартиры** — `pixel art portrait 48x48, middle-aged portuguese landlord, mustache, shrugging, "é normal" attitude`

## Шаг 3. Сцены — по порядку игры

Размер — **180 × 135**. Имя файла — как в заголовке. Всего 61.

Негатив (если генератор поддерживает отдельное поле):

```
blurry, gradient, photorealistic, 3d render, text, letters, watermark, jpeg artifacts, extra fingers, face close-up
```

### Сцены — дом (холодная палитра)

**`room_home.png`** *(опорная, уже есть)* — Комната в панельке: чемодан раскрыт на полу, вещи разложены вокруг, за окном серый двор.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad
```

**`suitcase.png`** — Крупно: чемодан на весах, рядом гречка, машинки и серый плюшевый кот.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight
```

**`kitchen_mom.png`** — Кухня мамы: стол, заставленный едой, мама со спины у плиты, клеёнка.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside
```

**`friends_kitchen.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, crowded small kitchen at night, silhouettes of friends around a table with wine bottles and snacks, cigarette smoke near the window, fairy lights, warm but tired atmosphere
```

**`yard_home.png`** — Двор: панельки, качели, ларёк, голые деревья.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, russian apartment block courtyard in late autumn, rusty playground swing, small kiosk, bare trees, puddles, grey sky, lonely figure in a hoodie with a backpack seen from behind taking a photo with a phone
```

**`office.png`** — Московский офис: сдать ноутбук и уйти.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, open-space office in moscow at evening, empty desks, a laptop handed over at a reception desk, glass walls, city lights outside, cold neon light, a feeling of leaving quietly
```

**`exchange.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, currency exchange booth near a metro entrance, glowing rate board with unreadable digits, queue of people in dark coats, one person in a hoodie seen from behind, cold evening, neon green digits
```

**`airport_arrivals.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary
```

**`paris.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, paris seine embankment at golden hour, eiffel tower in the distance, a man in his 30s walking arm in arm with his elderly mother seen from behind, bookstalls along the river, soft warm light, tender and quiet
```

**`malaga_beach.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, warm mediterranean beach in malaga, white hillside town behind, turquoise calm sea, a family with grandparents under a striped umbrella, a boy in armbands running into the water, bright midday sun
```

**`airport_home.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, airport departure hall at night, long quiet queue to passport control, people with big suitcases, departure board with unreadable text, cold white light, figure with a backpack seen from behind
```

**`border.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, passport control booth seen from traveler's point of view, border officer behind glass looking at a passport, stamp in hand, harsh fluorescent light, tense
```

**`plane.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, view from an airplane window seat, clouds below, wing visible, a hand resting on the window frame, soft sunrise colors, calm and bittersweet
```

**`transit.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, huge transit airport terminal at night, people sleeping on benches with backpacks, a simit bread stall, big glass windows with airplanes outside, warm artificial light, liminal space feeling
```

### Сцены — Грузия

**`tbilisi_hotel.png`** — Одна комната на троих: два ноутбука, ребёнок в наушниках, чемоданы.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy
```

**`tbilisi_old_town.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes, narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights
```

**`car.png`** — Поездка на прокатной машине из Тбилиси в Батуми через перевал.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, small rental car on a winding mountain road in georgia, green mountains, low clouds, view from behind the car, a toddler asleep in a child seat visible through the rear window, early spring, calm road-trip mood
```

**`batumi_flat.png`** — Квартира на высоком этаже, море во всё окно — главная сцена акта.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light
```

**`batumi_beach.png`** *(опорная, уже есть)* — Галька и камни — центральная сцена всей игры.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender
```

**`batumi_boulevard.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, batumi seaside boulevard with palm trees, the moving metal statues of ali and nino in the distance, a toddler on his father's shoulders, lanterns, sunset over the sea
```

**`batumi_street.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, batumi street with a mix of old houses and glass towers, used cars parked along the road, wet asphalt, neon signs (unreadable), a car market vibe, cloudy sky
```

**`batumi_bar.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, small cozy bar in batumi, wooden tables, friends with beer glasses laughing, warm yellow light, rain on the window, string lights
```

**`batumi_rain.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, batumi in heavy rain seen from a high balcony, grey sea merging with the sky, a child's drawing of a sunny sea taped to the window glass, cozy inside, gloomy outside
```

**`batumi_cafe.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, georgian cafe table with a boat-shaped adjarian khachapuri with egg and butter, a small boy eating only the crust, father's hand with a fork, warm light
```

**`batumi_kindergarten.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, kindergarten gate in batumi, colorful fence, a teacher holding hands with children, a small boy walking in without looking back, father standing outside the gate, morning
```

**`batumi_supermarket.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, georgian supermarket shelf full of buckwheat packs, a man in a hoodie staring at it, ironic mood
```

**`public_service_hall.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, modern georgian public service hall, glass and wood, electronic queue screens, coffee corner, people with document folders, futuristic bureaucracy, bright clean light
```

### Сцены — Португалия (тёплая палитра)

**`lisbon_street.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, steep lisbon street with a yellow tram, colorful tiled facades, a family of three with two suitcases and three backpacks climbing uphill, sunny, slightly comic
```

**`figueira_beach.png`** *(опорная, уже есть)*

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, extremely wide empty sandy beach of figueira da foz, atlantic waves far away, a small boy running toward the ocean, seagulls, off-season grey-blue light, vast and quiet
```

**`figueira_lake.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, small calm lake among pine trees near figueira da foz, picnic area with stone barbecue grills, smoke rising, a few families at wooden tables, children running in a pack, warm late afternoon light
```

**`figueira_street.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon
```

**`figueira_school.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning
```

**`lawyer.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, small immigration lawyer office, stacks of folders, a lawyer in glasses explaining something with a pen, a couple across the desk looking confused, portuguese flag in the corner
```

**`hostel.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, cramped hostel dorm with bunk beds, backpacks everywhere, a suitcase open on the floor, tiled floor, small window with sunlight and a lisbon rooftop view, slightly chaotic
```

**`flat_viewing.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, empty small lisbon apartment with a window facing a blank wall, real estate agent holding keys, visible mold stain in the ceiling corner, old tiles, bare lightbulb, ironic mood
```

**`flat.png`** — Своя квартира (самая частая сцена — её лучше заказать у художника).

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling
```

**`flat_cold.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, same small lisbon apartment at night, cold blue tint, figure wrapped in a blanket and a winter jacket sitting on the mattress, visible breath vapor, a small electric heater glowing orange
```

**`stairs.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, old lisbon building staircase with azulejo tiles on the walls, neighbor's door open with warm light and a child peeking out, smell-lines of cooking, cozy
```

**`financas.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, portuguese tax office waiting room, ticket number screen, long rows of chairs, people waiting with papers, tired clerk at a desk, greenish fluorescent light, bureaucratic comedy
```

**`bank.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light
```

**`aima.png`** — Главная бюрократическая сцена — AIMA узнаваема.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring
```

**`ctt_post.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window
```

**`clinic.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, small private clinic reception in lisbon, white walls, azulejo tile strip, receptionist, patient with a scarf holding a throat, calm
```

**`pastelaria.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, traditional portuguese pastry shop counter, trays of pastel de nata, espresso cups, glass display, azulejo walls, warm golden morning light, happy mood
```

**`supermarket.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, portuguese supermarket aisle, a small "world foods" shelf with slavic products, person standing still looking at a small curd snack, fluorescent light, quiet loneliness
```

**`phone.png`** — Экран телефона — самая частая сцена после квартиры. Одна картинка на всё: письма, зарплата, банк.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen
```

**`phone_chat.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting
```

**`phone_video.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room
```

**`ocean.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, atlantic ocean coast with rocks, figure sitting alone on a rock seen from behind looking at the horizon, big waves, overcast soft light, melancholic and vast
```

**`ocean_sunset.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, wide atlantic beach at sunset, family of three (father, mother, small boy) sitting on the sand seen from behind, orange and pink sky, calm waves, feeling of quiet hope
```

### Сцены — Фигейра, год 2 и Оэйраш

**`figueira_flat_party.png`** — Новый год дважды: в 21:00 — ноутбук с Петербургом, в 00:00 — друзья и виноград.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, small apartment new year's eve, laptop on the table showing a video call with grandmother and relatives, champagne glasses, a bowl of twelve grapes, friends in party hats, a boy in pajamas, fairy lights, cozy and bittersweet
```

**`hospital.png`** — Urgência ночью и роддом.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, portuguese hospital emergency waiting room at night, number screen, tired parents with a sleeping child on a plastic chair, vending machine glow, quiet fluorescent light
```

**`padel.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, outdoor padel court with glass walls, woman holding a racket and her nose in surprise, man laughing and running to help, sunny afternoon, comic moment
```

**`legoland.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, colorful theme park made of giant toy bricks, father and small boy on a roller coaster with hands up, bright summer day, pure joy
```

**`oeiras_street.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, oeiras seaside promenade near lisbon, white modern buildings, palm trees, atlantic ocean, a dark bmw parked, evening traffic toward lisbon, golden light
```

**`oeiras_school.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, modern bilingual school yard, kids from many countries in uniforms, a boy laughing with friends, flags of different countries on a wall (no text), bright morning
```

**`oeiras_flat.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, modern rented apartment near lisbon, baby crib next to a desk with a laptop, a pregnancy test on the bathroom shelf in the background, warm evening light
```

**`oeiras_beach.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, beach near lisbon at sunset, group of friends with children around a picnic blanket, families from different countries, warm and nostalgic
```

**`stadium.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, huge football stadium in green and white colors, crowd with scarves raised, father and boy in green-white striped scarves singing, floodlights, evening match
```

**`car_dealer.png`**

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, car dealership showroom, shiny dark bmw under spotlights, salesman with a contract, father looking tempted and guilty, comic
```

**`lisbon_flat_keys.png`** — Финал. Пустая квартира, ключи, музей переезда на полу.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game, empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet
```

## Шаг 4. Анимации

Короткие циклы, 6–8 кадров в секунду: пиксель-арт не любит плавности. Сдавать **горизонтальной полосой кадров** (sprite strip) — один PNG, кадры слева направо, без отступов. Фон прозрачный, если не сказано иначе.

| Файл | Что | Кадр | Кадров | Промпт / заметка |
|---|---|---|---|---|
| `anim_waves.png` | волны поверх `ocean`, `ocean_sunset`, `figueira_beach` | 180×40 | 4 | `seamless looping pixel art ocean waves strip, 4 frames, transparent background, Endesga 32` |
| `anim_rain.png` | дождь поверх `batumi_rain` | 180×135 | 3 | слой капель, сдвиг вниз на 3 px за кадр, прозрачный фон |
| `anim_stone.png` | камень делает «блинчики» на `batumi_beach` | 64×24 | 6 | `pixel art flat stone skipping over water with small splashes, 6 frames, transparent background` |
| `anim_ali_nino.png` | статуи Али и Нино съезжаются и расходятся | 48×64 | 8 | `pixel art two tall metal ring statues of a man and a woman slowly moving toward each other, passing through, and apart, 8 frames` |
| `anim_steam.png` | пар над кофе в `pastelaria` | 16×16 | 4 | `pixel art steam rising from an espresso cup, 4 frame loop, transparent` |
| `anim_phone.png` | уведомление на экране телефона | 32×16 | 3 | баннер подпрыгивает: вниз на 2 px, обратно, пауза |
| `anim_board.png` | табло с номерами в `aima`, `financas` | 24×12 | 2 | мигание цифр |
| `anim_breath.png` | пар изо рта в `flat_cold` | 16×16 | 3 | |

Анимации интерфейса (печать текста, всплывающие «+10», плывущие пиксели вступления, переходы) делаются кодом — рисовать не нужно.

## Шаг 5. Фоны вступления (по желанию)

Вступление уже анимировано кодом. Если хочется богаче — по фону на строфу, размер 180×135, очень тёмные и минималистичные: поверх них печатается текст.

- «У каждого своя жизнь. И свой чемодан» — пустая комната и чемодан: `pixel art, empty room with a single old suitcase in a beam of light, dust particles, very dark and minimal`
- «Мы выбираем…» — развилка дорог: `pixel art, a road splitting into two under a night sky, tiny figure at the fork, minimal`
- «Мы ошибаемся…» — перевёрнутая карта: `pixel art, a crumpled paper map with a wrong route drawn in red, on a kitchen table, minimal`
- «Помогаем близким…» — две руки: `pixel art, two hands almost touching across a video call screen, minimal and warm`
- «Встречаемся. Расстаёмся…» — аэропорт: `pixel art, airport arrivals gate at night, silhouettes hugging, minimal`
- «Это история одной семьи» — три силуэта у моря: `pixel art, father, mother and a toddler seen from behind on a pebble beach at dusk, minimal`

## Шаг 6. Иконки

### `AppIcon.png` — иконка приложения, 1024×1024 (рисовать 64×64, увеличить ×16 без сглаживания)

```
pixel art app icon 64x64, a big old suitcase with a luggage tag "23 kg", on a background of blue portuguese azulejo tile pattern, a small grey plush cat toy peeking out of the suitcase, bold readable silhouette, no other text
```

### Иконки шкал — 16×16, прозрачный фон, по одной на файл

Сейчас в игре стоят системные иконки Apple — гладкие, выбиваются из пикселя.

| Файл | Шкала | Промпт |
|---|---|---|
| `stat_money.png` | Деньги | `pixel art icon 16x16, Endesga 32, transparent background, a gold euro coin` |
| `stat_nerves.png` | Кукуха | `pixel art icon 16x16, Endesga 32, transparent background, a small cartoon brain with a tiny spark` |
| `stat_documents.png` | Документы | `pixel art icon 16x16, Endesga 32, transparent background, a folder with papers and a stamp` |
| `stat_home.png` | Дом | `pixel art icon 16x16, Endesga 32, transparent background, a small house with a lit window` |
| `stat_belonging.png` | Свой тут | `pixel art icon 16x16, Endesga 32, transparent background, a sun over a tiny azulejo tile` |

Логотип «23 кг» и весь текст интерфейса **не рисовать** — это делается кодом пиксельным шрифтом.

## Как сдавать

1. **PNG, точный размер** (сцены 180×135, иконки шкал 16×16, портреты 48×48). Не 1024×768 «в пиксельном стиле», а настоящие 180×135.
2. **Палитра Endesga 32.** В Aseprite: Sprite → Color Mode → Indexed с загруженной палитрой.
3. **Имя файла** — ровно как в брифе.
4. Положить PNG в `App/Resources/Art/` под именем сцены (`batumi_beach.png`) — проект пересобирать не нужно. Или прислать архивом — разложу сам.

### Частые дефекты — проверить перед сдачей

- **Фальшивые пиксели:** «пиксели» разного размера, сетка плывёт. Признак уменьшения картинки с ИИ без привязки к сетке. Лечится: Sprite Size с *Nearest neighbor* и ручная чистка.
- **Сглаживание на контурах** — полупрозрачные полутона вокруг линий.
- **Текст-каша** на вывесках и экранах. Затереть.
- **Чужая семья:** у сына в руках не серый плюшевый кот, отец без рюкзака, у мамы распущенные волосы. Сверять с листом персонажей.
- **Лица крупным планом** — по стилю их нет.
