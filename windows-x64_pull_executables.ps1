# Pull and prepare windows-x64 executables
$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

Write-Host "Pulling latest binaries..."
git pull
if ($LASTEXITCODE -ne 0) { throw "git pull failed" }

Write-Host "Done. windows-x64 executables are ready."
Write-Host "(Windows binaries are located in windows-x64/ and tom/windows-x64/)"
