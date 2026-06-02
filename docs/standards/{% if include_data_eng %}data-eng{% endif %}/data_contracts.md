# Data Contracts

These standards were written on June 2, 2026 using Context7. Verify currency before project start if found older than 6 months.

## Validation
- All external inputs must use Pydantic v2 `BaseModel`.
- Applies to:
  - APIs
  - configs (JSON/YAML/env)
  - pipeline boundaries
  - message queues

## Rule
- Never pass raw dicts across module boundaries if structure is known.

## Error Handling
- Do not silently swallow validation errors.
- Fail fast on schema mismatch.
- Raise `ValidationError` (or subclass) explicitly.

## Design Principle
- Schema is part of the codebase, not documentation.
- Version your contracts; breaking changes require migration path.

## Usage
```python
from pydantic import BaseModel, Field

class UserInput(BaseModel):
    name: str = Field(..., min_length=1)
    age: int | None = None
```