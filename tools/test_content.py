#!/usr/bin/env python3
"""Тесты валидатора и симулятора сценария — и сюжетные тесты настоящего сценария.

    python3 tools/test_content.py

Сюжетные тесты повторяют StoryTests.swift: их можно гонять без Mac, сразу
после правки карточек. Источник правды — Swift-движок; здесь проверяется,
что сценарий ведёт туда, куда задумано.
"""
import copy
import os
import random
import sys
import unittest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import content  # noqa: E402

GAME, CARDS = content.load()


def tiny(cards, acts=None, endings=None, start='start'):
    """Маленький сценарий для проверки правил."""
    game = {
        'start': {'act': 'a', 'card': start,
                  'stats': {'money': 1000, 'nerves': 50, 'documents': 50, 'home': 50, 'belonging': 0}},
        'acts': acts or [{'id': 'a', 'title': 'А', 'daysPerCard': 1, 'fallback': 'fb'}],
        'endings': endings or [{'id': 'broke', 'title': 'т', 'text': 'т', 'stat': 'money'},
                               {'id': 'happy', 'title': 'т', 'text': 'т'}],
    }
    all_cards = cards + [{'id': 'fb', 'kind': 'event', 'repeatable': True, 'text': 'т',
                          'choices': [{'label': 'дальше'}]}]
    for card in all_cards:
        card.setdefault('act', 'a')
        card.setdefault('_file', 'test.json')
    return game, all_cards


def event(cid, effects=None, requires=None):
    card = {'id': cid, 'kind': 'event', 'text': cid, 'choices': [{'label': 'ок', 'effects': effects or {}}]}
    if requires:
        card['requires'] = requires
    return card


def at_card(card_id, act, flags=(), counters=None, **stats):
    """Партия на настоящем сценарии, поставленная на нужную карточку."""
    game = content.Game(GAME, CARDS, random.Random(7))
    game.current = card_id
    game.act = act
    game.flags = set(flags)
    game.counters = dict(counters or {})
    game.stats = {'money': 20000, 'nerves': 80, 'documents': 80, 'home': 60, 'belonging': 60}
    game.stats.update(stats)
    assert card_id in game.by_id, f'нет карточки {card_id}'
    return game


def labels(game):
    card = game.by_id[game.current]
    return [card['choices'][i]['label'] for i in game.available()]


def tap(game, label):
    card = game.by_id[game.current]
    index = next(i for i, c in enumerate(card['choices']) if c['label'] == label)
    assert index in game.available(), f'кнопка «{label}» недоступна'
    return game.choose(index)


class ValidatorTests(unittest.TestCase):
    def problems(self, game, cards):
        return content.validate(game, cards)[0]

    def test_clean_content_has_no_problems(self):
        self.assertEqual(self.problems(*tiny([event('start')])), [])

    def test_real_content_has_no_problems(self):
        self.assertEqual(self.problems(GAME, CARDS), [])

    def test_broken_next_is_reported(self):
        problems = self.problems(*tiny([event('start', {'next': ['nowhere']})]))
        self.assertTrue(any('nowhere' in p for p in problems))

    def test_broken_schedule_act_and_ending_are_reported(self):
        effects = {'schedule': [{'card': 'ghost', 'inDays': 1}], 'act': 'mars', 'ending': 'fin'}
        problems = ' '.join(self.problems(*tiny([event('start', effects)])))
        for name in ('ghost', 'mars', 'fin'):
            self.assertIn(name, problems)

    def test_unknown_effect_key_is_reported(self):
        problems = self.problems(*tiny([event('start', {'teleport': True})]))
        self.assertTrue(any('teleport' in p for p in problems))

    def test_unknown_stat_is_reported(self):
        problems = self.problems(*tiny([event('start', {'stats': {'karma': 5}})]))
        self.assertTrue(any('karma' in p for p in problems))

    def test_all_conditional_choices_are_reported(self):
        card = {'id': 'start', 'kind': 'event', 'text': 'т',
                'choices': [{'label': 'плед', 'requires': {'flags': ['x']}}]}
        problems = self.problems(*tiny([card, event('setter', {'set': ['x']})]))
        self.assertTrue(any('застрять' in p for p in problems))

    def test_flag_read_but_never_set_is_reported(self):
        problems = self.problems(*tiny([event('start', requires={'flags': ['never_set']})]))
        self.assertTrue(any('never_set' in p for p in problems))

    def test_non_repeatable_fallback_is_reported(self):
        game, cards = tiny([event('start')])
        next(c for c in cards if c['id'] == 'fb')['repeatable'] = False
        self.assertTrue(any('не повторяемая' in p for p in self.problems(game, cards)))

    def test_intro_must_be_list_of_strings(self):
        game, cards = tiny([event('start')])
        game['intro'] = 'строка'
        self.assertTrue(any('intro' in p for p in self.problems(game, cards)))


