# Infrastructure & Container Orchestration

This directory houses infrastructure-as-code files, container setups, proxies configurations, and site reliability configurations.

## Directory Structure
*   `docker/`: Stores Dockerfiles and docker-compose configurations for running local development and production container builds.
*   `nginx/`: Stores reverse proxy configuration templates (`nginx.conf`) routing API and WebSockets traffic.
*   `monitoring/`: Stores Prometheus/Grafana alerts configurations, trace exporters configs, and system check indicators.
*   `deployment/`: Contains Kubernetes manifests, CD pipelines triggers, and server clusters ingress settings.
