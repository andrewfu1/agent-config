#!/usr/bin/env bash
# Link one personality file to the global instruction locations for both tools.
set -euo pipefail
if [ "$#" -ne 0 ]; then
  echo 'Usage: ./install.sh' >&2
  exit 2
fi
repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source_file="$repo_dir/personality.md"
codex_dir="${CODEX_HOME:-$HOME/.codex}"
claude_dir="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
# Check both destinations before changing either one.
for target in "$codex_dir/AGENTS.md" "$claude_dir/CLAUDE.md"; do
  if [ -d "$target" ]; then
    echo "Expected an instruction file, found a directory: $target" >&2
    exit 1
  fi
done
for target in "$codex_dir/AGENTS.md" "$claude_dir/CLAUDE.md"; do
  mkdir -p -- "$(dirname -- "$target")"
  if [ -L "$target" ] && [ "$(readlink "$target")" = "$source_file" ]; then
    echo "Already linked: $target"
    continue
  fi
  if [ -e "$target" ] || [ -L "$target" ]; then
    saved="$target.pre-agent-config"
    index=1
    while [ -e "$saved" ] || [ -L "$saved" ]; do
      saved="$target.pre-agent-config.$index"
      index=$((index + 1))
    done
    mv -- "$target" "$saved"
    echo "Backed up: $saved"
  fi
  ln -s -- "$source_file" "$target"
  echo "Linked: $target"
done
if [ -s "$codex_dir/AGENTS.override.md" ]; then
  echo 'Note: your existing AGENTS.override.md takes precedence over the Codex personality file.'
fi
echo 'Start new Codex and Claude Code sessions to load the preferences.'
