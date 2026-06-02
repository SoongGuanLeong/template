# SQL Standards

These standards were written on June 2, 2026 using Context7. Verify currency before project start if found older than 6 months.

## Query Rules
- No f-string SQL.
- Always parameterized queries.

- No dynamic table/column names in queries (allowlist if needed).

## File Organization
- Store raw SQL in `/sql` directory per module.
- Name files descriptively: `get_user_by_id.sql`, `upsert_order.sql`.

## Linting
- Use SQLFluff to lint all SQL files.
- Configure `.sqlfluffrc` with your dialect and rules.

## Migrations (required)
- Use Alembic (Python) or Flyway for schema migrations.
- Never alter production schemas manually.
- Each migration must be reversible.

## Safety
- Never concatenate user input into SQL strings.