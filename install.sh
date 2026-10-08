#!/usr/bin/env bash
# Copy the personality text to the global instruction files for both tools.
set -euo pipefail
if [ "$#" -ne 0 ]; then
  echo 'Usage: ./install.sh' >&2
  exit 2
fi
repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source_file="$repo_dir/personality.md"
codex_dir="${CODEX_HOME:-$HOME/.codex}"
claude_dir="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
targets=()
for agent in codex claude; do
  case "$agent" in
    codex) label='Codex'; config_dir="$codex_dir"; filename='AGENTS.md' ;;
    claude) label='Claude Code'; config_dir="$claude_dir"; filename='CLAUDE.md' ;;
  esac
  if ! command -v "$agent" >/dev/null 2>&1; then
    echo "Skipped $label: '$agent' command not found on PATH."
    continue
  fi
  if [ ! -d "$config_dir" ]; then
    echo "Skipped $label: config folder does not exist: $config_dir. Run $agent once, then rerun this installer."
    continue
  fi
  targets+=("$config_dir/$filename")
done
if [ "${#targets[@]}" -eq 0 ]; then
  echo 'No agent configs updated.'
  exit 0
fi
# Check eligible destinations before changing either one.
for target in "${targets[@]}"; do
  if [ -d "$target" ]; then
    echo "Expected an instruction file, found a directory: $target" >&2
    exit 1
  fi
done
for target in "${targets[@]}"; do
  if [ -f "$target" ] && cmp -s -- "$source_file" "$target"; then
    echo "Already up to date: $target"
    continue
  fi
  if [ -e "$target" ]; then
    saved="$target.pre-agent-config"
    index=1
    while [ -e "$saved" ]; do
      saved="$target.pre-agent-config.$index"
      index=$((index + 1))
    done
    mv -- "$target" "$saved"
    echo "Backed up: $saved"
  fi
  cp -- "$source_file" "$target"
  echo "Copied: $target"
done
if [ -s "$codex_dir/AGENTS.override.md" ]; then
  echo 'Note: your existing AGENTS.override.md takes precedence over the Codex personality file.'
fi
echo 'Start new sessions in the updated agents to load the preferences.'
