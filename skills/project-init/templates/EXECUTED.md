---
doc: Execution Log
project: {{PROJECT_NAME}}
author: {{AUTHOR}}
last-updated: {{ISO_DATE}}
kb: docs/README.md
---

# EXECUTED — {{PROJECT_NAME}}

Chronological, append-only log of everything done to this project — actions, decisions, who/what did them, and outcomes. **Newest entries go at the bottom.** Every entry: ISO 8601 timestamp with offset, the actor (human or `tool / model`), the action, files touched, and the outcome.

| Timestamp (ISO 8601) | Actor (tool / model or human) | Action | Files touched | Outcome |
|---|---|---|---|---|
| {{ISO_DATE}} | {{AGENT_TOOL}} | Initialized project (mode: {{MODE}}) | `.git/`, `.gitignore`, `PRD.md`, `TRD.md`, `EXECUTED.md`, `docs/`, `AGENTS.md` | Scaffold created; TODO markers pending user input |

<!-- Append below. Format:
| 2026-11-14T10:35:00+05:30 | Devin CLI / SWE-2 | Added auth module | src/auth/** | Implemented + tested |
-->
