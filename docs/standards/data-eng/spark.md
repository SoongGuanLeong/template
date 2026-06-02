# PySpark Standards

These standards were written on June 2, 2026 using Context7. Verify currency before project start if found older than 6 months.

## API Usage
- Always use `pyspark.sql.functions as F`
- Never use `selectExpr` for logic.

## Column Handling
- Always use `F.col()`
- Never use `df["col"]` in expressions.

## SQL Usage
- SQL strings only allowed in `spark.sql()` for full queries.
- No f-string SQL.

## Version Constraint
- Java 17 required for Spark 3.5+
- Python 3.9+ for Spark 3.5.
- Use virtual environments; pin Spark version in `pyproject.toml`.