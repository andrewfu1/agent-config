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

The installer copies `personality.md` into `~/.codex/AGENTS.md` and `~/.claude/CLAUDE.md` as regular files. Existing instructions are backed up before replacement. Identical files are left alone.


## Update

```sh
git pull --ff-only
./install.sh
```

Start new agent sessions after installing updates. The installed files work independently of this repo.
