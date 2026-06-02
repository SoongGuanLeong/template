.PHONY: help lint format test clean

help: ## Show this help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

lint: ## Run ruff and pyright.
	uv run ruff check .
	uv run pyright

format: ## Auto-format with ruff.
	uv run ruff format .
	uv run ruff check --fix .

test: ## Run pytest.
	uv run pytest

clean: ## Remove caches and build artifacts.
	rm -rf .pytest_cache .ruff_cache .pyright_cache .mypy_cache .coverage htmlcov
	rm -rf dist build *.egg-info
	find . -type d -name __pycache__ -exec rm -rf {} +
