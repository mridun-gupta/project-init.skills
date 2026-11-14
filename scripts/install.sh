#!/usr/bin/env bash
# Installs the project-init skill into AI tool skill directories.
#   ./scripts/install.sh              # universal dir only (~/.agents/skills)
#   ./scripts/install.sh --all        # every known location
#   ./scripts/install.sh claude cursor   # specific targets
#   ./scripts/install.sh --list       # show targets and exit
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")/../skills/project-init" && pwd)"
[ -f "$SRC/SKILL.md" ] || { echo "no SKILL.md under $SRC" >&2; exit 1; }

declare -A T=(
  [agents]="$HOME/.agents/skills"                       # Devin, Cursor, Codex, Copilot, Gemini CLI, Zed, Cline
  [claude]="$HOME/.claude/skills"                       # Claude Code
  [codex]="$HOME/.codex/skills"                         # Codex (legacy path, still read)
  [cursor]="$HOME/.cursor/skills"                       # Cursor native
  [copilot]="$HOME/.copilot/skills"                     # VS Code Copilot / Copilot CLI
  [antigravity]="$HOME/.gemini/config/skills"           # Antigravity IDE + CLI (global)
  [gemini]="$HOME/.gemini/skills"                       # Gemini CLI
  [windsurf]="$HOME/.codeium/windsurf/skills"           # Windsurf
  [kiro]="$HOME/.kiro/skills"                           # Kiro
  [devin]="${APPDATA:-$HOME/.config}/devin/skills"      # Devin CLI native (%APPDATA% on Win)
  [amp]="$HOME/.config/agents/skills"                   # Amp
  [opencode]="$HOME/.config/opencode/skills"            # OpenCode
  [roo]="$HOME/.roo/skills"                             # Roo Code
)

if [[ "${1:-}" == "--list" ]]; then
  for k in "${!T[@]}"; do printf '%-12s %s\n' "$k" "${T[$k]}"; done; exit 0
fi

if [[ "${1:-}" == "--all" ]]; then
  chosen=("${!T[@]}")
elif [[ $# -eq 0 ]]; then
  chosen=(agents)
else
  chosen=("$@")
fi

for t in "${chosen[@]}"; do
  [[ -v "T[$t]" ]] || { echo "unknown target '$t' (use --list)" >&2; continue; }
  dest="${T[$t]}/project-init"
  mkdir -p "$dest"
  cp -r "$SRC/." "$dest/"
  echo "installed -> $dest"
done
echo "Done. Invoke with /project-init (or \$project-init in Codex)."
