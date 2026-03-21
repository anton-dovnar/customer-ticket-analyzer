# Берем легкий образ Python
FROM python:3.14-slim

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем список библиотек и устанавливаем их
RUN pip install --no-cache-dir uv
COPY pyproject.toml .
RUN uv sync --no-dev

# Копируем папку app с твоим кодом
COPY ./app ./app

# Команда для запуска сервера
CMD ["uv", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
