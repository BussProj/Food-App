# Django Backend Service

The backend layer is built as a Modular Monolith using Django 5 and Django REST Framework.

## Directory Structure
*   `config/`: Main Django project configuration folder (`settings.py`, `urls.py`, `asgi.py`, `wsgi.py`, `celery.py`).
*   `apps/`: Independent modular Django apps (e.g., `tenants`, `authentication`, `operations`, `billing`).
*   `requirements.txt`: Python package dependencies.
*   `manage.py`: Django execution script.

## Development Setup

### 1. Requirements Installation
Create a local Python virtual environment and install packages:
```bash
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

### 2. Environment Configurations
Verify a `.env` file is initialized at the root of the backend folder using the variables mapping in `../.env.example`.

### 3. Migrations & Server Start
```bash
python manage.py migrate
python manage.py runserver
```

## Running Backend Tests
Execute unit tests using the standard Django test runner:
```bash
python manage.py test
```