class EngineMirrorTests(unittest.TestCase):
    """Правила Python-копии — те же, что проверяет GameEngineTests.swift."""

    def play(self, cards, seed=1, **kw):
        game, all_cards = tiny(cards, **kw)
        return content.Game(game, all_cards, random.Random(seed))

    def test_next_takes_first_candidate_whose_requirement_holds(self):
        g = self.play([event('start', {'next': ['over', 'ok']}),
                       event('over', requires={'minCounters': {'kg': 24}}), event('ok')])
        g.choose(0)
        self.assertEqual(g.current, 'ok')

    def test_scheduled_card_is_dropped_when_requirement_fails(self):
        g = self.play([event('start', {'next': ['declare'], 'schedule': [{'card': 'returned', 'inDays': 1}]}),
                       event('declare', {'set': ['declared']}),
                       event('returned', requires={'notFlags': ['declared']})])
        g.choose(0)
        g.choose(0)
        self.assertEqual(g.current, 'fb')

    def test_act_change_resets_act_day(self):
        acts = [{'id': 'a', 'title': 'А', 'daysPerCard': 1, 'fallback': 'fb'},
                {'id': 'b', 'title': 'Б', 'daysPerCard': 3, 'fallback': 'fb'}]
        g = self.play([event('start', {'act': 'b', 'days': 10})], acts=acts)
        g.choose(0)
        self.assertEqual(g.day - g.act_start, 0)

    def test_stat_ending_beats_story_ending(self):
        g = self.play([event('start', {'stats': {'money': -5000}, 'ending': 'happy'})])
        g.choose(0)
        self.assertEqual(g.ending, 'broke')

    def test_clamping_reports_actual_change(self):
        g = self.play([event('start', {'stats': {'home': 80}})])
        _, applied = g.choose(0)
        self.assertEqual(applied, {'home': 50})


