# ==============================================================================
# ENVIRONMENT SETUP SCRIPT (Restaurant Management SaaS Platform)
# ==============================================================================
# This script provisions local developer assets, configurations, and templates
# in an idempotent manner.
# ==============================================================================

Write-Host "Starting Sprint 0.2 Developer Environment Setup..." -ForegroundColor Cyan

# 1. Verify Prerequisites
$prereqs = @("docker", "python", "npm")
foreach ($cmd in $prereqs) {
    if (Get-Command $cmd -ErrorAction SilentlyContinue) {
        Write-Host "[OK] Found prerequisite: $cmd" -ForegroundColor Green
    } else {
        Write-Warning "[WARNING] Prerequisite missing: $cmd. Please install it for full local capabilities."
    }
}

# 2. Idempotent Environment File Creation
$envExample = Join-Path $PSScriptRoot "../../.env.example"
$envFile = Join-Path $PSScriptRoot "../../.env"

if (Test-Path $envFile) {
    Write-Host "[OK] Environment configuration file .env already exists." -ForegroundColor Green
} else {
    Write-Host "[INFO] Copying .env.example template to .env..." -ForegroundColor Yellow
    Copy-Item $envExample $envFile
    Write-Host "[OK] Created .env configuration file." -ForegroundColor Green
}

# 3. Provision Frontend Node Dependencies (Conditional)
$frontendDir = Join-Path $PSScriptRoot "../../frontend/restaurant-platform"
if (Get-Command npm -ErrorAction SilentlyContinue) {
    if (Test-Path (Join-Path $frontendDir "node_modules")) {
        Write-Host "[OK] Node dependencies already installed in frontend workspace." -ForegroundColor Green
    } else {
        Write-Host "[INFO] Installing Node dependencies. This may take a minute..." -ForegroundColor Yellow
        Push-Location $frontendDir
        try {
            npm install --no-audit --no-fund
            Write-Host "[OK] Installed frontend node packages." -ForegroundColor Green
        } catch {
            Write-Error "Failed to run 'npm install' inside $frontendDir"
        }
        Pop-Location
    }
} else {
    Write-Warning "Skipped frontend npm install because npm CLI was not found."
}

# 4. Pre-build Docker images (Optional & Idempotent)
if (Get-Command docker -ErrorAction SilentlyContinue) {
    Write-Host "[INFO] Verifying docker compose files and pre-building images..." -ForegroundColor Yellow
    $composePath = Join-Path $PSScriptRoot "../../docker-compose.yml"
    docker compose -f $composePath build
    Write-Host "[OK] Base container images successfully compiled." -ForegroundColor Green
} else {
    Write-Error "Docker daemon command not found. Please install Docker Desktop to run containers."
}

Write-Host "Setup Completed Successfully. Run scripts/dev/start.ps1 to start the platform." -ForegroundColor Green
