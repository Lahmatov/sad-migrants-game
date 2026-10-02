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
import re
import sys
import unittest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import content  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

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


class ChoiceShapeTests(unittest.TestCase):
    """Выбор должен быть выбором: не монетка и не ловушка."""

    def test_detector_finds_option_worse_in_everything(self):
        card = {'id': 'x', 'choices': [
            {'label': 'хорошо', 'effects': {'stats': {'nerves': 5, 'home': 2}}},
            {'label': 'плохо', 'effects': {'stats': {'nerves': 3}}}]}
        self.assertEqual(len(content.dominated_choices([card])), 1)

    def test_detector_accepts_real_trade_off(self):
        card = {'id': 'x', 'choices': [
            {'label': 'деньги', 'effects': {'stats': {'money': 100, 'nerves': -5}}},
            {'label': 'нервы', 'effects': {'stats': {'nerves': 5}}}]}
        self.assertEqual(content.dominated_choices([card]), [])

    def test_detector_ignores_options_with_future_consequences(self):
        card = {'id': 'x', 'choices': [
            {'label': 'хорошо', 'effects': {'stats': {'nerves': 5}}},
            {'label': 'с флагом', 'effects': {'stats': {'nerves': 3}, 'set': ['later']}}]}
        self.assertEqual(content.dominated_choices([card]), [])

    def test_no_option_is_worse_in_everything(self):
        self.assertEqual(content.dominated_choices(CARDS), [])

    def test_no_card_is_a_coin_flip(self):
        # Один вариант — это судьба, два — монетка, три — выбор.
        # Два допустимы, только если второй открывается прошлым решением.
        flips = [c['id'] for c in CARDS
                 if len(c['choices']) == 2 and all('requires' not in x for x in c['choices'])]
        self.assertEqual(flips, [])

    def test_dad_call_is_remembered(self):
        self.assertNotIn('Вспомнить тот звонок', labels(at_card('oei_father', 'oeiras')))
        g = at_card('call_dad', 'packing')
        tap(g, 'Позвать его с собой')
        self.assertIn('asked_dad', g.flags)
        self.assertIn('Вспомнить тот звонок', labels(at_card('oei_father', 'oeiras', ['asked_dad'])))

    def test_paris_and_spain_follow_moms_first_visit(self):
        paris = next(c for c in CARDS if c['id'] == 'oei_mom_paris')
        spain = next(c for c in CARDS if c['id'] == 'oei_mom_spain')
        self.assertIn('mom_visited', paris['requires']['flags'])
        self.assertIn('mom_visited', spain['requires']['flags'])
        g = at_card('f2_mom_visit', 'figueira2')
        tap(g, 'Просто быть дома')
        self.assertIn('mom_visited', g.flags)

    def test_drive_to_malaga_only_with_the_old_peugeot(self):
        self.assertNotIn('Ехать на Пежо', labels(at_card('f2_inlaws_malaga', 'figueira2')))
        self.assertIn('Ехать на Пежо', labels(at_card('f2_inlaws_malaga', 'figueira2', ['old_car'])))

    def test_mom_has_not_met_granddaughter_yet(self):
        for cid in ('oei_mom_again', 'oei_mom_paris', 'oei_mom_spain'):
            card = next(c for c in CARDS if c['id'] == cid)
            self.assertIn('daughter', card['requires']['notFlags'], cid)

    def test_wifes_parents_arrive_before_the_birth(self):
        # Они были здесь в день родов — сидели с сыном.
        g = at_card('oei_law_change', 'oeiras', ['pregnant'])
        tap(g, 'Перечитать закон')
        due = dict(g.scheduled)
        self.assertLess(due['oei_inlaws_granddaughter'], due['oei_daughter_born'])
        g = at_card('oei_law_change', 'oeiras', ['pregnant'])
        tap(g, 'Не говорить жене')
        self.assertIn('oei_inlaws_granddaughter', dict(g.scheduled))

    def test_memories_surface_after_what_reminds_of_them(self):
        triggers = {'mem_sled': 'bat_snow', 'mem_ford_ka': 'bat_toys', 'mem_brother_lake': 'bat_brother_here',
                    'mem_chips': 'fig_mom_birthday', 'mem_dad_car': 'oei_father_back'}
        by_id = {c['id']: c for c in CARDS}
        for memory, trigger in triggers.items():
            self.assertEqual(by_id[memory].get('kind'), 'event', memory)
            for choice in by_id[trigger]['choices']:
                scheduled = [s['card'] for s in choice['effects'].get('schedule', [])]
                self.assertIn(memory, scheduled, f'{trigger} → {memory}')

    def test_memories_inside_story_chains(self):
        g = at_card('dep_mom_dinner', 'departure')
        tap(g, 'Есть ещё пирожок')
        self.assertEqual(g.current, 'mem_murmansk')
        tap(g, 'Сказать маме «спасибо»')
        self.assertEqual(g.current, 'dep_money')
        g = at_card('oei_father_trip', 'oeiras')
        tap(g, 'Разобрать его квартиру')
        self.assertEqual(g.current, 'mem_gasmask')
        tap(g, 'Рассмеяться')
        self.assertEqual(g.current, 'oei_father_back')

    def test_dads_watch_only_if_you_took_it(self):
        self.assertNotIn('Посмотреть на его часы', labels(at_card('mem_dad_car', 'oeiras')))
        self.assertIn('Посмотреть на его часы', labels(at_card('mem_dad_car', 'oeiras', ['father_watch'])))

    def test_azores_trip_was_before_the_daughter(self):
        card = next(c for c in CARDS if c['id'] == 'oei_azores')
        self.assertIn('daughter', card['requires']['notFlags'])

    def test_mom_first_comes_to_batumi(self):
        g = at_card('bat_mom_visit', 'batumi')
        tap(g, 'Повести на пляж')
        self.assertIn('mom_visited', g.flags)

    def test_grandma_dance_video_only_if_you_danced(self):
        self.assertNotIn('Пересмотреть её танец', labels(at_card('f2_grandma', 'figueira2')))
        g = at_card('bat_wedding', 'batumi', ['new_offer'])
        tap(g, 'Позвать её танцевать')
        self.assertIn('grandma_dance', g.flags)


