#requires -PSEdition Core
#requires -Version 7.0

Set-Variable -Name "TestConfigPath" -Value "${PSScriptRoot}\..\config.json" -Option Constant -Scope Script
Set-Variable -Name "BackupTestConfigPath" -Value "${TestConfigPath}.bak" -Option Constant -Scope Script

function CleanupInteractiveConfig {
    if (Test-Path $BackupTestConfigPath -PathType Leaf) {
        Move-Item -Path $BackupTestConfigPath -Destination $TestConfigPath -Force
    }
}

function BuildInteractiveConfig {
    param (
        [switch]$TakeBackup
    )

    if ($TakeBackup) {
        Copy-Item -Path $TestConfigPath -Destination $BackupTestConfigPath
    }
    $config = Get-Content -Path $TestConfigPath | ConvertFrom-Json -Depth 4
    $config.playwright.options.headless = $false
    $config | ConvertTo-Json -Depth 4 | Set-Content -Path $TestConfigPath
}
