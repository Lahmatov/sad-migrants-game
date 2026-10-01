# Картинки карточек и выборов

> Собрано скриптом `tools/make_card_art.py` из `art/cards/*.json`. Править промпты — там.

**Как сдавать.** PNG 180×135 (или крупнее строго 4:3 — приложение растянет без сглаживания).
Файл кладётся в `App/Resources/Art/` под именем из заголовка. Пересобирать проект не нужно — достаточно запустить сборку в Xcode.

Порядок показа: картинка выбора → картинка карточки → фон сцены из `docs/art-brief.md` → живая сцена из кода. Поэтому рисовать можно в любом порядке: пропущенное подменится.

**Стиль.** Перед первой картинкой дай генератору «первое сообщение» и три опорные картинки из `docs/art-brief.md` (шаги 0–2) — и прикладывай их как референс стиля к каждой. Иначе 711 картинок разъедутся по стилю.

**Анимацию рисовать не нужно.** Её добавляет код поверх картинки — в каждой строке указано какую, чтобы оставить для неё место (воду внизу, небо вверху).

**Негатив** (если генератор поддерживает): `blurry, gradient, photorealistic, 3d render, text, letters, watermark, jpeg artifacts, extra fingers, face close-up`

Всего картинок: **711** — 212 карточек и 499 выборов.

## Петербург. Сборы

### `intro.png`

> Петербург, конец февраля. Решение уехать принимается за несколько дней — где-то между новостями и третьей бессонной ночью. Билеты на чартер через Ереван, вылет второго марта, ночью. Сыну два года, он ещё не говорит. Сейчас он у бабушки в Старой Руссе и ничего не знает.

Анимация: падающий снег. Сцена: `room_home`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: late february night in a small saint petersburg rental flat, a man and a woman sit at a kitchen table lit only by two laptop screens, phones face down, snow falling past the dark window. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

#### `intro__1.png` — «Позвонить папе»

Анимация: падающий снег.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man standing at the dark window holding a phone to his ear, waiting for an answer, city lights below in the snow. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

### `call_dad.png`

> Ты звонишь папе и спрашиваешь, что он думает про переезд. Он долго молчит. Потом говорит: «Не надо. Подумайте ещё».

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: close view of a smartphone on a kitchen table showing an outgoing call to 'dad', a cold cup of tea beside it, blue winter dusk through the window. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `call_dad__1.png` — ««Хорошо, подумаем»»

> Ты говоришь «подумаем». Билеты уже куплены. Вы оба это понимаете и делаете вид, что нет.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man sitting hunched on a stool with the phone pressed to his ear, looking at the floor, two plane tickets printed on the table. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `call_dad__2.png` — ««Пап, мы уже решили»»

> «Ну, вам виднее», — говорит он. Голос ровный. Ты потом долго вспоминаешь, каким он был.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man in the hallway with the phone, his free hand pressed to his forehead, a quiet flat behind him. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `call_dad__3.png` — «Позвать его с собой»

> Он смеётся — впервые за разговор. «Куда я поеду, у меня тут гараж». Потом тихо: «Звоните». Ты запомнишь и смех, и «звоните».

Анимация: падающий снег.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man smiling sadly into the phone, through the window a row of old soviet garages under snow. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `call_inlaws.png`

> Родители жены отвечают сразу, без паузы: «Едьте». Папа жены добавляет: «Я вас отвезу в аэропорт. Ночью так ночью».

Анимация: пар поднимается из центра. Сцена: `kitchen_mom`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a warm old kitchen, an older couple at the table on a video call on a tablet, the father-in-law already holding car keys. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside. a steaming cup or pot near the center of the frame.
```

#### `call_inlaws__1.png` — «Обнять его»

> Он неловко хлопает тебя по спине. Такие люди говорят «я отвезу» вместо всех остальных слов.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: two men in a narrow hallway in an awkward hug, the older one patting the younger on the back. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside.
```

#### `call_inlaws__2.png` — ««Спасибо»»

> «Да ладно», — говорит он и уходит смотреть, сколько бензина в машине.

Анимация: падающий снег.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the older man walking out to a snowy yard toward an old car with a flashlight, checking the fuel. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside.
```

#### `call_inlaws__3.png` — ««Мы сами, на такси»»

> Он машет рукой: «Какое такси, ночью». Отвезёт всё равно. Но ты хотя бы предложил — и почему-то стало легче.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the older man waving his hand dismissively in a kitchen, car keys swinging from his finger, the younger man laughing. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside. a steaming cup or pot near the center of the frame.
```

### `pack_clothes.png`

> Два чемодана по двадцать три килограмма и три рюкзака. Сначала одежда на троих: на лето, на зиму и на «мы не знаем, куда едем». Уже тридцать четыре килограмма. Вы не понимаете, как.

Анимация: пылинки медленно плывут. Сцена: `suitcase`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: two big open suitcases on the floor of a small room, piles of folded clothes for summer and winter, a bathroom scale nearby. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

#### `pack_clothes__1.png` — «Дальше»

Анимация: пылинки медленно плывут.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: both suitcases half full, a winter jacket squeezed in on top, the scale showing a big number in illegible pixels. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

### `pack_toys.png`

> Игрушки собираешь сам: сын в Старой Руссе, так что его мнения никто не спрашивает. Машинки Hot Wheels — штук сорок. Лего. Книжки. И серый плюшевый кот, без которого он не засыпает.

Анимация: пылинки медленно плывут. Сцена: `suitcase`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a floor covered with toy cars, lego bricks, picture books and a grey plush cat, an open suitcase waiting. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

#### `pack_toys__1.png` — «Взять всё»

> Шесть килограммов детства. Чемодан звенит машинками, когда его двигаешь.

Анимация: пылинки медленно плывут.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a suitcase packed full of toy cars and lego, the grey plush cat sitting on top like a guard. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

#### `pack_toys__2.png` — «Кота и пять машинок»

> Кот едет обязательно. Пять машинок ты выбираешь двадцать минут, как будто от этого что-то зависит.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a hand holding five small toy cars over the suitcase, the grey plush cat already inside. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

#### `pack_toys__3.png` — «Кота, машинки и Лего»

> Книжки остаются на полке. Ты обещаешь себе купить такие же там. Купишь — только на другом языке.

Анимация: пылинки медленно плывут.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a stack of children's books left on an empty shelf while the suitcase is zipped with toys inside. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

### `pack_kitchen.png`

> Детская кухня из ИКЕА. Сын каждый день варит на ней суп из машинок. В чемодан она не влезает. Никак. Даже если очень хотеть.

Анимация: без анимации. Сцена: `room_home`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a small white ikea toy kitchen in the corner of a child's room, toy cars inside a toy pot, a suitcase beside it clearly too small. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

#### `pack_kitchen__1.png` — «Попробовать разобрать»

> Сорок минут с шестигранником. Не влезает. Собираешь обратно. Лишний винтик ты найдёшь потом в кармане, уже в Тбилиси.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man sitting on the floor with an allen key surrounded by toy kitchen parts, a single screw in his hand. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

#### `pack_kitchen__2.png` — «Оставить»

> Кухня остаётся в пустой квартире. Ты фотографируешь её, как старого друга.

Анимация: пылинки медленно плывут.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the toy kitchen standing alone in a half-empty room, a phone in the man's hand taking its photo. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

#### `pack_kitchen__3.png` — «Пообещать новую — там»

> Ты обещаешь сыну новую кухню «там». Он не знает слова «там». Ты, честно говоря, тоже пока не очень.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man crouching and promising something to an empty toy kitchen, a child's drawing on the wall. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

### `pack_buckwheat.png`

> Все, кто уехал раньше, пишут одно: возьмите гречку. Там её нет. Ну, есть, но не та. Три килограмма стратегического запаса. А сырки «Б. Ю. Александров» в чемодан не положишь — растают.

Анимация: без анимации. Сцена: `suitcase`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a kitchen counter with paper packs of buckwheat, curd snack bars in a fridge door, an open suitcase on a chair. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

#### `pack_buckwheat__1.png` — «Взять гречку»

> Ты везёшь за границу три килограмма крупы. Самое русское решение в твоей жизни. Сырки вы съедаете в последний вечер. По три на человека.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: three kilos of buckwheat packs wedged between sweaters in the suitcase, a family eating curd snacks at the table behind. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

#### `pack_buckwheat__2.png` — «Купим там»

> Смелое заявление. Запомним. Сырки вы всё равно съедаете в последний вечер — тут без вариантов.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: empty suitcase corner where buckwheat could be, the family eating curd snacks at a late kitchen table. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight. a steaming cup or pot near the center of the frame.
```

#### `pack_buckwheat__3.png` — «Один килограмм — для души»

> Компромисс: килограмм гречки и пачка чая. Жена называет это «гуманитарной помощью самим себе».

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: one small pack of buckwheat and a box of tea placed neatly in the suitcase like a treasure. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

### `pack_laptops.png`

> Два рабочих ноутбука — твой и жены — едут в рюкзаках, на руках. Без них вы не эмигранты, а туристы без обратного билета. И третий, старый. «На всякий случай».

Анимация: без анимации. Сцена: `suitcase`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: two work laptops in backpacks on a sofa and a third old laptop with stickers lying alone. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

#### `pack_laptops__1.png` — «Взять и старый»

> «На всякий случай» — это всегда плюс два килограмма.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the old laptop squeezed into a backpack already full of cables. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

#### `pack_laptops__2.png` — «Оставить бабушке»

> Ноутбук остаётся у бабушки. Видеозвонки она так и не освоит: будет звонить вам по международной связи с городского и кричать в трубку, потому что «далеко же».

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an elderly woman holding the old laptop at her kitchen table, a landline phone beside her. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight. a steaming cup or pot near the center of the frame.
```

#### `pack_laptops__3.png` — «Продать за вечер»

> Объявление, звонок, покупатель с пакетом из «Пятёрочки». Копейки. Но копейки в дороге — тоже деньги.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a buyer with a supermarket plastic bag taking the old laptop at a doorway at night. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

### `pack_kid_meds.png`

> Жена собирает детскую аптечку. Как всегда — большую. Жаропонижающее трёх видов, от живота, от аллергии, от «а вдруг». «Там мы не знаем ни врачей, ни названий».

Анимация: без анимации. Сцена: `kitchen_mom`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a kitchen table covered with medicine boxes, thermometers and syrups, a woman sorting them into a big pouch. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside.
```

#### `pack_kid_meds__1.png` — «Взять всю»

> Ещё два килограмма. Жена спокойна. Это тоже лекарство.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a fat first aid pouch zipped shut on top of the suitcase, the woman relieved. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside.
```

#### `pack_kid_meds__2.png` — ««Может, поменьше?»»

> Жена смотрит на тебя так, что ты сам кладёшь в чемодан ещё одну упаковку. Аптечка едет большая. Она всегда едет большая.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman giving a long look while the man silently adds another box to the pile. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside.
```

#### `pack_kid_meds__3.png` — «Добавить свои таблетки»

> Ты кладёшь сверху свои таблетки от головы. Аптечек теперь две. Жена довольна — впервые за неделю.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: two first aid pouches side by side in the suitcase, one small, one huge. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside.
```

### `pack_album.png`

> Фотоальбом. Бумажный. Ты на море в пять лет, папа молодой, все живые.

Анимация: пылинки медленно плывут. Сцена: `room_home`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an old paper photo album open on a bed: a small boy on a beach, a young father, faded colors. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

#### `pack_album__1.png` — «Взять альбом»

> Два килограмма. Не спорь.

Анимация: пылинки медленно плывут.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the photo album wrapped in a sweater and placed in the suitcase. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

#### `pack_album__2.png` — «Сфотографировать страницы»

> Тридцать фотографий фотографий. В телефоне они какие-то не такие.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone held over the album photographing a page, the screen glowing. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

#### `pack_album__3.png` — «Взять три фотографии»

> Три снимка в обложке паспорта: папа молодой, мама на даче, ты на море. Остальной альбом остаётся в шкафу у мамы.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: three old photos slipped into a passport cover on a table. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

### `scales_over.png`

> Весы. Два чемодана — сорок шесть килограммов можно. У вас — больше. Что-то придётся оставить.

Анимация: без анимации. Сцена: `suitcase`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a suitcase on bathroom scales, the man and woman staring at it, things spread around on the floor. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

#### `scales_over__1.png` — «Выложить гречку»

> Прощай, стратегический запас.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: packs of buckwheat taken out and stacked on the floor next to the scales. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

#### `scales_over__2.png` — «Выложить Лего»

> Лего остаётся у бабушки «на потом». Машинки и кот едут — это не обсуждается.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a lego box set aside on a shelf labelled with a sticky note, the suitcase lighter. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

#### `scales_over__3.png` — «Распихать по рюкзакам»

> Три рюкзака становятся тяжелее чемоданов. Спины вам этого не простят, но авиакомпания не узнает.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: three backpacks bulging enormously, the man testing the weight of one with a grimace. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

#### `scales_over__4.png` — «Доплатить за перевес»

> Авиакомпания благодарит вас за выбор авиакомпании.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an airline check-in desk, the man paying by card for excess baggage. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

### `scales_ok.png`

> Сорок шесть. Ну, сорок шесть и восемьсот, но весы добрые. Ты садишься на каждый чемодан по очереди, чтобы они закрылись. Закрылись. Осталось забрать сына.

Анимация: пылинки медленно плывут. Сцена: `suitcase`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man sitting on a suitcase to close it, the woman pulling the zipper, both laughing tiredly. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

#### `scales_ok__1.png` — «Ехать в Старую Руссу»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: two closed suitcases and three backpacks standing in a row by the front door at night. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

### `pack_fallback.png`

> Вы перекладываете вещи из чемодана в рюкзак и обратно. Легче они от этого не становятся.

Анимация: пылинки медленно плывут. Сцена: `suitcase`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: things moved from a suitcase to a backpack and back, the room a mess of half-packed bags. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

#### `pack_fallback__1.png` — «Хватит»

Анимация: пылинки медленно плывут.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man giving up and sitting on the floor among the bags. Usual place, adapt if the moment says otherwise: close-up of a large open suitcase on a floor bathroom scale, stuffed with clothes, a pack of buckwheat, toy cars scattered around, a grey plush cat toy sitting on top of the suitcase, muted cold palette, warm lamp highlight.
```

## Петербург. Отъезд

### `dep_russa.png`

> Старая Русса. Сын гостил здесь у твоей мамы, ты приехал его забрать. Бабушка тоже здесь. Она суёт тебе в карман конверт с деньгами «на первое время», обнимает, целует сына в макушку, снова обнимает.

Анимация: пар поднимается из центра. Сцена: `kitchen_mom`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a small wooden house kitchen in an old russian town, a tiny grandmother pushing an envelope into the man's coat pocket, a toddler in her arms. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside. a steaming cup or pot near the center of the frame.
```

#### `dep_russa__1.png` — «Взять конверт»

> Ты берёшь. Спорить с ней бесполезно — ты знаешь это с детства. Одну купюру из этого конверта ты так и не потратишь.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man's hand holding a white envelope, grandmother nodding firmly. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside.
```

#### `dep_russa__2.png` — ««Ба, не надо»»

> Ты отказываешься. В Тбилиси, разбирая детскую куртку, ты найдёшь в кармане тот самый конверт. Бабушка всегда побеждает.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a toddler's jacket on a hotel bed, an envelope sticking out of its pocket. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside.
```

#### `dep_russa__3.png` — «Отдать конверт маме тайком»

> Ты отдаёшь конверт маме: «Верни ей потом». Мама кивает. Бабушка узнает и обидится — ровно на один день.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man quietly handing the envelope to his mother in a dim hallway. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside.
```

### `dep_mom_dinner.png`

> Ужин у мамы в Старой Руссе. Оливье, селёдка под шубой, пирожки — всё, что ты любишь с детства. И пицца — специально для внука. Сын ест только хлеб. Бабушка подкладывает всем добавку. Взрослые говорят о чём угодно, кроме главного.

Анимация: пар поднимается из центра. Сцена: `kitchen_mom`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a crowded family table with olivier salad, herring under a fur coat, pies and a pizza for the toddler who eats only bread. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside. a steaming cup or pot near the center of the frame.
```

#### `dep_mom_dinner__1.png` — «Сказать главное»

> «Мам, мы будем звонить каждый день». «Ну, каждый день не надо, — говорит мама. — Через день». Все смеются. Потом нет.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: mother and son across the table, she laughing with wet eyes. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside. a steaming cup or pot near the center of the frame.
```

#### `dep_mom_dinner__2.png` — «Есть ещё пирожок»

> Третья тарелка оливье, второй кусок шубы, четвёртый пирожок. Это тоже способ сказать.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man's plate piled high with pies, a grandmother adding more. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside. a steaming cup or pot near the center of the frame.
```

#### `dep_mom_dinner__3.png` — «Помочь мыть посуду»

> Вы с мамой стоите у раковины плечом к плечу. Она моет, ты вытираешь. Самый длинный разговор за вечер — и в нём почти нет слов.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: mother and son washing dishes shoulder to shoulder at a small sink, steam rising. Usual place, adapt if the moment says otherwise: cozy small russian kitchen, table covered with too much food (salads, pies, olivier salad bowl), oilcloth tablecloth, mother figure seen from behind standing at the stove, steam, window with dark winter evening, warm yellow lamp inside, cold blue outside. a steaming cup or pot near the center of the frame.
```

### `dep_money.png`

> Деньги лежат в акциях, в приложении брокера. Ты продаёшь всё за вечер, по любой цене. Теперь их нужно достать наличными, в валюте. А валюта в банкоматах кончается быстрее, чем ты до них доезжаешь.

Анимация: падающий снег. Сцена: `exchange`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a dark winter street at night with a row of atms, one screen glowing, the man with a phone checking a broker app. Usual place, adapt if the moment says otherwise: currency exchange booth near a metro entrance, glowing rate board with unreadable digits, queue of people in dark coats, one person in a hoodie seen from behind, cold evening, neon green digits.
```

#### `dep_money__1.png` — «Объехать банкоматы»

> Пять банкоматов за ночь. В четырёх — «операция недоступна». В пятом ещё есть евро. Ты снимаешь всё, что он даёт, и оглядываешься, как в кино.

Анимация: падающий снег.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man at the fifth atm finally pulling out euro banknotes, snow on his shoulders. Usual place, adapt if the moment says otherwise: currency exchange booth near a metro entrance, glowing rate board with unreadable digits, queue of people in dark coats, one person in a hoodie seen from behind, cold evening, neon green digits.
```

#### `dep_money__2.png` — «Поменять в обменнике»

> Очередь, курс грабительский, кассир смотрит понимающе. Деньги есть, но их стало заметно меньше.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a small currency exchange booth with a long queue and a tired cashier behind glass. Usual place, adapt if the moment says otherwise: currency exchange booth near a metro entrance, glowing rate board with unreadable digits, queue of people in dark coats, one person in a hoodie seen from behind, cold evening, neon green digits. small lit windows or lamps scattered in the upper two thirds.
```

#### `dep_money__3.png` — «Крипта через P2P»

> Ты покупаешь USDT у человека с котиком на аватарке. Котик надёжный. Наверное.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone screen with a chat and a cat avatar, the man in a dark room lit by it. Usual place, adapt if the moment says otherwise: currency exchange booth near a metro entrance, glowing rate board with unreadable digits, queue of people in dark coats, one person in a hoodie seen from behind, cold evening, neon green digits.
```

### `dep_rate.png`

> Курс доллара на табло меняется, пока ты стоишь в очереди. Мужчина перед тобой меняет всё. Совсем всё. Вы киваете друг другу.

Анимация: мигают огоньки в верхних двух третях. Сцена: `exchange`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a currency exchange with a big rate board, numbers changing, a queue of people in winter coats. Usual place, adapt if the moment says otherwise: currency exchange booth near a metro entrance, glowing rate board with unreadable digits, queue of people in dark coats, one person in a hoodie seen from behind, cold evening, neon green digits. small lit windows or lamps scattered in the upper two thirds.
```

#### `dep_rate__1.png` — «Поменять ещё немного»

> На всякий случай. Этот случай — вся ваша жизнь.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man pushing more banknotes under the cashier window. Usual place, adapt if the moment says otherwise: currency exchange booth near a metro entrance, glowing rate board with unreadable digits, queue of people in dark coats, one person in a hoodie seen from behind, cold evening, neon green digits. small lit windows or lamps scattered in the upper two thirds.
```

#### `dep_rate__2.png` — «Не менять»

> Курс вырастет. Ты это знаешь. Ты всегда это знаешь — потом.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man walking away from the queue, the rate board behind him going up. Usual place, adapt if the moment says otherwise: currency exchange booth near a metro entrance, glowing rate board with unreadable digits, queue of people in dark coats, one person in a hoodie seen from behind, cold evening, neon green digits. small lit windows or lamps scattered in the upper two thirds.
```

#### `dep_rate__3.png` — «Спросить мужчину впереди»

> «Меняй всё, — говорит он, не оборачиваясь. — И карты не закрывай». Ты не знаешь, кто он. Совет оказывается хорошим.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man talking to a stranger in a grey coat in the queue, the stranger not turning around. Usual place, adapt if the moment says otherwise: currency exchange booth near a metro entrance, glowing rate board with unreadable digits, queue of people in dark coats, one person in a hoodie seen from behind, cold evening, neon green digits. small lit windows or lamps scattered in the upper two thirds.
```

### `dep_farewell.png`

> Вы уезжаете, никому не сказав до свидания. Знают только родственники. Друзья узнают, когда вы уже будете в Тбилиси.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone with a long list of contacts, the man's thumb hovering, packed bags in the background. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `dep_farewell__1.png` — «Написать им из Тбилиси»

> Ты пишешь длинное сообщение и стираешь его. Пишешь короткое: «Мы уехали». Кто-то обидится, кто-то поймёт, кто-то сделает вид, что понял.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a short message typed on the phone in a tbilisi hotel room. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `dep_farewell__2.png` — «Не объяснять никому»

> Объяснять пришлось бы то, что вы и сами не понимаете. Тишина тоже ответ. Неловкий.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the phone face down on a suitcase, the room silent. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `dep_farewell__3.png` — «Позвонить одному другу»

> Ты звонишь только лучшему другу. Он молчит, потом говорит: «Понял. Обними сына». Остальные узнают от него. Так даже лучше.

Анимация: падающий снег.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on a balcony at night calling one friend, breath visible in the cold. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `dep_apartment.png`

> Квартира съёмная. Вы берёте самое ценное, остальное оставляете как есть — как будто уезжаете в отпуск. Посуда в шкафу, книги на полке, кухня из ИКЕА в углу.

Анимация: пылинки медленно плывут. Сцена: `room_home`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a rented flat left as if for a holiday: dishes in the cupboard, books on the shelf, the toy kitchen in the corner. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

#### `dep_apartment__1.png` — «Закрыть дверь»

> Ключ поворачивается два раза. Ты проверяешь ручку. Потом ещё раз. Квартира остаётся ждать.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a hand turning a key twice in an old apartment door. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

### `dep_kid_question.png`

> Последний вечер. Квартира в сумках и коробках. Сын ходит между ними грустный и не понимает, что происходит. Говорить он ещё не умеет — спросить не может.

Анимация: пылинки медленно плывут. Сцена: `room_home`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a toddler walking alone between bags and boxes in a half-empty flat, holding the grey plush cat. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

#### `dep_kid_question__1.png` — «Взять на руки»

> Он утыкается тебе в шею. Ты тоже не всё понимаешь, но тебе хотя бы можно этого не показывать.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man holding the toddler who buries his face in his neck. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

#### `dep_kid_question__2.png` — «Включить мультики»

> Мультики помогают ему. Тебе — нет.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a toddler watching cartoons on a tablet among boxes, the man looking away. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

#### `dep_kid_question__3.png` — «Строить крепость из коробок»

> Из коробок выходит крепость с окошком. Сын сидит внутри и не хочет выходить. Ты тоже не хочешь.

Анимация: пылинки медленно плывут.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a fort built from cardboard boxes with a window, a toddler peeking out. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

### `dep_walk.png`

> Вы сидите среди собранных сумок и ничего не понимаете. Много думаете о том, что уезжаете. Насколько — не знаете. Скорее всего, надолго.

Анимация: без анимации. Сцена: `room_home`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a couple sitting on the floor among packed bags in a dark flat, not talking. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

#### `dep_walk__1.png` — «Сидеть рядом с женой»

> Вы молчите. Сумки молчат. Где-то за стеной соседи смотрят телевизор, как будто ничего не происходит.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man and the woman shoulder to shoulder on the floor, a neighbour's tv glow through the wall. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

### `dep_messages.png`

> Бывший коллега пишет: «Правильно делаешь». Другой пишет: «Ну и вали». Третий ставит сердечко.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone screen with three messages: a thumbs up, an angry line, a heart, the man reading in the dark. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `dep_messages__1.png` — «Ответить всем»

> Первому — «спасибо», второму — долго ничего, потом тоже «спасибо». Третьему — сердечко.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man typing replies on the phone on a sofa. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `dep_messages__2.png` — «Никому»

> Ты выключаешь телефон. Потом включаешь — проверить, не написал ли кто-то ещё.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the phone switched off on a table, then the man reaching for it again. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `dep_messages__3.png` — «Ответить только третьему»

> Сердечко в ответ на сердечко. Самый честный разговор за день.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a single heart sent back on the phone screen. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `dep_work.png`

> На работе говорят: если переезжаешь в другую страну, тебя переводят на договор подряда — ГПХ. Двое коллег, которые тоже уехали, предлагают подписать петицию: пусть компания выплатит уезжающим три-четыре зарплаты.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a video call on a laptop with a grid of colleagues, a contract document open next to it. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `dep_work__1.png` — «Согласиться на ГПХ»

> Ты соглашаешься. Работа есть — и ладно. В чате коллеги ставят под твоим «ок» один грустный смайлик на двоих.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man signing a document on a laptop with a tired face. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `dep_work__2.png` — «Подписать петицию»

> Петиция уходит наверх. Ответ: «Мы вас услышали». Через неделю тебе тоже присылают договор ГПХ. Но подписывать его немного приятнее.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a petition page with a few signatures on the laptop screen. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `dep_work__3.png` — «Спросить юриста»

> Юрист объясняет про ГПХ, налоги и резидентство сорок минут. Ты понимаешь половину. Зато правильную.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on a video call with a lawyer, a notepad full of scribbles. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `dep_airport.png`

> Ночь. Папа жены везёт вас в Пулково по пустым улицам. А в аэропорту — толпа. Жена встречает своих коллег, которые тоже улетают, и они говорят вполголоса. Сын то спит, то просыпается. Вы ходите туда-сюда с чемоданами. Тревожно.

Анимация: падающий снег. Сцена: `airport_home`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a car driving through empty night streets of saint petersburg to the airport, the father-in-law at the wheel. Usual place, adapt if the moment says otherwise: airport departure hall at night, long quiet queue to passport control, people with big suitcases, departure board with unreadable text, cold white light, figure with a backpack seen from behind.
```

#### `dep_airport__1.png` — «Встать в очередь»

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a crowded airport hall at night, families with suitcases standing in a long quiet queue. Usual place, adapt if the moment says otherwise: airport departure hall at night, long quiet queue to passport control, people with big suitcases, departure board with unreadable text, cold white light, figure with a backpack seen from behind. small lit windows or lamps scattered in the upper two thirds.
```

### `dep_border.png`

> «Цель поездки?» Сын спит у тебя на плече. Два чемодана и три рюкзака — в три часа ночи.

Анимация: без анимации. Сцена: `border`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: passport control booth at night, an officer behind glass, the man with a sleeping toddler on his shoulder and many bags. Usual place, adapt if the moment says otherwise: passport control booth seen from traveler's point of view, border officer behind glass looking at a passport, stamp in hand, harsh fluorescent light, tense.
```

#### `dep_border__1.png` — ««Туризм»»

> Пограничник смотрит на чемоданы, на рюкзаки, на спящего сына. Долго. Очень долго. Штамп. Ты выдыхаешь где-то над облаками.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the officer looking at the luggage for a long time, a stamp raised in the air. Usual place, adapt if the moment says otherwise: passport control booth seen from traveler's point of view, border officer behind glass looking at a passport, stamp in hand, harsh fluorescent light, tense.
```

#### `dep_border__2.png` — «Улыбнуться и молчать»

> Пограничник улыбается в ответ. Почти. Листает паспорта. Штамп. Штамп. Штамп. Самые длинные три минуты в твоей жизни.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man smiling nervously at the booth, passports being flipped. Usual place, adapt if the moment says otherwise: passport control booth seen from traveler's point of view, border officer behind glass looking at a passport, stamp in hand, harsh fluorescent light, tense.
```

#### `dep_border__3.png` — ««В гости к друзьям»»

> «К каким друзьям?» — «К хорошим». Пограничник поднимает глаза, смотрит на спящего сына — и ставит штамп. Ты не знаешь, что это было.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the officer glancing at the sleeping toddler and stamping the passport. Usual place, adapt if the moment says otherwise: passport control booth seen from traveler's point of view, border officer behind glass looking at a passport, stamp in hand, harsh fluorescent light, tense.
```

### `dep_plane.png`

> Чартер взлетает. Внизу становится маленьким всё, что было большим. Сын засыпает сразу, на тебе. Жена смотрит в окно. Ты смотришь на жену.

Анимация: мерцают звёзды в верхней части. Сцена: `plane`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: inside a charter plane at night, a toddler asleep on the man's chest, the woman looking out of the window. Usual place, adapt if the moment says otherwise: view from an airplane window seat, clouds below, wing visible, a hand resting on the window frame, soft sunrise colors, calm and bittersweet. keep dark night sky in the upper part of the frame.
```

#### `dep_plane__1.png` — «Смотреть в окно»

> Облака. Ещё облака. Где-то под ними граница, но её не видно. Странно: такую важную вещь должно быть видно.

Анимация: мерцают звёзды в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: view through the plane window: clouds, nothing but clouds, no border to be seen. Usual place, adapt if the moment says otherwise: view from an airplane window seat, clouds below, wing visible, a hand resting on the window frame, soft sunrise colors, calm and bittersweet. keep dark night sky in the upper part of the frame.
```

#### `dep_plane__2.png` — «Взять жену за руку»

> Вы ничего не говорите. Всё уже сказано за эти дни. Остальное — потом.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: two hands holding each other on the armrest. Usual place, adapt if the moment says otherwise: view from an airplane window seat, clouds below, wing visible, a hand resting on the window frame, soft sunrise colors, calm and bittersweet.
```

#### `dep_plane__3.png` — «Смотреть на сына»

> Он спит, приоткрыв рот, и держит тебя за палец. Ты не двигаешься весь полёт. Рука затекает. Пусть.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a sleeping toddler holding the man's finger. Usual place, adapt if the moment says otherwise: view from an airplane window seat, clouds below, wing visible, a hand resting on the window frame, soft sunrise colors, calm and bittersweet.
```

### `dep_yerevan.png`

> Ереван. Сорок минут сидите в самолёте, никого не выпускают. Никто не понимает, почему так. Но почему-то так. Сын прилипает к иллюминатору и стучит ладошкой по стеклу: там горы.

Анимация: без анимации. Сцена: `transit`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a plane parked on the tarmac in yerevan, mountains through the window, a toddler pressing his palm to the glass. Usual place, adapt if the moment says otherwise: huge transit airport terminal at night, people sleeping on benches with backpacks, a simit bread stall, big glass windows with airplanes outside, warm artificial light, liminal space feeling.
```

#### `dep_yerevan__1.png` — «Помахать горам»

> Сын машет горам. Горы не отвечают. Самолёт снова взлетает — в Тбилиси.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the toddler waving at the snowy mountains outside the window. Usual place, adapt if the moment says otherwise: huge transit airport terminal at night, people sleeping on benches with backpacks, a simit bread stall, big glass windows with airplanes outside, warm artificial light, liminal space feeling.
```

#### `dep_yerevan__2.png` — «Проверить, где деньги»

> Все на месте: в носке, в подкладке, в куртке сына. Ты проверишь ещё раз в Тбилиси. И потом ещё.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man patting his sock and jacket lining to check the money. Usual place, adapt if the moment says otherwise: huge transit airport terminal at night, people sleeping on benches with backpacks, a simit bread stall, big glass windows with airplanes outside, warm artificial light, liminal space feeling.
```

