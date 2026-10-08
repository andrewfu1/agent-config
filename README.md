# Agent config

Global working preferences for Codex and Claude Code: independent judgment, plain English, and minimal changes grounded in the code.

## Install

```sh
git clone https://github.com/andrewfu1/agent-config.git ~/code/agent-config
cd ~/code/agent-config
./install.sh
```

The installer links `personality.md` to `~/.codex/AGENTS.md` and `~/.claude/CLAUDE.md`. Existing instruction files are backed up, then replaced by links. Rerunning does not duplicate anything. It honors `CODEX_HOME` and `CLAUDE_CONFIG_DIR` when set.

Run on each machine where you use the agents, then start new sessions. Keep this checkout in place.

## Update

```sh
git pull --ff-only
```

Edit `personality.md` to change both tools' preferences. Changes load in new sessions. These are global defaults; other loaded instructions can affect behavior.

[Design notes](DESIGN.md) · [Behavior checks](CHECKS.md)
