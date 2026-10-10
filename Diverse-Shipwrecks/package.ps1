# this is ai generated ok dont sue me

param (
    [Parameter(Mandatory = $false, Position = 0)]
    [string]$Version
)

$scriptDir = $PSScriptRoot
if (-not $scriptDir) {
    $scriptDir = (Get-Location).Path
}

# If no version is specified as an argument, discover available versions
if (-not $Version) {
    $availableVersions = (Get-ChildItem -Path $scriptDir -Directory | Where-Object { $_.Name -match '^\d+(\.\d+)*$' }).Name
    if (-not $availableVersions) {
        Write-Error "No version directories found in '$scriptDir'."
        exit 1
    }
    Write-Host "Available versions: $($availableVersions -join ', ')"
    $Version = Read-Host "Enter the version to zip (e.g., 26.3)"
}

$sourceDir = Join-Path $scriptDir $Version

if (-not (Test-Path $sourceDir -PathType Container)) {
    Write-Error "Version folder '$sourceDir' does not exist."
    exit 1
}

$outputZipName = "DerexDiverseShipwrecks-$Version.zip"
$outputZipPath = Join-Path $scriptDir $outputZipName

# Remove existing zip if already present
if (Test-Path $outputZipPath) {
    Remove-Item $outputZipPath -Force
}

Write-Host "Packaging '$Version' contents into '$outputZipName' using tar..." -ForegroundColor Cyan

Push-Location $sourceDir
try {
    tar.exe -a -cf $outputZipPath *
    if (Test-Path $outputZipPath) {
        $sizeKB = [Math]::Round((Get-Item $outputZipPath).Length / 1KB, 2)
        Write-Host "Done! Created $outputZipName ($sizeKB KB)" -ForegroundColor Green
    }
}
finally {
    Pop-Location
}
