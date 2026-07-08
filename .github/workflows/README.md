# GitHub Actions Workflows

This directory will store the YAML workflow specifications for GitHub Actions.

## Recommended Workflows (Future Sprint 0.2)
1.  **Continuous Integration (`ci.yml`)**:
    *   Triggered on pull requests to `develop` or `main`.
    *   Runs code linters (flake8/black for Python, ESLint/Prettier for Angular).
    *   Executes backend tests using Django test suites.
    *   Builds the Angular PWA static bundle to verify typing and compiler compliance.
2.  **Continuous Deployment (`cd.yml`)**:
    *   Triggered on commits to `main` (production go-live) or manual approval gates.
    *   Executes pre-deploy database migrations.
    *   Builds and pushes production-ready Docker containers to the image registry.
    *   Initiates progressive rolling deployments to staging/production clusters.
