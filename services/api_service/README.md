# AI Customer Support Analyzer

## Quickstart (local)

1. Install dependencies:

```bash
uv sync --all-extras
```

2. Start the full stack:

```bash
docker compose up --build
```

## Dev commands (uv)

Run API:

```bash
uv run uvicorn app.main:create_app --factory --host 0.0.0.0 --port 8000
```

Run tests:

```bash
uv run pytest
```

Run Ruff:

```bash
uv run ruff check .
```

Run mypy:

```bash
uv run mypy app/
```

## Pre-commit

Install git hooks:

```bash
uv run pre-commit install
```

Run all hooks manually:

```bash
uv run pre-commit run --all-files
```
