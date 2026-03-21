FROM python:3.12-bookworm

# install uv
RUN apt-get update \
&& apt-get install -y --no-install-recommends curl ca-certificates
ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh
ENV PATH="/root/.local/bin/:$PATH"

WORKDIR /app/
COPY /app/main.py /app/
COPY /app/pyproject.toml /app/
RUN uv sync

EXPOSE 8000
RUN useradd -m brian
USER brian
CMD ["uv", "run", "fastapi", "run", "/app/main.py"]
