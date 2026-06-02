# Changelog

All notable changes to this template are documented here. Downstream users see these changes when they run `copier update`.

## [Unreleased]

### Added
- Templated `pyproject.toml` (hatchling build backend, ruff/pyright/pytest dev deps, strict pyright, src/ layout, coverage config).
- `CONTRIBUTING.md` and `CHANGELOG.md` for the template itself.
- `## Communication Style` section in `AGENTS.md`.
- `jinja2-time` Jinja extension for `{{ now() }}` usage.

### Changed
- `LICENSE` year is now `{{ now().year }}` (auto-updates on `copier update`).
- `opencode.json` renamed to `opencode.jsonc` to reflect JSONC content (comments).
- Env-var substitution fixed: `${X}` → `{env:X}` (correct opencode syntax).
- `uv.lock` no longer gitignored; new projects commit their lock on first `uv sync`.
- README "After generation" section rewritten to match the new scaffold.

### Removed
- Filesystem MCP from `opencode.jsonc` (opencode native tools cover local file I/O).
- `PROJECT_ROOT` from `.env.example` (was only for the removed MCP).
- `uv.lock` entry from `.gitignore` (see Changed above).

### Security
- `.env` added to `.copier.yaml`'s `_exclude` as a defensive guard against accidental inclusion.

## v0.1.0 — 2026-06-01

- Initial template release.