#### `dep_yerevan__3.png` — «Закрыть глаза»

> Сорок минут сна в кресле — лучшие за неделю. Ты просыпаешься уже в небе над Грузией.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man asleep in the plane seat, the woman reading. Usual place, adapt if the moment says otherwise: huge transit airport terminal at night, people sleeping on benches with backpacks, a simit bread stall, big glass windows with airplanes outside, warm artificial light, liminal space feeling.
```

### `dep_wait.png`

> Пакуете, распаковываете, пакуете. Время тянется, как очередь в МФЦ.

Анимация: пылинки медленно плывут. Сцена: `room_home`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: bags packed, unpacked and packed again in a small room. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

#### `dep_wait__1.png` — «Дальше»

Анимация: пылинки медленно плывут.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man staring at a clock above the packed bags. Usual place, adapt if the moment says otherwise: small soviet-era apartment bedroom, open suitcase on the floor surrounded by folded clothes and books, window with grey overcast sky and concrete apartment blocks outside, old carpet on the wall, cold blue-grey muted colors, evening light from a desk lamp, quiet and sad.
```

## Тбилиси

### `tb_border.png`

> Тбилиси, паспортный контроль. Полицейский смотрит на сонного сына, улыбается и говорит на ломаном русском: «Молодец. Хороший мальчик будешь». Приобнимает его за плечо. Первый человек в новой стране — добрый.

Анимация: без анимации. Сцена: `border`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: tbilisi airport passport control at dawn, a kind georgian officer leaning out of his booth smiling at a sleepy toddler. Usual place, adapt if the moment says otherwise: passport control booth seen from traveler's point of view, border officer behind glass looking at a passport, stamp in hand, harsh fluorescent light, tense.
```

#### `tb_border__1.png` — ««Спасибо»»

> Ты говоришь «спасибо», потом вспоминаешь «мадлоба» и говоришь ещё раз. Он смеётся и ставит штамп. Тебе впервые за неделю немного легче.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the officer laughing and stamping the passport, the man with a hand on his heart. Usual place, adapt if the moment says otherwise: passport control booth seen from traveler's point of view, border officer behind glass looking at a passport, stamp in hand, harsh fluorescent light, tense.
```

### `tb_arrival.png`

> Тбилиси. Работодатель жены снял вам номер в отеле на две недели. Одна комната на троих: кровать, стол, окно во двор, где кто-то всё время чинит машину. Здесь вы будете жить, работать и есть.

Анимация: без анимации. Сцена: `tbilisi_hotel`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a small tbilisi hotel room for three: one bed, one desk, a window onto a courtyard where a man is fixing an old car. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy.
```

#### `tb_arrival__1.png` — «Распаковать чемоданы»

> Через десять минут комната выглядит так, будто вы живёте в ней год. Сын строит из кота и машинок гараж под кроватью.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the same room ten minutes later, cozy and lived-in, a toddler building a garage of toy cars under the bed. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy.
```

#### `tb_arrival__2.png` — «Не распаковывать»

> Две недели жизни из чемодана. Каждое утро ты ищешь носки в трёх местах. Зато уезжать будет быстро.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: closed suitcases stacked by the wall, the man digging through one for socks. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy.
```

#### `tb_arrival__3.png` — «Сразу открыть ноутбук»

> Чемоданы стоят нераскрытыми, а ты уже на созвоне. Начальник хвалит за оперативность. Сын хвалит кровать — прыгает на ней.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on a video call on the bed among unopened suitcases while the toddler jumps on the mattress. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy.
```

### `crypto_check.png`

> Проверяешь кошелёк с USDT. Всё на месте. Котик с аватарки прислал стикер «удачи». Наверное, это хороший знак.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone screen showing a crypto wallet balance and a sticker of a cat saying good luck, hotel bed sheets around. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `crypto_check__1.png` — «Выдохнуть»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man lying on the hotel bed exhaling, phone on his chest. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `tb_work_bed.png`

> Рабочий день. Ты на кровати с ноутбуком, жена за столом с ноутбуком, сын между вами смотрит мультики. Созвоны по очереди — под мультики. Твой начальник видит на фоне чужую штору и делает вид, что так и надо.

Анимация: без анимации. Сцена: `tbilisi_hotel`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a hotel room as an office: the man on the bed with a laptop, the woman at the desk with a laptop, the toddler between them watching cartoons. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy.
```

#### `tb_work_bed__1.png` — «Созвон из ванной»

> Акустика отличная. Ты презентуешь квартальный план, сидя на краю ванны. План одобрен.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man sitting on the edge of a bathtub presenting on a laptop, tiles behind him. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy.
```

#### `tb_work_bed__2.png` — «Работать ночью»

> Ночью тихо и никто не спрашивает, когда пойдём гулять. Утром ты выглядишь как город за окном — красиво, но потрёпано.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man working at night by laptop light, the family asleep, city lights in the window. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy. small lit windows or lamps scattered in the upper two thirds.
```

#### `tb_work_bed__3.png` — «Созвон с сыном на коленях»

> Сын машет в камеру. Начальник машет в ответ — впервые за два года ты видишь его улыбку.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a toddler on the man's lap waving into a laptop camera, a smiling boss on screen. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy.
```

### `tb_breakfast.png`

> Завтрак в отеле — шведский стол с грузинскими мотивами: хачапури, сыр, помидоры, которые пахнут помидорами. Сын ест хлеб и картошку фри. Много картошки фри. Ты ешь за двоих — нервы.

Анимация: пар поднимается из центра. Сцена: `tbilisi_hotel`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a hotel breakfast buffet with khachapuri, cheese and fat tomatoes, a toddler with a plate of french fries. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy. a steaming cup or pot near the center of the frame.
```

#### `tb_breakfast__1.png` — «Ещё хачапури»

> Через две недели ты будешь узнавать хачапури по звуку.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man with a plate stacked with khachapuri. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy. a steaming cup or pot near the center of the frame.
```

#### `tb_breakfast__2.png` — «Взять с собой на обед»

> Ты заворачиваешь хачапури в салфетку. Экономия три лари. Чувство — как в студенчестве.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man wrapping a khachapuri in a napkin and hiding it in his bag. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy.
```

#### `tb_breakfast__3.png` — «Уговорить сына на хачапури»

> Он откусывает сырный край, думает — и берёт ещё картошки фри. Но край он откусил. Это прогресс.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the toddler biting the cheesy edge of a khachapuri with a suspicious face. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy. a steaming cup or pot near the center of the frame.
```

### `tb_old_town.png`

> Вечером — старый город. Балконы, которые держатся на честном слове, серные бани, крутые улицы. Сын устаёт через пятнадцать минут и едет у тебя на плечах.

Анимация: мигают огоньки в верхних двух третях. Сцена: `tbilisi_old_town`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: old tbilisi in the evening: carved wooden balconies, steep streets, the man carrying the toddler on his shoulders. Usual place, adapt if the moment says otherwise: tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes, narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights. small lit windows or lamps scattered in the upper two thirds.
```

#### `tb_old_town__1.png` — «Подняться к крепости»

> Сверху город похож на рассыпанную коробку с игрушками. Сын показывает на город пальцем и смеётся. Ты впервые за месяц соглашаешься без оговорок.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: view from narikala fortress over the lights of tbilisi, the toddler pointing at the city. Usual place, adapt if the moment says otherwise: tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes, narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights. small lit windows or lamps scattered in the upper two thirds.
```

#### `tb_old_town__2.png` — «Сесть в кафе»

> Хозяин кафе приносит сыну мандарин просто так. В Грузии детям всё приносят просто так.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a tiny cafe table on a steep street, the owner handing a mandarin to the toddler. Usual place, adapt if the moment says otherwise: tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes, narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights. small lit windows or lamps scattered in the upper two thirds.
```

#### `tb_old_town__3.png` — «Серные бани»

> Горячая вода, запах серы, сын в восторге от пара. Ты выходишь другим человеком. Ненадолго, но другим.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: domes of the sulfur baths with steam rising, the family coming out red-cheeked. Usual place, adapt if the moment says otherwise: tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes, narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights. a steaming cup or pot near the center of the frame.
```

### `tb_atm.png`

> По чату ищете банкоматы, которые ещё снимают с российских карт — сразу в доллары, по курсу, от которого хочется плакать. Их находят и передают друг другу, как грибные места.

Анимация: без анимации. Сцена: `tbilisi_old_town`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a georgian atm on an old street, a small queue of russian-speaking people, a phone with a chat listing working atms. Usual place, adapt if the moment says otherwise: tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes, narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights.
```

#### `tb_atm__1.png` — «Снять, сколько дают»

> Банкомат думает, шуршит и выдаёт доллары. Курс ты стараешься не пересчитывать. Пересчитываешь. Плачешь немного.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the atm slowly pushing out dollar bills, the man covering his eyes. Usual place, adapt if the moment says otherwise: tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes, narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights.
```

#### `tb_atm__2.png` — «Ждать грузинский счёт»

> Деньги остаются в России, нервы — с тобой. Жена молча показывает тебе адрес ещё одного банкомата.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman silently showing the man a map pin on her phone. Usual place, adapt if the moment says otherwise: tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes, narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights.
```

#### `tb_atm__3.png` — «Попросить друга перевести»

> Друг переводит через свои карты и три приложения. Получается дешевле. И чуть неловко — теперь ты ему должен.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on the phone to a friend while looking at three banking apps. Usual place, adapt if the moment says otherwise: tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes, narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights.
```

### `tb_bank.png`

> Грузинский банк. Очередь из людей, которые выглядят точь-в-точь как вы: уставшие, с паспортами и с детьми. Перед открытием счёта тебе дают подписать бумагу о политических взглядах. Формулировки такие, что ручка зависает над листом.

Анимация: без анимации. Сцена: `bank`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a georgian bank hall with a long queue of tired people with passports and children, a form on the counter. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

#### `tb_bank__1.png` — «Не подписывать»

> Ты кладёшь ручку. Счёта нет. Есть ощущение, что тебя взвесили и признали неудобным.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a pen laid down next to an unsigned form on the counter. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

#### `tb_bank__2.png` — «Уйти в другой банк»

> В другом банке другая бумага, но похожая. Ты выходишь на улицу и долго стоишь у входа. Счёт подождёт.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man standing alone outside a bank entrance on a sunny street. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

#### `tb_bank__3.png` — «Подождать, пока откроют жене»

> Ты не идёшь в другой банк. Решаете, что пока хватит одного счёта на двоих. Карта жены теперь — общий кошелёк.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman's new bank card on a cafe table between two coffees. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

### `tb_wife_bank.png`

> Работодатель жены договаривается с банком, и ей открывают счёт. Обычный, без бумаг про взгляды. Жена показывает карту, как трофей.

Анимация: без анимации. Сцена: `bank`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman holding up a new georgian bank card like a trophy outside a bank. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

#### `tb_wife_bank__1.png` — «Оплатить ею кофе»

> Карта работает. Кофе вкусный. Хоть у кого-то в семье есть грузинский счёт — значит, у всей семьи.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the card tapped on a cafe terminal, two coffees on the counter. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light. a steaming cup or pot near the center of the frame.
```

### `tb_gamarjoba.png`

> Соседка по этажу учит сына говорить «гамарджоба». Через день он машет так всем подряд, включая голубей. Говорить он ещё не умеет, но здороваться — уже по-грузински. Ты ещё путаешь «мадлоба» и «нахвамдис».

Анимация: без анимации. Сцена: `tbilisi_old_town`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a hotel corridor, an elderly georgian neighbour waving at the toddler who waves back, pigeons on the windowsill. Usual place, adapt if the moment says otherwise: tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes, narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights.
```

#### `tb_gamarjoba__1.png` — ««Мадлоба!»»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the toddler waving at pigeons in a courtyard, the man saying thank you to the neighbour. Usual place, adapt if the moment says otherwise: tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes, narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights.
```

### `tb_mom_call.png`

> Мама звонит по видео. Видит одну комнату, два ноутбука и сына в шкафу — он там «живёт». «Вы как студенты», — говорит она. Не понять, осуждает или завидует.

Анимация: без анимации. Сцена: `phone_video`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone video call: a grandmother's face on screen, behind the camera a hotel room with two laptops and a toddler sitting inside a wardrobe. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `tb_mom_call__1.png` — ««Это временно, мам»»

> «Всё временно», — говорит мама. С этого дня это её любимая фраза.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man holding the phone, the grandmother on screen nodding wisely. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `tb_mom_call__2.png` — «Дать трубку сыну»

> Сын показывает бабушке шкаф, кота и голубя за окном. Двадцать минут. Бабушка счастлива.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the toddler holding the phone up to show grandmother the grey plush cat. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `tb_mom_call__3.png` — «Показать вид из окна»

> Двор, машина, мужчина под капотом. «Ну, нормально», — говорит мама. Мужчина машет в камеру.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the phone pointed at the courtyard, a man under a car bonnet waving at the camera. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

### `tb_signagi.png`

> Четыре года назад вы уже были в Грузии. Прилетели на три дня и поженились в Сигнахи — двое русских в городе любви на холме. Тогда Грузия была праздником. Теперь она — убежище.

Анимация: без анимации. Сцена: `tbilisi_old_town`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a wedding photo on a phone: a young couple on the old city wall of sighnaghi with the alazani valley behind them. Usual place, adapt if the moment says otherwise: tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes, narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights.
```

#### `tb_signagi__1.png` — «Найти свадебные фото»

> Вы листаете фото на кровати в номере. Вы там моложе и ничего не знаете. Сын тычет пальцем в маму на фото и смеётся.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple lying on a hotel bed scrolling wedding photos, the toddler pointing at the screen. Usual place, adapt if the moment says otherwise: tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes, narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights.
```

#### `tb_signagi__2.png` — «Обещать съездить в Сигнахи»

> Вы обещаете друг другу съездить туда втроём. Обязательно. Когда всё устаканится.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple shaking little fingers in a promise at a window. Usual place, adapt if the moment says otherwise: tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes, narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights.
```

#### `tb_signagi__3.png` — «Съездить прямо сейчас»

> Два часа дороги. Тот же холм, та же стена, тот же вид. Сын бегает там, где вы когда-то стояли вдвоём.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family on the city wall of sighnaghi, the toddler running where the couple once stood. Usual place, adapt if the moment says otherwise: tbilisi old town at dusk, colorful carved wooden balconies, steep cobblestone street, sulfur bath domes, narikala fortress on the hill, father carrying a small boy on his shoulders seen from behind, warm lights.
```

### `tb_one_room.png`

> Десятый день в одной комнате. Ссор нет — вы вообще не умеете ругаться всерьёз. По вечерам гуляете втроём и ходите по ресторанам. Сын засыпает прямо за столом, где-то между хинкали и десертом.

Анимация: мигают огоньки в верхних двух третях. Сцена: `batumi_cafe`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a georgian restaurant at night, plates of khinkali, a toddler asleep at the table. Usual place, adapt if the moment says otherwise: georgian cafe table with a boat-shaped adjarian khachapuri with egg and butter, a small boy eating only the crust, father's hand with a fork, warm light. small lit windows or lamps scattered in the upper two thirds.
```

#### `tb_one_room__1.png` — «Заказать ещё хинкали»

> Сын спит на двух стульях, укрытый твоей курткой. Вы с женой доедаете хинкали и впервые за месяц говорите не про документы.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a toddler asleep on two chairs under the man's jacket, the couple talking over khinkali. Usual place, adapt if the moment says otherwise: georgian cafe table with a boat-shaped adjarian khachapuri with egg and butter, a small boy eating only the crust, father's hand with a fork, warm light. small lit windows or lamps scattered in the upper two thirds.
```

#### `tb_one_room__2.png` — «Нести сына в отель»

> Ты несёшь его по ночному Тбилиси. Он тёплый и тяжёлый. Жена идёт рядом и держит тебя за локоть. Город красивый, вы — вместе. Пока этого хватает.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man carrying the sleeping toddler through night tbilisi, the woman holding his elbow. Usual place, adapt if the moment says otherwise: georgian cafe table with a boat-shaped adjarian khachapuri with egg and butter, a small boy eating only the crust, father's hand with a fork, warm light. small lit windows or lamps scattered in the upper two thirds.
```

#### `tb_one_room__3.png` — «Сидеть на балконе»

> Сын спит в номере. Вы сидите на узком балконе с чаем и смотрите во двор. Мужчина всё ещё чинит машину. Это успокаивает.

Анимация: мерцают звёзды в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple on a narrow hotel balcony with tea, looking down at the courtyard. Usual place, adapt if the moment says otherwise: georgian cafe table with a boat-shaped adjarian khachapuri with egg and butter, a small boy eating only the crust, father's hand with a fork, warm light. keep dark night sky in the upper part of the frame.
```

### `tb_trip.png`

> Первая неделя. Почему Батуми? Подумали: когда ещё получится пожить у моря. Вы берёте машину напрокат и едете смотреть квартиры. Пять часов дороги через перевал. Сын спит, потом смотрит на горы, потом снова спит.

Анимация: без анимации. Сцена: `car`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a rental car on a mountain pass road between tbilisi and batumi, green hills, a toddler asleep in the back seat. Usual place, adapt if the moment says otherwise: small rental car on a winding mountain road in georgia, green mountains, low clouds, view from behind the car, a toddler asleep in a child seat visible through the rear window, early spring, calm road-trip mood.
```

#### `tb_trip__1.png` — «Взять ту, что у моря»

> Две комнаты, вид на море и армянский ремонт: позолота, лепнина, люстра как в опере. Тысяча долларов в месяц плюс депозит. Хозяин говорит, что это «очень хорошая цена». Хозяин улыбается.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an over-decorated batumi flat: gilded moulding, an opera-style chandelier, the black sea in the window. Usual place, adapt if the moment says otherwise: small rental car on a winding mountain road in georgia, green mountains, low clouds, view from behind the car, a toddler asleep in a child seat visible through the rear window, early spring, calm road-trip mood. keep water in the lower third of the frame.
```

#### `tb_trip__2.png` — «Посмотреть все пять»

> Пять квартир за день. В одной нет окон, в другой нет хозяина, в третьей — кот хозяина. Вы берёте ту, что у моря: две комнаты и армянский ремонт. Тысяча долларов.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: five apartment doors in a row, one with no windows, one with a fat cat sitting in it. Usual place, adapt if the moment says otherwise: small rental car on a winding mountain road in georgia, green mountains, low clouds, view from behind the car, a toddler asleep in a child seat visible through the rear window, early spring, calm road-trip mood.
```

#### `tb_trip__3.png` — «Поторговаться»

> Ты торгуешься двадцать минут. Хозяин сбавляет сто долларов и уважительно жмёт руку. Ремонт остаётся армянским.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man shaking hands with a smiling landlord under a golden chandelier. Usual place, adapt if the moment says otherwise: small rental car on a winding mountain road in georgia, green mountains, low clouds, view from behind the car, a toddler asleep in a child seat visible through the rear window, early spring, calm road-trip mood.
```

### `tb_where_next.png`

> Две недели заканчиваются. Квартира в Батуми ждёт. Вы собираете два чемодана и три рюкзака — уже быстрее, чем в Петербурге. Сын третий день стоит у окна и стучит ладошкой по стеклу: море ему обещали ещё в Петербурге.

Анимация: без анимации. Сцена: `tbilisi_hotel`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the toddler standing at the hotel window looking out, two suitcases and three backpacks packed by the door. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy.
```

#### `tb_where_next__1.png` — «В Батуми, к морю»

> Сын визжит от восторга так, что из соседнего номера стучат в стену. Ты стучишь в ответ — тоже от радости.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family loading bags into a car, the toddler squealing with joy. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy.
```

### `tb_day.png`

> Ещё один день в номере. Работа, хачапури, мультики. Кто-то во дворе всё ещё чинит машину.

Анимация: без анимации. Сцена: `tbilisi_hotel`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: another day in the hotel room: laptops, khachapuri, cartoons, the man in the courtyard still fixing his car. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy.
```

#### `tb_day__1.png` — «Дальше»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the courtyard seen from the window, the car bonnet still open. Usual place, adapt if the moment says otherwise: small hotel room in tbilisi, one double bed with a laptop on it, a desk with a second laptop, a small boy with headphones watching cartoons between them, open suitcases, toy cars under the bed, window to a courtyard with old wooden balconies, warm lamp light, crowded but cozy.
```

## Батуми

### `bat_flat.png`

> Батуми. Квартира у моря: две комнаты, армянский ремонт, позолота на всём, что не двигается. Из окна — море. Сын выбегает на балкон и машет морю обеими руками. Море не отвечает, но, кажется, ему приятно.

Анимация: блики на воде в нижней трети. Сцена: `batumi_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a batumi flat with armenian-style renovation: gilded moulding, a huge chandelier, the black sea through the balcony door, a toddler waving at the sea from the balcony. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light. keep water in the lower third of the frame.
```

#### `bat_flat__1.png` — «Распаковать всё»

> Машинки — на подоконник, кот — на кровать, ноутбуки — на стол с золотыми ножками. Теперь это ваша квартира. Хотя бы на время.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: toy cars lined up on the windowsill, the grey plush cat on the bed, laptops on a gold-legged table. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light. keep water in the lower third of the frame.
```

#### `bat_flat__2.png` — «Сначала к морю»

> Вещи подождут. Море нет. Вы идёте на пляж прямо с дороги, и сын бросает свой первый камень в Чёрное море.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family walking onto a pebble beach still carrying a backpack, the toddler throwing his first stone into the sea. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light. keep water in the lower third of the frame.
```

#### `bat_flat__3.png` — «Сначала поспать»

> Вы падаете на кровать с золотыми ножками прямо в одежде. Просыпаетесь от шума моря и не сразу понимаете, где вы. Понимаете — и улыбаетесь.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family asleep in their clothes on a big bed with golden legs, sea light on the ceiling. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light. keep water in the lower third of the frame.
```

### `bat_lift.png`

> В Грузии за лифт надо платить: монеткой или специальной карточкой. Карточка, конечно, лежит дома. Дом — наверху. Ты внизу, с сыном на руках и пакетами из магазина.

Анимация: без анимации. Сцена: `batumi_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a georgian apartment block lobby with a coin-operated elevator, the man holding a toddler and shopping bags. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_lift__1.png` — «Искать монетку»

> Ты выворачиваешь карманы: лари, тетри, чек, машинка Hot Wheels. Монетки нужной нет. Соседка молча прикладывает свою карточку. Мадлоба.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man turning out his pockets: coins, a receipt, a toy car; a neighbour tapping her elevator card. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_lift__2.png` — «Пешком»

> Сын на руках, пакеты в другой руке, лестница бесконечная. На каждом этаже ты обещаешь себе положить карточку в кошелёк. Не кладёшь.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man climbing an endless staircase with a toddler on one arm and bags in the other. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_lift__3.png` — «Сесть на ступеньку и ждать»

> Через десять минут спускается сосед, подхватывает пакеты — и вас. Лифт едет на его монетке. Теперь ты должен ему монетку и разговор.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man and toddler sitting on a step, a smiling neighbour coming down the stairs. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

### `bat_neighbor_price.png`

> В лифте соседка с девятого этажа рассказывает, что снимает такую же квартиру. За пятьсот. Вид, правда, на соседний дом. Лифт едет очень долго.

Анимация: без анимации. Сцена: `batumi_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: inside an old slow elevator, a chatty neighbour in a housecoat talking to the man. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_neighbor_price__1.png` — ««Зато у нас море»»

> Зато у вас море. Ты повторяешь это себе каждое первое число.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on his balcony at sunset looking at the sea, a rent invoice in his hand. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light. keep water in the lower third of the frame.
```

### `bat_month_both.png`

> Ещё полтора месяца. Две зарплаты пришли, аренда ушла, няня, бензин, хачапури. Деньги приходят и уходят, как волны на пляже. Немного остаётся на берегу.

Анимация: блики на воде в нижней трети. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone banking app on a balcony railing, two salaries in, rent out, the sea behind. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen. keep water in the lower third of the frame.
```

#### `bat_month_both__1.png` — «Отложить»

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a small jar of saved coins on the gold-legged table, sea in the window. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen. keep water in the lower third of the frame.
```

### `bat_month_me.png`

> Полтора месяца на одну зарплату. Аренда съедает больше половины. Жена каждый вечер обновляет вакансии с лицом сапёра.

Анимация: пар поднимается из центра. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman at night scrolling job listings on a laptop with a serious face, the man cooking soup. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen. a steaming cup or pot near the center of the frame.
```

#### `bat_month_me__1.png` — «Затянуть пояса»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a belt being tightened symbolically, a small grocery bag on the kitchen table. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `bat_month_wife.png`

> Полтора месяца на зарплату жены. Ты варишь супы, водишь сына на занятия и пишешь сопроводительные письма. Сопроводительные получаются лучше супов.

Анимация: пар поднимается из центра. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man cooking soup with a toddler on his hip, cover letters open on a laptop. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen. a steaming cup or pot near the center of the frame.
```

#### `bat_month_wife__1.png` — «Держаться»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man typing a cover letter late at night, a pot cooling on the stove. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `bat_month_none.png`

> Полтора месяца без зарплат. Аренда приходит вовремя. Только она.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an empty wallet next to a rent invoice on a gilded table. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `bat_month_none__1.png` — «Платить из накоплений»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a savings account balance dropping on a phone screen, the man rubbing his eyes. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `bat_my_bank.png`

> Тебе наконец открывают счёт — в Батуми, в обычном отделении, без лишних бумаг. Операционистка улыбается и спрашивает, надолго ли вы. Ты не знаешь, что ответить.

Анимация: без анимации. Сцена: `bank`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a small bank office in batumi, a smiling clerk handing a bank card across the counter. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

#### `bat_my_bank__1.png` — ««Надолго»»

> Она кивает, как будто это правильный ответ. Карта твоя. Свой счёт в чужой стране — маленький якорь.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man holding his new georgian bank card like a small anchor. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

#### `bat_my_bank__2.png` — ««Пока не знаем»»

> Она улыбается: «Все так говорят». И отдаёт карту. Кажется, «пока не знаем» в Батуми — самый частый ответ этой весны.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the clerk shrugging with a knowing smile, a queue of people like him behind. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

#### `bat_my_bank__3.png` — «Открыть счёт и жене»

> Операционистка оформляет второй счёт, не моргнув. Теперь у каждого своя карта и своя маленькая независимость.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: two bank cards on the counter side by side, the woman taking hers. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

### `bat_car_trip.png`

> Ты собираешься на авторынок под Тбилиси с другом, который разбирается в машинах. Сначала надо снять доллары. Карты нет. Нигде нет. Сын смотрит на тебя очень невинно.

Анимация: без анимации. Сцена: `batumi_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man searching the flat for his bank card, drawers open, a toddler watching very innocently. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_car_trip__1.png` — «Перерыть коробки на выброс»

> Картонные коробки, приготовленные на помойку. В третьей — твоя карта. Сын положил её туда аккуратно, как в сейф. Ты снимаешь семь тысяч долларов и стараешься не думать, что было бы, если бы ты их выкинул.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man digging through cardboard boxes by the door, finding the card in the third one. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_car_trip__2.png` — «Спросить сына»

> Говорить он ещё почти не умеет, но молча ведёт тебя к коробкам, которые ты собирался выкинуть. Карта — там. Он не понимает, что тут такого. Ты снимаешь семь тысяч долларов.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the toddler silently leading the man by the hand to a pile of boxes. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_car_trip__3.png` — «Позвонить жене»

> Жена отвечает спокойно, не отрываясь от созвона: «Посмотри в коробках. Он туда всё прячет». Она права. Она всегда права про коробки.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman on a video call pointing calmly toward the boxes without looking up. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

### `bat_car.png`

> Авторынок. В России осталась Skoda Yeti — её отдали родителям. Ты ищешь что-то похожее: повыше, полноприводное, вроде Tiguan. И тут видишь её — Volkswagen Jetta GLI. Низкая, спортивная, совсем не то, что нужно семье с ребёнком.

Анимация: без анимации. Сцена: `batumi_street`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a georgian used car market under the sun, rows of cars, a red volkswagen jetta gli shining among dusty suvs. Usual place, adapt if the moment says otherwise: batumi street with a mix of old houses and glass towers, used cars parked along the road, wet asphalt, neon signs (unreadable), a car market vibe, cloudy sky.
```

#### `bat_car__1.png` — «Взять то, что хочется»

> Ты покупаешь то, что хочется, а не то, что правильно. Жена смотрит на клиренс, потом на тебя. Потом садится и говорит: «Ладно. Красивая».

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man proudly standing by a red jetta gli, his friend shaking his head, the woman looking at the low clearance. Usual place, adapt if the moment says otherwise: batumi street with a mix of old houses and glass towers, used cars parked along the road, wet asphalt, neon signs (unreadable), a car market vibe, cloudy sky.
```

#### `bat_car__2.png` — «Взять подешевле»

> Повыше, постарше, подешевле. Правильно. Скучно. Заводится не с первого раза. Друг одобрительно кивает, и от этого ещё скучнее.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an old tall suv that does not start on the first try, the friend nodding approval. Usual place, adapt if the moment says otherwise: batumi street with a mix of old houses and glass towers, used cars parked along the road, wet asphalt, neon signs (unreadable), a car market vibe, cloudy sky.
```

#### `bat_car__3.png` — «Обойдёмся такси»

> Ты уезжаешь с рынка без машины и с семью тысячами в кармане. Друг вздыхает. Ты знаешь всех таксистов района по именам. Они тебя — по сыну.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man leaving the car market on foot with cash in his pocket, waving down a taxi. Usual place, adapt if the moment says otherwise: batumi street with a mix of old houses and glass towers, used cars parked along the road, wet asphalt, neon signs (unreadable), a car market vibe, cloudy sky.
```

### `bat_car_police.png`

> Вечер, учёт закрыт, завтра выходной, а продавец уезжает. Договариваетесь: ты ставишь машину на учёт в Батуми, а продавец приходит в полицию в Тбилиси. На следующий день два участка в двух городах созваниваются по скайпу, и продавец в камеру подтверждает: да, продал.

Анимация: без анимации. Сцена: `public_service_hall`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a georgian police office, a laptop on the desk with a skype call to another police station where the seller waves. Usual place, adapt if the moment says otherwise: modern georgian public service hall, glass and wood, electronic queue screens, coffee corner, people with document folders, futuristic bureaucracy, bright clean light.
```

#### `bat_car_police__1.png` — «Помахать продавцу»

> Он машет в ответ. Полицейский ставит печать. Бюрократия по видеосвязи оказалась быстрее, чем многое в жизни.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man waving at the seller on the laptop screen, a policeman stamping a paper. Usual place, adapt if the moment says otherwise: modern georgian public service hall, glass and wood, electronic queue screens, coffee corner, people with document folders, futuristic bureaucracy, bright clean light.
```

#### `bat_car_police__2.png` — «Держать документы наготове»

> Документы не понадобились: хватило лица продавца в скайпе. Ты ещё долго носишь папку с собой — на всякий случай.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man clutching a thick folder of documents that nobody asks for. Usual place, adapt if the moment says otherwise: modern georgian public service hall, glass and wood, electronic queue screens, coffee corner, people with document folders, futuristic bureaucracy, bright clean light.
```

#### `bat_car_police__3.png` — «Пошутить в камеру»

> Ты говоришь в скайп что-то про «самую дальнюю сделку в истории Грузии». Оба полицейских смеются. Печать ставят с улыбкой.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: two policemen laughing at the skype call, the stamp coming down. Usual place, adapt if the moment says otherwise: modern georgian public service hall, glass and wood, electronic queue screens, coffee corner, people with document folders, futuristic bureaucracy, bright clean light.
```

### `bat_car_repair.png`

> Дешёвая машина показывает характер прямо на перекрёстке. Механик в гараже долго слушает мотор, как врач, и говорит: «Э, брат».

Анимация: без анимации. Сцена: `batumi_street`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a small garage in batumi, an old mechanic listening to an engine like a doctor. Usual place, adapt if the moment says otherwise: batumi street with a mix of old houses and glass towers, used cars parked along the road, wet asphalt, neon signs (unreadable), a car market vibe, cloudy sky.
```

