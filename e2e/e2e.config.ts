import type { E2EConfig } from 'e2e';
import { mobile } from '@e2e-dev/mobile';
import { claudeCode } from '@e2e-dev/acp';

// The game under test. CI builds a simulator .app and installs it with simctl
// before the run (.github/workflows/e2e.yml); locally, build and run it once from
// Xcode on the simulator (or `xcrun simctl install booted <MigrantSad.app>`).
export default {
  tests: 'tests/**/*.e2e.ts',
  targets: [
    {
      name: 'ios',
      // IOS_DEVICE pins a simulator by name or UDID; without it a booted iPhone simulator is used.
      engine: mobile({ platform: 'ios', ...(process.env.IOS_DEVICE ? { device: process.env.IOS_DEVICE } : {}) }),
      app: { bundleId: 'com.lahmatov.migrantsad' },
    },
  ],
  // One simulator, one worker.
  workers: 1,
  // A cold simulator launch plus the first music/asset load is slow on CI Macs.
  launchTimeout: 120_000,
  assertionTimeout: 10_000,
  // agent.* steps run on Claude Code over ACP with the owner's subscription
  // (claude login locally, CLAUDE_CODE_OAUTH_TOKEN in CI). Tests without agent
  // steps never start it.
  agents: {
    default: {
      executor: claudeCode({ model: 'sonnet' }),
      context: [
        'This is "23 kg", a pixel-art text game about emigration, portrait iPhone.',
        'The UI is in Russian by default. Title screen buttons: «Продолжить» = Continue,',
        '«Новая игра» = New game, «Настройки» = Settings. The intro has «Пропустить» = Skip',
        'and later «Начать» = Start. A game card shows stats at the top, a ☰ menu button',
        '(«Меню»), a gear for settings, the card text and one button per answer.',
        'Settings sheet: «Готово» = Done; themes «Ночь» = Night, «День» = Day, «Сепия» = Sepia;',
        'languages «Русский», «English», «Português».',
      ].join(' '),
    },
  },
} satisfies E2EConfig;
