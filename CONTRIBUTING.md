# Contributing to the Template

This repo is a [Copier](https://copier.readthedocs.io/) template. Improvements to the template propagate to every project generated from it.

## Workflow

1. Fork or branch.
2. Make your change.
3. Verify by generating a test project:
   ```bash
   copier copy . /tmp/template-test --defaults
   cd /tmp/template-test
   uv sync
   make lint
   make test
   ```
4. Open a PR with a clear description of what changed and why.

## Adding a new skill

1. Create `.opencode/skills/<skill-name>/SKILL.md`.
2. YAML frontmatter: `name`, `description`, optional `argument-hint`.
3. The skill is auto-discovered via `opencode.jsonc`'s `skills.paths`.
4. Add a one-line entry to the Skills list in `README.md`.

## Adding a new standards doc

1. Create `docs/standards/<name>.md`.
2. Date it: *"These standards were written on YYYY-MM-DD using Context7."*
3. Reference it from `AGENTS.md` if it's cross-cutting.
4. If it's a domain overlay (not Python/testing/infrastructure), wrap the folder name in `{% if include_<flag> %}<name>{% endif %}` and add the flag to `.copier.yaml`.

## Bumping template version

1. Add an entry to `CHANGELOG.md` under `[Unreleased]` (or a new version section).
2. Tag the commit: `git tag v0.X.0`.

## Style

- Keep edits minimal and traceable (per `AGENTS.md` Change Safety Rules).
- Don't refactor unrelated parts of the template in the same PR.
- Run `make lint` on a generated test project before submitting.
