# Database Assets & Migrations

This directory houses database design documentation, database seed scripts, backups, and raw SQL assets.

## Directory Structure
*   `erd/`: Holds Entity-Relationship Diagrams (ERD) mapping logical models, key relationships, and data types.
*   `migrations/`: Stores raw SQL migration scripts (in addition to Django-managed Python migrations).
*   `seeds/`: Contains mock data seeds, tenant templates, and default menu catalog presets used to populate new database instances.
*   `backups/`: Target folder for local, compressed database backup logs (ignored by git).
