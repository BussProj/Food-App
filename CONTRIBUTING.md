# Contributing Guidelines

Thank you for contributing to the Restaurant Management SaaS Platform. Please adhere to these guidelines during development.

---

## 1. Branch Strategy

We use a modified Git Flow model. All work must run through PRs; direct push to main branches is blocked.

*   `main`: Production-ready releases.
*   `develop`: Integration branch for active features.
*   `feature/epic-name/short-desc`: Active task work.
*   `bugfix/epic-name/short-desc`: Resolution of staging/production issues.
*   `hotfix/version-name`: Immediate critical resolutions directly branching from and merging back to `main`.

---

## 2. Commit Message Conventions

We enforce the **Conventional Commits** specification. Commit messages must use the format:
`type(scope): description`

### Approved Types
*   `feat`: A new feature or business capability.
*   `fix`: A bug resolution.
*   `docs`: Documentation changes only.
*   `style`: Code formatting updates (semi-colons, whitespace).
*   `refactor`: Structural code updates that neither fix bugs nor add features.
*   `perf`: Performance optimizations.
*   `test`: Adding or correcting tests.
*   `chore`: Tooling, build processes, or dependencies adjustments.

### Examples
*   `feat(auth): add email OTP verification endpoint`
*   `fix(orders): resolve table allocation collision in queue sync`
*   `docs(api): update WebSocket connection sequence definitions`

---

## 3. Pull Request Requirements

1.  **Ticket Reference**: Every PR must reference its target issue ID in the description (e.g., `Closes #102`).
2.  **Lint & Test Verification**: CI pipelines must pass successfully.
3.  **No Schema Leakage**: Verify that no migration files contain raw SQL queries bypassing custom managers.
4.  **Review Checkoff**: Requires approval from at least one SRE/Lead Developer prior to merge.

---

## 4. Definition of Done (DoD)

Before marking any task or user story as complete, the developer must verify:
*   [ ] **Business Validation**: Logic matches target tickets; calculation outputs are correct.
*   [ ] **Security Audit**: Authorization context checks pass; tenant leak tests verify no cross-tenant records access.
*   [ ] **Performance Check**: Query execution times are below 50ms; N+1 loops are eliminated.
*   [ ] **Automated Tests**: Unit test coverage on domain classes is 100%, and module coverage is at least 85%.
*   [ ] **Documentation**: `README.md` and module document guides are updated.
*   [ ] **Real-Time Sync**: Pushes events to active WebSockets groups; views refresh dynamically.
