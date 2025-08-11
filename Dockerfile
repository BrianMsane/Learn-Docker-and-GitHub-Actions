# Build Stage
FROM astral/uv:python3.12-bookworm-slim AS builder
WORKDIR /app
COPY pyproject.toml uv.lock /app/
RUN uv sync --frozen --no-dev

# Deployment Stage
FROM python:3.12-slim-bookworm
WORKDIR /app
COPY . /app/
COPY --from=builder /app/.venv /app/.venv
ENV PATH="/app/.venv/bin:$PATH"
EXPOSE 8000
CMD ["python", "main.py"]
