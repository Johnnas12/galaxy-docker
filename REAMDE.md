# Galaxy Docker

This repository provides Docker configurations for deploying the Galaxy platform in containerized environments.

## Features

- Pre-configured Galaxy Docker images
- Easy setup and deployment
- Customizable environment variables

## Getting Started

1. **Clone the repository:**
    ```bash
    git clone https://github.com/johnnas12/galaxy-docker.git
    cd galaxy-docker
    ```

2. **Build and run the Docker container:**
    ```bash
    docker compose up -d --build
    ```

3. **Access Galaxy:**
    Open your browser and navigate to `http://localhost:8080`.

## Configuration

- Edit the `Dockerfile` and `docker-compose.yml` to customize your setup.
- Set environment variables as needed.
