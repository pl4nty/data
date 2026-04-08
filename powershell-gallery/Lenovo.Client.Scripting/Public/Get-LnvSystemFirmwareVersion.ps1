<#
  .SYNOPSIS
  Get the System Firmware Version from the device

  .DESCRIPTION
  Returns the System Firmware Version if found, in a decimal version format.

  .PARAMETER

  .EXAMPLE
  Get-LnvSystemFirmwareVersion

  .INPUTS

  .OUTPUTS

  .NOTES

#>

function Get-LnvSystemFirmwareVersion {
    try {
        $device = Get-PnpDevice | Where-Object {$_.FriendlyName -like "*System Firmware*"}
        if (-not $device) {
            Write-Error "System Firmware device not found."
            return
        }
        $rawVersion = Get-PnpDeviceProperty -InstanceID $device.InstanceId | Where-Object {$_.Keyname -match "Device_FirmwareVersion"} | Select-Object -Property Data
        if (-not $rawVersion) {
            Write-Error "Firmware version property not found."
            return
        }
        $MajorVersion = $rawVersion.Data.Substring(0,1)
        $MinorVersionRaw = $rawVersion.Data.Substring(1)
        $MinorVersion = [string]([Convert]::ToInt32($MinorVersionRaw, 16)).ToString("D2")
        $SystemFirmwareVersion = "{0}.{1}" -f $MajorVersion, $MinorVersion
        return $SystemFirmwareVersion
    } catch {
        Write-Error "Failed to retrieve firmware version: $_"
    }
}
# SIG # Begin signature block
