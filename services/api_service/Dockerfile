FROM python:3.14-slim

WORKDIR /workspace

RUN pip install --no-cache-dir uv

COPY pyproject.toml uv.lock ./
COPY services/api_service /workspace/services/api_service

RUN uv sync --package api-service --no-dev --frozen

CMD ["uv", "run", "--package", "api-service", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
