<#
  .SYNOPSIS
  Provide a list of battery details

  .DESCRIPTION
  This cmdlet will return a list of custom objects which represent each battery
  in the system.

  .PARAMETER

  .EXAMPLE
  $myBatteries = Get-LnvBatteryDetails

  .INPUTS

  .OUTPUTS
  Returns a generic list of objects with the following attributes:
    [string]$InstanceName
    [string]$DeviceName
    [string]$DesignedCapacity
    [string]$Manufacturer
    [string]$FullChargedCapacity
    [string]$Location
    [string]$DesignVoltage
    [string]$RemainingCapacity
    [string]$PowerOnline
    [string]$Charging
    [string]$Discharging
    [string]$Voltage
    [string]$ChargeRate
    [string]$DischargeRate

  .NOTES

#>

function Get-LnvBatteryInfo {

class LnvBattery {
    [string]$InstanceName
    [string]$DeviceName
    [string]$DesignedCapacity
    [string]$Manufacturer
    [string]$FullChargedCapacity
    [string]$Location
    [string]$DesignVoltage
    [string]$RemainingCapacity
    [string]$PowerOnline
    [string]$Charging
    [string]$Discharging
    [string]$Voltage
    [string]$ChargeRate
    [string]$DischargeRate
}

$myLnvBatteries = New-Object 'System.Collections.Generic.List[LnvBattery]'

try {
    # Using Get-WmiObject because Get-CimInstance does not work with this particular class
    $batteries = Get-WmiObject -Class 'BatteryStaticData' -Namespace 'root\wmi'
    foreach ( $battery in $batteries) {
        $thisBattery = [LnvBattery]::new()
        $thisBattery.InstanceName = $battery.InstanceName
        $thisBattery.DeviceName = $battery.DeviceName
        $thisBattery.DesignedCapacity = $battery.DesignedCapacity
        $thisBattery.Manufacturer = $battery.ManufactureName
        $myLnvBatteries.Add($thisBattery)
    }
} catch {
    Write-Output -InputObject 'Unexpected error reading BatteryStaticData class from root\wmi'
    return
    #return no results, must be able to identify each battery in order to proceed
}

try {
    $batCaps = Get-CimInstance 'BatteryFullChargedCapacity' -Namespace 'root\wmi'
    foreach ($battery in $batCaps) {
        foreach ($thisbattery in $myLnvBatteries) {
            if ($battery.InstanceName -eq $thisbattery.InstanceName) {
                $thisbattery.FullChargedCapacity = $battery.FullChargedCapacity
            }
        }
    }
} catch {
    Write-Output -InputObject 'Unexpected error reading BatteryFullChargedCapacity class from root\wmi'
    # continue attempting to collect other battery details
}

try {
    $batteries = Get-CimInstance 'Win32_PortableBattery'
    foreach ($battery in $batteries) {
        foreach ($thisbattery in $myLnvBatteries) {
            if ($battery.Name -eq $thisbattery.DeviceName) {
                $thisbattery.Location = $battery.Location
                $thisbattery.DesignVoltage = $battery.DesignVoltage
            }
        }
    }
} catch {
    Write-Object -InputObject 'Unexpected error reading Win32_PortableBattery class.'
    # continue attempting to collect other battery details
}

try {
    $batteries = Get-CimInstance 'BatteryStatus' -Namespace 'root\wmi'
    foreach ($battery in $batteries) {
        foreach ($thisbattery in $myLnvBatteries) {
            if ($battery.InstanceName -eq $thisbattery.InstanceName) {
                $thisbattery.RemainingCapacity = $battery.RemainingCapacity
                $thisbattery.PowerOnline = $battery.PowerOnline
                $thisbattery.Charging = $battery.Charging
                $thisbattery.Discharging = $battery.Discharging
                $thisbattery.Voltage = $battery.Voltage
                $thisbattery.ChargeRate = $battery.ChargeRate
                $thisbattery.DischargeRate = $battery.DischargeRate
            }
        }
    }
}
catch {
    Write-Object -InputObject 'Unexpected error reading BatteryStatus class from root\wmi.'
}

return $myLnvBatteries
}
# SIG # Begin signature block
