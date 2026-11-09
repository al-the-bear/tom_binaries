# Commit all binary changes and push to remote
$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

# Check for changes
$status = git status --porcelain
if (-not $status) {
    Write-Host "No changes to commit."
    exit 0
}

Write-Host "Staging all changes..."
git add -A
if ($LASTEXITCODE -ne 0) { throw "git add failed" }

Write-Host ""
Write-Host "Changes to be committed:"
git diff --cached --stat
Write-Host ""

# Build commit message from changed platforms
$platforms = @()
$changedFiles = git diff --cached --name-only
foreach ($dir in @("darwin-arm64", "darwin-x64", "linux-x64", "linux-arm64", "linux-armhf", "win32-x64")) {
    if ($changedFiles | Where-Object { $_ -match $dir }) {
        $platforms += $dir
    }
}

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
$platStr = if ($platforms.Count -gt 0) { " ($($platforms -join ' '))" } else { "" }
$msg = "Update binaries ${timestamp}${platStr}"

Write-Host "Committing: $msg"
git commit -m $msg
if ($LASTEXITCODE -ne 0) { throw "git commit failed" }

Write-Host ""
Write-Host "Pushing to remote..."
git push origin main
if ($LASTEXITCODE -ne 0) { throw "git push failed" }

Write-Host ""
Write-Host "Done. All binary changes committed and pushed."
