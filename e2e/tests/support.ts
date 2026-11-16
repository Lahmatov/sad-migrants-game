/**
 * Agent steps need a Claude Code login. Locally that is `claude` signed in; in CI it is
 * the CLAUDE_CODE_OAUTH_TOKEN secret (`claude setup-token`). Without it, CI skips the
 * agent tests instead of failing them.
 */
export const agentSkip: string | false =
  process.env.CI && !process.env.CLAUDE_CODE_OAUTH_TOKEN && !process.env.ANTHROPIC_API_KEY
    ? 'no Claude Code login in CI: add the CLAUDE_CODE_OAUTH_TOKEN secret'
    : false;
