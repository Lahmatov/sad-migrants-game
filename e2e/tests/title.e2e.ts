import { beforeEach, describe, test } from '@e2e-dev/mobile';
import { expect } from 'e2e';

describe('title screen', () => {
  beforeEach(async ({ app }) => {
    // Fresh install: no save, default settings (Russian, night theme).
    await app.clearState();
    await app.open();
  });

  test('a fresh install offers New game and Settings, no Continue', async ({ screen }) => {
    await expect(screen.getByTestId('title-new-game')).toBeVisible();
    await expect(screen.getByTestId('title-new-game')).toHaveAccessibleName('Новая игра');
    await expect(screen.getByTestId('title-settings')).toBeVisible();
    await expect(screen.getByTestId('title-continue')).toHaveCount(0);
  });

  test('Done closes the settings sheet', async ({ screen }) => {
    await screen.getByTestId('title-settings').tap();
    await expect(screen.getByTestId('settings-done')).toBeVisible();

    await screen.getByTestId('settings-done').tap();

    await expect(screen.getByTestId('settings-done')).toHaveCount(0);
    await expect(screen.getByTestId('title-new-game')).toBeVisible();
  });

  test('choosing English relabels the title menu', async ({ screen }) => {
    await screen.getByTestId('title-settings').tap();
    await expect(screen.getByTestId('settings-done')).toBeVisible();

    await screen.getByTestId('settings-language-en').tap();
    await screen.getByTestId('settings-done').tap();

    await expect(screen.getByTestId('title-new-game')).toHaveAccessibleName('New game');
    await expect(screen.getByTestId('title-settings')).toHaveAccessibleName('Settings');
  });
});
