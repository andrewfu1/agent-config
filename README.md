# Agent Config

Global personality preferences for Codex and Claude Code. 

- Reduce LLM sycophancy
- ASD-STE100 inspired english
- Programming best practices

## Install

```sh
git clone https://github.com/andrewfu1/agent-config.git ~/code/agent-config
cd ~/code/agent-config
./install.sh
```

The installer skips an agent if its command is missing from PATH or its config folder does not exist

The installer links `personality.md` to `~/.codex/AGENTS.md` and `~/.claude/CLAUDE.md`. Existing instruction files are backed up, then replaced by links.