#### `bat_car_repair__1.png` — «Чинить»

> «Э, брат» обходится в шестьсот лари и в ящик мандаринов в подарок. Машина едет. Мандарины — тоже.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the car driving out of the garage, a crate of mandarins on the back seat. Usual place, adapt if the moment says otherwise: batumi street with a mix of old houses and glass towers, used cars parked along the road, wet asphalt, neon signs (unreadable), a car market vibe, cloudy sky.
```

### `bat_stones.png`

> Пляж в Батуми — галька. Сын открывает лучшее развлечение на свете: кидать камни в море. Один камень, второй, сотый. Ты сначала смотришь в телефон. Потом откладываешь телефон.

Анимация: блики на воде в нижней трети. Сцена: `batumi_beach`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a pebble beach in batumi, the toddler throwing stones into the black sea, the man with a phone. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender. keep water in the lower third of the frame.
```

#### `bat_stones__1.png` — «Кидать вместе»

> Вы кидаете камни два часа. Ни одной мысли про работу, документы и деньги. Лучшие два часа за полгода.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: father and son throwing stones together, splashes on the grey-green sea. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender. keep water in the lower third of the frame.
```

#### `bat_stones__2.png` — «Научить «блинчики»»

> Ты делаешь «блинчики», сын хлопает и кидает камень себе под ноги. По его правилам это тоже «блинчик». Он рассказывает об этом бабушке по видео: «Бу-бух!»

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man skipping a flat stone across the water, the toddler clapping. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender. keep water in the lower third of the frame.
```

#### `bat_stones__3.png` — «Собрать самые красивые»

> Вы выбираете плоские, белые, с полосками. Набирается полный карман. Один, самый гладкий, сын не отдаёт даже на ночь.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: small hands holding a pile of white striped pebbles. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender. keep water in the lower third of the frame.
```

### `bat_stones_again.png`

> Вечер, море, камни. Сын ищет идеальный плоский. Находит. Кидает. Не тот. Ищет снова. Ты никуда не торопишься.

Анимация: блики на воде в нижней трети. Сцена: `batumi_beach`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: evening pebble beach, the boy searching for the perfect flat stone, the sea calm. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender. keep water in the lower third of the frame.
```

#### `bat_stones_again__1.png` — «Ещё один камень»

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a stone in mid-air over the sunset sea. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender. keep water in the lower third of the frame.
```

### `bat_bar.png`

> Вечер пятницы. Друзья — такие же, уехавшие, — зовут в Sami Ludi. Пиво, разговоры про курс лари, визы и «как там наши». Смеётесь громче, чем смешно.

Анимация: мигают огоньки в верхних двух третях. Сцена: `batumi_bar`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: sami ludi bar at night in batumi, a table of friends with beer, warm lights. Usual place, adapt if the moment says otherwise: small cozy bar in batumi, wooden tables, friends with beer glasses laughing, warm yellow light, rain on the window, string lights. small lit windows or lamps scattered in the upper two thirds.
```

#### `bat_bar__1.png` — «Пойти»

> Ты возвращаешься в час ночи, счастливый и немного грустный. Утром — только немного грустный.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man walking home at 1 am along the neon boulevard, happy and a bit sad. Usual place, adapt if the moment says otherwise: small cozy bar in batumi, wooden tables, friends with beer glasses laughing, warm yellow light, rain on the window, string lights. small lit windows or lamps scattered in the upper two thirds.
```

#### `bat_bar__2.png` — «Остаться дома»

> Жена говорит: «Иди». Ты не идёшь. Вы смотрите сериал, и это тоже хорошая пятница.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple on the sofa watching a series, the man's phone with an unread invitation. Usual place, adapt if the moment says otherwise: small cozy bar in batumi, wooden tables, friends with beer glasses laughing, warm yellow light, rain on the window, string lights.
```

#### `bat_bar__3.png` — «Позвать всех к себе»

> Друзья приходят с пивом, сын засыпает под разговоры в соседней комнате. Тот же Sami Ludi, только с армянским ремонтом.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: friends with beer in the gilded living room, the toddler asleep in the next room. Usual place, adapt if the moment says otherwise: small cozy bar in batumi, wooden tables, friends with beer glasses laughing, warm yellow light, rain on the window, string lights. small lit windows or lamps scattered in the upper two thirds.
```

### `bat_rain.png`

> Батуми — самый дождливый город Грузии. Вам об этом никто не сказал. Дождь идёт пятый день. Сын рисует синие каракули. Это море, ты уверен: за окном его не видно.

Анимация: дождь по всему кадру. Сцена: `batumi_rain`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: batumi in heavy rain, the boulevard empty, the toddler at home drawing blue scribbles by the window. Usual place, adapt if the moment says otherwise: batumi in heavy rain seen from a high balcony, grey sea merging with the sky, a child's drawing of a sunny sea taped to the window glass, cozy inside, gloomy outside.
```

#### `bat_rain__1.png` — «Гулять под дождём»

> Вы с сыном в резиновых сапогах прыгаете по лужам на бульваре. Все остальные дома. Бульвар ваш.

Анимация: дождь по всему кадру.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: father and son in rubber boots jumping in puddles on the empty boulevard. Usual place, adapt if the moment says otherwise: batumi in heavy rain seen from a high balcony, grey sea merging with the sky, a child's drawing of a sunny sea taped to the window glass, cozy inside, gloomy outside.
```

#### `bat_rain__2.png` — «Сидеть дома»

> Пятый мультфильм, третий пазл, второй скандал. Дождь стучит по балкону ровно так, чтобы не дать уснуть.

Анимация: дождь по всему кадру.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a messy living room with puzzles and cartoons, rain streaming down the balcony door. Usual place, adapt if the moment says otherwise: batumi in heavy rain seen from a high balcony, grey sea merging with the sky, a child's drawing of a sunny sea taped to the window glass, cozy inside, gloomy outside.
```

#### `bat_rain__3.png` — «Уехать в Тбилиси»

> Два дня у друзей в Тбилиси, где сухо. Сын бегает по чужой квартире, вы спите до девяти. Возвращаетесь — в Батуми всё ещё дождь.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a sunny tbilisi courtyard, the toddler running around a friend's flat. Usual place, adapt if the moment says otherwise: batumi in heavy rain seen from a high balcony, grey sea merging with the sky, a child's drawing of a sunny sea taped to the window glass, cozy inside, gloomy outside.
```

### `bat_snow.png`

> Апрель. В Батуми выпадает снег. На пальмах. На мандариновых деревьях. На машинах у моря. Вы уехали из Петербурга в марте — и снег догнал вас здесь.

Анимация: падающий снег. Сцена: `batumi_rain`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: april snow on palm trees and mandarin trees in batumi, cars by the sea covered in white. Usual place, adapt if the moment says otherwise: batumi in heavy rain seen from a high balcony, grey sea merging with the sky, a child's drawing of a sunny sea taped to the window glass, cozy inside, gloomy outside.
```

#### `bat_snow__1.png` — «Показать сыну снег»

> Сын трогает снег на перилах балкона и смотрит на тебя: «А?» Как будто спрашивает, точно ли вы уехали.

Анимация: падающий снег.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the toddler touching snow on the balcony railing, looking up puzzled. Usual place, adapt if the moment says otherwise: batumi in heavy rain seen from a high balcony, grey sea merging with the sky, a child's drawing of a sunny sea taped to the window glass, cozy inside, gloomy outside.
```

#### `bat_snow__2.png` — «Написать маме»

> «У нас снег». Мама отвечает: «У нас тоже». Впервые за месяц у вас одна погода.

Анимация: падающий снег.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone chat: 'we have snow' answered with 'us too', snowy palms in the window. Usual place, adapt if the moment says otherwise: batumi in heavy rain seen from a high balcony, grey sea merging with the sky, a child's drawing of a sunny sea taped to the window glass, cozy inside, gloomy outside.
```

#### `bat_snow__3.png` — «Лепить снеговика»

> Снеговик получается маленький и мокрый, с мандарином вместо носа. Через час он тает. Сын машет ему: «Ушёл».

Анимация: падающий снег.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a tiny wet snowman with a mandarin nose on the beach. Usual place, adapt if the moment says otherwise: batumi in heavy rain seen from a high balcony, grey sea merging with the sky, a child's drawing of a sunny sea taped to the window glass, cozy inside, gloomy outside.
```

### `bat_adjaruli.png`

> Аджарский хачапури: лодочка с сыром, маслом и яйцом. Местные учат правильно размешивать. Сын ест только корочку, а остальное отдаёт тебе. Это твой главный риск здоровью в Грузии.

Анимация: пар поднимается из центра. Сцена: `batumi_cafe`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an adjarian khachapuri boat with cheese, butter and egg on a cafe table, a local stirring it to show how. Usual place, adapt if the moment says otherwise: georgian cafe table with a boat-shaped adjarian khachapuri with egg and butter, a small boy eating only the crust, father's hand with a fork, warm light. a steaming cup or pot near the center of the frame.
```

#### `bat_adjaruli__1.png` — «Доесть за сыном»

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man finishing the khachapuri while the toddler holds only the crust. Usual place, adapt if the moment says otherwise: georgian cafe table with a boat-shaped adjarian khachapuri with egg and butter, a small boy eating only the crust, father's hand with a fork, warm light. a steaming cup or pot near the center of the frame.
```

### `bat_khinkali.png`

> В одном ресторане есть маленькие хинкали. Сын влюбляется в них с первого укуса. Теперь у вас правило: большие хинкали ешь ты, маленькие — сын.

Анимация: пар поднимается из центра. Сцена: `batumi_cafe`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a georgian restaurant table with a plate of big khinkali and a plate of tiny khinkali. Usual place, adapt if the moment says otherwise: georgian cafe table with a boat-shaped adjarian khachapuri with egg and butter, a small boy eating only the crust, father's hand with a fork, warm light. a steaming cup or pot near the center of the frame.
```

#### `bat_khinkali__1.png` — «Заказать по правилу»

> Две тарелки: большая и маленькая. Официант уже не спрашивает. Это ваш ресторан.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the waiter bringing two plates, big and small, without asking. Usual place, adapt if the moment says otherwise: georgian cafe table with a boat-shaped adjarian khachapuri with egg and butter, a small boy eating only the crust, father's hand with a fork, warm light. a steaming cup or pot near the center of the frame.
```

#### `bat_khinkali__2.png` — «Украсть маленький»

> Сын замечает сразу. Смотрит долго и молча. Ты возвращаешь хинкали и ещё один свой — в качестве компенсации.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the toddler staring silently at the man who holds a stolen tiny khinkali. Usual place, adapt if the moment says otherwise: georgian cafe table with a boat-shaped adjarian khachapuri with egg and butter, a small boy eating only the crust, father's hand with a fork, warm light.
```

#### `bat_khinkali__3.png` — «Научить есть руками»

> Хинкали берут за хвостик, кусают и выпивают бульон. Сын обливается бульоном весь. Официант аплодирует.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the toddler covered in broth holding a khinkali by its tail, the waiter applauding. Usual place, adapt if the moment says otherwise: georgian cafe table with a boat-shaped adjarian khachapuri with egg and butter, a small boy eating only the crust, father's hand with a fork, warm light. a steaming cup or pot near the center of the frame.
```

### `bat_kindergarten.png`

> Садик. Вы обходите несколько и выбираете грузинский: рядом, недорого, воспитательницы строгие. В первый день сын держит тебя за ногу.

Анимация: без анимации. Сцена: `batumi_kindergarten`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the gate of a georgian kindergarten, strict teachers in the yard, the toddler holding the man's leg. Usual place, adapt if the moment says otherwise: kindergarten gate in batumi, colorful fence, a teacher holding hands with children, a small boy walking in without looking back, father standing outside the gate, morning.
```

#### `bat_kindergarten__1.png` — «Оставить его»

> Ты уходишь, не оглядываясь, — так советуют все. Оглядываешься за углом.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man walking away and looking back from around the corner. Usual place, adapt if the moment says otherwise: kindergarten gate in batumi, colorful fence, a teacher holding hands with children, a small boy walking in without looking back, father standing outside the gate, morning.
```

#### `bat_kindergarten__2.png` — «Посидеть с ним первый час»

> Воспитательница смотрит на тебя так, что ты понимаешь: здесь так не принято. Ты уходишь через десять минут.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man sitting on a tiny chair in the classroom, a teacher giving him a look. Usual place, adapt if the moment says otherwise: kindergarten gate in batumi, colorful fence, a teacher holding hands with children, a small boy walking in without looking back, father standing outside the gate, morning.
```

#### `bat_kindergarten__3.png` — «Сразу искать няню»

> Ты не можешь оставить его в чужом месте, где никто не говорит на его языке. Даже если он пока ни на каком не говорит.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man walking home with the toddler on his shoulders, a phone with nanny ads. Usual place, adapt if the moment says otherwise: kindergarten gate in batumi, colorful fence, a teacher holding hands with children, a small boy walking in without looking back, father standing outside the gate, morning.
```

### `bat_kindergarten_fear.png`

> Сын приходит из садика тихий и запуганный. Вздрагивает от громких голосов, не хочет утром одеваться, держится за дверь. Что там происходит, он рассказать не может.

Анимация: без анимации. Сцена: `batumi_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the toddler holding onto the apartment door in the morning, refusing to put on his shoes. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_kindergarten_fear__1.png` — «Забрать из садика»

> Вы забираете его в тот же день. Без объяснений и без разговоров с заведующей. Вечером он впервые за неделю смеётся.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy laughing in the evening at home, the kindergarten bag left in the corner. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_kindergarten_fear__2.png` — «Дать ещё неделю»

> Неделя становится самой длинной в Батуми. Он не привыкает. Вы забираете его в пятницу и обещаете себе больше так не делать.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a long week shown as a calendar, the boy quiet at the window. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_kindergarten_fear__3.png` — «Поговорить с воспитателем»

> Воспитательница говорит, что у них строго и все привыкают. Ты понимаешь, что ваш сын — не «все». Забираете на следующий день.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man talking to a stern teacher at the kindergarten gate. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

### `bat_nanny.png`

> Вы находите няню, которая помогает с сыном. А на вторую половину дня — занятия: три часа, рисование, песок, кубики. Он возвращается оттуда уставший и довольный.

Анимация: без анимации. Сцена: `batumi_kindergarten`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a kind nanny playing with the toddler in sand and blocks, an art class with paints. Usual place, adapt if the moment says otherwise: kindergarten gate in batumi, colorful fence, a teacher holding hands with children, a small boy walking in without looking back, father standing outside the gate, morning.
```

#### `bat_nanny__1.png` — «Выдохнуть»

> Можно снова работать, не прячась от созвонов. И можно не бояться утра.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man working calmly at the laptop, a quiet flat, sea in the window. Usual place, adapt if the moment says otherwise: kindergarten gate in batumi, colorful fence, a teacher holding hands with children, a small boy walking in without looking back, father standing outside the gate, morning. keep water in the lower third of the frame.
```

### `bat_ali_nino.png`

> На бульваре — статуи Али и Нино. Каждый вечер они медленно едут навстречу друг другу, на миг сливаются и снова расходятся. Сын смотрит, раскрыв рот, а когда они расходятся, говорит: «Ушли». И грустит.

Анимация: блики на воде в нижней трети. Сцена: `batumi_boulevard`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the moving metal statues of ali and nino on batumi boulevard at dusk, the toddler watching with his mouth open. Usual place, adapt if the moment says otherwise: batumi seaside boulevard with palm trees, the moving metal statues of ali and nino in the distance, a toddler on his father's shoulders, lanterns, sunset over the sea. keep water in the lower third of the frame.
```

#### `bat_ali_nino__1.png` — «Ждать следующей встречи»

> Вы стоите на бульваре ещё десять минут, пока они снова не съедутся. Сын хлопает. Ты думаешь о маме, которая звонит через день. Встречи бывают и такие.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the statues meeting and merging, the toddler clapping. Usual place, adapt if the moment says otherwise: batumi seaside boulevard with palm trees, the moving metal statues of ali and nino in the distance, a toddler on his father's shoulders, lanterns, sunset over the sea. keep water in the lower third of the frame.
```

#### `bat_ali_nino__2.png` — «Увести на мороженое»

> Мороженое лечит «ушли» быстрее любых объяснений. На обратном пути статуи уже снова рядом. Сын этого не видит. Ты — видишь.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man and toddler eating ice cream on a bench, the statues behind them. Usual place, adapt if the moment says otherwise: batumi seaside boulevard with palm trees, the moving metal statues of ali and nino in the distance, a toddler on his father's shoulders, lanterns, sunset over the sea. keep water in the lower third of the frame.
```

#### `bat_ali_nino__3.png` — «Рассказать их историю»

> Ты рассказываешь про мусульманина Али и грузинку Нино, которым не дали быть вместе. Сын ничего не понимает и внимательно слушает. Как будто понимает.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man crouching beside the toddler, telling the story, pointing at the statues. Usual place, adapt if the moment says otherwise: batumi seaside boulevard with palm trees, the moving metal statues of ali and nino in the distance, a toddler on his father's shoulders, lanterns, sunset over the sea. keep water in the lower third of the frame.
```

### `bat_persimmon.png`

> Хозяева квартиры приносят подарок: два пакета хурмы. Той самой, вяжущей, от которой немеет рот, если она недозрела.

Анимация: без анимации. Сцена: `batumi_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: two plastic bags of orange persimmons on the doorstep, smiling elderly landlords. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_persimmon__1.png` — «Есть, пока не кончится»

> Первый пакет вы честно съедаете за неделю. Второй тихо доходит на балконе — и уходит в мусор. Хозяевам вы говорите, что было очень вкусно.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family eating persimmons with puckered faces. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_persimmon__2.png` — «Подождать, пока дозреет»

> Вы ждёте. Хурма ждёт. В итоге дозревает один пакет. Второй — перезревает. Хозяевам вы говорите, что было очень вкусно.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: persimmons ripening in a row on the balcony railing. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light. keep water in the lower third of the frame.
```

#### `bat_persimmon__3.png` — «Угостить соседей»

> Половину хурмы ты раздаёшь по этажу. Через неделю соседи приносят вам вино, сыр и ещё хурмы. Хурма — это бумеранг.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man handing persimmons to neighbours on the landing. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

### `bat_buckwheat.png`

> В батумском супермаркете лежит гречка. Обычная, по три лари. Целая полка. Дома в шкафу три килограмма из Петербурга смотрят на тебя с укором.

Анимация: без анимации. Сцена: `batumi_supermarket`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a batumi supermarket shelf full of buckwheat, the man staring at it. Usual place, adapt if the moment says otherwise: georgian supermarket shelf full of buckwheat packs, a man in a hoodie staring at it, ironic mood.
```

#### `bat_buckwheat__1.png` — «Сварить петербургскую»

> Она вкуснее. Ты в этом уверен. Объективно — нет.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a pot of buckwheat from saint petersburg steaming on the stove. Usual place, adapt if the moment says otherwise: georgian supermarket shelf full of buckwheat packs, a man in a hoodie staring at it, ironic mood. a steaming cup or pot near the center of the frame.
```

### `bat_toys.png`

> Сын выстраивает машинки Hot Wheels в одну пробку через всю батумскую гостиную: от дивана до балкона, мимо стола с золотыми ножками. Теперь это его квартира. Раньше была хозяйская.

Анимация: без анимации. Сцена: `batumi_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a long traffic jam of forty toy cars across the gilded living room from sofa to balcony. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_toys__1.png` — «Достроить пробку вместе»

> Сорок машинок, одна пробка. Самая длинная пробка в Батуми — и единственная, где никто не нервничает.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: father and son on the floor adding the last toy cars to the jam. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

### `bat_cold_flat.png`

> Зима. Отопления в квартире нет: кондиционер греет комнату, в которой висит, и ни одну другую. Ветер с моря свистит в балконной двери. А на стенах появляется плесень — потом, в Португалии, ты будешь звать её «молд» и не сразу вспомнишь, как это по-русски.

Анимация: без анимации. Сцена: `batumi_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a cold flat in winter, wind through the balcony door, a single air conditioner, mold in a corner. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_cold_flat__1.png` — «Купить обогреватель»

> Обогреватель греет полметра вокруг себя. Вы живёте в этом полуметре втроём.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family huddled around a small heater. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_cold_flat__2.png` — «Спать в свитерах»

> Вы спите втроём на одной кровати в свитерах. Тесно, тепло и почему-то смешно.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: three people asleep in sweaters on one bed under blankets. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_cold_flat__3.png` — «Греться в кафе днём»

> Днём вы работаете в кафе, где тепло и пахнет кофе. Вечером возвращаетесь в холод. Кафе знает вас по именам.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man and woman working with laptops in a warm cafe, steam from cups. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light. a steaming cup or pot near the center of the frame.
```

### `bat_kid_sick.png`

> Ночью у сына температура тридцать девять. Ты не знаешь ни местных врачей, ни как вызвать скорую, ни как по-грузински «жаропонижающее».

Анимация: без анимации. Сцена: `batumi_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: night, a feverish toddler in bed, the man with a phone searching in a panic. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_kid_sick__1.png` — «Достать аптечку жены»

> Жена находит нужное за двадцать секунд, не включая свет. К утру тридцать семь. Ты молча обнимаешь жену. Она молча кивает на аптечку.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman finding medicine in the big first aid pouch in the dark. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_kid_sick__2.png` — «Частная клиника»

> Врач говорит по-русски, улыбается и выписывает то же самое, что лежит у вас в аптечке. Сто лари за спокойствие.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a private clinic at night, a kind doctor writing a prescription. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_kid_sick__3.png` — «Написать в чат»

> В час ночи в чате отвечают семь человек: телефон врача, название лекарства, адрес круглосуточной аптеки. Чужие люди. Свои.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone chat at 1 am filling with replies, the man reading. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

### `bat_layoff_wife.png`

> Жена закрывает ноутбук и долго сидит молча. Её компания делала сервис для грузовых перевозок. Проект подорожал, обстановка нестабильная — команду сокращают. «Ну вот. Теперь моя очередь».

Анимация: без анимации. Сцена: `batumi_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman closing her laptop and sitting silently at the gilded table. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_layoff_wife__1.png` — ««Мы справимся»»

> Она кивает. Вечером вы гуляете втроём по бульвару, и никто ни о чём не говорит. Это помогает больше слов.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family walking along the boulevard at night, nobody talking. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light. keep water in the lower third of the frame.
```

#### `bat_layoff_wife__2.png` — «Сесть за её резюме»

> Вы переписываете её резюме до двух ночи. Утром она говорит, что ты всё испортил, и переписывает обратно. Вы снова команда.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple rewriting a cv at 2 am, two laptops and cold tea. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_layoff_wife__3.png` — ««Отдохни месяц»»

> Она месяц гуляет с сыном у моря, спит до восьми и впервые за год читает книгу. Потом садится за резюме — уже другим человеком.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman reading a book on the beach while the toddler plays with stones. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light. keep water in the lower third of the frame.
```

### `bat_job_found_wife.png`

> Жена ищет работу. Одно собеседование — на немецком, и после него тишина. Два месяца спустя ей пишут снова и зовут ещё на одно интервью. А потом приходит оффер: швейцарский крипто-стартап.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman on a video interview in german, the man and toddler hiding behind the door. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `bat_job_found_wife__1.png` — «Отметить»

> Аджарский хачапури на троих и мороженое сыну. Сын не знает, что празднуют, но поддерживает. Новые коллеги жены пишут в чат: «Welcome!» — и почему-то из Португалии.

Анимация: конфетти падает.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family celebrating with adjarian khachapuri and ice cream. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `bat_vnzh_apply.png`

> Дом юстиции: стекло, кофе, электронная очередь — всё как в будущем. Подать на вид на жительство: переводы, справки, выписки, договор аренды. Девушка в окошке улыбается и принимает всё.

Анимация: без анимации. Сцена: `public_service_hall`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: batumi public service hall: glass, coffee machine, electronic queue screens. Usual place, adapt if the moment says otherwise: modern georgian public service hall, glass and wood, electronic queue screens, coffee corner, people with document folders, futuristic bureaucracy, bright clean light.
```

#### `bat_vnzh_apply__1.png` — «Подать самим»

> Три похода, два перевода и одна потерянная справка, которая нашлась у тебя в кармане. Заявление принято.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man at the counter with a stack of translated papers. Usual place, adapt if the moment says otherwise: modern georgian public service hall, glass and wood, electronic queue screens, coffee corner, people with document folders, futuristic bureaucracy, bright clean light.
```

#### `bat_vnzh_apply__2.png` — «Через посредника»

> Посредник говорит: «Сто процентов дадут». Посредник говорит это всем.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a smooth fixer in sunglasses taking money and documents. Usual place, adapt if the moment says otherwise: modern georgian public service hall, glass and wood, electronic queue screens, coffee corner, people with document folders, futuristic bureaucracy, bright clean light.
```

#### `bat_vnzh_apply__3.png` — «Не подавать»

> Ты решаешь не тратить время и нервы. Год без визы — это год. «Потом подумаем». Потом приходит быстрее, чем кажется.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man walking out of the glass hall, deciding not to apply. Usual place, adapt if the moment says otherwise: modern georgian public service hall, glass and wood, electronic queue screens, coffee corner, people with document folders, futuristic bureaucracy, bright clean light.
```

### `bat_vnzh_refused.png`

> СМС: в виде на жительство отказано. Причина не указана. В чате пишут: «Сейчас почти всем отказывают». От того, что всем, не легче.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone sms on the gilded table: application refused, no reason given. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `bat_vnzh_refused__1.png` — «Подать снова»

> Ты собираешь документы второй раз. Девушка в окошке узнаёт тебя и улыбается сочувственно. Отказ приходит быстрее, чем в первый раз.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the same clerk recognising the man at the counter and smiling sadly. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `bat_vnzh_refused__2.png` — «Принять»

> Год без визы для россиян — это год. А потом? Ты впервые открываешь карту Европы не как турист.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man opening a map of europe on his laptop for the first time not as a tourist. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `bat_vnzh_refused__3.png` — «Пойти к юристу»

> Юрист разводит руками: «Причину не объясняют никому». Двести лари за то, чтобы услышать это от специалиста.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a lawyer spreading his hands at his desk. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `bat_portugal_idea.png`

> Новые коллеги жены живут в Фигейре-да-Фош — маленьком городе на океане в Португалии. На созвоне они говорят: «Здесь круто. Приезжайте, подавайтесь, всё будет хорошо». За их спинами — океан.

Анимация: блики на воде в нижней трети. Сцена: `phone_video`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a video call with colleagues sitting on a portuguese balcony with the atlantic ocean behind them. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room. keep water in the lower third of the frame.
```

#### `bat_portugal_idea__1.png` — «Записать в заметки»

> Заметка называется «Португалия???». Три вопросительных знака — это и есть план.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone note titled 'portugal???'. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `bat_portugal_idea__2.png` — ««Хватит переездов»»

> Ты так говоришь. Ночью гуглишь «Фигейра-да-Фош школы». Жена гуглит то же самое в соседней вкладке.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple in bed, both googling figueira da foz on two phones. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `bat_portugal_idea__3.png` — «Спросить про школы»

> Они рассказывают про садики, налоги и про то, что по-английски тут говорят все, кроме тех, кто нужен. Ты записываешь. Полезно.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman taking notes during the call about schools and taxes. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

### `bat_first_word.png`

> Сын говорит первое слово. «Мама». Жена плачет, ты снимаешь на телефон дрожащими руками. Через неделю — «папа». Ты делаешь вид, что не ревновал.

Анимация: без анимации. Сцена: `batumi_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the toddler looking up at his mother and saying his first word, the woman crying, the man filming with shaking hands. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_first_word__1.png` — «Отправить видео бабушкам»

> Видео уходит в Петербург и в Старую Руссу. Бабушки пересматривают его, кажется, сотню раз. Самое короткое и самое важное видео этого года.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a video message flying to two grandmothers on their phones. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_first_word__2.png` — «Учить «папа» быстрее»

> Ты повторяешь «па-па» сорок раз в день. Сын смотрит на тебя с жалостью и говорит «мама». Неделю спустя — сдаётся.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man repeating 'pa-pa' to the toddler who looks at him with pity. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_first_word__3.png` — «Купить торт»

> Торт с надписью «Мама» — кондитер не задаёт вопросов. Сын съедает букву «М». Жена фотографирует остальное.

Анимация: конфетти падает.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a cake with an illegible word on it, the toddler eating the first letter. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

### `bat_offer.png`

> Тебе пишет рекрутер. Эстонская компания, крипто-бизнес. Они нашли тебя сами — ты даже не откликался. Предлагают больше денег, чем сейчас. Нынешняя работа тем временем перевела тебя на ГПХ.

Анимация: блики на воде в нижней трети. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone with a recruiter's message on the balcony table, sea behind. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen. keep water in the lower third of the frame.
```

#### `bat_offer__1.png` — «Согласиться»

> Ты соглашаешься почти сразу. Выходить можно с сентября. Осталось сдать ноутбук — а он числится в московском офисе.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man typing 'yes' on the phone, smiling. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `bat_offer__2.png` — «Поторговаться»

> Ты просишь чуть больше. Тебе дают чуть больше. Ты понимаешь, что мог попросить ещё больше, и решаешь об этом не думать.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man negotiating on a call, pacing on the balcony. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen. keep water in the lower third of the frame.
```

#### `bat_offer__3.png` — «Взять неделю подумать»

> Ты берёшь неделю. Рекрутер нервничает и добавляет ещё. Иногда молчание — лучший аргумент.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the phone face down on the table for a week, the recruiter's messages piling up. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `bat_wedding.png`

> Конец августа. Брат женится. Вы с женой летите в Россию на несколько дней, а сын остаётся в Батуми с её родителями — они прилетают специально, возят его на минеральные источники и обживают отель. На свадьбе бабушка снова суёт тебе деньги, обнимает и целует. Ты ещё не знаешь, что видишь её в последний раз.

Анимация: мигают огоньки в верхних двух третях. Сцена: `plane`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a russian wedding hall, the brother and bride, a tiny grandmother pressing money into the man's hand. Usual place, adapt if the moment says otherwise: view from an airplane window seat, clouds below, wing visible, a hand resting on the window frame, soft sunrise colors, calm and bittersweet. small lit windows or lamps scattered in the upper two thirds.
```

#### `bat_wedding__1.png` — «Взять деньги, не споря»

> Ты берёшь. Она довольна. Потом весь вечер держит тебя за руку, как маленького.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the grandmother holding the man's hand all evening at the table. Usual place, adapt if the moment says otherwise: view from an airplane window seat, clouds below, wing visible, a hand resting on the window frame, soft sunrise colors, calm and bittersweet. small lit windows or lamps scattered in the upper two thirds.
```

#### `bat_wedding__2.png` — «Обнять её подольше»

> Ты обнимаешь её на прощание дольше, чем обычно. Сам не знаешь почему. Потом будешь знать.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a long goodbye hug with the grandmother at the door. Usual place, adapt if the moment says otherwise: view from an airplane window seat, clouds below, wing visible, a hand resting on the window frame, soft sunrise colors, calm and bittersweet.
```

#### `bat_wedding__3.png` — «Позвать её танцевать»

> Бабушка отмахивается, а потом танцует. Медленно, держась за тебя, под какую-то старую песню. Все снимают на телефоны. Это видео ты потом будешь смотреть чаще всех остальных.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man slowly dancing with his tiny grandmother, everyone filming. Usual place, adapt if the moment says otherwise: view from an airplane window seat, clouds below, wing visible, a hand resting on the window frame, soft sunrise colors, calm and bittersweet. small lit windows or lamps scattered in the upper two thirds.
```

### `bat_moscow_office.png`

> После свадьбы ты заезжаешь в Москву. Офис, пропуск, ресепшен. Ты сдаёшь рабочий ноутбук, говоришь «пока» тем, кто на месте. Никто не удивлён: уехавших уже много.

Анимация: без анимации. Сцена: `office`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a moscow office reception, the man handing over a work laptop. Usual place, adapt if the moment says otherwise: open-space office in moscow at evening, empty desks, a laptop handed over at a reception desk, glass walls, city lights outside, cold neon light, a feeling of leaving quietly.
```

#### `bat_moscow_office__1.png` — «Обнять бывших коллег»

> Двое выходят проводить тебя до лифта. Вы обещаете созвониться. Назавтра ты выходишь на новую работу — из Батуми, с балкона, с видом на море.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: two colleagues walking the man to the elevator. Usual place, adapt if the moment says otherwise: open-space office in moscow at evening, empty desks, a laptop handed over at a reception desk, glass walls, city lights outside, cold neon light, a feeling of leaving quietly.
```

