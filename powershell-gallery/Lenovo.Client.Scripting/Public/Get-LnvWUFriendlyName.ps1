<#
  .SYNOPSIS
  Provide a list of driver and firmware updates that were applied by Windows Update

  .DESCRIPTION
  This cmdlet will return a list of drivers and firmware that were applied by
  Windows Update and will show the title used by Windows Update and the more
  usefule friendly name used by Lenovo. This cmdlet will also return the
  version and install date of the driver or firmware that was applied by
  Windows Update. The output will only include information about drivers that
  are currently active. Windows Update History may show multiple entries for
  the same driver or firmware, but this cmdlet will only return the most
  recent version of each driver or firmware. It will also only return
  information about drivers for components currently attached and not for
  components that have been removed or are not currently attached.

  *** ATTRIBUTION ***
  This cmdlet is based on the work of Trevor Jones and the original can be
  found on his blog at:
  https://smsagent.blog/2023/07/07/translating-windows-update-driver-names-to-friendly-driver-names/

  .PARAMETER GridView
  Mandatory: False
  Data Type: SwitchParameter
  Description: If specified, the output will be displayed in an Out-GridView window.

  .PARAMETER SortbyInstallDate
  Mandatory: False
  Data Type: SwitchParameter
  Description: If specified, the output will be sorted by InstallDate instead of WUName.

  .EXAMPLE
  Get-LnvWUFriendlyNames -GridView -SortbyInstallDate

  .INPUTS

  .OUTPUTS
  Returns a generic list of objects with the following attributes:
    [string]$WUName
    [string]$InstallDate
    [string]$DeviceName
    [string]$DriverVersion
    [string]$DriverDate
    [string]$Manufacturer

  .NOTES
  This cmdlet is not supported in PowerShell 7+ and must be run in Windows PowerShell (v5).
  This cmdlet relies on the MSU Package Provider for the Get-Package cmdlet which is not
  available in PowerShell 7+.
#>

function Get-LnvWUFriendlyName {

    param (
        [parameter(position = 0, Mandatory = $false)]
        [switch]$GridView,
        [switch]$SortbyInstallDate
    )

    if ($PSVersionTable.PSEdition -eq 'Core') {
        Write-Output "This cmdlet is not supported in PowerShell 7+. Please run it in Windows PowerShell (v5)."
        return
    }

    class LnvDriver {
        [string]$WUName
        [string]$InstallDate
        [string]$DeviceName
        [string]$DriverVersion
        [string]$DriverDate
        [string]$Manufacturer
    }

    Write-Output "Please wait, processing Windows Update driver friendly names (may take a few minutes)..."
    $DriverList = [System.Collections.Generic.List[LnvDriver]]::new()
    $win32Drivers = Get-CimInstance -ClassName Win32_PnPSignedDriver
    $InstalledDrivers = Get-Package -ProviderName msu | Where-Object {$_.Metadata.Item("SupportUrl") -match "target=hub"}
    foreach ($InstalledDriver in $InstalledDrivers)
    {
        $Driver = [LnvDriver]::new()
        $Driver.WUName = $InstalledDriver.Name
        $Driver.InstallDate = $InstalledDriver.Metadata.Item("Date")
        $DeviceDriver = ($win32Drivers | Where-Object { $_.DriverVersion -like "*$($InstalledDriver.Name.Split()[-1])*" } | Select-Object -First 1 | Select-Object DeviceName,DriverDate,DriverVersion,Manufacturer )
        If ($DeviceDriver)
        {
            $DriverDate = $DeviceDriver.DriverDate
            $Driver.DeviceName = $DeviceDriver.DeviceName
            $Driver.DriverDate = $DriverDate
            $Driver.DriverVersion = $DeviceDriver.DriverVersion
            $Driver.Manufacturer = $DeviceDriver.Manufacturer
            $DriverList.Add($Driver)
        }
    }

    if ($SortbyInstallDate) {
        $sortBy = 'InstallDate'
    } else {
        $sortBy = 'WUName' # Default sort property
    }

    if ($GridView) {
        $DriverList | Sort-Object -Property $sortBy | Out-GridView -Title "Windows Update Driver Friendly Names"
    } else {
        $DriverList | Sort-Object -Property $sortBy | Format-Table -Property WUName,InstallDate,DeviceName,DriverVersion,DriverDate,Manufacturer -AutoSize
    }
}
# SIG # Begin signature block
