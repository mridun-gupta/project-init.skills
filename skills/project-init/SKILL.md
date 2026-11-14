---
name: project-init
description: Initialize or upgrade a software project to a universal documentation standard. Runs git init, generates PRD.md / TRD.md / EXECUTED.md at the root, builds a four-audience docs/ knowledge base (ai, technical, layman, non-technical), writes an AGENTS.md conventions file, and in full mode documents every folder and file with header comments carrying doc references, ISO-8601 timestamps, and author. Use when creating, initializing, or scaffolding a new project or repository, or when asked to document an existing codebase to this standard.
argument-hint: [init|upgrade|full|lite]
license: MIT
---

# project-init

Bootstrap a project to a universal documentation standard, or retrofit an existing project to it.

## Modes

| Argument | Effect |
|---|---|
| `init` (default) | Full setup for a new/empty project |
| `upgrade` or `full` | Idempotent retrofit of an existing project — fill gaps, never overwrite |
| `lite` | Skeleton docs only; user re-invokes `upgrade`/`full` later for complete documentation |

If the user phrases intent as "prod-ready from the start" → treat as `full`. "Minimal for now, document properly later" → `lite`.

Bundled resources (same directory as this file): `templates/` (copy + substitute tokens) and `references/` (read for the detailed spec — `conventions.md`, `headers.md`).

## Workflow

### Step 0 — Confirm with the user (required)

Before creating anything, ask and confirm. Propose defaults; skip anything the user already answered:

1. **Project name** and **one-line purpose** (infer from folder name / conversation).
2. **Mode**: full documentation now, or lite now + upgrade later.
3. **Author name**: propose `git config user.name`; if unset, OS username; ask only if both fail.
4. **Extras**: README.md (default yes), LICENSE (default MIT — ask which), initial git commit (default yes).

### Step 1 — Git

- If `.git/` is absent: `git init -b main` (older git: `git init` then `git checkout -b main`).
- If `.git/` exists: leave history untouched.
- Write `.gitignore` from `templates/GITIGNORE`; if one exists, merge missing entries — never replace.

### Step 2 — Resolve tokens

- `{{PROJECT_NAME}}` — confirmed name
- `{{ONE_LINER}}` — confirmed purpose
- `{{AUTHOR}}` — per Step 0
- `{{ISO_DATE}}` — current local time, ISO 8601 **with timezone offset** (`2026-11-14T10:35:00+05:30`). Bash: `date -Iseconds`. PowerShell: `Get-Date -Format o`.
- `{{DATE}}` — `YYYY-MM-DD`; `{{YEAR}}` — `YYYY`
- `{{AGENT_TOOL}}` — your tool + model, e.g. "Devin CLI / SWE-2", "Claude Code / Opus", "Cursor / GPT-5"
- `{{MODE}}` — `full` or `lite`

### Step 3 — Root documents

Copy `templates/PRD.md`, `templates/TRD.md`, `templates/EXECUTED.md` to the project root, substituting tokens. Draft real content — fill PRD/TRD sections from the user's description and codebase evidence; where info is genuinely unknown, leave a `> TODO:` marker rather than fabricating. Add the first EXECUTED.md entry recording this initialization (action, files created, outcome).

### Step 4 — Knowledge base

Create the `docs/` tree per `templates/docs/`:

- `docs/README.md` — index linking all four tracks
- `docs/ai/` — dense, structured, machine-optimized docs (architecture map, API surface, invariants, glossary)
- `docs/technical/` — engineer-facing (setup, architecture, APIs, runbooks)
- `docs/layman/` — plain-language explanation with analogies
- `docs/non-technical/` — business/product framing for stakeholders

Seed each track README with project context plus a "what goes here" guide. Audience rules are in `references/conventions.md`.

### Step 5 — Conventions file

Copy `templates/AGENTS.md` to the project root — merge if one exists (append the conventions section; never delete user content). This file re-teaches the standard to every future agent session. For maximum coverage also create `CLAUDE.md` and `GEMINI.md`, each containing a single line: `See AGENTS.md.`

### Step 6 — Document the tree (full mode only — skip in lite)

- Every existing folder: a `README.md` per `references/conventions.md` (folder README format).
- Every existing source file: prepend a header comment per `references/headers.md` — pick the comment syntax by file extension. **Skip** binaries, generated files, and formats that cannot hold comments (JSON, lockfiles) — the folder README covers them.
- Large repo? Work folder-by-folder and ask the user to scope (e.g. start with `src/`).

### Step 7 — Finish

- Create `README.md` (from `templates/README.md`) and `LICENSE` (if the user opted in — copy `templates/LICENSE` for MIT, substituting `{{YEAR}}` + `{{AUTHOR}}`; if they chose another license, write its standard text instead).
- **lite**: report what is skeletal and tell the user to run `/project-init upgrade` when ready.
- If commits were approved: `git add -A && git commit -m "chore: initialize project docs and structure"`.
- Append the final EXECUTED.md entry.
- Report: what was created, which `> TODO:` markers need user input, how to invoke the upgrade later.

## Upgrade mode (`upgrade` / `full` on an existing repo)

Idempotent pass — never overwrite existing docs:

- Missing root docs → create from templates (record "retroactive init" in EXECUTED.md).
- Missing `docs/` tracks → create; existing → keep content, ensure `docs/README.md` links them.
- Missing `AGENTS.md` → create; present → merge the conventions section if absent.
- Files/folders lacking headers/READMEs → add per `references/`.
- Append an EXECUTED.md entry; offer a commit.

## Standing rules

- **Timestamps**: ISO 8601 with offset, always. Bump `Last-Updated` on every file/doc edit.
- **Traceability**: every header links to a `docs/` reference; every doc links back to the index.
- **Never destroy**: merge or append; never delete user content.
- **No fabrication**: unknowns become `> TODO:` markers.