#### `bat_moscow_office__2.png` — «Отдать ноутбук и уйти»

> Подпись, ноутбук, дверь. Пять минут на годы работы. Назавтра ты выходишь в эстонскую компанию. Новая почта, новый чат, новые люди, которые никогда не видели тебя вживую.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a door closing behind the man, a signature on a form. Usual place, adapt if the moment says otherwise: open-space office in moscow at evening, empty desks, a laptop handed over at a reception desk, glass walls, city lights outside, cold neon light, a feeling of leaving quietly.
```

#### `bat_moscow_office__3.png` — «Зайти в столовую»

> Последний обед в офисной столовой: котлета, пюре, компот. Ты ешь медленно. Это тоже прощание.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man alone in an office canteen with a cutlet, mashed potatoes and kompot. Usual place, adapt if the moment says otherwise: open-space office in moscow at evening, empty desks, a laptop handed over at a reception desk, glass walls, city lights outside, cold neon light, a feeling of leaving quietly. a steaming cup or pot near the center of the frame.
```

### `bat_brother_call.png`

> Звонит брат. Голос другой, не его. «Можно я к вам? Ненадолго».

Анимация: мерцают звёзды в верхней части. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone ringing on the balcony at night, the brother's name on the screen. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen. keep dark night sky in the upper part of the frame.
```

#### `bat_brother_call__1.png` — ««Конечно. Приезжай»»

> Ты не спрашиваешь ничего. Только где и когда его встретить.

Анимация: мерцают звёзды в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man saying yes into the phone, the sea dark behind him. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen. keep dark night sky in the upper part of the frame.
```

### `bat_brother_border.png`

> Ты едешь встречать брата на границу. Он стоит в очереди больше суток. Там таких много — ночью холодно, люди мёрзнут в машинах и на обочине. Пока ждёшь брата, ты возишь незнакомых ребят до отеля — погреться.

Анимация: мерцают звёзды в верхней части. Сцена: `car`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a long queue of cars at a mountain border at night, people cold by the roadside, the man waiting in his car. Usual place, adapt if the moment says otherwise: small rental car on a winding mountain road in georgia, green mountains, low clouds, view from behind the car, a toddler asleep in a child seat visible through the rear window, early spring, calm road-trip mood. keep dark night sky in the upper part of the frame.
```

#### `bat_brother_border__1.png` — «Возить, пока есть место»

> Ночь, печка на полную, на заднем сиденье чужие уставшие люди. Кто-то засыпает через минуту. Утром на той стороне появляется брат — с рюкзаком и улыбкой, будто приехал в отпуск.

Анимация: мерцают звёзды в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: strangers asleep in the back seat of the man's car, heater on, night road. Usual place, adapt if the moment says otherwise: small rental car on a winding mountain road in georgia, green mountains, low clouds, view from behind the car, a toddler asleep in a child seat visible through the rear window, early spring, calm road-trip mood. keep dark night sky in the upper part of the frame.
```

#### `bat_brother_border__2.png` — «Ждать только брата»

> Ты сидишь в машине и смотришь на очередь. Через час всё равно открываешь дверь и зовёшь двоих погреться. Утром появляется брат.

Анимация: мерцают звёзды в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man in his car watching the queue, then opening the door to two cold strangers. Usual place, adapt if the moment says otherwise: small rental car on a winding mountain road in georgia, green mountains, low clouds, view from behind the car, a toddler asleep in a child seat visible through the rear window, early spring, calm road-trip mood. keep dark night sky in the upper part of the frame.
```

#### `bat_brother_border__3.png` — «Носить брату термос»

> Ты пешком проходишь вдоль очереди с термосом и бутербродами. Брату — и тем, кто рядом. К утру ты знаешь половину очереди по именам.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man walking along the queue with a thermos and sandwiches. Usual place, adapt if the moment says otherwise: small rental car on a winding mountain road in georgia, green mountains, low clouds, view from behind the car, a toddler asleep in a child seat visible through the rear window, early spring, calm road-trip mood. a steaming cup or pot near the center of the frame.
```

### `bat_brother_here.png`

> Брат живёт у вас в отдельной комнате. Вечером все встречаетесь в зале с армянским ремонтом. Сын в восторге: у него появился дядя, который делает «блинчики» на воде лучше папы. Вы с братом говорите о детстве. Только о детстве.

Анимация: без анимации. Сцена: `batumi_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the brothers and the toddler in the gilded living room in the evening, the sea dark in the window. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_brother_here__1.png` — «Говорить о детстве»

> Про дачу, про велосипед, про то, как папа учил вас плавать. Ни слова про то, что сейчас. Так легче обоим.

Анимация: мерцают звёзды в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the brothers on the balcony talking about childhood, smiling. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light. keep dark night sky in the upper part of the frame.
```

#### `bat_brother_here__2.png` — «Спросить, что дальше»

> Брат долго смотрит на море. «Не знаю. Правда не знаю». Это первый честный разговор за много лет.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the brother looking at the sea in silence. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light. keep water in the lower third of the frame.
```

#### `bat_brother_here__3.png` — «Позвать кидать камни»

> Втроём на пляже: ты, брат и сын. Брат делает пять «блинчиков», ты — три, сын — один, себе под ноги. Счёт никто не ведёт.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the brother, the man and the toddler skipping stones on the beach. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light. keep water in the lower third of the frame.
```

### `bat_brother_leaves.png`

> Декабрь. Вы уезжаете в Португалию, брат — домой, в Россию. Сын суёт ему в руку свой лучший камень с пляжа. Брат кладёт его в нагрудный карман.

Анимация: блики на воде в нижней трети. Сцена: `batumi_boulevard`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: december on batumi boulevard, the toddler giving his uncle his best stone. Usual place, adapt if the moment says otherwise: batumi seaside boulevard with palm trees, the moving metal statues of ali and nino in the distance, a toddler on his father's shoulders, lanterns, sunset over the sea. keep water in the lower third of the frame.
```

#### `bat_brother_leaves__1.png` — «Обнять»

> Вы обнимаетесь дольше, чем принято у братьев. Потом расходитесь в разные стороны — как Али и Нино на бульваре.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: two brothers in a long hug, then walking in opposite directions. Usual place, adapt if the moment says otherwise: batumi seaside boulevard with palm trees, the moving metal statues of ali and nino in the distance, a toddler on his father's shoulders, lanterns, sunset over the sea. keep water in the lower third of the frame.
```

### `bat_tourists.png`

> Лето. В Батуми — туристы. Много русской речи, громкой и отпускной. Ты больше не турист. Но для официантов выглядишь точно так же.

Анимация: чайки пролетают в верхней части. Сцена: `batumi_beach`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a crowded summer beach in batumi full of loud tourists. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender. keep open sky in the upper part of the frame.
```

#### `bat_tourists__1.png` — «Заказать на грузинском»

> «Ори хачапури, гтховт». Официант улыбается и отвечает по-русски. Но улыбается по-другому.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man ordering in georgian at a beach cafe, the waiter smiling. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender.
```

#### `bat_tourists__2.png` — «Уйти на дальний пляж»

> На дальнем пляже — только местные, ты и сын с камнями. Ты чувствуешь себя почти местным. Почти.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a quiet distant beach with only locals, father and son with stones. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender. keep water in the lower third of the frame.
```

#### `bat_tourists__3.png` — «Подсказать им хинкальную»

> Ты советуешь туристам хинкальную с маленькими хинкали. Они смотрят на тебя как на местного. Ты не поправляешь.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man pointing tourists toward a khinkali place. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender.
```

### `bat_mom_call.png`

> Мама звонит по видео. Сын показывает ей море с балкона. Мама долго смотрит и говорит: «Хоть кто-то у нас на море».

Анимация: блики на воде в нижней трети. Сцена: `phone_video`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a video call: the grandmother on screen, the toddler showing her the sea from the balcony. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room. keep water in the lower third of the frame.
```

#### `bat_mom_call__1.png` — «Позвать маму в гости»

> «Ой, ну куда я поеду». Через полчаса она спрашивает, какая в Батуми погода в мае.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the grandmother on screen saying 'where would I go', then checking the weather. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `bat_mom_call__2.png` — «Рассказать про работу»

> Ты рассказываешь, что всё хорошо. Мама слушает и говорит: «Ты похудел». Это её способ сказать «я вижу».

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man talking on the call, grandmother squinting 'you lost weight'. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `bat_mom_call__3.png` — «Показать сына с камнями»

> Сын берёт телефон и несёт бабушку на пляж — показывать камни. Двадцать минут бабушка смотрит на гальку. Счастливая.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the toddler carrying the phone to the beach to show grandmother the pebbles. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room. keep water in the lower third of the frame.
```

### `bat_mom_visit.png`

> Мама всё-таки прилетает в Батуми — та самая, что говорила «ой, ну куда я поеду». В чемодане сырки, гречка и носки внуку. Она выходит на балкон с армянской позолотой, смотрит на море и долго молчит.

Анимация: блики на воде в нижней трети. Сцена: `airport_arrivals`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man's mother stepping onto the gilded balcony, looking at the sea in silence, a suitcase of gifts behind her. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary. keep water in the lower third of the frame.
```

#### `bat_mom_visit__1.png` — «Повести на пляж»

> Мама садится на гальку, внук приносит ей камни — по одному, торжественно. К вечеру у неё полный карман. Один камень она увезёт в Старую Руссу.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the grandmother sitting on pebbles, the grandson bringing her stones one by one. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary. keep water in the lower third of the frame.
```

#### `bat_mom_visit__2.png` — «Накормить хачапури»

> Аджарули с яйцом посередине. Мама долго смотрит, как его едят, потом пробует. «Жирно», — говорит она и доедает.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the grandmother tasting adjarian khachapuri with suspicion. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary. a steaming cup or pot near the center of the frame.
```

#### `bat_mom_visit__3.png` — «Просто сидеть на балконе»

> Неделю вы пьёте чай на балконе и смотрите на море. Говорите мало. Мама потом скажет, что это был её лучший отпуск за десять лет.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: mother and son drinking tea on the balcony looking at the sea. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary. keep water in the lower third of the frame.
```

### `bat_low_nerves.png`

> Ты не спишь третью ночь. Смотришь на море с балкона в четыре утра и не понимаешь, зачем всё это.

Анимация: мерцают звёзды в верхней части. Сцена: `batumi_beach`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: 4 am, the man alone on the balcony staring at the dark sea. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender. keep dark night sky in the upper part of the frame.
```

#### `bat_low_nerves__1.png` — «Разбудить жену»

> Она не ругается. Вы пьёте чай на кухне до рассвета. Она говорит: «Мы же вместе». Этого достаточно. Почти.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple drinking tea in the kitchen at dawn. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender. a steaming cup or pot near the center of the frame.
```

#### `bat_low_nerves__2.png` — «Записаться к психологу»

> Психолог — тоже уехавший. Первые десять минут вы просто молчите вместе. Это помогает.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a video session with a psychologist, both quiet. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender.
```

#### `bat_low_nerves__3.png` — «Пойти к морю»

> Ты кидаешь камни один в темноте. Не так хорошо, как с сыном. Но немного легче.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man throwing stones alone into the dark sea. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender. keep water in the lower third of the frame.
```

### `bat_low_money.png`

> На счету меньше, чем на два месяца аренды. Ты открываешь банковское приложение каждые полчаса, как будто там что-то вырастет.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone banking app showing a low balance, the man checking it again. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `bat_low_money__1.png` — «Взять фриланс»

> Сайт для батумского ресторана за ужин и немного лари. Ресторан доволен. Ужин тоже был ничего.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man building a website for a georgian restaurant, a plate of food beside the laptop. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `bat_low_money__2.png` — «Переехать в квартиру попроще»

> Без моря в окне. Сын стоит у окна и ищет море. Ты говоришь, что оно никуда не делось. Это правда.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a smaller flat with a window onto a wall, the toddler searching for the sea. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `bat_low_money__3.png` — «Попросить у мамы»

> Мама переводит деньги через три банка и соседку. Не спрашивает ни о чём. От этого хуже всего.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: money transfer notifications on the phone, the man ashamed. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `bat_schengen.png`

> Ноябрь. Жена смотрит в паспорт сына и бледнеет. Его шенгенская виза заканчивается через месяц. Ваши — чуть позже. Окно закрывается. Если уезжать в Европу — то сейчас.

Анимация: без анимации. Сцена: `batumi_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman holding the toddler's passport open at a visa page, turning pale. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_schengen__1.png` — «В Португалию»

> Заметка «Португалия???» теряет два вопросительных знака. Вы покупаете билеты через Стамбул на ближайшую дату.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: plane tickets via istanbul on a laptop screen. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_schengen__2.png` — «Открыть карту Европы»

> Испания, Германия, Черногория, Португалия. Вы спорите до ночи. Утром сын тычет пальцем в карту — в самый край, в океан. Билеты через Стамбул.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a map of europe on the table, the toddler pointing at the far west edge by the ocean. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light.
```

#### `bat_schengen__3.png` — «Спросить брата»

> Брат думает минуту: «Езжайте. Я разберусь». Ты не уверен, что он разберётся. Он тоже. Но вы покупаете билеты.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the brothers talking on the balcony, the brother nodding 'go'. Usual place, adapt if the moment says otherwise: high-rise apartment in batumi, big balcony window with the black sea filling the whole view, sparse rented furniture, a toy railway on the floor, a boy on the balcony waving at the sea, soft grey-green sea light. keep water in the lower third of the frame.
```

### `bat_sell_car.png`

> Машину нужно продать за неделю. Покупатели знают, что за неделю. Ты знаешь, что они знают.

Анимация: без анимации. Сцена: `batumi_street`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the red car parked by the sea with a for sale sign, buyers circling. Usual place, adapt if the moment says otherwise: batumi street with a mix of old houses and glass towers, used cars parked along the road, wet asphalt, neon signs (unreadable), a car market vibe, cloudy sky.
```

#### `bat_sell_car__1.png` — «Продать как есть»

> Тысячи за четыре долларов — точно уже не вспомнить. Дешевле, чем купили. Значительно. Сын машет машине вслед.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man handing over the keys and taking cash. Usual place, adapt if the moment says otherwise: batumi street with a mix of old houses and glass towers, used cars parked along the road, wet asphalt, neon signs (unreadable), a car market vibe, cloudy sky.
```

### `bat_last_stones.png`

> Последний вечер на пляже. Сын кидает камни в море. Последний он прижимает к груди и не отдаёт. В чемодане теперь есть камень из Батуми.

Анимация: блики на воде в нижней трети. Сцена: `batumi_beach`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the last evening on the pebble beach, the boy pressing a stone to his chest. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender. keep water in the lower third of the frame.
```

#### `bat_last_stones__1.png` — «Взять камень»

> Самый лёгкий груз в этом переезде. И самый тяжёлый.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a flat batumi stone placed into the suitcase on top of clothes. Usual place, adapt if the moment says otherwise: pebble beach in batumi, father and small boy throwing flat stones into the black sea, skipping stone ripples, mountains and high-rise towers in the background, evening light, peaceful and tender.
```

### `bat_spb_flat.png`

> Два месяца спустя. Вы говорите хозяйке, что больше не будете снимать квартиру в Петербурге. Вещи разбирают родители и друзья. Кто-то забирает что-то «на память». Жена переживает: вы же вроде собирались вернуться. Или нет. Непонятное состояние — ни там, ни тут.

Анимация: без анимации. Сцена: `phone_chat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a family chat on the phone with photos of an emptying saint petersburg flat. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

#### `bat_spb_flat__1.png` — «Пусть берут»

> Твоя кружка у кого-то на кухне. Ваши книги — у кого-то на полке. Ощущение, что дом растаскивают по частям, а ты смотришь на это из окна в Батуми.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: someone else's kitchen with the man's old mug on the shelf. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

#### `bat_spb_flat__2.png` — «Попросить сохранить главное»

> Мама забирает коробки к себе. Кухню из ИКЕА выставляют на «Авито» и продают за десять тысяч рублей. Пусть хоть кто-то варит на ней суп из машинок.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the toy kitchen photographed for an online listing. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

#### `bat_spb_flat__3.png` — «Не думать об этом»

> Ты отключаешь уведомления в семейном чате на неделю. Когда включаешь, квартиры уже нет. Есть фото пустой комнаты. Ты его не открываешь.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the phone with notifications muted lying on the balcony table. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting. keep water in the lower third of the frame.
```

### `crypto_frozen.png`

> Биржа заморозила ваши USDT: «Требуется дополнительная верификация». Котик с аватарки не отвечает.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone screen showing a frozen crypto account warning, a cat avatar offline. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `crypto_frozen__1.png` — «Пройти верификацию»

> Селфи с паспортом. Селфи с паспортом и листком с датой. Селфи с паспортом, листком и лицом «я не мошенник». Разморозили.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man taking a selfie with his passport and a handwritten date. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `crypto_frozen__2.png` — «Продать по плохому курсу»

> Потеряно много, зато быстро.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a bad exchange rate on screen, the man pressing sell. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `crypto_frozen__3.png` — «Писать в поддержку»

> Двадцать писем, три недели, один и тот же ответ «ваше обращение важно для нас». Разморозили. Курс за это время ушёл.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a mailbox full of identical support replies. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `bat_day.png`

> Обычная батумская неделя: работа, няня, море, дождь, хачапури. Ты не замечаешь, как она проходит.

Анимация: блики на воде в нижней трети. Сцена: `batumi_boulevard`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an ordinary batumi week: laptop, nanny, sea, rain, khachapuri. Usual place, adapt if the moment says otherwise: batumi seaside boulevard with palm trees, the moving metal statues of ali and nino in the distance, a toddler on his father's shoulders, lanterns, sunset over the sea. keep water in the lower third of the frame.
```

#### `bat_day__1.png` — «Дальше»

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boulevard in the evening, the family walking. Usual place, adapt if the moment says otherwise: batumi seaside boulevard with palm trees, the moving metal statues of ali and nino in the distance, a toddler on his father's shoulders, lanterns, sunset over the sea. keep water in the lower third of the frame.
```

## Фигейра-да-Фош, год 1

### `fig_istanbul.png`

> Стамбул, ночная пересадка. Трансфер полчаса везёт вас в отель, утром заберёт обратно. Ночью вы заказываете еду в номер и едите на кровати — как в Тбилиси, только теплее. Еда в аэропорту стоила как маленький ремонт.

Анимация: мигают огоньки в верхних двух третях. Сцена: `transit`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a small istanbul transit hotel room at night, the family eating room-service food on the bed, a minaret outside the window. Usual place, adapt if the moment says otherwise: huge transit airport terminal at night, people sleeping on benches with backpacks, a simit bread stall, big glass windows with airplanes outside, warm artificial light, liminal space feeling. small lit windows or lamps scattered in the upper two thirds.
```

#### `fig_istanbul__1.png` — «Спать до будильника»

> В пять утра рядом с отелем начинает петь мечеть. Будильник не понадобился. Сын садится в кровати и слушает, раскрыв рот.

Анимация: мерцают звёзды в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: dawn, the toddler sitting up in bed listening to the call to prayer from a minaret across the street. Usual place, adapt if the moment says otherwise: huge transit airport terminal at night, people sleeping on benches with backpacks, a simit bread stall, big glass windows with airplanes outside, warm artificial light, liminal space feeling. keep dark night sky in the upper part of the frame.
```

#### `fig_istanbul__2.png` — «Выйти на балкон»

> Предрассветный город, огни, азан с минарета через дорогу. Ты стоишь в куртке и думаешь, что ты между — уже не там, ещё не тут. Трансфер приезжает вовремя.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on a hotel balcony before dawn in his jacket, city lights and a minaret. Usual place, adapt if the moment says otherwise: huge transit airport terminal at night, people sleeping on benches with backpacks, a simit bread stall, big glass windows with airplanes outside, warm artificial light, liminal space feeling. small lit windows or lamps scattered in the upper two thirds.
```

#### `fig_istanbul__3.png` — «Пройтись по ночной улице»

> Вы выходите втроём на ночную улицу. Кот спит на капоте, продавец симитов машет сыну. Через час обратно — а ощущение, что побывали в Стамбуле.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family walking a night street, a cat asleep on a car bonnet, a simit seller waving. Usual place, adapt if the moment says otherwise: huge transit airport terminal at night, people sleeping on benches with backpacks, a simit bread stall, big glass windows with airplanes outside, warm artificial light, liminal space feeling. small lit windows or lamps scattered in the upper two thirds.
```

### `fig_lisbon.png`

> Лиссабон, 13 декабря. Два дня. Город на семи холмах, и вы с ребёнком, двумя чемоданами и тремя рюкзаками — на каждом. Пастел-де-ната, жёлтый трамвай, океан где-то за крышами. Сын видит трамвай и кричит на всю улицу: «Тлам-вай!»

Анимация: без анимации. Сцена: `lisbon_street`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: lisbon on a december day: steep streets, a yellow tram, the family with two suitcases and three backpacks on a hill. Usual place, adapt if the moment says otherwise: steep lisbon street with a yellow tram, colorful tiled facades, a family of three with two suitcases and three backpacks climbing uphill, sunny, slightly comic.
```

#### `fig_lisbon__1.png` — «Погулять ещё день»

> Вы катаетесь на жёлтом трамвае, пока сын не засыпает. Ты открываешь сайт с арендой и закрываешь его через минуту: цены как будто в другой валюте. Хорошо, что вам в Фигейру.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family riding a yellow tram, the boy asleep against the window. Usual place, adapt if the moment says otherwise: steep lisbon street with a yellow tram, colorful tiled facades, a family of three with two suitcases and three backpacks climbing uphill, sunny, slightly comic.
```

#### `fig_lisbon__2.png` — «Сразу в Фигейру»

> Коллеги жены уже ждут: «Приезжайте, тут круто». Два часа на поезде вдоль полей и сосен — и вот океан.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a train along fields and pine trees toward figueira, the boy pressing his face to the glass. Usual place, adapt if the moment says otherwise: steep lisbon street with a yellow tram, colorful tiled facades, a family of three with two suitcases and three backpacks climbing uphill, sunny, slightly comic.
```

#### `fig_lisbon__3.png` — «Доехать до океана»

> Электричка вдоль реки — и вот Атлантика. Сын бежит к ней — и от неё, когда приходит волна. Туда-обратно, двадцать раз.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy running toward atlantic waves on a lisbon beach and away again. Usual place, adapt if the moment says otherwise: steep lisbon street with a yellow tram, colorful tiled facades, a family of three with two suitcases and three backpacks climbing uphill, sunny, slightly comic. keep water in the lower third of the frame.
```

### `fig_arrive.png`

> Фигейра-да-Фош. Маленький город на океане. Пляж такой широкий, что до воды идти десять минут. Не сезон: пусто, ветер, чайки, рыбаки. Сын бежит к океану и останавливается — тот рычит.

Анимация: чайки пролетают в верхней части. Сцена: `figueira_beach`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: figueira da foz off-season: an extremely wide empty beach, wind, seagulls, a lone fisherman. Usual place, adapt if the moment says otherwise: extremely wide empty sandy beach of figueira da foz, atlantic waves far away, a small boy running toward the ocean, seagulls, off-season grey-blue light, vast and quiet. keep open sky in the upper part of the frame.
```

#### `fig_arrive__1.png` — «Подойти к воде вместе»

> Атлантика не похожа на Чёрное море. Она большая, холодная и не притворяется дружелюбной. Сын берёт тебя за руку и говорит: «Нормально». Значит, нормально.

Анимация: чайки пролетают в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family walking hand in hand toward the huge cold atlantic. Usual place, adapt if the moment says otherwise: extremely wide empty sandy beach of figueira da foz, atlantic waves far away, a small boy running toward the ocean, seagulls, off-season grey-blue light, vast and quiet. keep open sky in the upper part of the frame.
```

### `fig_month_both.png`

> Ещё полтора месяца. Две зарплаты, аренда, школа, бензин, пастел-де-ната по пятницам. Деньги приходят и уходят, как прилив. Немного остаётся на песке.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone banking app on a portuguese windowsill, salaries in, rent out, the ocean far away. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `fig_month_both__1.png` — «Отложить»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a jar of saved coins next to a box of pastéis de nata. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `fig_month_me.png`

> Полтора месяца на одну зарплату. Хватает, если не заглядывать в банковское приложение. Ты не заглядываешь.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man avoiding a banking app, phone face down on the table. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `fig_month_me__1.png` — «Затянуть пояса»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a modest shopping basket on the kitchen table. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `fig_month_wife.png`

> Полтора месяца на зарплату жены. Ты варишь супы и пишешь сопроводительные письма. Письма уже на португальском. Супы ещё на русском.

Анимация: пар поднимается из центра. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man cooking soup with a cover letter in portuguese open on the laptop. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen. a steaming cup or pot near the center of the frame.
```

#### `fig_month_wife__1.png` — «Держаться»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man typing at night, soup cooling on the stove. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `fig_month_none.png`

> Полтора месяца без зарплат. Аренда приходит вовремя. Только она.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an empty wallet beside a rent bill in an old portuguese flat. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `fig_month_none__1.png` — «Платить из накоплений»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: savings dropping on a phone screen, the man staring at it. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `fig_nif.png`

> Без NIF — налогового номера — здесь нельзя ничего: ни симку, ни квартиру, ни садик. Для NIF нужен фискальный представитель. Ты не знаешь, что это. Никто не знает. Оформлять сложно.

Анимация: без анимации. Сцена: `financas`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a finanças tax office hall in portugal, ticket machine, green fluorescent light, the family waiting. Usual place, adapt if the moment says otherwise: portuguese tax office waiting room, ticket number screen, long rows of chairs, people waiting with papers, tired clerk at a desk, greenish fluorescent light, bureaucratic comedy.
```

#### `fig_nif__1.png` — «Через помогаторов»

> По сто евро с каждого из троих — и вы налогоплательщики Португалии. Налогов пока нет. Но номера есть. Сын — тоже налогоплательщик. В два с половиной года.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a helper in a blazer handing three tax number papers to the couple. Usual place, adapt if the moment says otherwise: portuguese tax office waiting room, ticket number screen, long rows of chairs, people waiting with papers, tired clerk at a desk, greenish fluorescent light, bureaucratic comedy.
```

#### `fig_nif__2.png` — «Самому в Finanças»

> Номерок, очередь, жесты, английский пополам с португальским. Тебе отказывают: нужен представитель. Ты идёшь к помогаторам и платишь те же сто евро с человека.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man at a counter being refused, gesturing in broken portuguese. Usual place, adapt if the moment says otherwise: portuguese tax office waiting room, ticket number screen, long rows of chairs, people waiting with papers, tired clerk at a desk, greenish fluorescent light, bureaucratic comedy.
```

#### `fig_nif__3.png` — «Спросить в чате»

> Чат знает всё: какой помогатор надёжный, какой берёт за срочность, какой пропадает. Ты выбираешь надёжного. Те же сто евро — но спишь спокойнее.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man reading a long chat thread of recommendations on his phone. Usual place, adapt if the moment says otherwise: portuguese tax office waiting room, ticket number screen, long rows of chairs, people waiting with papers, tired clerk at a desk, greenish fluorescent light, bureaucratic comedy.
```

### `fig_bank.png`

> Банк. Менеджер улыбается ровно до момента, когда видит российские паспорта. «Один момент», — говорит он и уходит на двадцать минут.

Анимация: без анимации. Сцена: `bank`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a portuguese bank office, a manager looking at russian passports and standing up to leave. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

#### `fig_bank__1.png` — «Через помогаторов»

> Сто пятьдесят евро с человека — и помогатор идёт с вами в банк, говорит нужные слова, кивает в нужных местах. Счёт открывают. Так здесь устроено: на всё есть свой помогатор.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a helper speaking portuguese for the family at the bank desk. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

#### `fig_bank__2.png` — «Ждать и улыбаться»

> Он возвращается с анкетами: происхождение средств, цель счёта, девичья фамилия бабушки. Через три недели счёт открыт.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a pile of forms and the couple smiling tiredly. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

#### `fig_bank__3.png` — «Показать грузинский счёт»

> Выписка из грузинского банка, переведённая на португальский. Менеджер изучает её как детектив. Счёт открывают. Грузия выручает и отсюда.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man handing over a translated georgian bank statement. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

#### `fig_bank__4.png` — «Пойти в другой банк»

> Во втором банке всё открывают за час. Никто не знает почему. Ты не спрашиваешь.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a second bank, the couple walking out with cards in an hour. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

### `fig_flat.png`

> Квартиру вы сняли заранее, ещё из Батуми, через помогаторов — им отдали месячную аренду. Две спальни, зал и гараж за 750 евро. Хозяин просит оплату за полгода вперёд: иностранцы, без местной работы.

Анимация: без анимации. Сцена: `flat_viewing`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an old portuguese flat with two bedrooms, a living room and a garage, old windows, dated furniture. Usual place, adapt if the moment says otherwise: empty small lisbon apartment with a window facing a blank wall, real estate agent holding keys, visible mold stain in the ceiling corner, old tiles, bare lightbulb, ironic mood.
```

#### `fig_flat__1.png` — «Заплатить за полгода»

> Ты переводишь сумму, от которой у банковского приложения дрожит экран. Ключи — твои. Всё очень старое, и из окон дует. Но это ваш дом. На полгода — точно.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man staring at a huge bank transfer on his phone, keys in his other hand. Usual place, adapt if the moment says otherwise: empty small lisbon apartment with a window facing a blank wall, real estate agent holding keys, visible mold stain in the ceiling corner, old tiles, bare lightbulb, ironic mood.
```

#### `fig_flat__2.png` — «Попросить помесячно»

> Хозяин качает головой: без NIF и местного контракта — только вперёд. Ты платишь за полгода. Хотя бы попробовал.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the landlord shaking his head, pointing at a contract. Usual place, adapt if the moment says otherwise: empty small lisbon apartment with a window facing a blank wall, real estate agent holding keys, visible mold stain in the ceiling corner, old tiles, bare lightbulb, ironic mood.
```

#### `fig_flat__3.png` — «Поторговаться»

> Хозяин уступает пятьдесят евро в месяц — если вы не будете просить ремонт. Вы не будете. Окна это подтверждают.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the landlord and the man shaking hands, the old windows behind them. Usual place, adapt if the moment says otherwise: empty small lisbon apartment with a window facing a blank wall, real estate agent holding keys, visible mold stain in the ceiling corner, old tiles, bare lightbulb, ironic mood.
```

### `fig_car.png`

> Без машины в маленьком городе — автобус раз в час и супермаркет в пяти километрах. На площадке у дороги — Peugeot за семь тысяч евро: побитый со всех сторон, зато с панорамной крышей. И главное — автомат.

Анимация: без анимации. Сцена: `figueira_street`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a roadside car lot in figueira, a battered peugeot with a panoramic glass roof. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon.
```

#### `fig_car__1.png` — «Купить»

> Ты покупаешь его за крышу и за автомат. Сын лежит на заднем сиденье и смотрит в панорамную крышу на облака. Вы едете вдоль океана, и он засыпает. Ровно как в Батуми.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy lying on the back seat looking up through the panoramic roof at clouds, the ocean road outside. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon.
```

#### `fig_car__2.png` — «Пока на автобусе»

> Ты изучаешь расписание автобусов наизусть. Водители здороваются с сыном. Сын — со всеми водителями.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: father and son waiting at a lonely bus stop, a bus driver waving. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon.
```

#### `fig_car__3.png` — «Велосипед с креслом»

> Велосипед с детским креслом. Сын сидит сзади и командует «быстрее». В дождь — всё равно автобус.

Анимация: чайки пролетают в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man cycling with the boy in a child seat behind him along the promenade. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon. keep open sky in the upper part of the frame.
```

### `fig_car_later.png`

> Автобус опять не пришёл. Дождь. Сын промок. Тот побитый Peugeot с панорамной крышей всё ещё продаётся. Теперь — за шесть с половиной.

