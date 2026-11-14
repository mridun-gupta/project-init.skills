# Conventions — the full spec for the executing agent

Everything `project-init` generates follows these rules. When retrofitting (upgrade mode), apply them incrementally; never overwrite content you didn't create.

## 1. Documentation layout

```
<project-root>/
├── PRD.md            # product requirements (from templates/PRD.md)
├── TRD.md            # technical design (from templates/TRD.md)
├── EXECUTED.md       # append-only action/decision log (from templates/EXECUTED.md)
├── AGENTS.md         # standing conventions (from templates/AGENTS.md)
├── README.md         # project overview (from templates/README.md)
├── .gitignore        # from templates/GITIGNORE
├── LICENSE           # if user opted in (MIT default)
└── docs/             # knowledge base — four audience tracks + index
    ├── README.md
    ├── ai/           # machine-optimized
    ├── technical/    # engineers
    ├── layman/       # plain language
    └── non-technical/# business framing
```

## 2. File header spec

Every source file that supports comments starts with:

```
<one-line purpose>
Docs: <path-to-doc>#<anchor>
Author: <name>
Last-Updated: <ISO-8601 with offset>
```

- `Docs:` — relative path into `docs/` (usually `docs/technical/<topic>.md#<section>`). The referenced file/anchor **must exist or be created** — a dangling link is a defect. If no specific page exists yet, point at `docs/README.md`.
- `Author:` — `git config user.name` → OS username → asked. Preserve the original author when headers are added to existing files (use git blame/first-commit evidence if available); a retrofit adds `Contributors:` instead of replacing `Author:`.
- `Last-Updated:` — ISO 8601 local time **with timezone offset** (`2026-11-14T10:35:00+05:30`). Regenerate it at write time — never copy a stale timestamp.
- Header placement: after any shebang (`#!`) or `<?php` open tag / `// @ts-` pragma lines that must stay first; before all other code.
- Markdown and YAML carry the same fields as YAML frontmatter (see `headers.md`).

### No-header files

JSON (`*.json`, `*.jsonc` if strict), `*.lock`, `package-lock.json`, `yarn.lock`, `poetry.lock`, minified/compiled output, `*.min.*`, binaries, images, vendored code, auto-generated files marked "DO NOT EDIT". These are documented in the **folder README's contents table** instead — same columns (role, doc link, last-updated).

## 3. Folder README spec

Every directory containing files gets `README.md`:

```markdown
---
doc: Folder index
project: {{PROJECT_NAME}}
author: {{AUTHOR}}
last-updated: <ISO>
kb: docs/README.md
---

# <path>/ — <one-line purpose>

| File | Role | Docs |
|---|---|---|
| `foo.ts` | <role> | docs/technical/api.md#foo |
| `data.json` | <role> | (no header — documented here) |

---
*Last-Updated: <ISO> · Author: <name>*
```

Update the contents table whenever files are added, removed, or renamed.

## 4. EXECUTED.md entry format

Append-only table, newest at bottom:

```
| <ISO-8601 w/ offset> | <actor = human name or "tool / model"> | <imperative action> | <paths or globs> | <one-line outcome> |
```

Actor format: `Devin CLI / SWE-2`, `Claude Code / Opus 4.5`, `Codex / GPT-5`, `human / Jane Doe`. One entry per logical change, not per file.

## 5. Audience-track style guide

| Track | Voice | Must have | Must not have |
|---|---|---|---|
| `ai/` | Telegraphic, structured | frontmatter w/ `topics`, `source-files`; tables; stable anchors | narrative prose, hedging |
| `technical/` | Precise, complete | runnable commands, real paths, version notes | vague steps, untested commands |
| `layman/` | Conversational | analogies, defined terms, short sentences | code blocks, unexplained jargon |
| `non-technical/` | Outcome-first | PRD requirement IDs, honest status | implementation detail, architecture diagrams |

## 6. Sync-on-change contract (enforced via generated AGENTS.md)

Any change to code must, in the same commit/change-set:

1. Bump `Last-Updated` in touched file headers.
2. Update `docs/` pages covering the changed topic — `technical/` and `ai/` always; `layman/`/`non-technical/` when user-visible behavior changed.
3. Update folder `README.md` contents tables if files moved/added/removed.
4. Append one `EXECUTED.md` row.

## 7. Idempotency rules (upgrade mode)

- File exists → don't overwrite; merge or skip, and note "already present" in the EXECUTED entry.
- Header exists but stale format → update format, preserve original `Author:`.
- `AGENTS.md` exists → append the conventions section under a `## project-init conventions` heading if absent.
- Doc exists with content → keep; add missing sections only.
