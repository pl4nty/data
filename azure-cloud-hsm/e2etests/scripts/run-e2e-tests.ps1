<#
.SYNOPSIS
    This script will launch the development server and run the end-to-end tests
against an extension side-loaded into the portal specified by `portalUrl` inside
the `config.json` file.

.DESCRIPTION
    This script must be run from the directory containing
the portal extension project file, and requires a stage name
provided via a command-line argument.

.PARAMETER OutputPath
    When this optional parameter is provided, the screenshots taken at the time
of test failures will be copied to the specified directory.

.PARAMETER Interactive
    If this switch is provided, the tests will be run in a visible browser.
#>
#requires -Version 7.0
#requires -PSEdition Core

param (
    [Parameter(Mandatory=$false)][string]$OutputPath = "",
    [switch]$Interactive
)

. "${PSScriptRoot}\interactive-config.ps1"

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
Set-Variable -Name "DevServerJobName" -Value "MHSMDevServer" -Option Constant -Scope Script
Set-Variable -Name "DevServerStartTimeout" -Value 90 -Option Constant -Scope Script
Set-Variable -Name "DevServerStartedToken" -Value "Started listening on port" -Option Constant -Scope Script
Set-Variable -Name "DevServerStartPollingInterval" -Value 3 -Option Constant -Scope Script
Set-Variable -Name "ScreenshotsLocation" -Value "${PSScriptRoot}\..\Screenshots" -Option Constant -Scope Script
Set-Variable -Name "SourceLocation" -Value "${PSScriptRoot}\..\..\src" -Option Constant -Scope Script
Set-Variable -Name "TestSuiteLocation" -Value "${PSScriptRoot}\.." -Option Constant -Scope Script

function Main() {
    $currentDirectory = Get-Location
    try {
        StartDevServer
        RunE2ETests
    }
    catch {
        Write-Error $_
        Exit 1
    }
    finally {
        StopDevServer
        SaveScreenshots
        CleanupInteractiveConfig
        Set-Location -Path $currentDirectory
    }
}


function StartDevServer {
    Write-Information "Starting dev server"
    Push-Location -Path $SourceLocation
    if (-not (Test-Path -Path "node_modules" -PathType Container)) {
        Write-Information "Installing npm dependencies"
        npm install
    }
    $devServerJob = Start-Job -Name $DevServerJobName -ScriptBlock { npm run start }
    $timeout = $DevServerStartTimeout
    do {
        if ($timeout -le 0) {
            Write-Error "Dev server did not start within $DevServerStartTimeout seconds"
            Exit 1
        }
        Start-Sleep $DevServerStartPollingInterval
        $timeout -= $DevServerStartPollingInterval
        Write-Host "." -NoNewline
        $devServerOutput = Receive-Job -Job $devServerJob -ErrorAction SilentlyContinue
    } while ("$devServerOutput" -notmatch "$DevServerStartedToken")
    Write-Information "Dev server started"
    Pop-Location
}

function StopDevServer() {
    Write-Information "Stopping dev server"
    $devServerJob = Get-Job -Name $DevServerJobName
    if ($null -ne $devServerJob) {
        Stop-Job -Job $devServerJob
        Write-Information "Dev server stopped"
        Remove-Job -Job $devServerJob
    }
}

function RunE2ETests {
    Write-Information "Running E2E tests"
    Push-Location -Path $TestSuiteLocation
    npx playwright install
    if ($Interactive) {
        BuildInteractiveConfig -TakeBackup
    }
    npm run e2e:sideload
    Pop-Location
}

function SaveScreenshots {
    if ($OutputPath -ne "" -and (Test-Path -Path $ScreenshotsLocation -PathType Container)) {
        Copy-Item -Path $ScreenshotsLocation -Destination $OutputPath -Recurse
    }
}

Main
