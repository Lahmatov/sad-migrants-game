#!/usr/bin/env python3
"""Проверка и прогон сценария без Xcode.

    python3 tools/content.py            — проверка + 2000 случайных прохождений
    python3 tools/content.py --runs 50  — меньше прохождений
    python3 tools/content.py --scenes   — список картинок, на которые ссылаются карточки
    python3 tools/content.py --play     — сыграть в терминале

Правила здесь повторяют GameEngine.swift. Источник правды — Swift: если
поменялся движок, поменяй и эту копию, иначе симуляция начнёт врать.
Зачем копия: сценарий пишется чаще, чем код, и проверять его хочется
за секунду, без Mac.
"""
import argparse
import glob
import json
import os
import random
import statistics
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CONTENT = os.path.join(ROOT, 'Core/Sources/MigrantCore/Content')
STATS = ('money', 'nerves', 'documents', 'home', 'belonging')
# Сколько секунд в среднем уходит на карточку: прочитать, выбрать, прочитать итог.
SECONDS_PER_CARD = 14

CARD_KEYS = {'id', 'kind', 'scene', 'speaker', 'text', 'requires', 'repeatable', 'weight', 'choices'}
CHOICE_KEYS = {'label', 'result', 'requires', 'effects'}
EFFECT_KEYS = {'stats', 'set', 'clear', 'add', 'next', 'schedule', 'act', 'days', 'ending'}
REQ_KEYS = {'flags', 'notFlags', 'anyFlags', 'minStats', 'maxStats', 'minCounters', 'maxCounters',
            'fromDay', 'fromActDay'}


def load():
    with open(os.path.join(CONTENT, 'game.json'), encoding='utf-8') as f:
        game = json.load(f)
    cards = []
    for path in sorted(glob.glob(os.path.join(CONTENT, 'cards', '*.json'))):
        with open(path, encoding='utf-8') as f:
            data = json.load(f)
        for card in data['cards']:
            card['act'] = data['act']
            card['_file'] = os.path.basename(path)
            cards.append(card)
    return game, cards


def validate(game, cards):
    problems, warnings = [], []
    by_id = {}
    for card in cards:
        if card['id'] in by_id:
            problems.append(f"карточка {card['id']} объявлена дважды")
        by_id[card['id']] = card
    acts = {a['id']: a for a in game['acts']}
    endings = {e['id'] for e in game['endings']}
    for e in game['endings']:
        if 'stat' in e and e['stat'] not in STATS:
            problems.append(f"концовка {e['id']}: неизвестная шкала {e['stat']}")
    intro = game.get('intro', [])
    if not isinstance(intro, list) or not all(isinstance(line, str) for line in intro):
        problems.append("game.json: intro должен быть списком строк")
    if game['start']['act'] not in acts:
        problems.append(f"старт: нет акта {game['start']['act']}")
    if game['start']['card'] not in by_id:
        problems.append(f"старт: нет карточки {game['start']['card']}")
    for act in game['acts']:
        fb = act.get('fallback')
        if not fb:
            problems.append(f"акт {act['id']}: нет запасной карточки")
        elif fb not in by_id:
            problems.append(f"акт {act['id']}: нет запасной карточки {fb}")
        elif not by_id[fb].get('repeatable'):
            problems.append(f"акт {act['id']}: запасная {fb} не повторяемая")

    flags_set, flags_read, counters_add, counters_read = set(), set(), set(), set()
    referenced = {game['start']['card']} | {a.get('fallback') for a in game['acts']}

    def check_req(req, place):
        if req is None:
            return
        for key in req:
            if key not in REQ_KEYS:
                problems.append(f"{place}: неизвестное условие {key}")
        for key in ('flags', 'notFlags', 'anyFlags'):
            flags_read.update(req.get(key, []))
        for key in ('minStats', 'maxStats'):
            for stat in req.get(key, {}):
                if stat not in STATS:
                    problems.append(f"{place}: неизвестная шкала {stat}")
        for key in ('minCounters', 'maxCounters'):
            counters_read.update(req.get(key, {}))

    for card in cards:
        place = f"{card['_file']}: {card['id']}"
        for key in card:
            if key not in CARD_KEYS | {'act', '_file'}:
                problems.append(f"{place}: неизвестное поле {key}")
        if card.get('kind', 'pool') not in ('pool', 'event'):
            problems.append(f"{place}: неизвестный kind {card.get('kind')}")
        if not card.get('text'):
            problems.append(f"{place}: пустой текст")
        check_req(card.get('requires'), place)
        choices = card.get('choices', [])
        if not choices:
            problems.append(f"{place}: нет вариантов")
        elif all('requires' in c for c in choices):
            problems.append(f"{place}: все варианты с условиями — можно застрять")
        if len(card.get('text', '')) > 320:
            warnings.append(f"{place}: длинный текст ({len(card['text'])} симв.) — не влезет без прокрутки")
        if len(choices) > 4:
            warnings.append(f"{place}: больше четырёх кнопок — не влезет на экран")
        for choice in choices:
            for key in choice:
                if key not in CHOICE_KEYS:
                    problems.append(f"{place}: неизвестное поле варианта {key}")
            if not choice.get('label'):
                problems.append(f"{place}: вариант без текста")
            elif len(choice['label']) > 32:
                warnings.append(f"{place}: длинная кнопка «{choice['label']}»")
            if len(choice.get('result', '')) > 220:
                warnings.append(f"{place}: длинный итог у «{choice.get('label')}»")
            check_req(choice.get('requires'), place)
            eff = choice.get('effects', {})
            for key in eff:
                if key not in EFFECT_KEYS:
                    problems.append(f"{place}: неизвестный эффект {key}")
            for stat in eff.get('stats', {}):
                if stat not in STATS:
                    problems.append(f"{place}: неизвестная шкала {stat}")
            flags_set.update(eff.get('set', []))
            counters_add.update(eff.get('add', {}))
            for target in eff.get('next', []):
                referenced.add(target)
                if target not in by_id:
                    problems.append(f"{place}: next → несуществующая {target}")
            for entry in eff.get('schedule', []):
                referenced.add(entry['card'])
                if entry['card'] not in by_id:
                    problems.append(f"{place}: schedule → несуществующая {entry['card']}")
            if 'act' in eff and eff['act'] not in acts:
                problems.append(f"{place}: переход в несуществующий акт {eff['act']}")
            if 'ending' in eff and eff['ending'] not in endings:
                problems.append(f"{place}: несуществующая концовка {eff['ending']}")

    for card in cards:
        if card.get('kind') == 'event' and card['id'] not in referenced:
            warnings.append(f"{card['id']}: event, на который никто не ссылается — не покажется никогда")
    for flag in sorted(flags_read - flags_set):
        problems.append(f"флаг {flag} проверяется, но нигде не ставится")
    for flag in sorted(flags_set - flags_read):
        warnings.append(f"флаг {flag} ставится, но нигде не проверяется (пока — задел на будущее?)")
    for name in sorted(counters_read - counters_add):
        problems.append(f"счётчик {name} проверяется, но нигде не растёт")
    return problems, warnings


