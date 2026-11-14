# Publishing `project-init` — directory & marketplace checklist

Status legend: `[ ]` not submitted · `[~]` submitted/pending · `[x]` live.

## Tier 0 — works automatically once the repo is public

No submission needed; verify each after pushing:

- [ ] `npx skills add mridun-gupta/skills_project-init` — skills.sh installer, detects ~12 agents
- [ ] `gh skill add mridun-gupta/skills_project-init` — GitHub Copilot
- [ ] Claude Code: `/plugin marketplace add mridun-gupta/skills_project-init` → `/plugin install project-init@mridun-gupta-skills` (`.claude-plugin/` self-hosts this)
- [ ] `gemini extensions install https://github.com/mridun-gupta/skills_project-init` and `gemini skills install <same>`
- [ ] Manual copy per INSTALL.md (`~/.agents/skills`, `~/.claude/skills`, …)
- [ ] Repo hygiene: topics set (`agent-skills claude-skills codex cursor copilot gemini-cli antigravity windsurf`), `v1.0.0` release published

## Tier 1 — registries & directories (submit each)

| # | Directory | Where/how to submit | Status |
|---|---|---|---|
| 1 | **skills.sh / skillsboard.sh** (skills community index) | Site submission / repo PR; repo qualifies as-is (root + `skills/` layout scanned) | [ ] |
| 2 | **anthropics/skills** (official Anthropic skills repo) | PR adding `project-init` under their community/experimental skills; follow repo CONTRIBUTING + `claude plugin validate` output | [ ] |
| 3 | **Cursor directory** (cursor.directory / Cursor community listings) | Submit repo link + one-line description | [ ] |
| 4 | **agentskills.io** (Agent Skills spec site) | Resources/community list — link repo | [ ] |
| 5 | **Gemini CLI extensions gallery** (geminicli.com/extensions) | `gemini-extension.json` is already in place; submit repo to the gallery/registry used by the site | [ ] |
| 6 | **awesome-agent-skills** | PR: add `mridun-gupta/skills_project-init` under project/scaffolding skills | [ ] |
| 7 | **awesome-claude-code / awesome-claude-code-plugins** | PR under Skills/Plugins | [ ] |
| 8 | **awesome-copilot** | PR under skills/instructions | [ ] |
| 9 | **awesome-cursor / cursor community lists** | PR or issue submission | [ ] |
| 10 | **Codex community lists** (awesome-codex, OpenAI community forum Showcase) | PR / forum post linking repo | [ ] |
| 11 | **ChatGPT/Codex universal plugin directory** | `agents/openai.yaml` ships in the skill — submit repo to OpenAI's plugin/plugin-directory process | [ ] |
| 12 | **JetBrains Junie / Kiro / Windsurf / OpenCode / Amp community registries** | Each has community lists — submit repo + description | [ ] |

## Copy-paste listing text

**Name:** project-init
**One-liner:** Universal Agent Skill — initializes any project with git, PRD/TRD/EXECUTED docs, a four-audience docs/ knowledge base, and enforced file-header conventions (doc refs, ISO timestamps, author). Works in Claude Code, Codex, Cursor, Copilot, Devin, Antigravity, Gemini, Windsurf, Zed and more.
**Install:** `npx skills add mridun-gupta/skills_project-init` or copy `skills/project-init/` into your tool's skills dir.
**Tags:** agent-skills, scaffolding, documentation, conventions, prd, knowledge-base

## Tier 2 — promotion

- [ ] dev.to / Hashnode post + terminal GIF of `/project-init` scaffolding a repo
- [ ] r/ClaudeAI, r/cursor, r/ChatGPTCoding, r/LocalLLaMA (works with local models via prompt paste)
- [ ] Show HN / Product Hunt (optional, once a few stars exist)
