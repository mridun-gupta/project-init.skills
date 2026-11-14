# Installing `project-init`

The skill lives at **`skills/project-init/`** in this repo. Use a one-line installer, an ecosystem plugin mechanism, or a manual copy. Restart the tool after installing.

## One-line installs (once this repo is public)

```bash
npx skills add mridun-gupta/project-init.skills      # auto-detects ~12 agents
gh skill add mridun-gupta/project-init.skills        # GitHub Copilot
gemini skills install https://github.com/mridun-gupta/project-init.skills
gemini extensions install https://github.com/mridun-gupta/project-init.skills
```

Claude Code (repo self-hosts a marketplace):

```
/plugin marketplace add mridun-gupta/project-init.skills
/plugin install project-init@mridun-gupta-skills
```

## Scripted copy

```bash
git clone https://github.com/mridun-gupta/project-init.skills && cd project-init.skills
./scripts/install.sh            # bash — ~/.agents/skills by default
./scripts/install.sh --all      # every known location
./scripts/install.sh --list     # show targets
```

```powershell
git clone https://github.com/mridun-gupta/project-init.skills; cd project-init.skills
.\scripts\install.ps1           # PowerShell — ~/.agents/skills by default
.\scripts\install.ps1 -All      # every known location
.\scripts\install.ps1 -List     # show targets
```

## Easiest manual spot: the vendor-neutral path

`.agents/skills/` is the cross-vendor standard — one copy reaches most tools.

| Scope | Path | Reaches |
|---|---|---|
| Project | `<repo>/.agents/skills/project-init/` | Devin, Codex, Cursor, Antigravity, VS Code Copilot, Gemini CLI, Zed, Amp, OpenCode, Cline, Roo |
| Global | `~/.agents/skills/project-init/` | Same, for every project on this machine |

```bash
mkdir -p ~/.agents/skills && cp -r skills/project-init ~/.agents/skills/
```
```powershell
Copy-Item -Recurse .\skills\project-init "$HOME\.agents\skills\project-init"
```

## Full install matrix (per tool)

| Tool | Project-level | Global (all projects) | Notes |
|---|---|---|---|
| **Devin CLI / Desktop** | `.devin/skills/`, `.agents/skills/` | `~/.agents/skills/` · `%APPDATA%\devin\skills\` (Win) · `~/.config/devin/skills/` (mac/linux) · `~/.codeium/<channel>/skills/` | Also reads `.claude`, `.codex`, `.kiro`, `.github`, `.windsurf` skill dirs |
| **Cursor** | `.agents/skills/`, `.cursor/skills/` | `~/.agents/skills/` · `~/.cursor/skills/` | `~/.cursor/skills/` syncs to Cloud Agents; also reads `.claude`/`.codex` dirs |
| **Codex CLI / ChatGPT desktop** | `.agents/skills/` | `~/.agents/skills/` · `~/.codex/skills/` (legacy) · `/etc/codex/skills/` (system) | Invoke `$project-init` or `/skills` |
| **VS Code Copilot** | `.github/skills/`, `.agents/skills/`, `.claude/skills/` | `~/.copilot/skills/` · `~/.agents/skills/` · `~/.claude/skills/` | |
| **Claude Code** | `.claude/skills/` | `~/.claude/skills/` | Doesn't read `.agents` — use plugin install or own copy |
| **Google Antigravity** | `.agents/skills/` | `~/.gemini/config/skills/` | Global dir differs from the standard |
| **Gemini CLI** | `.agents/skills/` | `~/.gemini/skills/` · `~/.agents/skills/` | Extension install also works |
| **Windsurf** | `.windsurf/skills/`, `.agents/skills/` | `~/.codeium/<channel>/skills/` | channel: `windsurf`/`windsurf-next`/`windsurf-insiders` |
| **Kiro** | `.kiro/skills/` | `~/.kiro/skills/` | |
| **Amp** | `.agents/skills/` | `~/.config/agents/skills/` | |
| **OpenCode** | `.agents/skills/` | `~/.config/opencode/skills/` | |
| **Zed** | `.agents/skills/` | `~/.agents/skills/` | |
| **Cline / Roo Code** | `.agents/skills/` | `~/.agents/skills/` · `~/.roo/skills/` | |

## Tools without skill support

ChatGPT web, Grok, generic/local models (Ollama, LM Studio, llama.cpp):

- Paste the body of `skills/project-init/SKILL.md` as a system prompt / custom instruction.
- Or copy `skills/project-init/templates/AGENTS.md` (tokens filled) into the project root — any AGENTS.md-reading agent follows the conventions.

## Optional per-tool extras

Frontmatter is deliberately spec-minimal (`name`, `description`, `argument-hint`, `license`). In a per-tool copy you can add, e.g. for Devin: `allowed-tools`, `permissions`; for Claude Code: `allowed-tools`. Keep `name`/`description` unchanged.

## Uninstall

Delete the `project-init/` folder from each install location.