class Game:
    """Копия GameEngine.swift. Меняешь движок — меняй и здесь."""

    def __init__(self, game, cards, rng):
        self.game, self.cards, self.rng = game, cards, rng
        self.by_id = {c['id']: c for c in cards}
        self.acts = {a['id']: a for a in game['acts']}
        self.endings = game['endings']
        self.stats = dict(game['start']['stats'])
        self.flags, self.counters, self.seen = set(), {}, set()
        self.day, self.turn = 0, 0
        self.act = game['start']['act']
        self.act_start = 0
        self.scheduled = []
        self.current = game['start']['card']
        self.ending = None

    def meets(self, req):
        if not req:
            return True
        if not all(f in self.flags for f in req.get('flags', [])):
            return False
        if any(f in self.flags for f in req.get('notFlags', [])):
            return False
        if 'anyFlags' in req and not any(f in self.flags for f in req['anyFlags']):
            return False
        for stat, bound in req.get('minStats', {}).items():
            if self.stats[stat] < bound:
                return False
        for stat, bound in req.get('maxStats', {}).items():
            if self.stats[stat] > bound:
                return False
        for name, bound in req.get('minCounters', {}).items():
            if self.counters.get(name, 0) < bound:
                return False
        for name, bound in req.get('maxCounters', {}).items():
            if self.counters.get(name, 0) > bound:
                return False
        if 'fromDay' in req and self.day < req['fromDay']:
            return False
        if 'fromActDay' in req and self.day - self.act_start < req['fromActDay']:
            return False
        return True

    def available(self):
        card = self.by_id[self.current]
        return [i for i, c in enumerate(card['choices']) if self.meets(c.get('requires'))]

    def choose(self, index):
        card = self.by_id[self.current]
        choice = card['choices'][index]
        eff = choice.get('effects', {})
        self.seen.add(card['id'])
        self.turn += 1
        applied = {}
        for stat, change in eff.get('stats', {}).items():
            before = self.stats[stat]
            upper = None if stat == 'money' else 100
            after = max(before + change, 0)
            if upper is not None:
                after = min(after, upper)
            self.stats[stat] = after
            if after != before:
                applied[stat] = after - before
        self.flags.update(eff.get('set', []))
        self.flags.difference_update(eff.get('clear', []))
        for name, amount in eff.get('add', {}).items():
            self.counters[name] = self.counters.get(name, 0) + amount
        default_days = self.acts.get(self.act, {}).get('daysPerCard', 1)
        self.day += max(eff.get('days', default_days), 0)
        for entry in eff.get('schedule', []):
            self.scheduled.append((entry['card'], self.day + entry['inDays']))
        if 'act' in eff and eff['act'] != self.act:
            self.act = eff['act']
            self.act_start = self.day
        for ending in self.endings:
            if 'stat' in ending and self.stats[ending['stat']] <= 0:
                self.ending = ending['id']
                break
        else:
            if 'ending' in eff:
                self.ending = eff['ending']
        if self.ending:
            self.current = None
            return choice, applied
        self.current = self.draw(eff.get('next', []), card['id'])
        return choice, applied

    def draw(self, preferred, previous):
        for cid in preferred:
            if cid in self.by_id and self.meets(self.by_id[cid].get('requires')):
                return cid
        while True:
            due = [(d, i) for i, (_, d) in enumerate(self.scheduled) if d <= self.day]
            if not due:
                break
            _, index = min(due)
            cid, _ = self.scheduled.pop(index)
            if cid in self.by_id and self.meets(self.by_id[cid].get('requires')):
                return cid
        pool = [c for c in self.cards
                if c['act'] == self.act and c.get('kind', 'pool') == 'pool'
                and c['id'] != previous
                and (c.get('repeatable') or c['id'] not in self.seen)
                and self.meets(c.get('requires'))]
        weights = [max(c.get('weight', 1), 0) for c in pool]
        if sum(weights) > 0:
            return self.rng.choices(pool, weights=weights)[0]['id']
        fallback = self.acts.get(self.act, {}).get('fallback')
        return fallback if fallback in self.by_id else None


