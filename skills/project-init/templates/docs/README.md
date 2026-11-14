---
doc: Knowledge Base Index
project: {{PROJECT_NAME}}
author: {{AUTHOR}}
last-updated: {{ISO_DATE}}
kb: docs/README.md
---

# docs/ — {{PROJECT_NAME}} knowledge base

One project, four audiences. Pick your track; every page links back here.

| Track | For | Style | Start here |
|---|---|---|---|
| [ai/](ai/README.md) | AI agents, codegen tools, RAG | Dense, structured, frontmatter-heavy, no prose padding | `ai/architecture-map.md` |
| [technical/](technical/README.md) | Engineers building/maintaining | Precise, complete, runnable commands | `technical/architecture.md` |
| [layman/](layman/README.md) | Curious non-experts | Plain language, analogies, no jargon | `layman/overview.md` |
| [non-technical/](non-technical/README.md) | PMs, stakeholders, leadership | Business framing — what/why/value, not how | `non-technical/overview.md` |

## Root documents

- [../PRD.md](../PRD.md) — product requirements
- [../TRD.md](../TRD.md) — technical design
- [../EXECUTED.md](../EXECUTED.md) — append-only change log
- [../AGENTS.md](../AGENTS.md) — conventions every contributor/agent must follow

## Rules for writers

- Every page carries frontmatter: `doc`, `project`, `author`, `last-updated` (ISO 8601 w/ offset), `kb`.
- Link related pages across tracks — a `technical/` page points at its `ai/` and `layman/` counterparts.
- Keep the index table current when pages are added (see `AGENTS.md` sync rules).

---
*Last-Updated: {{ISO_DATE}} · Author: {{AUTHOR}}*
