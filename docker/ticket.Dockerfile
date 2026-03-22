FROM python:3.14-slim

WORKDIR /workspace

RUN pip install --no-cache-dir uv

COPY pyproject.toml uv.lock ./
COPY packages/ticket_shared /workspace/packages/ticket_shared
COPY services/ticket /workspace/services/ticket
COPY services/analysis/pyproject.toml /workspace/services/analysis/pyproject.toml

RUN uv sync --package ticket-service --no-dev --frozen

EXPOSE 8000

CMD ["uv", "run", "--package", "ticket-service", "uvicorn", "ticket.main:app", "--host", "0.0.0.0", "--port", "8000"]