class CardArtTests(unittest.TestCase):
    """У каждой карточки и каждого выбора есть промпт на картинку."""

    def setUp(self):
        import make_card_art
        self.art = make_card_art

    def test_every_card_and_choice_has_prompt(self):
        self.assertEqual(self.art.problems(CARDS, self.art.load_art()), [])

    def test_renamed_button_is_reported(self):
        card = {'id': 'x', 'choices': [{'label': 'новая'}]}
        acts = [('t.json', {'cards': [{'id': 'x', 'image': 'a', 'anim': 'none',
                                       'choices': [{'label': 'старая', 'image': 'b', 'anim': 'none'}]}]})]
        self.assertEqual(len(self.art.problems([card], acts)), 1)

    def test_missing_card_and_unknown_animation_are_reported(self):
        cards = [{'id': 'x', 'choices': []}, {'id': 'y', 'choices': []}]
        acts = [('t.json', {'cards': [{'id': 'x', 'image': 'a', 'anim': 'fireworks', 'choices': []}]})]
        found = self.art.problems(cards, acts)
        self.assertTrue(any('y' in f for f in found))
        self.assertTrue(any('fireworks' in f for f in found))

    def test_key_cards_go_second_and_choices_last(self):
        self.assertEqual(self.art.tier('x', {'key': True}, True), 2)
        self.assertEqual(self.art.tier('x', {}, True), 3)
        self.assertEqual(self.art.tier('x__1', {'key': True}, False), 3)

    def test_there_are_about_forty_key_cards(self):
        keys = [e for _, data in self.art.load_art() for e in data['cards'] if e.get('key')]
        self.assertTrue(30 <= len(keys) <= 50, len(keys))

    def test_animation_names_match_the_app(self):
        path = os.path.join(ROOT, 'Core', 'Sources', 'MigrantCore', 'ArtMotion.swift')
        with open(path, encoding='utf-8') as handle:
            swift = handle.read()
        cases = re.search(r'case (none, [a-z, ]+)\n', swift).group(1).split(', ')
        self.assertEqual(cases, self.art.ANIMATIONS)


