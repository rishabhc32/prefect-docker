# prefect-docker

A sample project to run Prefect 3 with Docker Compose.

## Building the Docker Image

To build the Docker image:

```bash
docker build -t prefect-docker .
```

## Running with Docker Compose

To run the application using Docker Compose with production environment variables:

```bash
docker compose --env-file .env.prod up
```
