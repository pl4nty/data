<#
  .SYNOPSIS
  Get the URL to current BIOS update package

  .DESCRIPTION
  This command will return the URL to the current BIOS update package for
  either the specified machine type or for the machine type of the device
  running the command.

  .PARAMETER MachineType
  Mandatory: False

  .EXAMPLE
  Get-LnvBiosUpdateUrl -MachineType '21AH'

  .EXAMPLE
  Get-LnvBiosUpdateUrl

  .INPUTS

  .OUTPUTS

  .NOTES
  The device must be a Lenovo ThinkPad, ThinkCentre, or ThinkStation.
#>
function Get-LnvBiosUpdateUrl {
    param (
        [ValidateLength(4,4)][parameter(position = 0, Mandatory = $false)] [String] $MachineType
    )

    try {
        [xml]$catalog = Get-LnvDATCatalog
    }
    catch {
        Write-Output $_
        return
    }

    if ($MachineType -eq '') {
        $computer = Get-CimInstance -Class "Win32_ComputerSystemProduct" -Namespace "root/cimv2"

        if ($computer.Vendor.ToString().ToLower() -eq 'lenovo') {
           $MachineType = $computer.Name.Substring(0, 4)
           if ($MachineType -eq '') {
            Write-Output -InputObject "Could not get valid machine type."
           }
        }
        else {
            Write-Output -InputObject "Not a Lenovo product."
        }
    }

    $node = $catalog.ModelList.Model | Where-Object { $_.Types.Type -eq "$MachineType" }

    try {
        $updateUrl = $node.BIOS.'#text'
        return $updateUrl
    }
    catch {
        Write-Output -InputObject "BIOS Update not found for $($MachineType)"
    }
}

# SIG # Begin signature block
