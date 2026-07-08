# Angular Frontend Service

The frontend layer is built as a single-page Progressive Web App (PWA) using Angular 22 and Tailwind CSS 4.

## Directory Structure
*   `restaurant-platform/`: Main Angular project workspace.
    *   `src/app/core/`: Singleton services (API gateways, auth, state services).
    *   `src/app/shared/`: Reusable buttons, forms, tables, and dialogs.
    *   `src/app/features/`: Lazy-loaded components and routes mapped to user roles.

## Development Setup

### 1. Requirements Installation
Verify Node.js and npm are installed. Run inside the workspace:
```bash
cd restaurant-platform
npm install
```

### 2. Running Local Dev Server
Start the Angular dev server on port 4200:
```bash
npm start
```

## Running Frontend Tests
Execute unit tests using the configured test runner (Vitest):
```bash
npm test
```
