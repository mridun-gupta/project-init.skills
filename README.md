# project-init

> A universal Agent Skill — one `SKILL.md` package that works across IDEs, AI coding apps, and model backends.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](CHANGELOG.md)
[![Agent Skills](https://img.shields.io/badge/spec-Agent%20Skills-green)](https://agentskills.io)

When a new project is created, the agent will:

1. **`git init`** (branch `main`) + baseline `.gitignore`
2. **Draft `PRD.md`, `TRD.md`, `EXECUTED.md`** at the project root
3. **Build a `docs/` knowledge base** in four tracks — `ai/`, `technical/`, `layman/`, `non-technical/` — plus an `AGENTS.md` conventions file so every *future* agent session keeps docs, folder READMEs, and file-header comments (doc refs, ISO-8601 timestamps, author) in sync

## Install

Pick whichever your tool supports — details in **[INSTALL.md](INSTALL.md)**:

```bash
# Any skill-aware agent (recommended — auto-detects ~12 tools)
npx skills add mridun-gupta/project-init.skills

# GitHub Copilot
gh skill add mridun-gupta/project-init.skills

# Claude Code — repo is its own marketplace
/plugin marketplace add mridun-gupta/project-init.skills

# Gemini CLI
gemini extensions install https://github.com/mridun-gupta/project-init.skills
gemini skills install https://github.com/mridun-gupta/project-init.skills

# Manual / scripted copy to tool dirs
git clone https://github.com/mridun-gupta/project-init.skills
cd project-init.skills
./scripts/install.sh          # or: pwsh scripts/install.ps1 (-All for every tool)
```

Vendor-neutral manual spot: copy `skills/project-init/` into `~/.agents/skills/` (covers Devin, Cursor, Codex, Copilot, Gemini CLI, Zed, Cline) or `<repo>/.agents/skills/` per-project.

## Use

| Invocation | Effect |
|---|---|
| `/project-init` or `init` | Full setup for a new project |
| `/project-init lite` | Skeleton docs now; upgrade later |
| `/project-init upgrade` or `full` | Retrofit an existing repo, idempotently |

Slash command in Devin / Claude Code / Cursor / Copilot / Antigravity · `$project-init` in Codex · `@` picker in ChatGPT desktop. Auto-triggers on "create a new project" in tools that support model-invocation.

## What it produces

```
my-project/
├── PRD.md  TRD.md  EXECUTED.md        # documents of record
├── AGENTS.md                          # standing conventions (read by Codex, Devin, Cursor, Copilot…)
├── CLAUDE.md  GEMINI.md               # one-line pointers → AGENTS.md
├── README.md  .gitignore  LICENSE
└── docs/
    ├── README.md                      # KB index
    ├── ai/  technical/  layman/  non-technical/
└── <every folder>/README.md + ISO-stamped header comments on every source file
```

```ts
/**
 * Handles OAuth token refresh.
 * Docs: docs/technical/api.md#auth
 * Author: Jane Doe
 * Last-Updated: 2026-11-14T10:35:00+05:30
 */
```

## Works with

Claude Code · Codex CLI / ChatGPT desktop · Cursor · VS Code Copilot / Copilot CLI · Devin · Google Antigravity · Gemini CLI · Windsurf · Kiro · Amp · OpenCode · Zed · Cline · Roo — anything reading the open [Agent Skills](https://agentskills.io) format. For tools without skill support (ChatGPT web, Grok, local models): paste `skills/project-init/SKILL.md` as a system prompt, or drop `templates/AGENTS.md` into the project.

## Repo layout

| Path | Purpose |
|---|---|
| `skills/project-init/` | The skill — `SKILL.md` + `templates/` + `references/` + `agents/openai.yaml` |
| `.claude-plugin/` | Claude Code plugin + marketplace manifest (this repo self-hosts) |
| `gemini-extension.json` | Gemini CLI extension manifest |
| `scripts/` | `install.ps1` / `install.sh` — copy to every known tool dir |
| `INSTALL.md` | Full per-tool install matrix + no-skill fallbacks |
| `PUBLISHING.md` | Directory/marketplace submission checklist |

## Contributing & releasing

See [CONTRIBUTING.md](CONTRIBUTING.md). Releases are git tags (`v1.0.0`); version lives in `CHANGELOG.md`, `.claude-plugin/plugin.json`, `.claude-plugin/marketplace.json`, and `gemini-extension.json` — keep them in sync.

[MIT](LICENSE) © mridun-gupta
