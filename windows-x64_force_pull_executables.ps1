# Force pull windows-x64 executables (overwrites local changes)
$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

Write-Host "Fetching latest from remote..."
git fetch origin
if ($LASTEXITCODE -ne 0) { throw "git fetch failed" }

Write-Host "Resetting to remote main (local changes will be overwritten)..."
git reset --hard origin/main
if ($LASTEXITCODE -ne 0) { throw "git reset failed" }

Write-Host "Done. windows-x64 executables are ready."
Write-Host "(Windows binaries are located in windows-x64/ and tom/windows-x64/)"
