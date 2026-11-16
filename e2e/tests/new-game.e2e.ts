import { beforeEach, describe, test } from '@e2e-dev/mobile';
import { expect } from 'e2e';

describe('new game', () => {
  beforeEach(async ({ app }) => {
    await app.clearState();
    await app.open();
  });

  test('Skip on the intro opens the first card', async ({ screen }) => {
    await screen.getByTestId('title-new-game').tap();
    await expect(screen.getByTestId('intro-skip')).toBeVisible();

    await screen.getByTestId('intro-skip').tap();

    await expect(screen.getByTestId('game-menu')).toBeVisible();
    await expect(screen.getByTestId('game-settings')).toBeVisible();
    await expect(screen.getByTestId(/^choice-\d+$/).first()).toBeVisible();
  });

  test('a started game offers Continue after a relaunch', async ({ app, screen }) => {
    await screen.getByTestId('title-new-game').tap();
    await screen.getByTestId('intro-skip').tap();
    await expect(screen.getByTestId('game-menu')).toBeVisible();

    await app.restart();

    await expect(screen.getByTestId('title-continue')).toBeVisible();
    await expect(screen.getByTestId('title-continue')).toHaveAccessibleName('Продолжить');
  });
});
