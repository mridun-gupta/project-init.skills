# Contributing

## Layout

- `skills/project-init/` — the skill. `SKILL.md` is the prompt; `templates/` are copied into generated projects; `references/` is the on-demand spec.
- `.claude-plugin/`, `gemini-extension.json` — ecosystem manifests.
- `scripts/` — installers.
- `INSTALL.md`, `PUBLISHING.md` — install matrix + submission checklist.

## Rules

- Frontmatter stays spec-minimal: `name`, `description`, `argument-hint`, `license`. Tool-specific fields belong in per-tool copies, not here.
- `name:` must always equal the skill directory name (`project-init`).
- Keep `description` under 1024 chars with trigger phrases front-loaded.
- `{{TOKEN}}` placeholders used in `templates/` must be defined in `SKILL.md` Step 2.
- Bump the version in **all four** places together: `CHANGELOG.md`, `.claude-plugin/plugin.json`, `.claude-plugin/marketplace.json`, `gemini-extension.json`.

## Test your change

1. `./scripts/install.sh` (or `install.ps1`) into `~/.agents/skills/`.
2. Invoke `/project-init` on a scratch folder in your tool of choice.
3. Check generated docs have no raw `{{` tokens left.