class StoryTests(unittest.TestCase):
    """Ключевые истории настоящего сценария ведут туда, куда задумано."""

    # --- финал ---

    def final_ending(self, flags=(), **stats):
        g = at_card('oei_final', 'oeiras', flags, **stats)
        tap(g, 'Подписать')
        g.choose(0)
        return g.ending

    def test_kept_things_open_museum(self):
        self.assertEqual(self.final_ending(['has_plaid', 'batumi_stone', 'has_album'], home=80, belonging=80), 'museum')

    def test_stone_thrown_into_ocean_means_no_museum(self):
        self.assertEqual(self.final_ending(['has_plaid', 'has_album'], home=80, belonging=80), 'two_homes')

    def test_strong_home_gives_two_homes(self):
        self.assertEqual(self.final_ending(home=70, belonging=80), 'two_homes')

    def test_faded_home_and_roots_give_ours_here(self):
        self.assertEqual(self.final_ending(home=40, belonging=90), 'ours_here')

    def test_middle_home_gives_thirty_years(self):
        self.assertEqual(self.final_ending(home=60, belonging=90), 'thirty_years')

    def test_no_roots_gives_thirty_years(self):
        self.assertEqual(self.final_ending(home=40, belonging=30), 'thirty_years')

    def test_return_home_hidden_when_home_is_weak(self):
        self.assertNotIn('Вернуться в Петербург', labels(at_card('oei_final', 'oeiras', home=40)))

    def test_return_home_ending(self):
        g = at_card('oei_final', 'oeiras', home=60)
        tap(g, 'Вернуться в Петербург')
        self.assertEqual(g.ending, 'return_home')

    def test_amsterdam_and_renting_endings(self):
        for label, ending in (('Принять оффер в Амстердаме', 'further'), ('Не подписывать. Пока', 'renting')):
            g = at_card('oei_final', 'oeiras')
            tap(g, label)
            self.assertEqual(g.ending, ending)

    def test_every_ending_is_reachable_somehow(self):
        reachable = {e['id'] for e in GAME['endings'] if 'stat' in e}
        for card in CARDS:
            for choice in card['choices']:
                if 'ending' in choice.get('effects', {}):
                    reachable.add(choice['effects']['ending'])
        self.assertEqual(reachable, {e['id'] for e in GAME['endings']})

    # --- посылка ---

    def play_until(self, g, turns, pick):
        shown = set()
        for _ in range(turns):
            if g.ending or g.current is None:
                break
            shown.add(g.current)
            g.choose(pick(g.available()))
        return shown

    def test_parcel_needs_nif_to_declare(self):
        self.assertNotIn('Задекларировать сейчас', labels(at_card('ctt_notice', 'figueira', ['in_portugal'])))

    def test_undeclared_parcel_goes_back_to_mom(self):
        g = at_card('ctt_notice', 'figueira', ['in_portugal'])
        tap(g, 'Потом разберусь')
        # Последняя кнопка: у напоминания это «Amanhã», то есть снова не декларируем.
        shown = self.play_until(g, 40, lambda options: options[-1])
        self.assertIn('parcel_returned', shown)
        self.assertNotIn('parcel_arrives', shown)

    def test_declared_parcel_arrives(self):
        g = at_card('ctt_notice', 'figueira', ['in_portugal', 'has_nif'])
        tap(g, 'Задекларировать сейчас')
        shown = self.play_until(g, 30, lambda options: options[0])
        self.assertIn('parcel_arrives', shown)
        self.assertNotIn('parcel_returned', shown)

    # --- чемодан ---

    def test_overweight_leads_to_scales(self):
        g = at_card('pack_scooter', 'packing', counters={'kg': 72})
        tap(g, 'Купим там новый')
        self.assertEqual(g.current, 'scales_over')

    def test_normal_weight_skips_scales(self):
        g = at_card('pack_scooter', 'packing', counters={'kg': 60})
        tap(g, 'Купим там новый')
        self.assertEqual(g.current, 'scales_ok')

    def test_paying_overweight_closes_suitcase(self):
        g = at_card('scales_over', 'packing', counters={'kg': 75})
        tap(g, 'Доплатить за перевес')
        self.assertEqual(g.current, 'scales_ok')

    def test_dropping_buckwheat_only_if_packed(self):
        self.assertNotIn('Выложить гречку', labels(at_card('scales_over', 'packing', counters={'kg': 75})))
        self.assertIn('Выложить гречку', labels(at_card('scales_over', 'packing', ['has_buckwheat'], counters={'kg': 75})))

    # --- отложенные вещи ---

    def test_plaid_button_only_with_plaid(self):
        self.assertIn('Бабушкин плед', labels(at_card('fig_cold', 'figueira', ['has_flat_pt', 'has_plaid'])))
        self.assertNotIn('Бабушкин плед', labels(at_card('fig_cold', 'figueira', ['has_flat_pt'])))

    def test_expensive_car_needs_money(self):
        poor = labels(at_card('bat_car', 'batumi', money=5000))
        self.assertNotIn('Купить красивую', poor)
        self.assertIn('Обойдёмся такси', poor)

    def test_brother_daughter_schedules_his_leaving(self):
        g = at_card('bat_brother_daughter', 'batumi')
        tap(g, 'Сесть рядом')
        self.assertIn('brother_niece', g.flags)
        self.assertIn('bat_brother_leaves', [cid for cid, _ in g.scheduled])

    def test_exactly_one_money_card_fits_each_job_situation(self):
        for prefix, place in (('bat_month_', 'in_batumi'), ('fig_month_', 'in_portugal')):
            cards = [c for c in CARDS if c['id'].startswith(prefix)]
            self.assertEqual(len(cards), 4)
            for jobs in (set(), {'job_me'}, {'job_wife'}, {'job_me', 'job_wife'}):
                g = at_card(cards[0]['id'], 'x', jobs | {place})
                fitting = [c['id'] for c in cards if g.meets(c.get('requires'))]
                self.assertEqual(len(fitting), 1, f'{prefix} {sorted(jobs)}: {fitting}')

    # --- форма ---

    def test_buttons_fit_on_screen(self):
        for card in CARDS:
            for choice in card['choices']:
                self.assertLessEqual(len(choice['label']), 32, f"{card['id']}: {choice['label']}")

    def test_random_playthroughs_always_end(self):
        for seed in range(100):
            g = content.Game(GAME, CARDS, random.Random(seed))
            for _ in range(1000):
                if g.ending:
                    break
                self.assertIsNotNone(g.current, f'сид {seed}: нет карточки')
                g.choose(g.rng.choice(g.available()))
            self.assertIsNotNone(g.ending, f'сид {seed}: партия не закончилась')


if __name__ == '__main__':
    unittest.main(verbosity=1)