Анимация: дождь по всему кадру. Сцена: `figueira_street`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: rain at a bus stop, the boy soaked, the peugeot still for sale across the road. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon.
```

#### `fig_car_later__1.png` — «Купить»

> Продавец помнит тебя. «Я знал, что вы вернётесь». Он тоже по-своему эмигрант-психолог.

Анимация: дождь по всему кадру.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the seller grinning and handing over the peugeot keys. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon.
```

#### `fig_car_later__2.png` — «Ещё подождать»

> Ты ждёшь. Автобус тоже ждёт — где-то не здесь. Ты знаешь расписание наизусть и всё равно мокнешь.

Анимация: дождь по всему кадру.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: father and son under a tiny umbrella still waiting for the bus. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon.
```

#### `fig_car_later__3.png` — «Взять машину в аренду»

> Месяц аренды — и ты понимаешь, что за полгода аренды можно было купить тот Пежо. Ты это знал. Но месяц был хороший.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a rental car parked outside the old flat. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon.
```

### `fig_layoff_me.png`

> Эстонская компания. Кто-то слил ключи, данные утекли, клиенты перестали доверять. Через неделю сокращают восемьдесят пять процентов людей. Тебя тоже. Ты проработал там полгода.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a laptop showing a company-wide layoff email, the man sitting very still. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `fig_layoff_me__1.png` — «Сразу искать»

> Ты обновляешь резюме в тот же вечер. В графе «местоположение» пишешь «Португалия». Это новое ощущение.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man updating his cv at night, typing 'portugal' as location. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `fig_layoff_me__2.png` — «Сначала к океану»

> Ты идёшь на пляж. Камней в Фигейре нет — только песок. Ты бросаешь в океан ракушку. Не то. Потом идёшь домой и обновляешь резюме.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on the wide sand beach throwing a shell into the ocean. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen. keep water in the lower third of the frame.
```

#### `fig_layoff_me__3.png` — «Созвониться с командой»

> Вы созваниваетесь всей сокращённой командой: шутите, делитесь вакансиями, ругаете того, кто слил ключи. Через неделю двое уже нашли работу. Ты — следом.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a video call grid of laid-off colleagues laughing and sharing links. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `fig_job_found_me.png`

> Полтора месяца откликов и собеседований — и оффер. Новый стартап, работает на американский рынок. Созвоны теперь вечером: у них утро.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an offer email on the laptop, the evening sky outside. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `fig_job_found_me__1.png` — «Принять»

> Ты подписываешь контракт на кухне. Сын не понимает, почему папа танцует. Присоединяется. Вечером твой рабочий день только начинается.

Анимация: конфетти падает.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man dancing in the kitchen, the boy joining in. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `fig_laptop_sell.png`

> Старый ноутбук, который ты вёз из Петербурга «на всякий случай». Случай наступил: тебя сократили.

Анимация: без анимации. Сцена: `phone_chat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the old laptop with stickers lying on the table. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

#### `fig_laptop_sell__1.png` — «Продать»

> Покупатель с OLX торгуется двадцать минут и платит, не проверяя. Сто шестьдесят евро и чувство, что ты предал старого друга.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a buyer counting euro bills for the laptop at the door. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

#### `fig_laptop_sell__2.png` — «Оставить»

> Вдруг будет ещё какой-нибудь случай.

Анимация: пылинки медленно плывут.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the old laptop put back on a shelf. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

#### `fig_laptop_sell__3.png` — «Отдать сыну»

> Старый ноутбук становится детским: мультики, рисовалка и клавиша пробела, которую он жмёт как барабан. Ноутбук снова нужен.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy drumming on the old laptop's spacebar, a cartoon on screen. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

### `fig_school.png`

> Садик рядом с домом. Цена зависит от доходов: показываешь налоговую декларацию — и выходит 550 евро в месяц. Воспитательница не говорит ни по-русски, ни по-английски. Сын не говорит по-португальски.

Анимация: без анимации. Сцена: `figueira_school`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a small portuguese kindergarten with azulejo tiles, the boy holding his father's hand at the gate. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

#### `fig_school__1.png` — «Показать налоги и платить»

> Первое время он молчит. Потом говорит — тихо-тихо. Потом громче. Через пару месяцев воспитательница поправляет уже не его, а тебя.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy quiet at a tiny table among portuguese children, then whispering. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

#### `fig_school__2.png` — «Искать бесплатный»

> Бесплатных мест нет до сентября. Вы возвращаетесь в тот же садик и платите те же 550. Зато теперь вы знаете все садики города.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on the phone calling kindergartens, a list crossed out. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

#### `fig_school__3.png` — «Подождать до сентября»

> Ещё три месяца сын дома, на созвонах — у тебя на коленях. В сентябре — тот же садик. Португальский догоняет быстро.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy on the man's lap during a video call at home. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

### `fig_school_tv.png`

> В садике отлично учат ментальной арифметике: сын складывает в уме быстрее тебя. Но в последний час перед тем, как родители забирают детей, все сидят и смотрят телевизор.

Анимация: без анимации. Сцена: `figueira_school`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a kindergarten room with an abacus lesson, and a tv on in the corner. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

#### `fig_school_tv__1.png` — «Забирать пораньше»

> Ты переносишь созвоны и приходишь к четырём. Сын выходит с лицом человека, которого спасли от мультфильма. Немного жалеет.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man arriving at four, the boy running out. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

#### `fig_school_tv__2.png` — «Пусть смотрит»

> Час телевизора на португальском — тоже урок языка. Ты так себе объясняешь. Иногда даже веришь.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: children watching a tv in a row, the boy among them. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

#### `fig_school_tv__3.png` — «Поговорить с воспитательницей»

> Ты объясняешь на ломаном португальском, что дома телевизор почти не смотрят. Воспитательница кивает: «Claro». Теперь в последний час — мультики про животных. Компромисс.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man talking to a teacher at the kindergarten door with gestures. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

### `fig_alopecia.png`

> Однажды утром у сына выпадает прядь волос — целым кусочком. Ты листаешь интернет и пугаешься всё сильнее. Врача найти сложно: по государственной медицине ждать три месяца, по страховке — неделю.

Анимация: без анимации. Сцена: `clinic`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man looking at a small bald patch on the boy's head in the morning light. Usual place, adapt if the moment says otherwise: small private clinic reception in lisbon, white walls, azulejo tile strip, receptionist, patient with a scarf holding a throat, calm.
```

#### `fig_alopecia__1.png` — «По страховке за неделю»

> Врач смотрит пять минут: временная алопеция, от стресса. Пройдёт. Три страны за год — даже у волос бывает стресс. Ты выдыхаешь впервые за неделю.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a doctor's office, a calm doctor reassuring the parents. Usual place, adapt if the moment says otherwise: small private clinic reception in lisbon, white walls, azulejo tile strip, receptionist, patient with a scarf holding a throat, calm.
```

#### `fig_alopecia__2.png` — «Ждать три месяца»

> Три месяца ты смотришь на его макушку каждое утро. Волосы отрастают раньше, чем доходит очередь. Врач подтверждает: временная алопеция. Ты седеешь — немного, но навсегда.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a calendar with three months crossed off, the man checking the boy's head. Usual place, adapt if the moment says otherwise: small private clinic reception in lisbon, white walls, azulejo tile strip, receptionist, patient with a scarf holding a throat, calm.
```

#### `fig_alopecia__3.png` — «Врач из чата по видео»

> Знакомая врач из чата смотрит по видео, просит фото при дневном свете. «Похоже на стресс, но к дерматологу сходите». Ты всё равно идёшь. Но спишь спокойнее.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a video call with a doctor, the man holding a phone near the boy's head. Usual place, adapt if the moment says otherwise: small private clinic reception in lisbon, white walls, azulejo tile strip, receptionist, patient with a scarf holding a throat, calm.
```

### `fig_kid_languages.png`

> Сын перед сном: «Папа, где моя шапео? Я пойду спать в каму». Два языка в одном предложении. Ты не знаешь, гордиться или беспокоиться. Делаешь и то и другое.

Анимация: мерцают звёзды в верхней части. Сцена: `figueira_school`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy in pajamas in bed asking for his hat, the man sitting on the edge. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning. keep dark night sky in the upper part of the frame.
```

#### `fig_kid_languages__1.png` — «Гордиться»

> Ты рассказываешь об этом всем: маме, друзьям, чату. Чат отвечает: «У нас так же». Ты всё равно гордишься.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man telling friends on the phone with a proud face. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

#### `fig_kid_languages__2.png` — «Читать ему по-русски»

> Каждый вечер — сказка на русском. Он поправляет твоё ударение в слове «Буратино». Он не прав, но ты не споришь.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man reading a russian fairy tale book at bedtime. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

#### `fig_kid_languages__3.png` — «Записать в заметки»

> Заметка «Что сказал сын» растёт: шапео, кама, «папа, você é bobo». Когда-нибудь ты её ему покажешь.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone note with a growing list of the boy's funny phrases. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

### `fig_school_bilingual.png`

> Сыну скоро в школу. По-португальски он уже болтает, а английского — ни слова, и обычная школа рядом этого не исправит. Жена вечером открывает сайт билингвальной школы под Лиссабоном. Цены вы закрываете вместе.

Анимация: без анимации. Сцена: `figueira_school`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman at night looking at a bilingual school website, the man beside her. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

#### `fig_school_bilingual__1.png` — ««Когда-нибудь»»

> Вкладка с сайтом школы остаётся открытой. Месяцами. Как обещание.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the school website tab still open months later. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

#### `fig_school_bilingual__2.png` — «Посчитать, сколько нужно»

> Таблица называется «Оэйраш???». Три вопросительных знака. Ты уже знаешь, чем это кончится.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a spreadsheet titled with question marks on the laptop. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

#### `fig_school_bilingual__3.png` — «Спросить про скидки»

> Школа отвечает вежливо: скидка на второго ребёнка. Второго у вас нет. Пока.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an email reply from the school on the screen, the couple laughing. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

### `fig_legal.png`

> Шенген скоро закончится. Жена подаётся на вид на жительство первой — сама. Ты — через юристов, по статье 90, как высококвалифицированный специалист. Сына оформляют через воссоединение семьи — с женой.

Анимация: без анимации. Сцена: `lawyer`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a portuguese law office with folders, a lawyer explaining residence permit articles to the couple. Usual place, adapt if the moment says otherwise: small immigration lawyer office, stacks of folders, a lawyer in glasses explaining something with a pen, a couple across the desk looking confused, portuguese flag in the corner.
```

#### `fig_legal__1.png` — «Довериться юристам»

> Юристы говорят: «Всё будет». Ты впервые читаешь о себе «высококвалифицированный специалист» в официальном документе. Приятно. Потом идут сорок страниц требований.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man reading a long list of requirements. Usual place, adapt if the moment says otherwise: small immigration lawyer office, stacks of folders, a lawyer in glasses explaining something with a pen, a couple across the desk looking confused, portuguese flag in the corner.
```

#### `fig_legal__2.png` — «Податься самому, как жена»

> Ты пробуешь сам. Через неделю звонишь юристам. Жена ничего не говорит. Это хуже, чем если бы сказала.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man alone at home with a mountain of forms, then calling the lawyers. Usual place, adapt if the moment says otherwise: small immigration lawyer office, stacks of folders, a lawyer in glasses explaining something with a pen, a couple across the desk looking confused, portuguese flag in the corner.
```

#### `fig_legal__3.png` — «Спросить в чате, кто как»

> Чат советует трёх юристов, двух помогаторов и одного «знакомого из SEF». Ты выбираешь юристов — тех, что на двести евро дешевле.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone chat with many recommendations. Usual place, adapt if the moment says otherwise: small immigration lawyer office, stacks of folders, a lawyer in glasses explaining something with a pen, a couple across the desk looking confused, portuguese flag in the corner.
```

### `fig_sef_slots.png`

> Чтобы подать документы на ВНЖ, нужна запись в SEF — миграционную службу. Слоты появляются и исчезают за секунды. Вы ловите их сами.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple at two laptops refreshing an appointment page, a clock showing the minute slots appear. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `fig_sef_slots__1.png` — «Ловить до победы»

> Вы выучили, в какую минуту слоты появляются и в какую их сбрасывают. Потратили недели и деньги на звонки. Так и не дозвонились.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple exhausted at dawn, still refreshing. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `fig_sef_slots__2.png` — «Сдаться и платить»

> Через неделю попыток ты понимаешь правила игры: слоты не ловят, слоты покупают.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man paying online for an appointment. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `fig_sef_slots__3.png` — «Попросить друзей ловить»

> Пять человек в чате ловят слоты для вас в свои свободные минуты. Не ловят. Но ты впервые чувствуешь, что вы тут не одни.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: friends' messages popping up on the phone trying to help. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `fig_sef_paid.png`

> Жена платит за запись двести евро, ты — триста, сына записывают друзья. Записи — в трёх разных городах: жене в Сантарен, тебе в Порту, сыну в Визеу. Португалия маленькая, но не настолько.

Анимация: без анимации. Сцена: `aima`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a map of portugal with three pins: santarém, porto, viseu. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `fig_sef_paid__1.png` — «Ехать по всей стране»

> Три поездки, три окошка, три набора отпечатков. В Визеу сын сидит смирно и смотрит в камеру так серьёзно, что сотрудница смеётся.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: three government office windows, three sets of fingerprints, the boy serious at the camera. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `fig_sef_paid__2.png` — «Составить маршрут»

> Таблица: даты, города, поезда, кто с сыном. Жена говорит, что ты превратил эмиграцию в логистику. Ты не споришь: так легче.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a neat travel spreadsheet of dates and trains. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `fig_sef_paid__3.png` — «Взять сына в Порту»

> Ты берёшь сына с собой в Порту: поезд, мост, португальская бифана. Он не помнит, зачем вы ездили. Помнит мост.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: father and son on a train and then on the iron bridge in porto. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

### `fig_card_son.png`

> Через месяц приходит первая карточка ВНЖ — сына. Самый маленький в семье и самый быстрый в бумагах.

Анимация: без анимации. Сцена: `ctt_post`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a small residence card with the boy's serious face lying on a ctt envelope. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

#### `fig_card_son__1.png` — «Сфотографировать»

> Карточка с серьёзным лицом сына едет маме в Старую Руссу. Мама отвечает: «Важный какой».

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone photo of the card being sent to grandmother. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

### `fig_card_wife.png`

> Через три месяца — карточка жены. Она держит её двумя пальцами, как билет на поезд, который наконец пришёл.

Анимация: без анимации. Сцена: `ctt_post`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman holding her residence card with two fingers like a long-awaited ticket. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

#### `fig_card_wife__1.png` — ««А моя?»»

> Твоя — в Порту. Где-то в очереди. Жена хлопает тебя по плечу: «Высококвалифицированные ждут дольше».

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman patting the man on the shoulder, laughing. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

### `fig_sef_renamed.png`

> Новости: миграционной службы SEF больше нет. Теперь вместо неё — AIMA. Очередь та же, вывеска новая. А твоя карточка где-то между ними — всё ещё в Порту.

Анимация: без анимации. Сцена: `aima`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an old sef sign being replaced by a new aima sign over the same long queue. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `fig_sef_renamed__1.png` — «Ждать»

> Ты ждёшь. Так делают все. В чате пишут, что очередь в AIMA — четыреста тысяч человек. Ты чувствуешь себя частью чего-то большого.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man waiting, scrolling chat messages about the queue. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `fig_sef_renamed__2.png` — «Позвонить узнать»

> Номер SEF больше не работает. Номер AIMA пока не работает. Ты звонишь в никуда — и слушаешь, как никуда тебе отвечает музыкой.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man listening to hold music on the phone. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `fig_sef_renamed__3.png` — «Книга жалоб»

> Ты пишешь в Livro de Reclamações — вежливо, по-португальски, с переводчиком. Ответа нет. Но тебе почему-то легче.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man writing in a complaint book at a counter. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

### `fig_parcel_offer.png`

> «Я вам посылку отправила! Носки, шоколадки, внуку книжки. Всё как надо». Ты чувствуешь неясную тревогу.

Анимация: без анимации. Сцена: `phone_video`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a video call with the mother showing a parcel she just sent. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `fig_parcel_offer__1.png` — ««Спасибо, мам!»»

> Мама счастлива. Ты тоже. Тревога остаётся.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the mother smiling on screen, the man smiling with a hint of worry. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

### `ctt_notice.png`

> Письмо: «Ваша посылка задержана на таможне. Предоставьте декларацию и оплатите сборы в течение 20 дней, иначе она будет возвращена отправителю». Отправитель — мама.

Анимация: без анимации. Сцена: `ctt_post`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a ctt post office letter about a parcel held at customs. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

#### `ctt_notice__1.png` — «Задекларировать сейчас»

> Сайт на португальском, форма на двенадцать полей. В графе «стоимость» ты везде пишешь ноль: носки — 0, шоколадка — 0, книжки — 0. Про любовь поля нет.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a customs form on a laptop with every value set to zero. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

#### `ctt_notice__2.png` — «Потом разберусь»

> Двадцать дней — это много. Почти месяц. Что может пойти не так.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the letter put aside under a pile of papers. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

### `ctt_reminder.png`

> Ты вспоминаешь про посылку. Считаешь дни. Осталось восемь. Или шесть. Сайт CTT грузится третью минуту.

Анимация: без анимации. Сцена: `ctt_post`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man counting days on a calendar, a slow ctt website loading. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

#### `ctt_reminder__1.png` — «Задекларировать»

> Успеваешь. Ты чувствуешь себя героем боевика, где бомбу обезвредили на последней секунде. Бомба — это носки.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man submitting the declaration at the last moment. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

#### `ctt_reminder__2.png` — «Amanhã»

> Завтра. Португалия тебя уже меняет.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man closing the laptop and saying 'tomorrow'. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

### `parcel_returned.png`

> Мама звонит: «Мне посылка вернулась. С наклейками. Я ничего не поняла. Носки там были шерстяные, сама вязала. И книжки внуку». Посылка проехала шесть тысяч километров, чтобы вернуться.

Анимация: без анимации. Сцена: `phone_video`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a video call: the mother holding a returned parcel covered in stickers. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `parcel_returned__1.png` — ««Мам, в следующий раз разберусь»»

> «Ничего, — говорит мама. — Передам с кем-нибудь». «С кем-нибудь» — теперь главный вид транспорта в вашей жизни.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man promising on the call, the mother waving it off. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

### `parcel_arrives.png`

> Посылка! Шла так долго, что ты перестал её ждать. Шерстяные носки, «Алёнка», книжки с картинками и записка: «Кушайте нормально». Сын садится читать прямо на полу почты.

Анимация: без анимации. Сцена: `ctt_post`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an opened parcel on the table: wool socks, a chocolate bar, picture books, a handwritten note. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

#### `parcel_arrives__1.png` — «Съесть дольку «Алёнки»»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man breaking off a piece of the chocolate, the family around. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

### `fig_mold.png`

> В углу — плесень. Хозяин приходит, смотрит: «É normal. É Portugal». Это нормально. Это Португалия.

Анимация: без анимации. Сцена: `flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a black mold spot in the corner of an old portuguese flat, the landlord shrugging. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

#### `fig_mold__1.png` — «Купить средство»

> Плесень уходит. Через неделю возвращается с друзьями.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man spraying the corner with a cleaner. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

#### `fig_mold__2.png` — «Назвать её Жозе»

> Сын здоровается с Жозе каждое утро. Жозе растёт. Жозе — член семьи, которого никто не выбирал.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy waving good morning to the mold in the corner. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

#### `fig_mold__3.png` — «Открыть окна настежь»

> Холодно, зато дышит. Плесень тоже дышит. Счёт ничья.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: all the windows wide open, curtains blowing in the cold wind. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

### `fig_cold.png`

> Первая квартира в Фигейре — самая холодная в вашей жизни. Включая Петербург. Всё очень старое, окна продувает насквозь. Дома +13, на улице +15, в ванной — Норильск. Португальцы говорят, что зима тут мягкая. Португальцы врут.

Анимация: без анимации. Сцена: `flat_cold`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the coldest flat: the family in jackets indoors, breath visible, old leaky windows. Usual place, adapt if the moment says otherwise: same small lisbon apartment at night, cold blue tint, figure wrapped in a blanket and a winter jacket sitting on the mattress, visible breath vapor, a small electric heater glowing orange.
```

#### `fig_cold__1.png` — «Купить обогреватель»

> Обогреватель греет полметра вокруг себя. Вы снова живёте в этом полуметре, как в Батуми.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family huddled around a tiny heater. Usual place, adapt if the moment says otherwise: same small lisbon apartment at night, cold blue tint, figure wrapped in a blanket and a winter jacket sitting on the mattress, visible breath vapor, a small electric heater glowing orange.
```

#### `fig_cold__2.png` — «Терпеть»

> Три пары носков. Ты пишешь маме, что всё хорошо. Мама присылает прогноз: в Фигейре +15. «Тепло же», — пишет она.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man in three pairs of socks texting his mother 'all good'. Usual place, adapt if the moment says otherwise: same small lisbon apartment at night, cold blue tint, figure wrapped in a blanket and a winter jacket sitting on the mattress, visible breath vapor, a small electric heater glowing orange.
```

#### `fig_cold__3.png` — «Спать втроём»

> Все на одной кровати, под двумя одеялами, кот посередине. Тесно и тепло — как в Батуми зимой. Это уже семейная традиция.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: three people and a plush cat under two blankets on one bed. Usual place, adapt if the moment says otherwise: same small lisbon apartment at night, cold blue tint, figure wrapped in a blanket and a winter jacket sitting on the mattress, visible breath vapor, a small electric heater glowing orange.
```

### `fig_electricity.png`

> Пришёл счёт за электричество. Ты перечитываешь сумму. Переводишь в лари. Переводишь в рубли. Больше никуда не переводишь.

Анимация: без анимации. Сцена: `flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an electricity bill on the table, the man staring at it. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

#### `fig_electricity__1.png` — «Оплатить»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man paying the bill on his phone with a sigh. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

### `fig_stone.png`

> На пляже сын достаёт из кармана камень из Батуми. «Можно я его брошу в океан? Пусть познакомятся».

Анимация: блики на воде в нижней трети. Сцена: `figueira_beach`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: on the wide sand beach the boy holding the batumi stone up to the ocean. Usual place, adapt if the moment says otherwise: extremely wide empty sandy beach of figueira da foz, atlantic waves far away, a small boy running toward the ocean, seagulls, off-season grey-blue light, vast and quiet. keep water in the lower third of the frame.
```

#### `fig_stone__1.png` — ««Бросай»»

> Камень из Чёрного моря улетает в Атлантику. Сын машет ему вслед. Ты думаешь, что теперь у вас есть кто-то и там, и тут.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the stone flying over the atlantic waves, the boy waving after it. Usual place, adapt if the moment says otherwise: extremely wide empty sandy beach of figueira da foz, atlantic waves far away, a small boy running toward the ocean, seagulls, off-season grey-blue light, vast and quiet. keep water in the lower third of the frame.
```

#### `fig_stone__2.png` — ««Давай оставим»»

> Камень ложится на полку рядом с серым котом. Полка постепенно становится музеем вашего переезда.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the stone placed on a shelf next to the grey plush cat. Usual place, adapt if the moment says otherwise: extremely wide empty sandy beach of figueira da foz, atlantic waves far away, a small boy running toward the ocean, seagulls, off-season grey-blue light, vast and quiet.
```

#### `fig_stone__3.png` — ««Брось ракушку вместо»»

> Сын думает и бросает ракушку. «Это от камня привет». Камень остаётся в кармане. Привет улетает в Атлантику.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy throwing a shell into the ocean, the stone still in his pocket. Usual place, adapt if the moment says otherwise: extremely wide empty sandy beach of figueira da foz, atlantic waves far away, a small boy running toward the ocean, seagulls, off-season grey-blue light, vast and quiet. keep water in the lower third of the frame.
```

### `fig_stones.png`

> На пляже Фигейры — песок, а не галька. Кидать нечего. Сын пол-лета ищет камни, находит три ракушки и пробку и кидает их. «Блинчиков» не получается. Он не сдаётся.

Анимация: чайки пролетают в верхней части. Сцена: `figueira_beach`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy searching the sand for stones, finding shells and a cork. Usual place, adapt if the moment says otherwise: extremely wide empty sandy beach of figueira da foz, atlantic waves far away, a small boy running toward the ocean, seagulls, off-season grey-blue light, vast and quiet. keep open sky in the upper part of the frame.
```

#### `fig_stones__1.png` — «Искать вместе»

Анимация: чайки пролетают в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: father and son crouching on the sand together searching. Usual place, adapt if the moment says otherwise: extremely wide empty sandy beach of figueira da foz, atlantic waves far away, a small boy running toward the ocean, seagulls, off-season grey-blue light, vast and quiet. keep open sky in the upper part of the frame.
```

### `fig_pastel.png`

> Пастел-де-ната. Тёплый, с корицей, евро двадцать. Ты съедаешь один у стойки, как местные. Сын — два, как сын.

Анимация: пар поднимается из центра. Сцена: `pastelaria`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a portuguese pastelaria counter with warm pastéis de nata and cinnamon, the man eating one standing. Usual place, adapt if the moment says otherwise: traditional portuguese pastry shop counter, trays of pastel de nata, espresso cups, glass display, azulejo walls, warm golden morning light, happy mood. a steaming cup or pot near the center of the frame.
```

#### `fig_pastel__1.png` — «Ещё по одному»

> Это не еда. Это антидепрессант с корочкой.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: two more pastries on the counter, the man and boy grinning. Usual place, adapt if the moment says otherwise: traditional portuguese pastry shop counter, trays of pastel de nata, espresso cups, glass display, azulejo walls, warm golden morning light, happy mood. a steaming cup or pot near the center of the frame.
```

#### `fig_pastel__2.png` — «Хватит»

> Вы уходите, гордясь силой воли. Возвращаетесь через час.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man and boy walking away from the pastelaria, glancing back. Usual place, adapt if the moment says otherwise: traditional portuguese pastry shop counter, trays of pastel de nata, espresso cups, glass display, azulejo walls, warm golden morning light, happy mood.
```

#### `fig_pastel__3.png` — «Коробку домой»

> Шесть пастейш в коробке. До дома доезжают четыре. Жена делает вид, что не считала.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a box of six pastries in the car, two already gone. Usual place, adapt if the moment says otherwise: traditional portuguese pastry shop counter, trays of pastel de nata, espresso cups, glass display, azulejo walls, warm golden morning light, happy mood.
```

### `fig_obrigado.png`

> Кассирша что-то спрашивает. Ты говоришь «obrigado». Она ждёт. Ты ждёшь. Сын молчит — он и в садике пока молчит. Вы оба улыбаетесь кассирше одинаковой улыбкой.

Анимация: без анимации. Сцена: `supermarket`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a supermarket checkout, the cashier asking something, the man and boy smiling the same confused smile. Usual place, adapt if the moment says otherwise: portuguese supermarket aisle, a small "world foods" shelf with slavic products, person standing still looking at a small curd snack, fluorescent light, quiet loneliness.
```

#### `fig_obrigado__1.png` — «Записаться на курсы»

> Три раза в неделю по три часа. Через полгода — экзамен A1, ты сдаёшь. Понимать больше почти не стал, но теперь у тебя есть бумага, что ты понимаешь.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a portuguese class in the evening, the man at a desk among other immigrants. Usual place, adapt if the moment says otherwise: portuguese supermarket aisle, a small "world foods" shelf with slavic products, person standing still looking at a small curd snack, fluorescent light, quiet loneliness.
```

#### `fig_obrigado__2.png` — «Учить по приложению»

> Сова из приложения знает, где ты живёшь. Сова разочарована.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a language app owl on the phone screen looking disappointed. Usual place, adapt if the moment says otherwise: portuguese supermarket aisle, a small "world foods" shelf with slavic products, person standing still looking at a small curd snack, fluorescent light, quiet loneliness.
```

#### `fig_obrigado__3.png` — «Улыбнуться и кивнуть»

> Кассирша кивает в ответ и сама пробивает пакет. Кажется, вопрос был про пакет.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the cashier packing a bag herself, the man nodding. Usual place, adapt if the moment says otherwise: portuguese supermarket aisle, a small "world foods" shelf with slavic products, person standing still looking at a small curd snack, fluorescent light, quiet loneliness.
```

### `fig_chat.png`

> Чат «Русские в Фигейре» — восемьдесят человек. Продают велосипеды, ищут стоматолога и спорят про SEF. Но знакомятся всё равно не там, а на детской площадке.

Анимация: без анимации. Сцена: `phone_chat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone chat 'russians in figueira' with eighty members, the man scrolling. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

#### `fig_chat__1.png` — «Читать всё»

> Двадцать лайфхаков, три слуха и новость, что всё пропало. Лайфхаки противоречат друг другу.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man reading endless messages late at night. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

#### `fig_chat__2.png` — «Пойти на площадку»

> Пока дети делят горку, вы уже знаете друг о друге всё: откуда, когда, по какой статье. Все до странного дружелюбные, весёлые и свои. Сын находит друга. Ты — тоже.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a sunny playground, parents chatting, the boy making a friend on the slide. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

#### `fig_chat__3.png` — «Выйти из чата»

> Тишина. Никто не спорит про SEF у тебя в кармане. Через неделю ты возвращаешься — узнать, где купить творог.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the phone with the chat muted on the table. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

### `fig_utente.png`

> У сына болит ухо. Для врача нужен номер utente. В Фигейре его дают по справке о проживании из junta de freguesia — без лишних вопросов.

Анимация: без анимации. Сцена: `clinic`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a portuguese parish office, the man getting a residence certificate stamped. Usual place, adapt if the moment says otherwise: small private clinic reception in lisbon, white walls, azulejo tile strip, receptionist, patient with a scarf holding a throat, calm.
```

#### `fig_utente__1.png` — «Получить utente»

> Справка за день, номер за неделю. Ты не веришь, что бывает так просто. Потом, в Оэйраше, поверишь ещё меньше.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a health centre card being handed over. Usual place, adapt if the moment says otherwise: small private clinic reception in lisbon, white walls, azulejo tile strip, receptionist, patient with a scarf holding a throat, calm.
```

#### `fig_utente__2.png` — «Аптечка из Петербурга»

> Жена находит капли из Петербурга. Срок годности — до следующего года. Аптечка работает быстрее системы здравоохранения.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman finding ear drops in the old first aid pouch. Usual place, adapt if the moment says otherwise: small private clinic reception in lisbon, white walls, azulejo tile strip, receptionist, patient with a scarf holding a throat, calm.
```

#### `fig_utente__3.png` — «Частная клиника»

> Врач говорит, что это отит. Это стоит девяносто евро. Отит ничего не стоит.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a private clinic doctor examining the boy's ear. Usual place, adapt if the moment says otherwise: small private clinic reception in lisbon, white walls, azulejo tile strip, receptionist, patient with a scarf holding a throat, calm.
```

### `fig_colleagues.png`

> Коллеги жены — те самые, из-за которых вы выбрали Фигейру, — зовут в гости. Две семьи. Дети сразу уходят в другую комнату и пропадают там до ночи.

Анимация: мигают огоньки в верхних двух третях. Сцена: `friends_kitchen`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a warm portuguese living room, two families of the wife's colleagues, children disappearing into another room. Usual place, adapt if the moment says otherwise: crowded small kitchen at night, silhouettes of friends around a table with wine bottles and snacks, cigarette smoke near the window, fairy lights, warm but tired atmosphere. small lit windows or lamps scattered in the upper two thirds.
```

#### `fig_colleagues__1.png` — «Пойти с тортом»

> Говорите про садики, аренду и где тут нормальный творог. Взрослые смеются, дети строят шалаш из подушек. Впервые здесь кажется, что вас ждали.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: adults laughing at a table with a cake, children building a pillow fort. Usual place, adapt if the moment says otherwise: crowded small kitchen at night, silhouettes of friends around a table with wine bottles and snacks, cigarette smoke near the window, fairy lights, warm but tired atmosphere. small lit windows or lamps scattered in the upper two thirds.
```

#### `fig_colleagues__2.png` — «Сослаться на усталость»

