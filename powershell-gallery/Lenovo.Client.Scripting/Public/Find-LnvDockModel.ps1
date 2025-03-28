<#
  .SYNOPSIS
  Finds dock model name based on machine type

  .DESCRIPTION
  The first four characters of the dock product number is the machine type.
  This command returns the dock model name by searching for the machine type.
  The -Details switch controls whether the full dock details are displayed.
  If -Details is not specified then only the dock name will be returned.
  If -Details is provided then the PnP IDs for the USB Billboard device and
  the audio device will be shown. These can be used when targeting laptops
  that have this dock attached.

  .PARAMETER MachineType
  Mandatory: True

  .PARAMETER Details
  Mandatory: False


  .EXAMPLE
  Find-LnvDockModel -MachineType 40AN -Details

  .INPUTS

  .OUTPUTS

  .NOTES

#>
function Find-LnvDockModel {
    param (
        [ValidateLength(4,4)][parameter(position = 0, Mandatory = $true, helpMessage = "Enter the four-character Machine Type to search for")]
        [String] $MachineType,
        [parameter(position = 1, Mandatory = $false)]
        [switch] $Details
    )

    $MachineType = $MachineType.ToLower().Trim()
    $docks = Get-LnvDockList

    if ($docks) {
        foreach ($dock in $docks) {
            if ($dock.machine_type.ToLower().Contains($MachineType)) {
                if ($Details) {
                    $dock
                } else {
                    $dock.device_name
                }
            }
        }
    } else {
        Write-Output -InputObject "Could not get dock list."
    }
}

# SIG # Begin signature block
