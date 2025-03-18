FROM python:3.12-slim

WORKDIR /app

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    UV_COMPILE_BYTECODE=1 \
    PATH="/app/.venv/bin:$PATH" \
    PREFECT_HOME="/app/.prefect" \
    PC_DEPLOYMENT_ENVIRONMENT=PRODUCTION

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install uv
COPY --from=ghcr.io/astral-sh/uv:0.5.5 /uv /uvx /bin/

# Copy project files and sync the project into a new environment, using the frozen lockfile
COPY pyproject.toml uv.lock ./
RUN uv sync --no-cache --frozen

# Copy project files
COPY web/ web/
