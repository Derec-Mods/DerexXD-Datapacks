$outputZip = "DerexStairsAndSlabsToBlock.zip"

if (Test-Path $outputZip) {
    Remove-Item $outputZip -Force
}

if (Get-Command tar.exe -ErrorAction SilentlyContinue) {
    tar.exe -a -c -f $outputZip pack.mcmeta data
} else {
    $ProgressPreference = 'SilentlyContinue'
    Compress-Archive -Path "pack.mcmeta", "data" -DestinationPath $outputZip -Force
}
Write-Host "Created $outputZip successfully!" -ForegroundColor Green
