#requires -Version 7.0
#requires -PSEdition Core

# Ensure Windows Update service is running
Start-Service wuauserv

# Install Media Foundation
if ((Get-WindowsFeature -Name Server-Media-Foundation).InstallState -ne 'Installed') {
    Install-WindowsFeature Server-Media-Foundation
}

# Verify the installation
$missingFiles = @()
if (-not (Test-Path "$env:windir\System32\mf.dll")) {
    $missingFiles += 'mf.dll'
}
if (-not (Test-Path "$env:windir\System32\mfplat.dll")) {
    $missingFiles += 'mfplat.dll'
}

if ($missingFiles.Count -eq 0) {
    Write-Output "All required Media Foundation files are present."
} else {
    Write-Error "Missing Media Foundation files: $($missingFiles -join ', ')"
}

npx playwright install