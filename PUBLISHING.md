# Publishing `project-init` — directory & marketplace checklist

Status legend: `[x]` live/automatic · `[~]` submitted or in progress · `[ ]` needs action.

## Done / automatic

- [x] **GitHub repo public** — https://github.com/mridun-gupta/project-init.skills
- [x] **v1.0.0 release** — https://github.com/mridun-gupta/project-init.skills/releases/tag/v1.0.0
- [x] **Repo topics set** (20) incl. `gemini-cli-extension`, `agent-skills`, `claude-code`, `codex`, `cursor`, `github-copilot`
- [x] **skills.sh** — no submission exists; it auto-indexes on `npx skills add` telemetry. First install already ran → appears once it re-crawls. Verify: `npx skills add mridun-gupta/project-init.skills --list` (already returns `project-init`)
- [x] **Gemini CLI extension gallery** — no submission; crawler finds repos with topic `gemini-cli-extension` + `gemini-extension.json` at root. Both in place → appears in geminicli.com/extensions within days
- [x] **Claude Code marketplace** — self-hosted via `.claude-plugin/`: `/plugin marketplace add mridun-gupta/project-init.skills` → install `project-init`. Live now
- [x] **`npx skills` / `gh skill` / `gemini extensions|skills install` / manual copy** — all verified working

## User action required (web forms / sign-in)

| # | Directory | Mechanism | Action | Status |
|---|---|---|---|---|
| 1 | **cursor.directory** | Web form (no PRs) | Sign in → https://cursor.directory/plugins/new → paste repo URL → it auto-detects `skills/project-init/SKILL.md` → Submit (security scan then live) | [ ] |
| 2 | **awesome-claude-code** (`hesreallyhim`) | Issue form | Submit once eligible — rule: repo ≥14 days old w/ activity **or** ≥100 stars | [ ] wait |
| 3 | **awesome-agent-skills / awesome-copilot / awesome-cursor** | PRs to each list | Add line: `- [project-init](https://github.com/mridun-gupta/project-init.skills) - Universal Agent Skill: git init, PRD/TRD/EXECUTED, 4-audience docs KB, header conventions` | [ ] |
| 4 | **primorum.ai/skills**, **skillsboard.sh** | Community directory submissions | Submit repo + one-liner (below) | [ ] |
| 5 | **Codex/ChatGPT plugin directory** | OpenAI-curated | No public submission; share repo in OpenAI community forum Showcase + `awesome-codex`-type lists | [ ] |
| 6 | **anthropics/skills** | PR — **effectively closed** | Public evidence: no maintainer engagement on community PRs, no CONTRIBUTING policy. Skip unless policy appears | [ ] skip |
| 7 | **agentskills.io** | Spec site, no directory | Nothing to submit; repo already spec-compliant | [x] n/a |

## Copy-paste listing text

**Name:** project-init
**One-liner:** Universal Agent Skill — initializes any project with git, PRD/TRD/EXECUTED docs, a four-audience docs/ knowledge base, AGENTS.md conventions, and ISO-timestamped file headers. Works in Claude Code, Codex, Cursor, Copilot, Devin, Antigravity, Gemini, Windsurf, Zed and more.
**Install:** `npx skills add mridun-gupta/project-init.skills`
**Topics:** `agent-skills claude-code codex cursor github-copilot scaffolding documentation`

## Promotion (optional, later)

- [ ] dev.to / Hashnode post + terminal GIF of `/project-init` scaffolding a repo
- [ ] r/ClaudeAI, r/cursor, r/ChatGPTCoding, OpenAI community forum
- [ ] Show HN / Product Hunt once a few stars exist