> Жена идёт с сыном одна. Возвращаются поздно и счастливые. Ты сидишь в тишине, которой хотел. Она почему-то не радует.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man alone in a silent flat in the evening. Usual place, adapt if the moment says otherwise: crowded small kitchen at night, silhouettes of friends around a table with wine bottles and snacks, cigarette smoke near the window, fairy lights, warm but tired atmosphere.
```

#### `fig_colleagues__3.png` — «Позвать их к себе»

> Две семьи у вас в старой квартире с продувающими окнами. Все в свитерах, все смеются. Плесень в углу делает вид, что её нет.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the two families in sweaters squeezed into the old cold flat, laughing. Usual place, adapt if the moment says otherwise: crowded small kitchen at night, silhouettes of friends around a table with wine bottles and snacks, cigarette smoke near the window, fairy lights, warm but tired atmosphere.
```

### `fig_amanha.png`

> Посреди рабочего созвона гаснет свет. Электричество отключили: деньги за свет почему-то не списались с карты, а предупредить никто не счёл нужным. Ты платишь сразу. Включат — «amanhã».

Анимация: без анимации. Сцена: `flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the flat suddenly dark in the middle of a video call, the man frozen at the laptop. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

#### `fig_amanha__1.png` — «Ждать»

> Amanhã наступает через два дня. Ты работаешь из кафе с одной розеткой и учишься говорить «desculpe» тем, кто к ней тянется.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man working in a cafe at the only socket. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

#### `fig_amanha__2.png` — «Ехать к ним в офис»

> В офисе тебя внимательно выслушивают, всё понимают, сочувствуют и говорят: «amanhã». Amanhã — это не «завтра». Это философия.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a utility office clerk sympathetically saying 'amanhã'. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

#### `fig_amanha__3.png` — «Зажечь свечи»

> Вечер при свечах. Сын думает, что это праздник. Созвон ты переносишь на amanhã — ты тоже учишься.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family at a candlelit table, the boy delighted. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling. small lit windows or lamps scattered in the upper two thirds.
```

### `fig_mom_birthday.png`

> У мамы день рождения. Ты в очереди в Finanças: у тебя номерок A148, на табло — A62. Позвонить сейчас — значит поздравлять под объявления на португальском.

Анимация: без анимации. Сцена: `financas`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a finanças queue, the man holding ticket a148, the board showing a62. Usual place, adapt if the moment says otherwise: portuguese tax office waiting room, ticket number screen, long rows of chairs, people waiting with papers, tired clerk at a desk, greenish fluorescent light, bureaucratic comedy.
```

#### `fig_mom_birthday__1.png` — «Позвонить из очереди»

> Мама слышит объявление: «Ты где?» — «В налоговой, мам». — «Ну хоть не в тюрьме», — смеётся она. Ты тоже. На табло — A63.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man laughing into his phone in the queue. Usual place, adapt if the moment says otherwise: portuguese tax office waiting room, ticket number screen, long rows of chairs, people waiting with papers, tired clerk at a desk, greenish fluorescent light, bureaucratic comedy.
```

#### `fig_mom_birthday__2.png` — «Пусть внук поздравит вечером»

> Сын поёт бабушке «С днём рождения» на португальском. Бабушка ничего не понимает и плачет от счастья.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy singing happy birthday into a phone in the evening. Usual place, adapt if the moment says otherwise: portuguese tax office waiting room, ticket number screen, long rows of chairs, people waiting with papers, tired clerk at a desk, greenish fluorescent light, bureaucratic comedy.
```

#### `fig_mom_birthday__3.png` — «Записать видео от всех»

> Вечером вы втроём записываем видео: жена с тортом, сын с рисунком, ты с номерком A148 на память. Мама пересылает его всем подругам.

Анимация: конфетти падает.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family recording a video with a cake and a drawing. Usual place, adapt if the moment says otherwise: portuguese tax office waiting room, ticket number screen, long rows of chairs, people waiting with papers, tired clerk at a desk, greenish fluorescent light, bureaucratic comedy.
```

### `fig_sardines.png`

> Июнь, праздник Святого Жуана. На улицах жарят сардины, играет музыка, все бьют друг друга по голове пластиковыми молоточками. Это традиция. Сыну дают молоточек.

Анимация: мигают огоньки в верхних двух третях. Сцена: `figueira_street`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: são joão festival in figueira: sardines grilling, music, strings of lights, people bopping each other with plastic hammers. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon. small lit windows or lamps scattered in the upper two thirds.
```

#### `fig_sardines__1.png` — «Влиться»

> Сардины на хлебе, вино, музыка. Незнакомые люди стучат друг друга молоточками по голове и смеются. Сын стучит всех подряд, и все смеются ещё громче. Вы впервые на празднике, а не рядом с ним.

Анимация: конфетти падает.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family in the crowd with plastic hammers, laughing strangers. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon.
```

#### `fig_sardines__2.png` — «Посмотреть с балкона»

> Сверху всё видно: огни, дым, люди. Ты думаешь, что через год спустишься. Может быть.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple watching the festival from a balcony, smoke and lights below. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon. small lit windows or lamps scattered in the upper two thirds.
```

#### `fig_sardines__3.png` — «Пожарить сардины дома»

> Ты покупаешь сардины на рынке и жаришь их на балконе. Соседи снизу кричат «Bom apetite!». Квартира пахнет праздником ещё неделю.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man grilling sardines on the balcony, neighbours waving. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon. a steaming cup or pot near the center of the frame.
```

### `fig_ocean.png`

> Ты сидишь на мокром песке. Океан огромный и шумит. Где-то там, прямо, — Америка. Петербург — в другую сторону, за спиной. Батуми — тоже. Ты не оборачиваешься.

Анимация: блики на воде в нижней трети. Сцена: `ocean`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man sitting alone on wet sand facing the huge atlantic. Usual place, adapt if the moment says otherwise: atlantic ocean coast with rocks, figure sitting alone on a rock seen from behind looking at the horizon, big waves, overcast soft light, melancholic and vast. keep water in the lower third of the frame.
```

#### `fig_ocean__1.png` — «Посидеть ещё»

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man still sitting as the sun sets over the ocean. Usual place, adapt if the moment says otherwise: atlantic ocean coast with rocks, figure sitting alone on a rock seen from behind looking at the horizon, big waves, overcast soft light, melancholic and vast. keep water in the lower third of the frame.
```

### `fig_syrok.png`

> В отделе «Продукты мира» лежит сырок «Б.Ю. Александров». 4,99 €. Ты стоишь рядом. Долго. Сын спрашивает, что это. Ты не знаешь, как объяснить.

Анимация: без анимации. Сцена: `supermarket`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a 'world foods' supermarket shelf with a russian curd snack priced 4.99. Usual place, adapt if the moment says otherwise: portuguese supermarket aisle, a small "world foods" shelf with slavic products, person standing still looking at a small curd snack, fluorescent light, quiet loneliness.
```

#### `fig_syrok__1.png` — «Купить два»

> Сын пробует и говорит: «Ну такое». Ты доедаешь оба. Для него это просто сладкий творог. Для тебя — школьная перемена.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy tasting the snack with a 'meh' face, the man finishing both. Usual place, adapt if the moment says otherwise: portuguese supermarket aisle, a small "world foods" shelf with slavic products, person standing still looking at a small curd snack, fluorescent light, quiet loneliness.
```

#### `fig_syrok__2.png` — «Не покупать»

> Ты уходишь. Возвращаешься. Уходишь снова.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man walking away from the shelf and coming back. Usual place, adapt if the moment says otherwise: portuguese supermarket aisle, a small "world foods" shelf with slavic products, person standing still looking at a small curd snack, fluorescent light, quiet loneliness.
```

#### `fig_syrok__3.png` — «Сфотографировать маме»

> Фото: сырок на португальской полке, ценник 4,99. Мама отвечает: «Дорого!» — и тремя смеющимися смайликами.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone photo of the price tag sent to grandmother. Usual place, adapt if the moment says otherwise: portuguese supermarket aisle, a small "world foods" shelf with slavic products, person standing still looking at a small curd snack, fluorescent light, quiet loneliness.
```

### `fig_surf.png`

> Фигейра — город сёрферов. На пляже школа сёрфинга. Ты смотришь на волны, на гидрокостюмы, на свои тридцать с лишним.

Анимация: блики на воде в нижней трети. Сцена: `figueira_beach`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a surf school on figueira beach, wetsuits and boards in the sand, big waves. Usual place, adapt if the moment says otherwise: extremely wide empty sandy beach of figueira da foz, atlantic waves far away, a small boy running toward the ocean, seagulls, off-season grey-blue light, vast and quiet. keep water in the lower third of the frame.
```

#### `fig_surf__1.png` — «Записаться»

> Первые уроки ты в основном падаешь. Потом однажды встаёшь — на две секунды, но встаёшь. Океан холодный, а тебе хорошо как давно не было.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man standing on a surfboard for two seconds before falling. Usual place, adapt if the moment says otherwise: extremely wide empty sandy beach of figueira da foz, atlantic waves far away, a small boy running toward the ocean, seagulls, off-season grey-blue light, vast and quiet. keep water in the lower third of the frame.
```

#### `fig_surf__2.png` — «Смотреть с берега»

> Ты сидишь с сыном на песке и смотришь, как другие падают. Тоже хорошо. Но не так.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: father and son watching surfers from the sand. Usual place, adapt if the moment says otherwise: extremely wide empty sandy beach of figueira da foz, atlantic waves far away, a small boy running toward the ocean, seagulls, off-season grey-blue light, vast and quiet. keep water in the lower third of the frame.
```

#### `fig_surf__3.png` — «Купить доску с рук»

> Доска с OLX, с вмятиной и наклейкой «Peniche 2009». Своя. Теперь отступать некуда.

Анимация: чайки пролетают в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man carrying a dented second-hand surfboard home. Usual place, adapt if the moment says otherwise: extremely wide empty sandy beach of figueira da foz, atlantic waves far away, a small boy running toward the ocean, seagulls, off-season grey-blue light, vast and quiet. keep open sky in the upper part of the frame.
```

### `fig_mom_call.png`

> Мама звонит по видео. Сын показывает ей океан, садик и плесень в углу. Мама спрашивает, тепло ли вам.

Анимация: без анимации. Сцена: `phone_video`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a video call: the boy showing grandmother the ocean, the kindergarten and the mold in the corner. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `fig_mom_call__1.png` — ««Тепло, мам»»

> Ты держишь камеру так, чтобы угол с плесенью не попал в кадр. Мама говорит, что ты похудел. Это правда.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man angling the phone camera away from the moldy corner. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `fig_mom_call__2.png` — «Показать океан»

> Ты выходишь на набережную и показываешь маме Атлантику. Мама молчит. Потом говорит: «Красиво». И ещё раз: «Красиво».

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on the promenade showing the atlantic on the phone. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room. keep water in the lower third of the frame.
```

#### `fig_mom_call__3.png` — «Позвать маму в гости»

> «Летом», — говорит мама. «Летом», — повторяешь ты. Оба знаете, как это сейчас непросто. Оба всё равно смотрите билеты.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the grandmother on screen nodding 'in summer'. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

### `fig_low_nerves.png`

> Ты не спишь третью ночь. Третья страна за год, третий садик у сына, третий раз с нуля. Смотришь в потолок и считаешь документы вместо овец.

Анимация: без анимации. Сцена: `flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: 3 am, the man awake staring at the ceiling, document icons floating instead of sheep. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

#### `fig_low_nerves__1.png` — «Записаться к психологу»

> Психолог — тоже эмигрант. Первые десять минут вы просто молчите вместе. Это помогает.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a video session with a psychologist. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

#### `fig_low_nerves__2.png` — «Разбудить жену»

> Вы пьёте чай на кухне до рассвета. Она говорит: «Мы уже дважды справились». Ты считаешь — правда, дважды.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple with tea at the kitchen table at dawn. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling. a steaming cup or pot near the center of the frame.
```

#### `fig_low_nerves__3.png` — «Пойти к океану ночью»

> Океан шумит в темноте так же, как днём. Ему всё равно, сколько у тебя документов. Почему-то это помогает.

Анимация: мерцают звёзды в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man alone by the night ocean. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling. keep dark night sky in the upper part of the frame.
```

### `fig_low_money.png`

> На счету меньше, чем на два месяца аренды. Ты открываешь банковское приложение каждые полчаса, как будто там что-то вырастет.

Анимация: без анимации. Сцена: `flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a low balance on the phone, the man checking again. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

#### `fig_low_money__1.png` — «Взять фриланс»

> Сайт для местной сёрф-школы. Платят деньгами и бесплатными уроками для сына. Сын считает, что это лучший контракт в твоей жизни.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man building a website for a surf school, a surfboard leaning on the wall. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

#### `fig_low_money__2.png` — «Продать что-нибудь»

> Ты продаёшь наушники, велосипед и немного гордости. За гордость дают меньше всего.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: headphones and a bicycle being sold to a stranger. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

#### `fig_low_money__3.png` — «Попросить у мамы»

> Мама переводит деньги через три банка и соседку. Не спрашивает ни о чём. От этого хуже всего.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: money transfer notifications from mother. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

### `fig_urgencia.png`

> Зима. Вечером у сына под сорок, вы едете в urgência — приёмный покой. Его оставляют в больнице с температурой на два дня. Остаться с ним можно одному взрослому.

Анимация: без анимации. Сцена: `hospital`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a portuguese hospital emergency room at night, the boy feverish in his mother's arms. Usual place, adapt if the moment says otherwise: portuguese hospital emergency waiting room at night, number screen, tired parents with a sleeping child on a plastic chair, vending machine glow, quiet fluorescent light.
```

#### `fig_urgencia__1.png` — «Жена — первой ночью»

> Первую ночь с ним жена, вторую — ты. Узкая раскладушка, мигающий монитор, медсестра, которая говорит с сыном на португальском, а он отвечает ей на русском. Через два дня вас отпускают домой.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman on a narrow folding bed by the boy's hospital bed, a monitor blinking. Usual place, adapt if the moment says otherwise: portuguese hospital emergency waiting room at night, number screen, tired parents with a sleeping child on a plastic chair, vending machine glow, quiet fluorescent light. small lit windows or lamps scattered in the upper two thirds.
```

#### `fig_urgencia__2.png` — «Остаться самому»

> Первую ночь с ним ты, вторую — жена. Ты не спишь, слушаешь, как он дышит, и считаешь капли в капельнице. Через два дня — домой. Бесплатно. Ты всё равно пытаешься кому-то заплатить.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man awake by the hospital bed counting drops in the drip. Usual place, adapt if the moment says otherwise: portuguese hospital emergency waiting room at night, number screen, tired parents with a sleeping child on a plastic chair, vending machine glow, quiet fluorescent light. small lit windows or lamps scattered in the upper two thirds.
```

#### `fig_urgencia__3.png` — «Меняться днём»

> Днём вы меняетесь каждые четыре часа, такси туда-обратно. Медсёстры уже знают вас обоих. Сын — тоже: каждый раз радуется, как в первый.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple handing over at the hospital door with a taxi waiting. Usual place, adapt if the moment says otherwise: portuguese hospital emergency waiting room at night, number screen, tired parents with a sleeping child on a plastic chair, vending machine glow, quiet fluorescent light.
```

### `fig_friends.png`

> Шашлыки на пляже нельзя — только у озера, в специальном месте с мангалами. Туда съезжаются все, кого вы знаете по площадке. Дети носятся одной стаей. Говорите о садиках, SEF и где брать мясо. О главном — нет. Все и так всё знают.

Анимация: пар поднимается из центра. Сцена: `figueira_lake`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a lakeside picnic area among pine trees, barbecue grills smoking, families from the playground, kids in a pack. Usual place, adapt if the moment says otherwise: small calm lake among pine trees near figueira da foz, picnic area with stone barbecue grills, smoke rising, a few families at wooden tables, children running in a pack, warm late afternoon light. a steaming cup or pot near the center of the frame.
```

#### `fig_friends__1.png` — «Остаться до темноты»

> Под утро ты понимаешь, что эти люди — ваши. Не по паспорту. По тому, как вы молчите об одном и том же.

Анимация: мерцают звёзды в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the group by the lake after dark, embers glowing. Usual place, adapt if the moment says otherwise: small calm lake among pine trees near figueira da foz, picnic area with stone barbecue grills, smoke rising, a few families at wooden tables, children running in a pack, warm late afternoon light. keep dark night sky in the upper part of the frame.
```

#### `fig_friends__2.png` — «Уйти пораньше»

> Сын не хочет уходить. Ты тоже. Вы уходите, потому что завтра садик. Это и есть нормальная жизнь.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family leaving the picnic early, the boy looking back. Usual place, adapt if the moment says otherwise: small calm lake among pine trees near figueira da foz, picnic area with stone barbecue grills, smoke rising, a few families at wooden tables, children running in a pack, warm late afternoon light.
```

#### `fig_friends__3.png` — «Привезти пельмени»

> Ты привозишь на шашлыки пельмени в термосе. Это оказывается главным блюдом вечера. Шашлык обижен.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man opening a thermos of pelmeni, everyone crowding around. Usual place, adapt if the moment says otherwise: small calm lake among pine trees near figueira da foz, picnic area with stone barbecue grills, smoke rising, a few families at wooden tables, children running in a pack, warm late afternoon light. a steaming cup or pot near the center of the frame.
```

### `fig_niece_born.png`

> Сентябрь. Брат присылает фото: у него родилась дочка. Маленькая, красная, сердитая. Ты смотришь на неё через экран — за пять тысяч километров.

Анимация: без анимации. Сцена: `phone_video`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone photo of a newborn baby girl, the man looking at it. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `fig_niece_born__1.png` — «Позвонить по видео»

> Брат держит телефон так, чтобы племянница была в кадре. Сын машет ей с другой стороны Европы. Она спит и ничего не знает про границы.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a video call: the brother holding up the baby, the boy waving. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `fig_niece_born__2.png` — «Отправить фото сына»

> Сын держит рисунок: каракули и большое солнце. «Это для сестрёнки». Брат отвечает сердечком. Потом пишет: «Повешу над кроваткой».

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy holding up a drawing of a sun for his cousin. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `fig_niece_born__3.png` — «Пообещать приехать»

> «Приедем, как только сможем», — пишешь ты. Брат отвечает: «Знаю». Вы оба знаете, что «как только» — это не скоро.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man typing 'we will come' on his phone. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

### `fig_year_one.png`

> Год в Фигейре. У вас есть NIF, ключи, любимая пастелария и друзья, с которыми можно поехать на озеро. Сын говорит по-португальски чуть-чуть лучше вас обоих — и очень этим гордится. Вы здесь ещё не дома. Но уже и не в гостях.

Анимация: чайки пролетают в верхней части. Сцена: `ocean_sunset`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a golden sunset over figueira beach, the family sitting on the sand. Usual place, adapt if the moment says otherwise: wide atlantic beach at sunset, family of three (father, mother, small boy) sitting on the sand seen from behind, orange and pink sky, calm waves, feeling of quiet hope. keep open sky in the upper part of the frame.
```

#### `fig_year_one__1.png` — «Второй год»

Анимация: чайки пролетают в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family walking home along the promenade at dusk. Usual place, adapt if the moment says otherwise: wide atlantic beach at sunset, family of three (father, mother, small boy) sitting on the sand seen from behind, orange and pink sky, calm waves, feeling of quiet hope. keep open sky in the upper part of the frame.
```

### `fig_day.png`

> Обычная неделя в Фигейре: работа, школа, ветер с океана, «bom dia» соседям. Ты не замечаешь, как она проходит.

Анимация: чайки пролетают в верхней части. Сцена: `figueira_street`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an ordinary figueira week: laptop, kindergarten, ocean wind, neighbours saying bom dia. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon. keep open sky in the upper part of the frame.
```

#### `fig_day__1.png` — «Дальше»

Анимация: чайки пролетают в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the promenade with the ocean and seagulls. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon. keep open sky in the upper part of the frame.
```

## Фигейра-да-Фош, год 2

### `f2_card.png`

> Девять месяцев спустя из Порту приходит и твоя карточка ВНЖ. Последняя в семье. Пока она шла, SEF успели переименовать в AIMA, а сын — выучить португальский.

Анимация: без анимации. Сцена: `ctt_post`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a ctt envelope opened on the kitchen table, the man's residence card from porto inside. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

#### `f2_card__1.png` — «Сфотографировать все три»

> Три карточки на столе рядом. Фото уходит маме, брату и в чат. Чат отвечает тридцатью сердечками и одним «а мы ещё ждём». Ты знаешь, каково это.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: three residence cards lined up on the table, a phone taking a photo. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

#### `f2_card__2.png` — «Проверить фамилию»

> Фамилия написана правильно. Ты проверяешь ещё раз. И ещё. Правильно. Это подозрительно, но приятно.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man holding the card close to his eyes, checking the surname. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

#### `f2_card__3.png` — «Позвонить маме»

> «Мам, у меня карточка». — «Какая карточка?» — «Ну, ВНЖ». — «А, ну наконец-то». Мама рада так, будто это она девять месяцев ждала. Может, так и было.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on the phone with his mother, waving the card. Usual place, adapt if the moment says otherwise: portuguese post office counter with a red "CTT" sign, parcels on shelves, a box wrapped in tape with russian stickers, clerk behind the counter, sunny window.
```

### `f2_citizen_count.png`

> Ты открываешь калькулятор. Гражданство — через пять лет легального проживания. Прошло полтора. Осталось три с половиной. Ты ставишь напоминание в календарь. На дату через три с половиной года.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone calculator and a calendar reminder set three and a half years ahead. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `f2_citizen_count__1.png` — «Начать учить к экзамену A2»

> Учебник для экзамена на гражданство. Первая тема — «Моя семья». Ты пишешь: «Tenho uma mulher, um filho e um bolor chamado José».

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a portuguese exam textbook open at 'my family', a mold spot drawn in the margin. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `f2_citizen_count__2.png` — «Просто считать»

> Три с половиной года. Это меньше, чем вы прожили между Петербургом и этим днём. Звучит выполнимо.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man counting on his fingers by the window, the ocean outside. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen. keep water in the lower third of the frame.
```

#### `f2_citizen_count__3.png` — «Записаться на курсы A2»

> Снова три раза в неделю. В группе те же лица, что на A1, только увереннее. Ты тоже — немного.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an evening language class, the same faces as before, a bit more confident. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `f2_new_year.png`

> Новый год. В Петербурге полночь наступает в девять вечера по-вашему. В 21:00 вы с бокалами у ноутбука: мама, брат с женой и малышкой, куранты. В 00:00 — второй раз, с друзьями и португальским виноградом.

Анимация: конфетти падает. Сцена: `figueira_flat_party`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: new year's eve in the figueira flat: a laptop showing the family in saint petersburg with the kremlin chimes, glasses raised at 9 pm. Usual place, adapt if the moment says otherwise: small apartment new year's eve, laptop on the table showing a video call with grandmother and relatives, champagne glasses, a bowl of twelve grapes, friends in party hats, a boy in pajamas, fairy lights, cozy and bittersweet.
```

#### `f2_new_year__1.png` — «Встретить оба»

> Двенадцать виноградин на двенадцать ударов — португальская традиция. Ты загадываешь одно желание дважды. На всякий случай.

Анимация: конфетти падает.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: midnight, the family eating twelve grapes as fireworks burst over the ocean. Usual place, adapt if the moment says otherwise: small apartment new year's eve, laptop on the table showing a video call with grandmother and relatives, champagne glasses, a bowl of twelve grapes, friends in party hats, a boy in pajamas, fairy lights, cozy and bittersweet.
```

#### `f2_new_year__2.png` — «Только петербургский»

> В полночь по-местному вы уже спите. Сын просыпается от салюта и говорит: «Это второй Новый год?» Да, сынок. Теперь их всегда два.

Анимация: мерцают звёзды в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family asleep at midnight, the boy waking up to fireworks at the window. Usual place, adapt if the moment says otherwise: small apartment new year's eve, laptop on the table showing a video call with grandmother and relatives, champagne glasses, a bowl of twelve grapes, friends in party hats, a boy in pajamas, fairy lights, cozy and bittersweet. keep dark night sky in the upper part of the frame.
```

#### `f2_new_year__3.png` — «Только португальский»

> Петербургский Новый год вы пропускаете: сын спит, вы гуляете. Мама присылает фото стола с оливье. Ты смотришь на него дольше, чем хотел бы.

Анимация: конфетти падает.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple walking the promenade at night, fireworks over the sea. Usual place, adapt if the moment says otherwise: small apartment new year's eve, laptop on the table showing a video call with grandmother and relatives, champagne glasses, a bowl of twelve grapes, friends in party hats, a boy in pajamas, fairy lights, cozy and bittersweet.
```

### `f2_padel.png`

> Падел — главная игра всех уехавших. Корт, четыре ракетки, мяч, стенки. Жена делает великолепный замах — и попадает ракеткой себе по носу.

Анимация: без анимации. Сцена: `padel`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a padel court with glass walls, the woman swinging a racket and hitting her own nose. Usual place, adapt if the moment says otherwise: outdoor padel court with glass walls, woman holding a racket and her nose in surprise, man laughing and running to help, sunny afternoon, comic moment.
```

#### `f2_padel__1.png` — «В urgência»

> Шесть часов в коридоре: нос, лёд, телефон на десяти процентах. Потом врач смотрит пять минут и отпускает. Сделать ничего не сделали. Нос так и остался с историей.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a long hospital corridor, the woman holding ice to her nose, a phone at 10 percent. Usual place, adapt if the moment says otherwise: outdoor padel court with glass walls, woman holding a racket and her nose in surprise, man laughing and running to help, sunny afternoon, comic moment.
```

#### `f2_padel__2.png` — «Приложить лёд и доиграть»

> Она доигрывает сет. Вечером нос синий, и в urgência всё равно приходится ехать. Шесть часов ожидания, пять минут врача — и ничего не сделали. Зато сет.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman finishing the set with a bruised nose, raising her racket. Usual place, adapt if the moment says otherwise: outdoor padel court with glass walls, woman holding a racket and her nose in surprise, man laughing and running to help, sunny afternoon, comic moment.
```

#### `f2_padel__3.png` — «В частную клинику»

> Двадцать минут ожидания, рентген, «перелом без смещения, заживёт само». То же, что сказали бы в urgência, но за сто пятьдесят евро и без шести часов.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a private clinic x-ray screen showing a nose. Usual place, adapt if the moment says otherwise: outdoor padel court with glass walls, woman holding a racket and her nose in surprise, man laughing and running to help, sunny afternoon, comic moment.
```

### `f2_grandma.png`

> Мама пишет коротко: бабушки больше нет. Та, что совала деньги в карман и целовала сына в макушку. Последний раз ты видел её на свадьбе брата.

Анимация: без анимации. Сцена: `phone_video`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a short message on the man's phone, the man sitting very still by the window. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `f2_grandma__1.png` — «Достать её купюру»

> Купюра из её конверта лежит в альбоме — ты так её и не потратил. Ты долго держишь её в руках. Сын спрашивает, что это. «Это бабушкино».

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an old banknote from the grandmother's envelope held in the man's hands over the photo album. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `f2_grandma__2.png` — «Звонить маме каждый день»

> Каждый вечер, в одно и то же время. «Ну каждый день не надо», — говорит мама. И каждый вечер ждёт звонка с без пяти.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on the phone with his mother at the same time every evening. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `f2_grandma__3.png` — «Пересмотреть её танец»

> То видео со свадьбы брата: бабушка танцует, держась за тебя, и смеётся. Ты пересматриваешь его до утра. Она там живая. Она там всегда будет живая.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a wedding video on the phone: the tiny grandmother dancing, holding onto the man. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room. small lit windows or lamps scattered in the upper two thirds.
```

### `f2_niece.png`

> Брат присылает видео: племянница делает первые шаги. В руке у неё — плоский камень с батумского пляжа. Сын смотрит видео двенадцать раз.

Анимация: без анимации. Сцена: `phone_video`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone video of a baby girl taking first steps holding a flat pebble. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `f2_niece__1.png` — «Позвонить брату»

> Вы говорите час. Про детей, про папу, про дачу. Не про то, что между вами четыре тысячи километров и одна граница.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the brothers on a long video call, both smiling. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

### `f2_irs.png`

> Апрель. Первая португальская декларация — IRS. Ещё до этого вы с русским бухгалтером по видео пытались понять, как правильно выставлять recibo verde. Поняли друг друга примерно наполовину.

Анимация: без анимации. Сцена: `financas`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the portuguese tax portal on a laptop, a hundred fields, the man frowning. Usual place, adapt if the moment says otherwise: portuguese tax office waiting room, ticket number screen, long rows of chairs, people waiting with papers, tired clerk at a desk, greenish fluorescent light, bureaucratic comedy.
```

#### `f2_irs__1.png` — «Заполнить самому»

> Шесть вечеров, два видео на YouTube, один звонок другу в Алматы, который сделал то же самое. Отправлено. Налоговая молчит. Молчание — это хорошо?

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: six evenings of youtube tutorials and forms, coffee cups piling up. Usual place, adapt if the moment says otherwise: portuguese tax office waiting room, ticket number screen, long rows of chairs, people waiting with papers, tired clerk at a desk, greenish fluorescent light, bureaucratic comedy.
```

#### `f2_irs__2.png` — «Бразильский бухгалтер»

> Бразильский бухгалтер делает всё за вечер, объясняет на португальском, который ты почему-то понимаешь, и говорит, что у тебя возврат. Ты готов его обнять. Он сам тебя обнимает. Бразилия.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a brazilian accountant at his desk explaining with big gestures. Usual place, adapt if the moment says otherwise: portuguese tax office waiting room, ticket number screen, long rows of chairs, people waiting with papers, tired clerk at a desk, greenish fluorescent light, bureaucratic comedy.
```

#### `f2_irs__3.png` — «Подать вместе с женой»

> Совместная декларация: один вечер, два ноутбука, один спор про код 403. Отправлено. Вы снова команда — теперь и налоговая.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple filling the return together at two laptops. Usual place, adapt if the moment says otherwise: portuguese tax office waiting room, ticket number screen, long rows of chairs, people waiting with papers, tired clerk at a desk, greenish fluorescent light, bureaucratic comedy.
```

### `f2_kid_corrects.png`

> Собрание родителей в садике. Ты говоришь по-португальски медленно и с ошибками. Сын, не поднимая головы от планшета, поправляет тебя. Учительница одобрительно кивает. Ему.

Анимация: без анимации. Сцена: `figueira_school`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a parents' meeting at the kindergarten, the boy correcting his father's portuguese without looking up from a tablet. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

#### `f2_kid_corrects__1.png` — «Сказать «obrigado» сыну»

> Сын отвечает «de nada» таким тоном, будто занимается твоей интеграцией на общественных началах.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy saying 'de nada' with a serious face, the teacher nodding at him. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

### `f2_storm.png`

> Зимний шторм. Волны перелетают через набережную, пляж исчез. Вы втроём стоите у окна. Сын говорит, что Атлантика злится. Ты говоришь, что она просто большая.

Анимация: дождь по всему кадру. Сцена: `ocean`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a winter storm: waves crashing over the figueira promenade, the family watching from the window. Usual place, adapt if the moment says otherwise: atlantic ocean coast with rocks, figure sitting alone on a rock seen from behind looking at the horizon, big waves, overcast soft light, melancholic and vast.
```

#### `f2_storm__1.png` — «Смотреть вместе»

Анимация: дождь по всему кадру.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: three silhouettes at the window, the boy pointing at the angry atlantic. Usual place, adapt if the moment says otherwise: atlantic ocean coast with rocks, figure sitting alone on a rock seen from behind looking at the horizon, big waves, overcast soft light, melancholic and vast.
```

### `f2_mom_call.png`

> Вечерний звонок маме. Сын показывает ей рисунки, жена — новый нос, ты — океан из окна. Мама рассказывает про соседей, про цены, про сериал. Час проходит как пять минут.

Анимация: без анимации. Сцена: `phone_video`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an evening video call, the boy showing drawings, the woman showing her healed nose, the ocean in the window. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `f2_mom_call__1.png` — ««До завтра, мам»»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the call ending with everyone waving goodbye. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

### `f2_mom_visit.png`

> Мама прилетает в Фигейру. После Батуми она уже опытная путешественница: пересадка, паспортный контроль, «obrigada» на выходе. Чемодан, как всегда, наполовину ваш: сырки, гречка, носки внуку.

