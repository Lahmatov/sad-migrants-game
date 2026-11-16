import { beforeEach, describe, test } from '@e2e-dev/mobile';
import { expect } from 'e2e';
import { agentSkip } from './support.ts';

// Agent steps run on Claude Code (e2e.config.ts). Skipped in CI without a login.
describe('agent flows', { tags: ['agent'], skip: agentSkip }, () => {
  beforeEach(async ({ app }) => {
    await app.clearState();
    await app.open();
  });

  test('the player reaches the first card from the title screen', async ({ agent, screen }) => {
    await agent.act('start a new game');
    await agent.act('skip the intro');

    await expect(screen.getByTestId('game-menu')).toBeVisible();
    await agent.assert('a game card is shown with its text and at least one answer button');
  });

  test('the player switches the colour theme to Day', async ({ agent, screen }) => {
    await agent.act('open Settings');
    await agent.act('choose the Day theme');

    await expect(screen.getByTestId('settings-theme-day')).toBeSelected();
    await expect(screen.getByTestId('settings-theme-night')).not.toBeSelected();
  });
});