class StoryTests(unittest.TestCase):
    """Ключевые истории настоящего сценария ведут туда, куда задумано."""

    # --- финал ---

    def final_ending(self, flags=(), **stats):
        g = at_card('oei_final', 'oeiras', flags, **stats)
        tap(g, 'Подписать')
        g.choose(0)
        return g.ending

    def test_kept_things_open_museum(self):
        self.assertEqual(self.final_ending(['grandma_envelope', 'batumi_stone', 'has_album'], home=80, belonging=80), 'museum')

    def test_stone_thrown_into_ocean_means_no_museum(self):
        self.assertEqual(self.final_ending(['grandma_envelope', 'has_album'], home=80, belonging=80), 'two_homes')

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

    def test_america_only_with_american_job(self):
        self.assertNotIn('Принять оффер из Штатов', labels(at_card('oei_final', 'oeiras')))
        g = at_card('oei_final', 'oeiras', ['us_job'])
        tap(g, 'Принять оффер из Штатов')
        self.assertEqual(g.ending, 'america')

    def test_new_american_job_remembers_america(self):
        g = at_card('fig_job_found_me', 'figueira')
        tap(g, 'Принять')
        self.assertIn('us_job', g.flags)

    def test_buying_outright_only_after_business_took_off(self):
        self.assertNotIn('Купить без ипотеки', labels(at_card('oei_final', 'oeiras', ['business'])))
        g = at_card('oei_final', 'oeiras', ['business_ok'])
        tap(g, 'Купить без ипотеки')
        self.assertEqual(g.ending, 'rich')

    def test_moving_apart_ends_in_divorce(self):
        g = at_card("oei_apart", "oeiras", nerves=15)
        tap(g, 'Разъехаться')
        self.assertEqual(g.ending, 'divorce')

    def test_talking_keeps_family_and_closes_the_question(self):
        g = at_card("oei_apart", "oeiras", nerves=15)
        tap(g, 'Поговорить по-настоящему')
        self.assertIsNone(g.ending)
        self.assertIn('apart_talked', g.flags)

    def test_laptop_sale_only_after_layoff(self):
        card = next(c for c in CARDS if c['id'] == 'fig_laptop_sell')
        self.assertIn('job_me', card['requires']['notFlags'])
        self.assertIn('has_laptop2', card['requires']['flags'])

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
        g = at_card('pack_album', 'packing', counters={'kg': 50})
        tap(g, 'Сфотографировать страницы')
        self.assertEqual(g.current, 'scales_over')

    def test_normal_weight_skips_scales(self):
        g = at_card('pack_album', 'packing', counters={'kg': 40})
        tap(g, 'Сфотографировать страницы')
        self.assertEqual(g.current, 'scales_ok')

    def test_paying_overweight_closes_suitcase(self):
        g = at_card('scales_over', 'packing', counters={'kg': 75})
        tap(g, 'Доплатить за перевес')
        self.assertEqual(g.current, 'scales_ok')

    def test_dropping_buckwheat_only_if_packed(self):
        self.assertNotIn('Выложить гречку', labels(at_card('scales_over', 'packing', counters={'kg': 75})))
        self.assertIn('Выложить гречку', labels(at_card('scales_over', 'packing', ['has_buckwheat'], counters={'kg': 75})))

    # --- отложенные вещи ---

    def test_grandma_banknote_only_if_envelope_was_kept(self):
        self.assertIn('Достать её купюру', labels(at_card('f2_grandma', 'figueira2', ['grandma_envelope'])))
        self.assertNotIn('Достать её купюру', labels(at_card('f2_grandma', 'figueira2')))

    def test_brother_comes_only_after_wedding(self):
        g = at_card('bat_day', 'batumi')
        g.day = 400
        card = g.by_id['bat_brother_call']
        self.assertFalse(g.meets(card.get('requires')))
        g.flags.add('wedding_done')
        self.assertTrue(g.meets(card.get('requires')))

    def test_lego_can_be_left_only_once(self):
        g = at_card('scales_over', 'packing', ['has_toys'], counters={'kg': 60})
        tap(g, 'Выложить Лего')
        self.assertEqual(g.current, 'scales_over')
        self.assertNotIn('Выложить Лего', labels(g))

    def test_expensive_car_needs_money(self):
        poor = labels(at_card('bat_car', 'batumi', money=5000))
        self.assertNotIn('Взять то, что хочется', poor)
        rich = labels(at_card('bat_car', 'batumi', money=20000))
        self.assertIn('Взять то, что хочется', rich)
        self.assertIn('Обойдёмся такси', poor)

    def test_brother_leaves_together_with_you(self):
        g = at_card('bat_schengen', 'batumi', ['brother_here', 'portugal_idea'])
        tap(g, 'В Португалию')
        self.assertEqual(g.current, 'bat_brother_leaves')

    def test_without_brother_you_go_straight_to_packing(self):
        g = at_card('bat_schengen', 'batumi', ['portugal_idea'])
        tap(g, 'В Португалию')
        self.assertEqual(g.current, 'bat_last_stones')

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
