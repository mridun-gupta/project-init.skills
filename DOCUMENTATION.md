# project-init — Documentation

> Universal Agent Skill: initializes or upgrades a software project to a documentation standard — `git init`, `PRD.md`/`TRD.md`/`EXECUTED.md`, a four-audience `docs/` knowledge base, `AGENTS.md` conventions, and ISO-8601 timestamped header comments on every source file.

- **Repo:** https://github.com/mridun-gupta/project-init.skills
- **Latest release:** https://github.com/mridun-gupta/project-init.skills/releases/latest
- **License:** MIT

## 1. What it is

One `SKILL.md` package (open [Agent Skills](https://agentskills.io) standard) + templates + conventions spec. Install it once; every agent that supports skills can then scaffold fully documented projects on demand. The generated `AGENTS.md` keeps the conventions alive for every future agent session — even agents that never loaded the skill.

## 2. Install

| Method | Command |
|---|---|
| skills CLI (recommended) | `npx skills add mridun-gupta/project-init.skills` |
| GitHub Copilot | `gh skill add mridun-gupta/project-init.skills` |
| Claude Code | `/plugin marketplace add mridun-gupta/project-init.skills` then install `project-init` |
| Gemini CLI | `gemini extensions install https://github.com/mridun-gupta/project-init.skills` or `gemini skills install <same>` |
| Scripted copy | `git clone` the repo → `./scripts/install.sh` or `pwsh scripts/install.ps1` (`--all`/`-All` for every tool) |
| Manual | copy `skills/project-init/` into `~/.agents/skills/` (universal) or the tool-specific dir in [INSTALL.md](INSTALL.md) |

## 3. Invoke

| Command | Effect |
|---|---|
| `/project-init` or `init` | Full setup for a new project |
| `/project-init lite` | Skeleton docs only; upgrade later |
| `/project-init upgrade` or `full` | Idempotent retrofit of an existing repo |

Slash form in Devin, Claude Code, Cursor, Copilot, Antigravity · `$project-init` in Codex · `@`-picker in ChatGPT desktop · auto-triggers on "create a new project" where supported.

Before writing anything it asks four questions: **project name + one-line purpose**, **mode**, **author** (defaults to `git config user.name` → OS username), and **extras** (README, LICENSE, initial commit).

## 4. What it produces

```
my-project/
├── PRD.md            # product requirements (from templates/PRD.md)
├── TRD.md            # technical design; sections link to living docs
├── EXECUTED.md       # append-only action/decision log w/ ISO timestamps + actor
├── AGENTS.md         # standing conventions for all contributors & agents
├── CLAUDE.md / GEMINI.md   # one-line pointers to AGENTS.md
├── README.md  .gitignore  LICENSE (MIT)
└── docs/
    ├── README.md     # knowledge-base index
    ├── ai/           # dense, structured, machine-optimized
    ├── technical/    # engineers: setup, architecture, APIs, runbooks
    ├── layman/       # plain language, analogies, no jargon
    └── non-technical/# business/product framing for stakeholders
```

**Full mode** additionally adds a `README.md` to every folder and a header comment to every source file:

```ts
/**
 * Handles OAuth token refresh.
 * Docs: docs/technical/api.md#auth
 * Author: Jane Doe
 * Last-Updated: 2026-11-14T10:35:00+05:30
 */
```

Header rules (full spec: `skills/project-init/references/`): `Docs:` must point at a real file+anchor in `docs/`; `Last-Updated` is ISO 8601 with offset, bumped on every edit; files that can't hold comments (JSON, lockfiles, binaries, generated) are documented in the folder README instead. Comment syntax covers ~15 language families including `//`, `#`, `/* */`, `<!-- -->`, `--`, `;;`, `%`, `(* *)`, `REM`, `'`, and YAML frontmatter for Markdown/YAML.

## 5. Conventions it enforces (via generated AGENTS.md)

On every code change, the same change-set must: bump `Last-Updated` in touched file headers → update relevant `docs/` pages (technical + ai always; layman/non-technical when user-visible behavior changed) → update folder README contents tables → append one `EXECUTED.md` row. Never delete docs; unknowns become `> TODO:` markers.

## 6. Compatibility

Any agent loading `SKILL.md` per the Agent Skills standard: Claude Code, Codex CLI / ChatGPT desktop, Cursor, VS Code Copilot / Copilot CLI, Devin, Google Antigravity, Gemini CLI, Windsurf, Kiro, Amp, OpenCode, Zed, Cline, Roo, Pi. Windows / macOS / Linux — needs `git` on PATH for the git steps. Agents without skill support: paste `SKILL.md` as a system instruction, or use the generated `AGENTS.md` standalone.

## 7. Known limitations

- Auto-invocation on "new project" depends on the host; manual `/project-init` always works.
- `full` mode on large repos proceeds folder-by-folder and asks for scope.
- Unknown info becomes `> TODO:` markers rather than fabricated content.
- Vendored/generated/third-party code is intentionally out of header scope.

## 8. Files in the package

| Path | Purpose |
|---|---|
| `SKILL.md` | Skill definition + workflow (the prompt) |
| `templates/` | Files copied into generated projects (`{{TOKEN}}` placeholders) |
| `references/` | conventions.md (full spec), headers.md (per-language templates) |
| `agents/openai.yaml` | Codex/ChatGPT invocation metadata |
| `LICENSE` | MIT |

## 9. FAQ

**Will it overwrite my existing docs?** No — upgrade mode is idempotent and never overwrites; it fills gaps and appends EXECUTED entries.
**Can I run it later?** Yes — start with `lite`, then `/project-init upgrade` any time.
**Does it commit?** Only if you opt in during the setup questions.
**Repo renamed?** Update `github.com/mridun-gupta/project-init.skills` in README/INSTALL/manifests.
