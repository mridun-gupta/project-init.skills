---
doc: AI Track
project: {{PROJECT_NAME}}
audience: ai
author: {{AUTHOR}}
last-updated: {{ISO_DATE}}
kb: docs/README.md
---

# docs/ai — machine-optimized reference

Dense, structured documentation for AI agents and code tools. Optimize for retrievability: frontmatter on every page, stable anchors, one topic per file, no narrative filler.

## What goes here

- `architecture-map.md` — component graph, data flow, file-to-component index
- `api-surface.md` — every public interface: signatures, types, errors
- `invariants.md` — rules the code must never break; assumptions agents should not violate
- `glossary.md` — project terms → exact definitions (prevents hallucinated terminology)
- `conventions.md` — pointer to [../../AGENTS.md](../../AGENTS.md) plus anything machine-relevant
- `decisions.md` — ADR-style entries: context → decision → consequences

## Style rules

- Frontmatter keys: `doc`, `project`, `audience: ai`, `topics: [...]`, `last-updated`, `source-files: [...]` — so agents can map doc ↔ code.
- Tables > paragraphs. Explicit > implied. Version claims with `Last-Verified` dates.

> TODO: seed `architecture-map.md` and `glossary.md` for {{PROJECT_NAME}}.

---
*Last-Updated: {{ISO_DATE}} · Author: {{AUTHOR}}*
