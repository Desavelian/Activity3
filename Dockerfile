FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app

RUN chmod +x /app/.github/scripts/entrypoint.sh

# Run entrypoint.sh when the container starts
ENTRYPOINT ["/app/.github/scripts/entrypoint.sh"]