def simulate(game, cards, runs):
    endings, turns, days, stuck = Counter(), [], [], 0
    shown = Counter()
    fallback_ids = {a.get('fallback') for a in game['acts']}
    fallback_hits = 0
    for seed in range(runs):
        g = Game(game, cards, random.Random(seed))
        while g.ending is None and g.turn < 1000:
            if g.current is None:
                stuck += 1
                break
            shown[g.current] += 1
            if g.current in fallback_ids:
                fallback_hits += 1
            options = g.available()
            g.choose(g.rng.choice(options))
        endings[g.ending or 'нет концовки'] += 1
        turns.append(g.turn)
        days.append(g.day)
    total = sum(turns)
    print(f"\nПрохождений: {runs} (случайные выборы)")
    print(f"Карточек за партию: медиана {statistics.median(turns):.0f}, "
          f"мин {min(turns)}, макс {max(turns)}")
    print(f"≈ {statistics.median(turns) * SECONDS_PER_CARD / 60:.0f} мин игры "
          f"(по {SECONDS_PER_CARD} с на карточку); игровых дней — медиана {statistics.median(days):.0f}")
    print(f"Запасные карточки: {fallback_hits / total:.0%} показов — "
          "если много, акту не хватает содержания")
    print("Концовки:")
    for name, count in endings.most_common():
        print(f"  {name:12} {count / runs:6.1%}")
    never = [c['id'] for c in cards if shown[c['id']] == 0]
    if never:
        print(f"Ни разу не показались ({len(never)}): {', '.join(never)}")
    if stuck:
        print(f"Застряли без карточки: {stuck} раз")
    return stuck == 0


def play(game, cards):
    g = Game(game, cards, random.Random())
    while g.ending is None:
        card = g.by_id[g.current]
        act = g.acts[g.act]['title']
        print(f"\n— {act}, день {g.day} — " + '  '.join(f"{k}:{v}" for k, v in g.stats.items()))
        if card.get('speaker'):
            print(f"[{card['speaker']}]")
        print(card['text'])
        options = g.available()
        for n, i in enumerate(options, 1):
            print(f"  {n}. {card['choices'][i]['label']}")
        try:
            pick = int(input('> ')) - 1
            index = options[pick]
        except (ValueError, IndexError, EOFError):
            return
        choice, applied = g.choose(index)
        if choice.get('result'):
            print(f"\n{choice['result']}")
        if applied:
            print('  ' + '  '.join(f"{k} {v:+d}" for k, v in applied.items()))
    ending = next(e for e in game['endings'] if e['id'] == g.ending)
    print(f"\n*** {ending['title']} ***\n{ending['text']}")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--runs', type=int, default=2000)
    parser.add_argument('--scenes', action='store_true')
    parser.add_argument('--play', action='store_true')
    parser.add_argument('--quiet', action='store_true', help='не печатать предупреждения')
    args = parser.parse_args()
    try:
        game, cards = load()
    except (json.JSONDecodeError, KeyError) as error:
        print(f"Сценарий не читается: {error}")
        return 1
    if args.scenes:
        scenes = Counter(c.get('scene', '—') for c in cards)
        for scene, count in sorted(scenes.items()):
            print(f"{scene:20} {count}")
        return 0
    if args.play:
        play(game, cards)
        return 0
    problems, warnings = validate(game, cards)
    print(f"Карточек: {len(cards)}, актов: {len(game['acts'])}, концовок: {len(game['endings'])}")
    if warnings and not args.quiet:
        print(f"\nПредупреждения ({len(warnings)}):")
        for w in warnings:
            print(f"  · {w}")
    if problems:
        print(f"\nОшибки ({len(problems)}):")
        for p in problems:
            print(f"  • {p}")
        return 1
    ok = simulate(game, cards, args.runs)
    return 0 if ok else 1


if __name__ == '__main__':
    sys.exit(main())
