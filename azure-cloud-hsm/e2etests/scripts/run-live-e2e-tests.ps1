<#
.SYNOPSIS
    This script runs the end-to-end tests against a deployed
environment at a specific stage. Other environments are not supported
at this time.

.DESCRIPTION
    This script must be run from the directory containing
the portal extension project file, and requires a stage name
provided via a command-line argument.

.PARAMETER StageName
    The name of the stage to run the tests against. Valid stage
names are: "preview", "1", "2", "3", "4" and "5".

.PARAMETER Interactive
    If this switch is provided, the tests will be run in a
visible browser.
#>
#requires -PSEdition Core
#requires -Version 7.0

param (
    [Parameter(Mandatory = $true)][string]$StageName,
    [switch]$Interactive
)

Set-Variable -Name "testLocation" -Value "${PSScriptRoot}\.." -Option Constant -Scope Script
Set-Variable -Name "testConfigFile" -Value "${PSScriptRoot}\..\config.json" -Option Constant -Scope Script
Set-Variable -Name "reportersConfigFile" -Value "${PSScriptRoot}\..\reporters.json" -Option Constant -Scope Script
Set-Variable -Name "backupTestConfigFile" -Value "${testConfigFile}.bak" -Option Constant -Scope Script
Set-Variable -Name "backupReportersConfigFile" -Value "${reportersConfigFile}.bak" -Option Constant -Scope Script

. "${PSScriptRoot}\interactive-config.ps1"

function ValidateStageOrDie {
    $validStages = @("preview", "1", "2", "3", "4", "5")
    if ($validStages -inotcontains $StageName) {
        Write-Output "Stage $StageName is not supported"
        Write-Output "Available stages are: $( $validStages -join ", " )"
        exit 1
    }
}

function SetTestStage {
    $uriBuilder = New-Object System.UriBuilder "https://portal.azure.com"
    $uriBuilder.Query = "feature.customportal=false&feature.canmodifystamps=true&Microsoft_Azure_ManagedHSM=stage$StageName"

    Copy-Item $testConfigFile $backupTestConfigFile -Force
    $testConfig = Get-Content $testConfigFile | Out-String | ConvertFrom-Json
    $testConfig.portalUrl = $uriBuilder.Uri.AbsoluteUri

    $testConfig | ConvertTo-Json -Depth 4 | Set-Content $testConfigFile
}

function SetReportName {
    Copy-Item $reportersConfigFile $backupReportersConfigFile -Force
    $reportersConfig = Get-Content $reportersConfigFile | Out-String | ConvertFrom-Json
    $reportersConfig.'mocha-junit-reporter'.options.testsuitesTitle += " - Stage $StageName"

    $reportersConfig | ConvertTo-Json -Depth 4 | Set-Content $reportersConfigFile
}

function RecoverConfigFiles {
    Move-Item $backupTestConfigFile $testConfigFile -Force
    Move-Item $backupReportersConfigFile $reportersConfigFile -Force
}

function RunTests {
    if ($Interactive) {
        BuildInteractiveConfig
    }
    npm run e2e
}

function Main {
    ValidateStageOrDie

    try {
        SetTestStage
        SetReportName
        Push-Location $testLocation
        RunTests
    } finally {
        RecoverConfigFiles
        Pop-Location
    }
}

Main