Анимация: без анимации. Сцена: `airport_arrivals`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the arrivals hall at lisbon airport, the grandmother with a suitcase full of gifts, the boy hesitating. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary.
```

#### `f2_mom_visit__1.png` — «Показать всё за неделю»

> Океан, пастелария, садик, озеро, Коимбра. Мама устаёт к среде, но не признаётся. В пятницу она говорит: «Ну теперь я хоть знаю, где вы». И это важнее всего, что ты показал.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the grandmother tired but proud on a bench in coimbra. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary.
```

#### `f2_mom_visit__2.png` — «Просто быть дома»

> Никаких экскурсий. Мама варит суп, сын не отходит от неё, ты работаешь, слыша их на кухне. Как будто вы снова в Петербурге — только за окном океан.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the grandmother cooking soup in the old flat, the boy hugging her leg. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary. a steaming cup or pot near the center of the frame.
```

#### `f2_mom_visit__3.png` — «Оставить ей внука на вечер»

> Вы с женой впервые за год идёте в ресторан вдвоём. Возвращаетесь — сын спит, мама смотрит португальский сериал без перевода и всё понимает. Говорит, что всё.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple at a restaurant table alone, candles. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary. small lit windows or lamps scattered in the upper two thirds.
```

### `f2_inlaws_visit.png`

> Прилетают родители жены. Тесть первым делом обходит Пежо, стучит по колесу и молчит так выразительно, что слов не нужно. Тёща сразу забирает внука — и больше вы его до вечера не видите.

Анимация: без анимации. Сцена: `airport_arrivals`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the father-in-law walking around the battered peugeot, kicking a tyre. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary.
```

#### `f2_inlaws_visit__1.png` — «Дать тестю порулить»

> Тесть ведёт Пежо вдоль океана и одобрительно кивает на панорамную крышу. «Машина нормальная, — говорит он. — Побитая, но нормальная». Высшая оценка.

Анимация: чайки пролетают в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the father-in-law driving the peugeot along the ocean road, nodding at the glass roof. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary. keep open sky in the upper part of the frame.
```

#### `f2_inlaws_visit__2.png` — «Выспаться наконец»

> Неделю вы спите до восьми. Внук гуляет с бабушкой и дедушкой по набережной и возвращается с полными карманами ракушек. Вы не помните, когда в последний раз так высыпались.

Анимация: чайки пролетают в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the grandparents walking the boy on the promenade, pockets full of shells. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary. keep open sky in the upper part of the frame.
```

#### `f2_inlaws_visit__3.png` — «Устроить ужин для всех»

> Коллеги жены, друзья с площадки, родители — все в вашей продуваемой квартире. Тесть рассказывает анекдоты, которые никто не понимает, кроме вас. Все смеются.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a crowded dinner in the old flat with colleagues, friends and grandparents. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary. small lit windows or lamps scattered in the upper two thirds.
```

### `f2_inlaws_malaga.png`

> Лето 2024-го. Родители жены прилетают снова — они приезжают раз-два в год. Атлантика им холодная, поэтому решаете все вместе: едем в Малагу, купаться в нормальном море.

Анимация: блики на воде в нижней трети. Сцена: `malaga_beach`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a warm mediterranean beach in malaga with the grandparents under an umbrella. Usual place, adapt if the moment says otherwise: warm mediterranean beach in malaga, white hillside town behind, turquoise calm sea, a family with grandparents under a striped umbrella, a boy in armbands running into the water, bright midday sun. keep water in the lower third of the frame.
```

#### `f2_inlaws_malaga__1.png` — «Купаться до заката»

> Тесть плывёт до буйка и обратно, как в молодости. Сын — за ним, в нарукавниках. Тёща под зонтом командует с берега. Тёплое море на всех.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the father-in-law swimming to a buoy, the boy in armbands following. Usual place, adapt if the moment says otherwise: warm mediterranean beach in malaga, white hillside town behind, turquoise calm sea, a family with grandparents under a striped umbrella, a boy in armbands running into the water, bright midday sun. keep water in the lower third of the frame.
```

#### `f2_inlaws_malaga__2.png` — «Оставить сына с ними»

> Вы с женой на целый день уходите вдвоём: старый город, крепость, тапас. Вечером сын загорелый и абсолютно счастливый. Бабушка с дедушкой — уставшие и тоже.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple alone in malaga old town eating tapas. Usual place, adapt if the moment says otherwise: warm mediterranean beach in malaga, white hillside town behind, turquoise calm sea, a family with grandparents under a striped umbrella, a boy in armbands running into the water, bright midday sun. small lit windows or lamps scattered in the upper two thirds.
```

#### `f2_inlaws_malaga__3.png` — «Лететь лоукостером»

> Ручная кладь сорок на тридцать, тёща упаковывает в неё неделю жизни. Тесть ругает авиакомпанию по-русски, стюардесса понимающе кивает. Через два часа — Малага.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the grandmother squeezing a week of things into a tiny cabin bag at the airport. Usual place, adapt if the moment says otherwise: warm mediterranean beach in malaga, white hillside town behind, turquoise calm sea, a family with grandparents under a striped umbrella, a boy in armbands running into the water, bright midday sun.
```

#### `f2_inlaws_malaga__4.png` — «Ехать на Пежо»

> Пятеро в побитом Пежо, девять часов через всю Испанию. Тесть комментирует каждый обгон, панорамная крыша показывает всё испанское небо. Доехали. Пежо — герой.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: five people in the battered peugeot on a spanish highway, the sky through the glass roof. Usual place, adapt if the moment says otherwise: warm mediterranean beach in malaga, white hillside town behind, turquoise calm sea, a family with grandparents under a striped umbrella, a boy in armbands running into the water, bright midday sun.
```

### `f2_low_nerves.png`

> Ты не спишь третью ночь. Всё вроде бы получилось: документы, работа, садик. А ты сидишь на кухне в три утра и не понимаешь, почему так тяжело.

Анимация: без анимации. Сцена: `flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: 3 am in the kitchen, the man alone with tea, everything done but heavy. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

#### `f2_low_nerves__1.png` — «Записаться к психологу»

> Психолог говорит, что это нормально: два года выживания, потом тело понимает, что можно расслабиться, — и разваливается. Это странным образом успокаивает.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a psychologist on a video call explaining with calm hands. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

#### `f2_low_nerves__2.png` — «Разбудить жену»

> Вы пьёте чай до рассвета. Она говорит: «Мы уже трижды справились». Ты считаешь — правда, трижды.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple with tea at dawn. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling. a steaming cup or pot near the center of the frame.
```

#### `f2_low_nerves__3.png` — «Сходить на падел»

> Два часа бегать за мячом и ни о чём не думать. Жена играет в защитных очках. Ты смеёшься впервые за неделю.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple playing padel laughing, the woman in safety goggles. Usual place, adapt if the moment says otherwise: small rented lisbon apartment room, mattress with a thin blanket, laptop on a box used as a table, a few books on a shelf, black mold spot in the corner of the ceiling, window with terracotta rooftops, evening, lived-in but temporary feeling.
```

### `f2_low_money.png`

> На счету меньше, чем на два месяца аренды. Ты снова открываешь банковское приложение каждые полчаса.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone with a low balance on the kitchen table. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `f2_low_money__1.png` — «Взять фриланс»

> Сайт для сёрф-школы и бесплатные уроки для сына. Сын считает, что это лучший контракт в твоей жизни.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man building a surf school website, the boy with a bodyboard. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `f2_low_money__2.png` — «Продать что-нибудь»

> Ты продаёшь велосипед, наушники и немного гордости. За гордость дают меньше всего.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a bicycle and headphones sold to a stranger. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `f2_low_money__3.png` — «Сдать гараж»

> Сосед ставит в ваш гараж свою лодку. Лодка больше, чем ваша машина. Сто евро в месяц — немного, но стабильно.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a neighbour's small boat parked in the family's garage. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `f2_move_decision.png`

> Два года в Фигейре. Здесь спокойно, океан, друзья. Но сыну пора в школу, а билингвальные — только под Лиссабоном. Жена открывает ту самую вкладку, которая висела открытой полгода.

Анимация: без анимации. Сцена: `figueira_school`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman opening the long-open school tab, the couple at the table at night. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

#### `f2_move_decision__1.png` — «Переезжаем в Оэйраш»

> Третий переезд за три года. Чемоданы вы уже не покупаете — они просто живут на шкафу в ожидании.

Анимация: пылинки медленно плывут.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: suitcases taken down from the top of a wardrobe. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

#### `f2_move_decision__2.png` — «Ещё год здесь»

> Вы честно пытаетесь. Через месяц сын приходит с вопросом «а почему я не говорю, как в YouTube?». Вы переезжаете в Оэйраш.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy asking a question at dinner, the couple looking at each other. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

#### `f2_move_decision__3.png` — «Сначала съездить посмотреть»

> Вы едете в Оэйраш на выходные: школа, улицы, океан. Сын бегает по школьному двору и не хочет уходить. Решение принимается без слов.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family on a weekend visit to a school yard in oeiras, the boy running. Usual place, adapt if the moment says otherwise: small portuguese public school yard, kids in hoodies, a teacher at the gate, a boy with a backpack holding his father's hand, azulejo wall with a school emblem (no text), morning.
```

### `f2_day.png`

> Обычная неделя в Фигейре: работа, садик, падел, «bom dia» соседям. Ты замечаешь, что больше не переводишь цены в рубли.

Анимация: чайки пролетают в верхней части. Сцена: `figueira_street`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an ordinary figueira week: padel, kindergarten, 'bom dia' to neighbours. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon. keep open sky in the upper part of the frame.
```

#### `f2_day__1.png` — «Дальше»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a price tag in euros, no longer converted. Usual place, adapt if the moment says otherwise: small portuguese seaside town street, white houses with blue azulejo trim, an old 15-year-old hatchback car parked, a bus stop, palm tree, windy afternoon.
```

## Оэйраш

### `oei_renewal.png`

> Пора продлевать вид на жительство. Теперь — в AIMA. Нужна запись: сдать биометрию заново. Слотов нет. На сайте нет, по телефону нет. В чатах есть, но за деньги.

Анимация: без анимации. Сцена: `aima`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an aima website showing no appointments, the man on hold on the phone. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `oei_renewal__1.png` — «Звонить на горячую линию»

> Музыка ожидания. Сорок минут. Потом гудки. Сын выучил эту мелодию и напевает её в садике.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man with a phone on speaker playing hold music, the boy humming along. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `oei_renewal__2.png` — «Нанять юриста»

> Юрист говорит: «Сделаем». Юрист покупает новую машину.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a lawyer saying 'we'll do it', a new car keychain on his desk. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `oei_renewal__3.png` — «Написать в книгу жалоб»

> Livro de Reclamações — самое мощное оружие Португалии. Говорят, помогает. Говорят, через месяц.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man writing in a complaint book at a counter. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

### `oei_arrive.png`

> Оэйраш. Океан, пальмы, белые дома и аренда 1500 € — вдвое дороже Фигейры. Квартиру ты снял летом и проверил дорогу до школы: тридцать минут. Лето, все в отпусках. Ты ещё не знаешь, что такое сентябрь.

Анимация: чайки пролетают в верхней части. Сцена: `oeiras_street`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: oeiras: palm trees, white houses, the ocean, the family arriving with suitcases in summer. Usual place, adapt if the moment says otherwise: oeiras seaside promenade near lisbon, white modern buildings, palm trees, atlantic ocean, a dark bmw parked, evening traffic toward lisbon, golden light. keep open sky in the upper part of the frame.
```

#### `oei_arrive__1.png` — «Распаковать чемоданы»

> В этот раз вы распаковываете всё. Даже камень из Батуми и серого кота. Даже то, что «потом».

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: everything unpacked: the batumi stone and the grey plush cat on a shelf. Usual place, adapt if the moment says otherwise: oeiras seaside promenade near lisbon, white modern buildings, palm trees, atlantic ocean, a dark bmw parked, evening traffic toward lisbon, golden light.
```

### `oei_school_fee.png`

> Счёт из школы: девятьсот в месяц, пока сын ещё в садике при ней. Плюс аренда. Ты открываешь письмо, закрываешь письмо, открываешь банк, закрываешь банк. Сын в это время рассказывает что-то по-английски. Ладно.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a school invoice email on the phone, the boy chatting in english in the background. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `oei_school_fee__1.png` — «Оплатить»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man paying on his phone with a sigh. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `oei_school.png`

> Сентябрь. Все вернулись из отпусков, и дорога в школу — туда и обратно — теперь минимум час двадцать. Зато школа: половина дня на португальском, половина на английском, в классе дети из десятка с лишним стран. Сын приходит домой и молчит. Потом говорит: «Тут все немножко как я».

Анимация: без анимации. Сцена: `oeiras_school`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a september traffic jam on the road to lisbon, then a bilingual school yard with kids from many countries. Usual place, adapt if the moment says otherwise: modern bilingual school yard, kids from many countries in uniforms, a boy laughing with friends, flags of different countries on a wall (no text), bright morning.
```

#### `oei_school__1.png` — «Обнять»

> Ради этой фразы стоило переехать. Ты не говоришь этого вслух. Жена тоже. Вы просто переглядываетесь.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man hugging the boy after his first school day. Usual place, adapt if the moment says otherwise: modern bilingual school yard, kids from many countries in uniforms, a boy laughing with friends, flags of different countries on a wall (no text), bright morning.
```

### `oei_sporting.png`

> Одноклассники сына делятся на «Бенфику» и «Спортинг». Нейтралитет невозможен: это Лиссабон. А сын как раз начал ходить на футбол при школе — и секция там «Спортинга».

Анимация: без анимации. Сцена: `stadium`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: school kids split into red benfica and green-white sporting, the boy in a sporting football kit. Usual place, adapt if the moment says otherwise: huge football stadium in green and white colors, crowd with scarves raised, father and boy in green-white striped scarves singing, floodlights, evening match.
```

#### `oei_sporting__1.png` — «Карточки болельщиков»

> Две клубные карточки — на тебя и на сына. Зелёно-белые шарфы, «Алвалади», сорок тысяч человек поют, и вы двое — тоже, не зная слов. Ты впервые в Португалии свой среди сорока тысяч.

Анимация: конфетти падает.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: father and son with green-white scarves in the roaring alvalade stadium. Usual place, adapt if the moment says otherwise: huge football stadium in green and white colors, crowd with scarves raised, father and boy in green-white striped scarves singing, floodlights, evening match.
```

#### `oei_sporting__2.png` — «Сначала на его игру»

> Субботнее утро, бровка, родители кричат по-португальски. Сын в зелёно-белой форме бежит не в ту сторону, потом в ту. После игры он спрашивает: «А на большой стадион пойдём?» Через неделю у вас две клубные карточки.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a saturday morning youth football match, the boy running the wrong way. Usual place, adapt if the moment says otherwise: huge football stadium in green and white colors, crowd with scarves raised, father and boy in green-white striped scarves singing, floodlights, evening match.
```

#### `oei_sporting__3.png` — ««Мы за Фигейру»»

> Сын смотрит на тебя как на предателя. Через месяц у него всё равно форма «Спортинга». У тебя — нет. Пока.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy looking at his father like a traitor, a sporting shirt on the chair. Usual place, adapt if the moment says otherwise: huge football stadium in green and white colors, crowd with scarves raised, father and boy in green-white striped scarves singing, floodlights, evening match.
```

### `oei_sporting_match.png`

> Матч «Спортинга». Сын знает все кричалки, ты — две. Вы проигрываете в последнюю минуту, и сорок тысяч человек вздыхают вместе с вами.

Анимация: мигают огоньки в верхних двух третях. Сцена: `stadium`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a sporting match at night, father and son singing, the stadium lights. Usual place, adapt if the moment says otherwise: huge football stadium in green and white colors, crowd with scarves raised, father and boy in green-white striped scarves singing, floodlights, evening match. small lit windows or lamps scattered in the upper two thirds.
```

#### `oei_sporting_match__1.png` — ««В следующий раз!»»

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: forty thousand people sighing after a last-minute goal against. Usual place, adapt if the moment says otherwise: huge football stadium in green and white colors, crowd with scarves raised, father and boy in green-white striped scarves singing, floodlights, evening match. small lit windows or lamps scattered in the upper two thirds.
```

### `oei_accident.png`

> Старая машина из Фигейры, два с половиной года верной службы. Мокрая дорога, ты один, не успел затормозить — и въехал. Не сильно. Ты цел. Машина — уже нет.

Анимация: дождь по всему кадру. Сцена: `oeiras_street`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the old peugeot with a crumpled bonnet on a wet road in oeiras, the man alone beside it. Usual place, adapt if the moment says otherwise: oeiras seaside promenade near lisbon, white modern buildings, palm trees, atlantic ocean, a dark bmw parked, evening traffic toward lisbon, golden light.
```

#### `oei_accident__1.png` — «Продать как есть»

> Тысяча евро. За семь купили. Ты гладишь её по рулю в последний раз. Следующие недели вы ездите на арендованных: каждую неделю новая машина, и сын каждый раз спрашивает, где наша.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man touching the steering wheel of the peugeot for the last time, a buyer counting euros. Usual place, adapt if the moment says otherwise: oeiras seaside promenade near lisbon, white modern buildings, palm trees, atlantic ocean, a dark bmw parked, evening traffic toward lisbon, golden light.
```

### `oei_bmw.png`

> Несколько недель аренды спустя — автосалон. Ты, человек, который в Батуми считал каждый лари, а в Фигейре ездил на побитом Пежо, смотришь на белую BMW 320d Touring 2023 года. В кредит. Менеджер говорит: «Вы это заслужили». Звучит подозрительно убедительно.

Анимация: мигают огоньки в верхних двух третях. Сцена: `car_dealer`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a car dealership, a white bmw 320d touring under spotlights, a salesman smiling. Usual place, adapt if the moment says otherwise: car dealership showroom, shiny dark bmw under spotlights, salesman with a contract, father looking tempted and guilty, comic. small lit windows or lamps scattered in the upper two thirds.
```

#### `oei_bmw__1.png` — «Взять BMW в кредит»

> Ты подписываешь договор и чувствуешь себя одновременно взрослым и безответственным. Сын в восторге. Жена считает платежи. Вы оба правы.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man signing a loan contract, the boy hugging the car. Usual place, adapt if the moment says otherwise: car dealership showroom, shiny dark bmw under spotlights, salesman with a contract, father looking tempted and guilty, comic. small lit windows or lamps scattered in the upper two thirds.
```

#### `oei_bmw__2.png` — «Взять что-то попроще»

> Ты держишься в салоне десять минут. Потом берёшь BMW. В кредит. Это не слабость. Это интеграция в португальскую банковскую систему.

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man walking out of the showroom with bmw keys after ten minutes. Usual place, adapt if the moment says otherwise: car dealership showroom, shiny dark bmw under spotlights, salesman with a contract, father looking tempted and guilty, comic. small lit windows or lamps scattered in the upper two thirds.
```

#### `oei_bmw__3.png` — «Подержанный универсал»

> Ты берёшь пятилетний универсал без кредита. Сын разочарован. Банк тоже: кредитной истории у тебя по-прежнему нет.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a plain used estate car parked in the street, the boy disappointed. Usual place, adapt if the moment says otherwise: car dealership showroom, shiny dark bmw under spotlights, salesman with a contract, father looking tempted and guilty, comic.
```

### `oei_pregnancy.png`

> Жена выходит из ванной с полоской в руке и лицом, на котором одновременно счастье, ужас и вопрос «а где мы её будем растить».

Анимация: без анимации. Сцена: `oeiras_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman coming out of the bathroom with a pregnancy test, her face both happy and scared. Usual place, adapt if the moment says otherwise: modern rented apartment near lisbon, baby crib next to a desk with a laptop, a pregnancy test on the bathroom shelf in the background, warm evening light.
```

#### `oei_pregnancy__1.png` — «Обрадоваться»

> Ты радуешься. Потом считаешь деньги. Потом снова радуешься. Сын требует брата. Ему объясняют, что так не заказывают. Будет сестра.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man laughing and then counting money on his fingers, the boy demanding a brother. Usual place, adapt if the moment says otherwise: modern rented apartment near lisbon, baby crib next to a desk with a laptop, a pregnancy test on the bathroom shelf in the background, warm evening light.
```

#### `oei_pregnancy__2.png` — «Сесть на пол»

> Ты садишься на пол. Жена садится рядом. Через минуту вы смеётесь. Через две — плачете. Через три — выбираете имя.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple sitting on the floor together laughing and crying. Usual place, adapt if the moment says otherwise: modern rented apartment near lisbon, baby crib next to a desk with a laptop, a pregnancy test on the bathroom shelf in the background, warm evening light.
```

#### `oei_pregnancy__3.png` — «Сразу позвонить маме»

> Жена делает страшные глаза: «Рано!» Поздно. Мама уже плачет, смеётся и спрашивает, какого цвета покупать коляску.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on the phone, the woman making a horrified face. Usual place, adapt if the moment says otherwise: modern rented apartment near lisbon, baby crib next to a desk with a laptop, a pregnancy test on the bathroom shelf in the background, warm evening light.
```

### `oei_law_change.png`

> До родов три месяца. В чате новость: закон о гражданстве изменили. Дети иностранцев, родившиеся в Португалии, больше не получают гражданство при рождении. Ваша дочка ещё не родилась, а уже опоздала.

Анимация: без анимации. Сцена: `phone_chat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone chat with news about a citizenship law change, the man reading in the dark. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

#### `oei_law_change__1.png` — «Перечитать закон»

> Ты читаешь закон трижды, с переводчиком и юристом из чата. Всё правильно поняли. Ты закрываешь ноутбук и идёшь гладить живот жены. «Ничего, — говоришь ты дочке. — Мы тоже не местные».

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man reading a law on the laptop three times. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

#### `oei_law_change__2.png` — «Не говорить жене»

> Ты держишься один вечер. Она узнаёт из того же чата. «Ты знал?» — «Час». Вы молчите вместе. Это всё равно лучше, чем по отдельности.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman asking 'did you know?', both silent at the table. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

#### `oei_law_change__3.png` — «Подписать петицию»

> Петиция против изменений: сорок тысяч подписей, твоя — где-то в середине. Закон не отменят. Но ты сделал что мог.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an online petition with many signatures. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

### `oei_daughter_born.png`

> Июль. Родилась дочка. Твой нос и мамины брови. Гражданства у неё нет. Ей всё равно — она спит. Сын в это время дома с бабушкой и дедушкой, а вечером держит сестру на руках и говорит: «Я научу её кидать камни».

Анимация: без анимации. Сцена: `hospital`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a maternity ward in july, a newborn girl asleep, the boy holding her carefully. Usual place, adapt if the moment says otherwise: portuguese hospital emergency waiting room at night, number screen, tired parents with a sleeping child on a plastic chair, vending machine glow, quiet fluorescent light.
```

#### `oei_daughter_born__1.png` — «Сфотографировать их вдвоём»

> Это фото потом будет стоять на полке рядом с камнем из Батуми и серым котом. Музей переезда пополнился главным экспонатом.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a photo of brother and sister on a shelf next to the batumi stone and the grey cat. Usual place, adapt if the moment says otherwise: portuguese hospital emergency waiting room at night, number screen, tired parents with a sleeping child on a plastic chair, vending machine glow, quiet fluorescent light.
```

#### `oei_daughter_born__2.png` — «Позвонить маме»

> Мама плачет так, что видео зависает. Когда связь возвращается, она уже придумала, что свяжет внучке. Носки. Конечно, носки.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a video call with the grandmother crying, the screen freezing. Usual place, adapt if the moment says otherwise: portuguese hospital emergency waiting room at night, number screen, tired parents with a sleeping child on a plastic chair, vending machine glow, quiet fluorescent light.
```

#### `oei_daughter_born__3.png` — «Подержать её первым»

> Акушерка кладёт её тебе на руки, пока жену зашивают. Она открывает глаза и смотрит на тебя так, будто проверяет документы. Ты проходишь.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a midwife placing the baby in the man's arms, the baby looking at him. Usual place, adapt if the moment says otherwise: portuguese hospital emergency waiting room at night, number screen, tired parents with a sleeping child on a plastic chair, vending machine glow, quiet fluorescent light.
```

### `oei_daughter_docs.png`

> Дочке нужен вид на жительство. Она родилась здесь, но для AIMA она иностранка, как и вы. Ближайшая подача — в апреле. Ей будет девять месяцев. Сын слышит из соседней комнаты музыку горячей линии и начинает насвистывать.

Анимация: без анимации. Сцена: `aima`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on hold with aima, holding the baby, hold music. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `oei_daughter_docs__1.png` — «Звонить каждый день»

> Ты звонишь, держа дочку на руках. Она засыпает под музыку ожидания AIMA. Хоть кому-то она нравится.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the baby asleep on the man's chest to the hold music. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `oei_daughter_docs__2.png` — «Юрист»

> Юрист — тот же, что в Фигейре. «О, вы снова!» Он рад. Он помнит твою фамилию лучше, чем AIMA.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the same lawyer from figueira welcoming them warmly. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `oei_daughter_docs__3.png` — «Спросить в чате»

> В чате у трёх семей та же история. Одна уже прошла. Присылает список документов с пометкой «и копию всего, даже копии».

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a chat message with a list of documents. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

### `oei_daughter_aima.png`

> Апрель. Подача на ВНЖ для дочки. Ей девять месяцев. Сотрудница просит, чтобы на фото она смотрела в камеру. Дочка смотрит на твои ключи. Попытка семь.

Анимация: без анимации. Сцена: `aima`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an aima office, a clerk trying to photograph a nine-month-old baby looking at keys. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `oei_daughter_aima__1.png` — «Потрясти ключами»

> Ключи над камерой, щелчок — и вот она, в анфас, очень серьёзная. «Parabéns». Дочке девять месяцев, и у неё уже есть дело в AIMA.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: keys jingling above the camera, the baby staring seriously into the lens. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

### `oei_legoland.png`

> Ты обещал сыну Леголенд. Вы летите вдвоём: три дня в Копенгагене, потом на арендованном Ситроене — в Биллунн. Жена остаётся дома «отдыхать от вас обоих».

Анимация: чайки пролетают в верхней части. Сцена: `legoland`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: copenhagen harbour with colourful houses, father and son with backpacks. Usual place, adapt if the moment says otherwise: colorful theme park made of giant toy bricks, father and small boy on a roller coaster with hands up, bright summer day, pure joy. keep open sky in the upper part of the frame.
```

#### `oei_legoland__1.png` — «Лететь»

> Копенгаген, русалочка размером с ладонь, хот-доги. Потом трасса, Ситроен и Биллунн: двенадцать раз на одних и тех же горках. Сын говорит, что это лучшие дни в его жизни. Ты думаешь — в твоей тоже.

Анимация: конфетти падает.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: father and son on a roller coaster at legoland, hands up. Usual place, adapt if the moment says otherwise: colorful theme park made of giant toy bricks, father and small boy on a roller coaster with hands up, bright summer day, pure joy.
```

#### `oei_legoland__2.png` — «Отложить до лета»

> Сын не спорит. Сын вычёркивает дни в календаре. Ты не выдерживаешь на третий вычеркнутый день и покупаешь билеты.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy crossing days off a calendar. Usual place, adapt if the moment says otherwise: colorful theme park made of giant toy bricks, father and small boy on a roller coaster with hands up, bright summer day, pure joy.
```

#### `oei_legoland__3.png` — «Взять и жену»

> Втроём: Копенгаген, Ситроен, Биллунн. Жена катается на тех же горках двенадцать раз и признаёт, что «отдыхать от вас» было бы скучнее.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the whole family in a rented citroën on a danish road. Usual place, adapt if the moment says otherwise: colorful theme park made of giant toy bricks, father and small boy on a roller coaster with hands up, bright summer day, pure joy.
```

### `oei_father.png`

> Восемь утра. Звонит мама. Они с папой давно в разводе, но полиция позвонила ей. Папа был у своей мамы в Надвоицах. Сердце.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: 8 am, the man in the kitchen with the phone, his mother's name on the screen. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `oei_father__1.png` — «Лететь»

> Жена ищет билеты, пока ты сидишь на кухне. Вечером ты уже летишь через Дубай. Сын приносит тебе серого кота. Молча. Ему никто ничего не объяснял.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman looking for tickets while the man sits at the kitchen table, the boy bringing him the grey plush cat. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `oei_father__2.png` — «Вспомнить тот звонок»

> Ты вспоминаешь, как звал его с собой, а он смеялся: «Куда я поеду, у меня тут гараж». Он так и не приехал. Теперь едешь ты — к нему.

Анимация: падающий снег.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man remembering: a row of old garages under snow. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `oei_father_trip.png`

> Петербург. Брат встречает тебя, и вы на его машине едете на север, в Надвоицы: справки, похоронное бюро, бумаги. Потом — в Мончегорск, где папа жил. Конец мая, а там лежит снег.

Анимация: падающий снег. Сцена: `car`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the brothers driving north from saint petersburg to karelia, snow at the end of may along the road. Usual place, adapt if the moment says otherwise: small rental car on a winding mountain road in georgia, green mountains, low clouds, view from behind the car, a toddler asleep in a child seat visible through the rear window, early spring, calm road-trip mood.
```

#### `oei_father_trip__1.png` — «Разобрать его квартиру»

> Вы с братом разбираете вещи молча. Ты забираешь его кофту Nike и часы Romanson. Часы стоят. Ты обещаешь себе их починить. До сих пор не починил.

Анимация: пылинки медленно плывут.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an old flat in monchegorsk, the brothers sorting things in silence, a nike sweatshirt and a stopped wristwatch on the table. Usual place, adapt if the moment says otherwise: small rental car on a winding mountain road in georgia, green mountains, low clouds, view from behind the car, a toddler asleep in a child seat visible through the rear window, early spring, calm road-trip mood.
```

### `oei_father_back.png`

> Самолёт в Лиссабон. Ты впервые замечаешь, что про Португалию думаешь «лечу домой». И что дом теперь — не одно место. На руке — папина кофта. Внизу облака.

Анимация: без анимации. Сцена: `plane`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a plane window over clouds, the man wearing his father's sweatshirt. Usual place, adapt if the moment says otherwise: view from an airplane window seat, clouds below, wing visible, a hand resting on the window frame, soft sunrise colors, calm and bittersweet.
```

#### `oei_father_back__1.png` — «Смотреть в окно»

> В аэропорту тебя встречают жена и сын с плакатом «ПАПА». Сын написал сам, буква «А» перевёрнута. Это лучший плакат в мире.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the arrivals hall, the woman and the boy holding a handmade sign 'papa' with a backwards letter. Usual place, adapt if the moment says otherwise: view from an airplane window seat, clouds below, wing visible, a hand resting on the window frame, soft sunrise colors, calm and bittersweet.
```

### `oei_ten_years.png`

> Новость: для гражданства теперь нужно не пять лет, а десять. Напоминание в календаре — то самое, через три с половиной года, — смотрит на тебя из телефона.

Анимация: без анимации. Сцена: `phone_chat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a chat message: citizenship now ten years instead of five, a calendar reminder on the phone. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

#### `oei_ten_years__1.png` — «Передвинуть напоминание»

> Ты переносишь его на пять лет вперёд. Календарь спрашивает: «Повторять?» Ты нажимаешь «нет». Потом думаешь и нажимаешь «каждый год».

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man dragging a calendar reminder five years ahead. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

#### `oei_ten_years__2.png` — «Учить A2 дальше»

> Экзамен никто не отменял. Ты сдашь его, даже если паспорт дадут к пенсии. Это уже вопрос принципа и португальских глаголов.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man studying portuguese verbs at night. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

#### `oei_ten_years__3.png` — «Посчитать для дочки»

> Через десять лет дочке будет почти одиннадцать. Она получит паспорт раньше, чем научится его терять. Ты почти смеёшься.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man calculating on paper, a baby asleep beside him. Usual place, adapt if the moment says otherwise: smartphone screen showing a busy group chat with many message bubbles and cat stickers (no readable text), hand holding the phone, night lighting.
```

### `oei_witnesses.png`

> В Оэйраше для справки о проживании нужны два свидетеля-соседа. В Фигейре было проще. Ты не знаешь соседей даже по именам.

Анимация: без анимации. Сцена: `stairs`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an oeiras apartment stairwell, the man looking at neighbours' doors he doesn't know. Usual place, adapt if the moment says otherwise: old lisbon building staircase with azulejo tiles on the walls, neighbor's door open with warm light and a child peeking out, smell-lines of cooking, cozy.
```

