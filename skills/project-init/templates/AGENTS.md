---
doc: Agent Conventions
project: {{PROJECT_NAME}}
author: {{AUTHOR}}
last-updated: {{ISO_DATE}}
kb: docs/README.md
---

# AGENTS.md — {{PROJECT_NAME}}

Standing rules for **any** AI agent or human contributor working in this repository. Follow them on every change.

## Documents of record

- `PRD.md` — what we build and why (product requirements)
- `TRD.md` — how it is built (technical design); sections point to living docs under `docs/technical/`
- `EXECUTED.md` — append-only log of actions/decisions; **add a row for every meaningful change you make** (ISO 8601 timestamp w/ offset, actor = tool+model or name, action, files, outcome)
- `docs/` — knowledge base in four tracks: `ai/` (machine-optimized), `technical/` (engineers), `layman/` (plain language), `non-technical/` (business). `docs/README.md` is the index — keep its links current.

## File header convention

Every source file starts with a header comment (syntax depends on the language):

```
<one-line purpose>
Docs: docs/technical/<topic>.md#<section>
Author: {{AUTHOR}}
Last-Updated: {{ISO_DATE}}
```

Rules:

- `Docs:` must point at a real file + anchor in `docs/` that explains this file's topic.
- `Last-Updated` is ISO 8601 **with timezone offset**; **bump it on every edit**.
- `Author` is the original author; significant rework may add `Contributors:`.
- Files that cannot hold comments (JSON, lockfiles, binaries, generated output) get **no** header — document them in the folder's `README.md` instead.
- Markdown/YAML files carry the same fields in YAML frontmatter instead of a comment.

## Folder convention

Every folder contains a `README.md` with: purpose, a contents table (file → role → doc link), and a `Last-Updated` footer. Update it whenever files are added/removed/renamed.

## Sync-on-change rules

When you change code, in the same change:

1. Update the affected files' `Last-Updated` headers.
2. Update the relevant `docs/` pages (all tracks that cover the changed topic — technical and ai always; layman/non-technical when behavior visible to users changed).
3. Append a row to `EXECUTED.md`.
4. Update the folder `README.md` contents table if files moved/added/removed.

Never delete existing documentation — correct it in place or mark it superseded. Unknowns get `> TODO:` markers, not invented content.

## Project

- **{{PROJECT_NAME}}** — {{ONE_LINER}}
- Owner/author: {{AUTHOR}} · Initialized {{DATE}} by {{AGENT_TOOL}} via the `project-init` skill (mode: {{MODE}})
