# Agent Config

Global personality preferences for Codex and Claude Code.

1. Reduce LLM sycophancy
2. ASD-STE100 inspired english
3. Programming best practices

## Install

```sh
git clone https://github.com/andrewfu1/agent-config.git ~/code/agent-config
cd ~/code/agent-config
./install.sh
```

The installer skips an agent if its command is missing from PATH or its config folder does not exist

The installer copies `personality.md` into `~/.codex/AGENTS.md` and `~/.claude/CLAUDE.md` as regular files. Existing instructions are backed up before replacement.
