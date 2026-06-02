# {{ project_name }}

Generated from the project template at `~/projects/template2`.

---

## What's in this template

A general-purpose project scaffold for new repos. The base template is language- and domain-agnostic. An optional **data-engineering overlay** is available and adds standards for Spark, SQL, and Pydantic data contracts.

The template ships with:

- **`AGENTS.md`** — behavior policy for AI coding agents
- **`docs/standards/`** — technical rules (Python, testing, infrastructure; data-eng overlay optional)
- **`Makefile`** — `make help`, `make lint`, `make format`, `make test`, `make clean`
- **`opencode.json`** — AI agent config (MCPs, skills, instructions)
- **`.opencode/skills/`** — 15 curated AI agent skills (see [Skills](#skills) below)
- **`.env.example`** — environment variable template

---

## How to use this template

### Generate a new project

```bash
# Install copier (once)
uv tool install copier

# Generate a new project from this template
copier copy ~/projects/template2 ~/projects/<new-project-name>
```

Copier will ask two questions:

| Variable | Default | Description |
|---|---|---|
| `project_name` | *(required)* | Human-readable name (e.g. `Order Pipeline`). Used in `LICENSE` and `README.md`. |
| `include_data_eng` | `false` | Include the data-engineering standards overlay? |

Skip the prompts with `--defaults` or supply values on the command line:

```bash
copier copy --defaults \
  --data project_name="Order Pipeline" \
  --data include_data_eng=true \
  ~/projects/template2 ~/projects/order-pipeline
```

### Update an existing project

When the template improves, pull those changes into a project:

```bash
cd ~/projects/<existing-project>
copier update
```

Copier will detect template changes, ask which to apply, and re-render files with the project's stored answers. If there are conflicts, you'll be asked to resolve them.

---

## After generation

The generated project is a starting point. Typical first steps:

1. **Initialize git** (if you want version control):
   ```bash
   cd ~/projects/<new-project>
   git init
   git add .
   git commit -m "Initial commit from template"
   ```
2. **Set up environment variables**:
   ```bash
   cp .env.example .env
   # edit .env with your values
   ```
3. **Install Python dependencies** (if Python is used):
   ```bash
   uv sync
   ```
4. **Verify the scaffold**:
   ```bash
   make help
   make lint
   make test
   ```

---

## Skills

The template ships 15 AI agent skills in `.opencode/skills/`. They're wired via `opencode.json`'s `skills.paths` field. The full list:

- `caveman` — ultra-compressed communication mode
- `diagnose` — disciplined bug diagnosis
- `edit-article` — article editing
- `git-guardrails-claude-code` — destructive-git safety hooks (Claude Code; port to opencode hooks before use)
- `grill-me` — interview-the-user planning skill
- `grill-with-docs` — plan-grilling that updates `CONTEXT.md` and `docs/adr/` inline
- `handoff` — session-end state capture for the next agent
- `improve-codebase-architecture` — find deepening opportunities
- `prototype` — throwaway prototype builder
- `setup-matt-pocock-skills` — bootstrap helper for the mattpocock skills workflow
- `tdd` — red-green-refactor loop
- `to-issues` — break a plan into issues
- `to-prd` — turn context into a PRD
- `triage` — issue state machine
- `zoom-out` — broader context / perspective

---

## Conventions

- **Standards currency.** Files in `docs/standards/` were last verified against upstream docs in June 2026. Before relying on a rule in a long-lived project, re-verify against current docs if more than 6 months have passed.
- **No `PROJECT.md` / `DECISIONS.md` / `CONTEXT.md` stubs.** These are lazy-created when they have content. `CONTEXT.md` is the domain glossary; `docs/adr/NNNN-title.md` holds individual architectural decisions.
- **No empty placeholders.** If a file isn't relevant to your project, delete it. Don't leave empty stubs.

---

## License

MIT. See [LICENSE](LICENSE).
