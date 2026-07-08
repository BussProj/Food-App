# ==============================================================================
# DEV ENVIRONMENT LAUNCHER (Restaurant Management SaaS Platform)
# ==============================================================================
# Idempotently starts the Docker Compose environment, monitors container
# startup health, and launches the browser when operational.
# ==============================================================================

Write-Host "Initializing Dev Environment Orchestrations..." -ForegroundColor Cyan

# 1. Environment Check
$rootPath = Resolve-Path (Join-Path $PSScriptRoot "../..")
$envPath = Join-Path $rootPath ".env"

if (-not (Test-Path $envPath)) {
    Write-Error "Environment file (.env) is missing at $rootPath. Run scripts/setup/setup.ps1 first."
    Exit 1
}

# 2. Check if Docker Daemon is Active
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Error "Docker client command not found. Please install and start Docker Desktop."
    Exit 1
}

# 3. Startup Docker containers
Write-Host "[INFO] Starting all 8 services..." -ForegroundColor Yellow
docker compose -f (Join-Path $rootPath "docker-compose.yml") up -d --build

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to boot Docker compose cluster."
    Exit 1
}

# 4. Graceful Startup Wait & Health Check Polling
$healthUrl = "http://localhost/api/health/"
$maxRetries = 30
$retryIntervalSec = 3
$success = $false

Write-Host "[INFO] Waiting for PostgreSQL, Redis, and Django container connections to report healthy..." -ForegroundColor Yellow

for ($i = 1; $i -le $maxRetries; $i++) {
    try {
        # Silent query checking status
        $response = Invoke-RestMethod -Uri $healthUrl -Method Get -TimeoutSec 2 -ErrorAction Stop
        if ($response.status -eq "success") {
            Write-Host "`n[OK] Platform routing and services connection pools successfully synchronized!" -ForegroundColor Green
            Write-Host "Database Latency: $($response.services.database.latency_ms) ms" -ForegroundColor Green
            Write-Host "Redis Latency: $($response.services.redis.latency_ms) ms" -ForegroundColor Green
            $success = $true
            break
        }
    } catch {
        # Log dot progress
        Write-Host "." -NoNewline
    }
    Start-Sleep -Seconds $retryIntervalSec
}

if (-not $success) {
    Write-Warning "`n[TIMEOUT] Health check endpoint did not respond successfully within time limit."
    Write-Warning "Please check container logs: 'docker compose logs backend' for detailed errors."
} else {
    # Launch browser to the Nginx landing route
    Write-Host "[INFO] Opening default browser to local proxy entrance http://localhost/ ..." -ForegroundColor Yellow
    Start-Process "http://localhost/"
}
