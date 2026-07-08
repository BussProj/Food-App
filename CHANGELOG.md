# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [0.1.0] - 2026-07-08
### Added
*   Repository folder structure template mapping to modular guidelines.
*   Editor configurations (`.editorconfig`) and line-ending normalizations (`.gitattributes`).
*   Git ignore configuration (`.gitignore`) covering Python caches, node packages, local DB files, and environments.
*   VS Code extension recommendation index (`.vscode/extensions.json`).
*   Contributor Covenant code of conduct guidelines (`CODE_OF_CONDUCT.md`).
*   Vulnerability disclosures policies (`SECURITY.md`).
*   Project delivery milestone plan (`ROADMAP.md`).
*   Developer onboarding instruction guide (`CONTRIBUTING.md`).
*   Environment variables schema layout template (`.env.example`).
*   Structured issue templates (bug report, feature requests, tasks) and pull request templates.
*   Descriptive README guidelines for directories (`assets/`, `backend/`, `database/`, `docs/`, `frontend/`, `infrastructure/`, `scripts/`).

## [0.2.0] - 2026-07-08
### Added
*   Unified `docker-compose.yml` orchestrating PostgreSQL, Redis, Django, and Angular containers.
*   Dockerfiles for backend, frontend, and Nginx reverse proxy service.
*   Nginx reverse proxy configurations supporting dynamic URL routing and WebSocket upgrades.
*   Bootstrapped Django 5 codebase under `backend/` using python:3.12-slim base image.
*   Split settings architecture (`base.py`, `local.py`) using `django-environ` to fetch settings keys.
*   ASGI Daphne configuration ready for Channels and WS integration.
*   Celery core application setup mapped to Redis queues and schedules.
*   Lightweight JSON health check views API (/api/health/) reporting PostgreSQL and Redis connection latency.
*   Idempotent PowerShell automation scripts (`setup.ps1` and `start.ps1`) for environment bootstrapping.

