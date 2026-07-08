# Restaurant Management SaaS Platform

A production-grade, multi-tenant, real-time Operating System for restaurant networks.

---

## 1. Directory Structure

The repository utilizes a modular structure segregating core frameworks, configurations, database assets, automation scripts, and static resources:

```
Food-App/
├── .github/              # Automation workflows, issue templates, and PR forms
├── assets/               # Branding assets, UI mockups, logos, and design icons
├── backend/              # Django 5 + DRF REST API source code root
├── database/             # ERDs, migration scripts, databases seeds, and backups
├── docs/                 # Finalized system, API, and deployment documentation
├── frontend/             # Angular 22 Single Page Application source code root
├── infrastructure/       # Container orchestration (Docker, Nginx) and SRE monitoring
└── scripts/              # Setup, database maintenance, and deployment wrappers
```

---

## 2. Platform Architecture Overview

The platform uses a **Modular Monolith** pattern built using **Clean Architecture** principles.
*   **Logical Isolation**: PostgreSQL Row-Level Security (RLS) locks query execution context to specific Tenant/Branch scopes.
*   **Asynchronous Processing**: Heavy computations are deferred to Celery background task workers via a Redis broker.
*   **Real-Time Sync**: Pushes real-time alerts and state transitions (e.g., ticket ready) to client browser slots via Django Channels (WebSockets) scoped to branch rooms.

---

## 3. Quick Start Development Setup

### Prerequisites
*   [Docker & Docker Compose (v20+)](https://www.docker.com/)
*   [Node.js (v24+)](https://nodejs.org/) & [npm (v11+)](https://www.npmjs.com/)
*   [Python (v3.13+)](https://www.python.org/)

### Setup Instructions
1.  **Clone the Repository**:
    ```bash
    git clone https://github.com/your-org/food-app.git
    cd food-app
    ```
2.  **Initialize Environments**:
    Copy the environment template:
    ```bash
    cp .env.example .env
    ```
3.  **Run Development Containers**:
    Execute the startup script:
    *   **Windows (PowerShell)**: `./scripts/dev/start.ps1` (to be created in Sprint 0.2)
    *   **Linux/macOS (Bash)**: `./scripts/dev/start.sh` (to be created in Sprint 0.2)
    *   *Alternative (Manual)*: `docker compose up --build`

---

## 4. Verification Checklists

Verify operational health by executing:
*   **Backend System Verification**:
    ```bash
    docker compose exec backend-api python manage.py check
    docker compose exec backend-api python manage.py test
    ```
*   **Frontend Compilation Verification**:
    ```bash
    docker compose exec frontend npm run test -- --watch=false
    ```

---

## 5. Development Guidelines
*   Refer to [CONTRIBUTING.md](file:///c:/Food%20App/Food-App/CONTRIBUTING.md) for branch strategy, PR templates, and commit messaging styles.
*   Refer to [ROADMAP.md](file:///c:/Food%20App/Food-App/ROADMAP.md) for milestone epics and delivery schedules.
*   Refer to [docs/README.md](file:///c:/Food%20App/Food-App/docs/README.md) for architecture schemas, API specifications, and decisions records.