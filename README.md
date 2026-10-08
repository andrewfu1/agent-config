# Agent Config

Global personality preferences for Codex and Claude Code.

1. Reduce LLM sycophancy
2. Write in ASD-STE100 inspired english
3. Follow programming best practices

## Install

```sh
git clone https://github.com/andrewfu1/agent-config.git
cd agent-config
./install.sh
```

The installer copies `personality.md` into `~/.codex/AGENTS.md` and `~/.claude/CLAUDE.md` as regular files. Existing instructions are backed up before replacement. It skips an agent if it is not installed.
