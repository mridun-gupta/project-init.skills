---
doc: Technical Track
project: {{PROJECT_NAME}}
audience: technical
author: {{AUTHOR}}
last-updated: {{ISO_DATE}}
kb: docs/README.md
---

# docs/technical — engineer documentation

Complete, precise docs for people building, running, and fixing {{PROJECT_NAME}}. Assume competence; don't hide complexity — but always give runnable commands and real file paths.

## What goes here

- `setup.md` — prerequisites, install, first run (commands verified, not approximate)
- `architecture.md` — modules, responsibilities, data flow; expands [../../TRD.md](../../TRD.md) §1
- `data-model.md` — entities, schemas, migrations
- `api.md` — endpoints/contracts with examples
- `infra.md` — environments, deploys, config vars
- `security.md` — authn/z, secrets handling, threat notes
- `testing.md` — frameworks, commands, coverage expectations
- `runbooks/` — "when X breaks, do Y" procedures

## Style rules

- Every command block must be copy-paste runnable on the supported platforms (note Windows/PowerShell vs bash differences).
- Reference code as `path/to/file.ext` — the files' header comments link back here; keep anchors stable.
- When APIs change, update this track *and* `docs/ai/api-surface.md` in the same change.

> TODO: seed `setup.md` and `architecture.md` for {{PROJECT_NAME}}.

---
*Last-Updated: {{ISO_DATE}} · Author: {{AUTHOR}}*