#### `oei_witnesses__1.png` — «Постучать к соседке снизу»

> Сеньора с первого этажа соглашается сразу и приносит сыну печенье. Она будет свидетелем, что вы существуете. Это больше, чем может AIMA.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an elderly neighbour opening her door and handing the boy a cookie. Usual place, adapt if the moment says otherwise: old lisbon building staircase with azulejo tiles on the walls, neighbor's door open with warm light and a child peeking out, smell-lines of cooking, cozy.
```

#### `oei_witnesses__2.png` — «Позвать друзей»

> Друзья приезжают из Лиссабона подписать бумагу «мы его соседи». Чиновница смотрит на них долго. Подписывает.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: friends from lisbon signing a paper at a parish office counter. Usual place, adapt if the moment says otherwise: old lisbon building staircase with azulejo tiles on the walls, neighbor's door open with warm light and a child peeking out, smell-lines of cooking, cozy.
```

#### `oei_witnesses__3.png` — «Спросить консьержа»

> Консьерж знает всех. За десять минут и коробку пастейш у тебя два свидетеля, которых ты видишь впервые.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man talking to a concierge, a box of pastries on the counter. Usual place, adapt if the moment says otherwise: old lisbon building staircase with azulejo tiles on the walls, neighbor's door open with warm light and a child peeking out, smell-lines of cooking, cozy.
```

### `oei_prices.png`

> В Оэйраше кофе стоит евро двадцать, а не девяносто центов, как в Фигейре. Ты замечаешь, что начал переводить цены в фигейрские. Это и есть эмиграция внутри эмиграции.

Анимация: пар поднимается из центра. Сцена: `supermarket`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a coffee cup and a price tag in an oeiras café. Usual place, adapt if the moment says otherwise: portuguese supermarket aisle, a small "world foods" shelf with slavic products, person standing still looking at a small curd snack, fluorescent light, quiet loneliness. a steaming cup or pot near the center of the frame.
```

#### `oei_prices__1.png` — «Заказать кофе»

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man drinking espresso at the counter. Usual place, adapt if the moment says otherwise: portuguese supermarket aisle, a small "world foods" shelf with slavic products, person standing still looking at a small curd snack, fluorescent light, quiet loneliness. a steaming cup or pot near the center of the frame.
```

### `oei_old_friends.png`

> Друзья из Фигейры приезжают в гости — те, с площадки и с озера. Дети за пять минут вспоминают старую игру, взрослые — старые шутки. Вы говорите «а помните, как в Фигейре…» так, как раньше говорили про Петербург.

Анимация: блики на воде в нижней трети. Сцена: `oeiras_beach`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: friends from figueira visiting the oeiras beach, kids playing an old game. Usual place, adapt if the moment says otherwise: beach near lisbon at sunset, group of friends with children around a picnic blanket, families from different countries, warm and nostalgic. keep water in the lower third of the frame.
```

#### `oei_old_friends__1.png` — «Сидеть до ночи»

> Фигейра стала прошлым, по которому можно скучать. Значит, она тоже была домом. Ты не заметил когда.

Анимация: мерцают звёзды в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the group on the beach at night, still talking. Usual place, adapt if the moment says otherwise: beach near lisbon at sunset, group of friends with children around a picnic blanket, families from different countries, warm and nostalgic. keep dark night sky in the upper part of the frame.
```

### `oei_mom_granddaughter.png`

> Мама смотрит на внучку по видео. Внучка смотрит на бабушку в телефоне и пытается его съесть. Мама смеётся — и вдруг замолкает: она ещё ни разу не держала её на руках. Только экран.

Анимация: без анимации. Сцена: `phone_video`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a video call: the grandmother on screen, the baby trying to eat the phone. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `oei_mom_granddaughter__1.png` — «Купить маме билеты»

> Ты открываешь сайт авиакомпании прямо во время звонка. Мама говорит «да ты что, дорого» и одновременно диктует, какие даты ей удобнее.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man buying plane tickets on his laptop during the call. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `oei_mom_granddaughter__2.png` — «Поднести дочку ближе»

> Дочка хватает телефон обеими руками и прижимается к экрану щекой. Мама на том конце тоже наклоняется. Почти обнялись.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the baby pressing her cheek to the phone screen, the grandmother leaning in. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

#### `oei_mom_granddaughter__3.png` — «Обещать: скоро»

> «Скоро, мам». Она кивает. Вы оба знаете, что «скоро» у вас теперь меряется визами и билетами, а не днями.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man saying 'soon' into the phone. Usual place, adapt if the moment says otherwise: smartphone in hand during a video call, mother's face on the screen in a warm kitchen, background of the caller's cold lisbon room, emotional contrast warm screen vs cold room.
```

### `oei_mortgage_bank.png`

> Банк. Ипотека. Менеджер спрашивает доходы, контракты, ВНЖ, кредитную историю. Кредитная история у тебя одна — BMW. Впервые в жизни это аргумент.

Анимация: без анимации. Сцена: `bank`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a bank manager asking for documents, the man with a folder of contracts. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

#### `oei_mortgage_bank__1.png` — «Подать заявку»

> Через три недели — предварительное одобрение. Ты перечитываешь письмо пять раз. Банк в стране, где ты пять лет назад не мог открыть счёт, верит, что ты будешь здесь тридцать лет.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an email of pre-approval on the phone, the man rereading it. Usual place, adapt if the moment says otherwise: small bank branch office, bank manager in a suit behind a desk holding a russian passport with a worried look, stack of forms, glass partition, neutral cold light.
```

### `oei_viewings.png`

> Просмотры в Лиссабоне. «T3 с потенциалом» — без кухни. «T2 с видом» — вид на стену соседнего дома, зато стена красивая. «T2 в тихом районе» — над баром.

Анимация: без анимации. Сцена: `flat_viewing`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: lisbon apartment viewings: a flat with no kitchen, a flat with a view of a wall, a flat above a bar. Usual place, adapt if the moment says otherwise: empty small lisbon apartment with a window facing a blank wall, real estate agent holding keys, visible mold stain in the ceiling corner, old tiles, bare lightbulb, ironic mood.
```

#### `oei_viewings__1.png` — «Смотреть дальше»

> Тридцатая квартира. Сын уже сам спрашивает агента про «caução» и «IMT». Агент спрашивает, не хочет ли он работать в агентстве.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy asking the estate agent about deposits. Usual place, adapt if the moment says otherwise: empty small lisbon apartment with a window facing a blank wall, real estate agent holding keys, visible mold stain in the ceiling corner, old tiles, bare lightbulb, ironic mood.
```

#### `oei_viewings__2.png` — «Взять с потенциалом»

> Жена смотрит на тебя. Ты смотришь на место, где должна быть кухня. Вы смотрите дальше.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple staring at the empty space where a kitchen should be. Usual place, adapt if the moment says otherwise: empty small lisbon apartment with a window facing a blank wall, real estate agent holding keys, visible mold stain in the ceiling corner, old tiles, bare lightbulb, ironic mood.
```

#### `oei_viewings__3.png` — «Смотреть в Оэйраше»

> Ближе к школе, дальше от Лиссабона. Квартиры не лучше, но дорога короче. Сын голосует ногами — он уже бежит к школе.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family viewing a flat near the school in oeiras. Usual place, adapt if the moment says otherwise: empty small lisbon apartment with a window facing a blank wall, real estate agent holding keys, visible mold stain in the ceiling corner, old tiles, bare lightbulb, ironic mood.
```

### `oei_apart.png`

> Вы давно разговариваете только о счетах, школе и AIMA. Дети спят. Жена сидит на краю дивана и говорит тихо: «Мы, кажется, всё это время переезжали — и где-то друг друга потеряли».

Анимация: без анимации. Сцена: `oeiras_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the woman sitting on the edge of the sofa at night talking quietly, children asleep. Usual place, adapt if the moment says otherwise: modern rented apartment near lisbon, baby crib next to a desk with a laptop, a pregnancy test on the bathroom shelf in the background, warm evening light.
```

#### `oei_apart__1.png` — «Поговорить по-настоящему»

> До трёх ночи. Про Петербург, про Батуми, про то, что было страшно — каждому по отдельности. Утром ничего не решено. Но вы снова на одной стороне.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple talking at the kitchen table until 3 am. Usual place, adapt if the moment says otherwise: modern rented apartment near lisbon, baby crib next to a desk with a laptop, a pregnancy test on the bathroom shelf in the background, warm evening light.
```

#### `oei_apart__2.png` — «Разъехаться»

> Вы долго молчите. Потом она кивает. Это самое спокойное решение за пять лет — и самое страшное.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: two sets of keys on the table. Usual place, adapt if the moment says otherwise: modern rented apartment near lisbon, baby crib next to a desk with a laptop, a pregnancy test on the bathroom shelf in the background, warm evening light.
```

#### `oei_apart__3.png` — «Найти психолога для двоих»

> Раз в неделю, по видео, вдвоём. Первые три встречи вы молчите. На четвёртой смеётесь. На пятой — плачете. Это работает.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple on a video session with a therapist. Usual place, adapt if the moment says otherwise: modern rented apartment near lisbon, baby crib next to a desk with a laptop, a pregnancy test on the bathroom shelf in the background, warm evening light.
```

### `oei_business.png`

> Знакомый с площадки, пока дети лезут на горку, рассказывает идею. Свой продукт, по вечерам, вдвоём. «Мы же всё равно не спим».

Анимация: без анимации. Сцена: `oeiras_beach`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a playground, another dad pitching an idea to the man while the kids climb a slide. Usual place, adapt if the moment says otherwise: beach near lisbon at sunset, group of friends with children around a picnic blanket, families from different countries, warm and nostalgic.
```

#### `oei_business__1.png` — «Рискнуть»

> Вечера, выходные, ноутбук на коленях у детской площадки. Жена спрашивает, когда ты спишь. Ты не помнишь.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man working on a laptop on a playground bench in the evening. Usual place, adapt if the moment says otherwise: beach near lisbon at sunset, group of friends with children around a picnic blanket, families from different countries, warm and nostalgic.
```

#### `oei_business__2.png` — «Не сейчас»

> Ты говоришь «может быть потом». Он кивает. Вы оба знаете, что это значит.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the two dads shaking hands, nothing decided. Usual place, adapt if the moment says otherwise: beach near lisbon at sunset, group of friends with children around a picnic blanket, families from different countries, warm and nostalgic.
```

#### `oei_business__3.png` — «Помочь советом»

> Ты не идёшь в партнёры, но раз в неделю созваниваешься и ругаешь его интерфейс. Он благодарит. Вы становитесь друзьями.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a weekly video call, the man criticising an app interface. Usual place, adapt if the moment says otherwise: beach near lisbon at sunset, group of friends with children around a picnic blanket, families from different countries, warm and nostalgic.
```

### `oei_business_grows.png`

> Полгода спустя. Первый платящий клиент. Потом десятый. Потом письмо, которое ты перечитываешь, как когда-то письмо про ВНЖ.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a phone showing payment notifications, the man staring in disbelief. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `oei_business_grows__1.png` — «Не верить»

> Ты проверяешь банк трижды. Деньги на месте. Ты впервые за пять лет чувствуешь не облегчение, а что-то похожее на гордость.

Анимация: конфетти падает.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man checking the bank app three times, smiling. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `oei_mom_again.png`

> Мама снова прилетает — она приезжает раз-два в год, как и родители жены. Теперь она знает, где у вас сахар, какой автобус до пляжа и что внук по утрам говорит по-английски. Чемодан всё так же наполовину ваш.

Анимация: без анимации. Сцена: `airport_arrivals`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: lisbon arrivals hall, the grandmother with a suitcase, the boy running toward her. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary.
```

#### `oei_mom_again__1.png` — «Встретить всей семьёй»

> Сын бежит через зону прилёта, не дожидаясь вас. Мама обнимает его и чуть не роняет чемодан с сырками. «Вырос», — говорит она. Она говорит это каждый раз.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the boy hugging his grandmother, the suitcase nearly falling. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary.
```

#### `oei_mom_again__2.png` — «Отпроситься с работы на неделю»

> Неделя без созвонов. Ты возишь маму по Оэйрашу и впервые видишь его её глазами: «А у вас тут красиво. Но дорого». Обе фразы правда.

Анимация: чайки пролетают в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man driving his mother along the oeiras coast. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary. keep open sky in the upper part of the frame.
```

#### `oei_mom_again__3.png` — «Пусть отдохнёт от нас»

> Мама ходит одна на набережную, пьёт кофе в пастеларии, где её уже знают. Возвращается и рассказывает вам про ваш город.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the grandmother alone with a coffee at a pastelaria counter. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary. a steaming cup or pot near the center of the frame.
```

### `oei_inlaws_again.png`

> Прилетают родители жены. Тесть уже не обходит машину — он сразу просит ключи. Тёща забирает внуков, и дом на неделю становится тихим и сытым.

Анимация: без анимации. Сцена: `airport_arrivals`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the father-in-law asking for car keys at the door, the grandmother taking the children. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary.
```

#### `oei_inlaws_again__1.png` — «Отдать тестю ключи»

> Тесть возит всех по Оэйрашу и Синтре и знает дорогу лучше навигатора. Через три дня он уже ругает лиссабонские пробки, как местный.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the father-in-law driving through sintra hills. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary.
```

#### `oei_inlaws_again__2.png` — «Сходить вдвоём в кино»

> Впервые за полгода вы с женой в кино. Фильм вы не запомните. Запомните, что держались за руки.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the couple in a cinema holding hands. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary.
```

#### `oei_inlaws_again__3.png` — «Готовить всем вместе»

> Пельмени лепят все: тёща, тесть, жена, сын и ты. Мука на полу, на сыне и почему-то на потолке. Это и есть праздник.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: everyone making pelmeni together, flour everywhere. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary.
```

### `oei_inlaws_granddaughter.png`

> До родов неделя. Родители жены прилетают — кто-то же должен быть с сыном, когда вы ночью поедете в роддом. Тёща сразу распаковывает чемодан. Тесть изучает, как работает ваша кофемашина. На всякий случай.

Анимация: пар поднимается из центра. Сцена: `airport_arrivals`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a week before the birth, the wife's parents unpacking in the oeiras flat, the father-in-law studying the coffee machine. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary. a steaming cup or pot near the center of the frame.
```

#### `oei_inlaws_granddaughter__1.png` — «Показать, где что лежит»

> Список на холодильнике: садик, секция, аллергия, любимые хлопья. Тёща читает его и откладывает: «Мы вырастили твою жену. Справимся». Справляются.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a list on the fridge, the grandmother waving it away. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary.
```

#### `oei_inlaws_granddaughter__2.png` — «Собрать сумку в роддом»

> Сумку собирают все четверо. Тесть кладёт туда шоколадку «для врача». Тёща её вынимает. Тесть кладёт обратно. Сумка готова.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: four people packing a hospital bag, a chocolate bar going in and out. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary.
```

#### `oei_inlaws_granddaughter__3.png` — «Отправить фото твоей маме»

> Фото: тесть с тёщей и внуком на диване, все ждут. Твоя мама пишет: «Какие хорошие». Потом: «Я тоже скоро». Ты перечитываешь это дважды.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a photo of the grandparents with the boy on the sofa, waiting. Usual place, adapt if the moment says otherwise: airport arrivals hall in lisbon, glass doors opening, a grandmother with a big suitcase and a small boy running toward her with arms open, warm afternoon light, welcome signs, joyful and slightly teary.
```

### `oei_mom_paris.png`

> 2026-й. Ты везёшь маму в Париж. Всю жизнь он был для неё открыткой на холодильнике. Теперь вы стоите на мосту, и открытка вокруг — настоящая.

Анимация: без анимации. Сцена: `paris`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: paris on a bridge over the seine, the man and his mother arm in arm, the eiffel tower in the distance. Usual place, adapt if the moment says otherwise: paris seine embankment at golden hour, eiffel tower in the distance, a man in his 30s walking arm in arm with his elderly mother seen from behind, bookstalls along the river, soft warm light, tender and quiet.
```

#### `oei_mom_paris__1.png` — «К Эйфелевой башне»

> Мама долго смотрит вверх и говорит: «Большая». Потом: «Папе бы понравилось». Вы оба молчите. Потом она просит сфотографировать её так, чтобы башня «влезла целиком».

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the mother looking up at the eiffel tower. Usual place, adapt if the moment says otherwise: paris seine embankment at golden hour, eiffel tower in the distance, a man in his 30s walking arm in arm with his elderly mother seen from behind, bookstalls along the river, soft warm light, tender and quiet.
```

#### `oei_mom_paris__2.png` — «Просто гулять»

> Без плана, без музеев. Набережные, булочные, лавки с книгами. Мама держит тебя под руку, как в детстве держал её ты. Вы проходите двадцать тысяч шагов, и она ни разу не жалуется.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the two walking along the seine past bookstalls. Usual place, adapt if the moment says otherwise: paris seine embankment at golden hour, eiffel tower in the distance, a man in his 30s walking arm in arm with his elderly mother seen from behind, bookstalls along the river, soft warm light, tender and quiet.
```

#### `oei_mom_paris__3.png` — «Сидеть в кафе на углу»

> Два кофе, два круассана, четыре часа. Мама рассказывает то, чего никогда не рассказывала по видео. Париж за окном — просто фон.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: mother and son at a small paris café corner table. Usual place, adapt if the moment says otherwise: paris seine embankment at golden hour, eiffel tower in the distance, a man in his 30s walking arm in arm with his elderly mother seen from behind, bookstalls along the river, soft warm light, tender and quiet. a steaming cup or pot near the center of the frame.
```

### `oei_mom_spain.png`

> Один из приездов мамы — Испания. Машина, дорога вдоль моря, белые городки на холмах. Мама в панаме на заднем сиденье рядом с внуком.

Анимация: блики на воде в нижней трети. Сцена: `malaga_beach`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a car on a coastal road in southern spain, white hill towns, the grandmother in a sun hat in the back seat. Usual place, adapt if the moment says otherwise: warm mediterranean beach in malaga, white hillside town behind, turquoise calm sea, a family with grandparents under a striped umbrella, a boy in armbands running into the water, bright midday sun. keep water in the lower third of the frame.
```

#### `oei_mom_spain__1.png` — «Ехать медленно»

> Каждый белый городок — остановка. Мама фотографирует всё подряд и отправляет подругам в Россию с подписью «Мы тут».

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a white andalusian village street, the grandmother photographing everything. Usual place, adapt if the moment says otherwise: warm mediterranean beach in malaga, white hillside town behind, turquoise calm sea, a family with grandparents under a striped umbrella, a boy in armbands running into the water, bright midday sun.
```

#### `oei_mom_spain__2.png` — «Сразу к морю»

> Мама заходит в Средиземное море по колено и стоит так десять минут. «Тёплое», — говорит она, будто не верит.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the grandmother standing knee-deep in the mediterranean. Usual place, adapt if the moment says otherwise: warm mediterranean beach in malaga, white hillside town behind, turquoise calm sea, a family with grandparents under a striped umbrella, a boy in armbands running into the water, bright midday sun. keep water in the lower third of the frame.
```

#### `oei_mom_spain__3.png` — «Научить её паэлье»

> Ты заказываешь паэлью и объясняешь маме, что это «плов с морем». Мама пробует и говорит, что её плов лучше. Она права.

Анимация: пар поднимается из центра.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a big paella pan on a terrace table. Usual place, adapt if the moment says otherwise: warm mediterranean beach in malaga, white hillside town behind, turquoise calm sea, a family with grandparents under a striped umbrella, a boy in armbands running into the water, bright midday sun. a steaming cup or pot near the center of the frame.
```

### `oei_low_nerves.png`

> Младенец не спит, старший — подросток в миниатюре, ипотека, AIMA, работа. Ты засыпаешь стоя в очереди в аптеке.

Анимация: без анимации. Сцена: `oeiras_flat`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man falling asleep standing in a pharmacy queue. Usual place, adapt if the moment says otherwise: modern rented apartment near lisbon, baby crib next to a desk with a laptop, a pregnancy test on the bathroom shelf in the background, warm evening light.
```

#### `oei_low_nerves__1.png` — «Поменяться ночами с женой»

> Одна ночь сна. Целая. Ты просыпаешься и не понимаешь, где ты и почему так хорошо.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man sleeping peacefully in daylight. Usual place, adapt if the moment says otherwise: modern rented apartment near lisbon, baby crib next to a desk with a laptop, a pregnancy test on the bathroom shelf in the background, warm evening light.
```

#### `oei_low_nerves__2.png` — «Психолог»

> Психолог тот же, что в Фигейре, теперь онлайн. «С возвращением», — говорит она. Ты смеёшься впервые за неделю.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a video session with the same psychologist. Usual place, adapt if the moment says otherwise: modern rented apartment near lisbon, baby crib next to a desk with a laptop, a pregnancy test on the bathroom shelf in the background, warm evening light.
```

#### `oei_low_nerves__3.png` — «Бегать у океана»

> Шесть утра, набережная, океан справа. Через неделю ты бегаешь не от, а просто так.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man running along the oeiras promenade at 6 am. Usual place, adapt if the moment says otherwise: modern rented apartment near lisbon, baby crib next to a desk with a laptop, a pregnancy test on the bathroom shelf in the background, warm evening light. keep water in the lower third of the frame.
```

### `oei_low_money.png`

> Школа, аренда, кредит за BMW, подгузники. Деньги в Оэйраше уходят быстрее, чем приходит пригородная электричка.

Анимация: без анимации. Сцена: `phone`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: school, rent, car loan and nappies bills spread on a table. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `oei_low_money__1.png` — «Взять подработку»

> Вечерами — фриланс, днём — работа, ночью — дочка. Ты спишь по выходным. Иногда.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man working at night with a baby monitor beside the laptop. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `oei_low_money__2.png` — «Продать BMW»

> Ты продаёшь BMW и снова ездишь на чём-то старше сына. Тебе, честно говоря, так спокойнее.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the bmw being driven away by a buyer. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

#### `oei_low_money__3.png` — «Попросить отсрочку в школе»

> Школа соглашается разбить платёж на три. Бухгалтер говорит: «Все так делают». От этого почему-то не легче.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a school office, the man signing a payment plan. Usual place, adapt if the moment says otherwise: close-up of a smartphone held in a hand, screen glowing with an abstract notification (no readable text), blurred room background, pixel art UI icons on screen.
```

### `oei_final.png`

> Квартира найдена. Не идеальная: третий этаж без лифта, кухня маленькая, зато школа рядом и из окна видно кусочек реки. Банк ждёт подписи до пятницы. Подписать — значит впервые в жизни решить что-то на тридцать лет вперёд.

Анимация: без анимации. Сцена: `lisbon_flat_keys`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a lisbon flat with keys on the floor: third floor, small kitchen, a slice of the river tagus in the window. Usual place, adapt if the moment says otherwise: empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet.
```

#### `oei_final__1.png` — «Подписать»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a pen over a mortgage contract. Usual place, adapt if the moment says otherwise: empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet.
```

#### `oei_final__2.png` — «Купить без ипотеки»

> Ты звонишь в банк и говоришь, что кредит не нужен. В трубке долгая пауза.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on the phone saying no loan needed. Usual place, adapt if the moment says otherwise: empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet.
```

#### `oei_final__3.png` — «Вернуться в Петербург»

> Ты долго смотришь на договор. Потом звонишь маме. Она молчит в трубку, а потом говорит: «Приезжайте». Только это.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man looking at the contract, then calling his mother. Usual place, adapt if the moment says otherwise: empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet.
```

#### `oei_final__4.png` — «Принять оффер в Амстердаме»

> Письмо с оффером пришло ещё в понедельник. Ты не открывал его три дня. Сегодня открыл.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an offer letter from amsterdam open on the laptop. Usual place, adapt if the moment says otherwise: empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet.
```

#### `oei_final__5.png` — «Принять оффер из Штатов»

> Американский стартап, с которым ты три года созванивался по вечерам, предлагает переезд. Ты смотришь на океан. Прямо — Америка.

Анимация: блики на воде в нижней трети.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an offer letter from a us startup, the ocean in the window. Usual place, adapt if the moment says otherwise: empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet. keep water in the lower third of the frame.
```

#### `oei_final__6.png` — «Не подписывать. Пока»

> Ты звонишь в банк и говоришь «não». Менеджер вздыхает. Жена — тоже. Но кивает.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on the phone saying 'não', the wife nodding. Usual place, adapt if the moment says otherwise: empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet.
```

### `final_museum.png`

> Вечер в пустой квартире. Ты открываешь коробку, которую возил из страны в страну и ни разу не разобрал. Купюра из бабушкиного конверта. Камень из Батуми. Альбом. Серый кот. Сын раскладывает их по полу в ряд, как в музее.

Анимация: пылинки медленно плывут. Сцена: `lisbon_flat_keys`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an empty new flat in the evening: the grandmother's banknote, the batumi stone, the photo album and the grey plush cat laid out in a row on the floor. Usual place, adapt if the moment says otherwise: empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet.
```

#### `final_museum__1.png` — «Поставить коробку на полку»

Анимация: пылинки медленно плывут.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a box placed first on an empty shelf. Usual place, adapt if the moment says otherwise: empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet.
```

### `final_two_homes.png`

> Вечер в пустой квартире. На полу — камень из Батуми, серый кот и фото детей. Мама на видео осматривает каждый угол. Сын объясняет бабушке, где будет его комната. По-русски.

Анимация: без анимации. Сцена: `lisbon_flat_keys`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an empty flat, the batumi stone and the grey cat on the floor, the grandmother on a video call looking at every corner. Usual place, adapt if the moment says otherwise: empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet.
```

#### `final_two_homes__1.png` — «Включить свет»

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the light switched on in the empty flat, warm glow. Usual place, adapt if the moment says otherwise: empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet. small lit windows or lamps scattered in the upper two thirds.
```

### `final_ours.png`

> Вечер в пустой квартире. Соседка снизу приносит пирог и говорит, что тут хороший район для детей. Сын благодарит её на португальском без акцента. Дочка спит на шарфе «Спортинга».

Анимация: без анимации. Сцена: `lisbon_flat_keys`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a neighbour bringing a pie to the empty flat, the baby asleep on a sporting scarf. Usual place, adapt if the moment says otherwise: empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet.
```

#### `final_ours__1.png` — «Включить свет»

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the light switched on, the family and the neighbour laughing. Usual place, adapt if the moment says otherwise: empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet. small lit windows or lamps scattered in the upper two thirds.
```

### `final_thirty.png`

> Вечер в пустой квартире. Вы сидите на полу вчетвером и едите пиццу из коробки. Никто ничего не говорит. Всё уже сказано за пять лет и четыре города.

Анимация: без анимации. Сцена: `lisbon_flat_keys`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family of four sitting on the floor of an empty flat eating pizza from a box. Usual place, adapt if the moment says otherwise: empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet.
```

#### `final_thirty__1.png` — «Включить свет»

Анимация: мигают огоньки в верхних двух третях.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the light switched on over the pizza box. Usual place, adapt if the moment says otherwise: empty lisbon apartment at dusk, small window with a glimpse of the river, family of four sitting on the floor seen from behind: father, mother with a baby, a boy; on the floor a flat stone, a grey plush cat toy, an old banknote and a pizza box, keys in the father's hand, warm and quiet. small lit windows or lamps scattered in the upper two thirds.
```

### `aima_call_again.png`

> Горячая линия AIMA, попытка номер… ты сбиваешься со счёта. Музыка та же.

Анимация: без анимации. Сцена: `aima`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on hold with aima, counting attempts on a sticky note. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `aima_call_again__1.png` — «Ждать до конца»

> На сорок третьей минуте отвечает живой человек. Обещает записать. Произносит твою фамилию так, что ты её не узнаёшь.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a real voice finally answering at minute 43. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `aima_call_again__2.png` — «Сдаться и нанять юриста»

> Юрист говорит: «Надо было сразу». Юрист прав. Это самое обидное.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man paying a lawyer. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `aima_call_again__3.png` — «Поехать без записи»

> Ты едешь в AIMA с утра без записи. Охранник не пускает. Но даёт номер, по которому, говорит он, «иногда отвечают». Иногда отвечают.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: a guard at the aima door handing the man a phone number. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

### `aima_slot.png`

> Запись на продление есть! На троих, в один день. Далеко от Оэйраша, в 8:40 утра. Но есть.

Анимация: без анимации. Сцена: `aima`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an aima appointment confirmation: three people, 8:40 am, far from oeiras. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `aima_slot__1.png` — «Ехать на BMW»

> Ночью, втроём, на BMW в кредит. Сын спит, ты ведёшь, жена штурман. Отпечатки, фото, «Parabéns». Кредит за машину впервые кажется оправданным.

Анимация: мерцают звёзды в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the white bmw on a night highway, the boy asleep in the back. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring. keep dark night sky in the upper part of the frame.
```

#### `aima_slot__2.png` — «Ехать автобусом»

> Ночной автобус, кофе на заправке, сын на коленях. Отпечатки, фото, «Parabéns». Ты не понимаешь, с чем поздравляют, но приятно.

Анимация: мерцают звёзды в верхней части.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the family on a night bus with coffee from a gas station. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring. keep dark night sky in the upper part of the frame.
```

#### `aima_slot__3.png` — «Попросить поближе»

> «Ближе нет». Запись сгорает. Через месяц дают новую — так же далеко.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man on the phone asking for a closer office. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

### `biometrics_lost.png`

> Продление. «Ваши биометрические данные не найдены в системе. Пожалуйста, запишитесь повторно». Три года назад их приняли в SEF, а AIMA их потеряла. Все шесть рук.

Анимация: без анимации. Сцена: `aima`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an aima screen: biometric data not found. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `biometrics_lost__1.png` — «Записаться повторно»

> Всё сначала: горячая линия, музыка, слоты. Сын спрашивает, можно ли в этот раз взять кота на фото.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man starting over with the hold music. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `biometrics_lost__2.png` — «Жалоба капслоком»

> Ты пишешь письмо на трёх языках, включая мат. Удаляешь мат. Отправляешь. Тишина.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an angry email being typed in three languages. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `biometrics_lost__3.png` — «Позвонить юристу»

> Юрист вздыхает: «Это у всех, кто с SEF переходил». Через две недели биометрию «находят». Юрист не уточняет как.

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man calling the lawyer who sighs. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

### `biometrics_found.png`

> «Ваши данные найдены. Приносим извинения за неудобства». Извинения от AIMA — как снег в Португалии: бывает, но все фотографируют.

Анимация: без анимации. Сцена: `aima`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an email: your data has been found, we apologise. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

#### `biometrics_found__1.png` — «Сфотографировать»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man taking a screenshot of the apology. Usual place, adapt if the moment says otherwise: immigration office waiting hall, sign "AIMA" above counters, crowded with people from different countries, number display, one open window out of ten, clerk taking fingerprints, fluorescent light, absurd and tiring.
```

### `oei_day.png`

> Обычная неделя в Оэйраше: школа, работа, пробки на трассе в Лиссабон, океан по дороге. Ты ловишь себя на том, что ругаешь пробки, как местный.

Анимация: блики на воде в нижней трети. Сцена: `oeiras_street`.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: an ordinary oeiras week: school, work, the highway to lisbon along the ocean. Usual place, adapt if the moment says otherwise: oeiras seaside promenade near lisbon, white modern buildings, palm trees, atlantic ocean, a dark bmw parked, evening traffic toward lisbon, golden light. keep water in the lower third of the frame.
```

#### `oei_day__1.png` — «Дальше»

Анимация: без анимации.

```
pixel art scene, 180x135, limited palette (Endesga 32), clean 1px outlines, no anti-aliasing, no text, cozy melancholic mood, side or three-quarter view, game background for a narrative mobile game. Moment: the man stuck in traffic grumbling like a local. Usual place, adapt if the moment says otherwise: oeiras seaside promenade near lisbon, white modern buildings, palm trees, atlantic ocean, a dark bmw parked, evening traffic toward lisbon, golden light.
```
