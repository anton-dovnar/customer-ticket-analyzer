FROM python:3.14-slim

WORKDIR /workspace

RUN pip install --no-cache-dir uv

COPY pyproject.toml uv.lock ./
COPY packages/ticket_shared /workspace/packages/ticket_shared
COPY services/ticket/pyproject.toml /workspace/services/ticket/pyproject.toml
COPY services/analysis /workspace/services/analysis

RUN uv sync --package analysis-service --no-dev --frozen

EXPOSE 8001

CMD ["uv", "run", "--package", "analysis-service", "uvicorn", "analysis.main:app", "--host", "0.0.0.0", "--port", "8001"]
