#----------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation.  All rights reserved.
#----------------------------------------------------------------------------------------------
# PowerShell script to install the VC++ runtime distribables.
#   Uses the VcRedist PowerShell module.
#   https://www.powershellgallery.com/packages/VcRedist
#

# Check VC++ 2013 runtime installation status.
$vcRegKey= "HKLM:\SOFTWARE\Microsoft\DevDiv\vc\Servicing\12.0\RuntimeAdditional"
$installStatus = (Get-ItemProperty -Path $vcRegKey -ErrorAction SilentlyContinue).Install

if (($installStatus.length -eq 0) -Or ($installStatus -eq 0))
{
    Write-Host "Required VC++ 2013 x64 Runtimes do not exist."  -ForegroundColor Yellow
    Write-Host "Installing the VC++ 2013 x64 Runtime now." -ForegroundColor Yellow
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

    try {
        # install VC runtime modules
        Import-Module VcRedist -ErrorAction Stop

        $version = Get-Module -Name VcRedist | Sort-Object Version | Select-Object -Last 1 | Select -ExpandProperty "Version"
        $currentVersion = [Version]::new($version.Major, $version.Minor, $version.Build)

        # Version 4.1.480 had a breaking change removing -Path parameter. https://vcredist.com/changelog/#41480
        $cutoffVersion = [Version]'4.1.480'

        # Create download folder
        $tmpPath = -join($env:TEMP, "\VcRedist")
        New-Item -Path $tmpPath -ItemType Directory -Force -ErrorAction Stop | Out-Null

        Write-Host "Downloading the VC++ 2013 x64 Runtime ..." -ForegroundColor Yellow
        if ($currentVersion -ge $cutoffVersion)
        {
            # VC 2013 is marked as unsupported now, export all possible versions
            $VcList = Get-VcList -Export All `
            | Where-Object {$_.Architecture -eq 'x64'} `
            | Where-Object {$_.Name -like '*2013*'} `
            | Sort-Object Version `
            | Select-Object -Last 1 `
            | Save-VcRedist -Path $tmpPath

            Write-Host "Installing the VC++ 2013 x64 Runtime ..." -ForegroundColor Yellow
            $VcList | Install-VcRedist | Out-Null
        }
        else {
            $VcList = Get-VcList | Where-Object {$_.Architecture -eq 'x64'} | Where-Object {$_.Name -like '*2013*'} | Get-VcRedist -Path $tmpPath

            Write-Host "Installing the VC++ 2013 x64 Runtime ..." -ForegroundColor Yellow
            $VcList | Install-VcRedist -Path $tmpPath | Out-Null
        }

        # remove temporary files
        Remove-Item -Path $tmpPath -Force -Recurse
    }
    catch {
        Write-Host "Failed to install VC++ 2013 x64 Runtime. Please download and install it manually..." -ForegroundColor Red
    }
}