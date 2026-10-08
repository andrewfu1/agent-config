# Design choices

One shared personality file keeps Codex and Claude Code aligned. This version contains no skills, model settings, hooks, or login state.

## Length

There is no established best word count for this personality prompt. OpenAI recommends a short, practical AGENTS.md and adding rules in response to repeated mistakes. Anthropic recommends keeping CLAUDE.md under 200 lines and making instructions specific and concise. This file is deliberately much shorter than that ceiling. Its length is a starting choice, not a measured optimum.

- [OpenAI: best practices](https://learn.chatgpt.com/guides/best-practices)
- [Anthropic: instruction files](https://code.claude.com/docs/en/memory)

## Judgment

The priority is accurate assessment, not agreement or disagreement for its own sake. Rules explicitly require evidence, allow justified agreement, and require reconsideration when facts change. The longer source draft was condensed to avoid repeating the same instruction in several forms.

## Language

ASD-STE100 is a controlled language for technical documentation, with rules for vocabulary and sentence structure. Here, it inspires plain words, active voice, short sentences, and consistent terms. Strict vocabulary compliance would be awkward for general coding conversations. “80% toward STE” is a style preference, not a compliance score.

- [ASD-STE100: official specification](https://www.asd-ste100.org/assets/files/ASD-STE100_ISSUE9.pdf)

## Code and uncertainty

“Never make assumptions” is expressed as inspecting relevant code before claiming its behavior. The agent must label uncertainty and ask about consequential gaps. It may state low-impact assumptions and proceed, so simple work does not stall.

Minimal implementation means solving the actual problem with existing tools when suitable. It does not mean choosing fewer lines at the expense of correctness or clarity.

## Scope and limits

The installer uses each tool's global instruction location. It backs up existing instructions rather than combining potentially conflicting prompts. Review backups if you want to retain any old preferences.

- [Codex: global instructions](https://learn.chatgpt.com/docs/agent-configuration/agents-md)
- [Claude Code: user instructions](https://code.claude.com/docs/en/memory)

Instructions influence behavior; they do not guarantee it. Use the behavior checks to identify repeated failures, then revise only the rules that need improvement.
