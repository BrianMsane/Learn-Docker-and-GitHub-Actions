# Build Stage

FROM astral/uv:python3.12-bookworm-slim AS builder
WORKDIR /app
COPY pyproject.toml uv.lock ./
RUN uv sync --no-cache -no-install-project


# Deployment Stage
FROM python:3.12-slim-bookworm
WORKDIR /app
COPY . /app/
COPY --from=builder /app/.venv /app/.venv
ENV PATH="/app/.venv/bin:$PATH"

EXPOSE 8000

CMD ["uv", "run", "fastapi", "main.py"]

# TODO: investigate the compatibility between an virtual enviromnment made in uv and that made in pip
