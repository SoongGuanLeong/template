---
name: git-guardrails-opencode
description: Set up or modify the opencode plugin that blocks dangerous git commands (push, reset --hard, clean -f, branch -D, checkout ., restore .) before the agent runs them. Use when user wants to add or remove patterns from the bundled guardrails, or wants to disable them.
---

# Setup Git Guardrails (opencode)

This starter ships an opencode plugin at `.opencode/plugins/block-dangerous-git.ts` that intercepts bash commands and throws on dangerous git patterns.

## What gets blocked

- `git push` (all variants)
- `git reset --hard`
- `git clean -f` / `git clean --force` / `git clean -fd`
- `git branch -D`
- `git checkout .` / `git restore .`

When blocked, the agent sees an error and must ask the user to run the command manually.

## How it works

The plugin exports a function returning a `tool.execute.before` hook. If the tool is `bash` and the command matches any pattern, it throws. opencode aborts the tool call.

## Add or remove patterns

Edit `.opencode/plugins/block-dangerous-git.ts`. The `DANGEROUS` array holds regexes. Add a new entry:

```ts
const DANGEROUS: RegExp[] = [
  // ...existing
  /\bgit\s+tag\s+-d\b/,
]
```

Patterns are `\b` word-bounded to avoid false positives (`git pushy` won't match).

## Scope

- **Project** (this repo only): the file lives at `.opencode/plugins/`. Bundled into every downstream that copies this starter.
- **Global** (all your projects): move the file to `~/.config/opencode/plugins/` and delete it from this repo.

## Disable temporarily

Comment out the body of the hook, or delete the file. To permanently disable for a project, delete the file. To permanently disable globally, remove from `~/.config/opencode/plugins/`.

## Verify

The plugin loads on opencode startup. To test patterns in isolation:

```bash
# Should match git push
node -e 'console.log(/\bgit\s+push\b/.test("git push origin main"))'
# -> true
```
