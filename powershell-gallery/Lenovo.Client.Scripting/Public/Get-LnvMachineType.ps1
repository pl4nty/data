<#
  .SYNOPSIS
  Get the 4 character machinetype of the device

  .DESCRIPTION
  Returns the 4 character machinetype of the running device.

  .PARAMETER

  .EXAMPLE
  Get-LnvMachineType

  .INPUTS

  .OUTPUTS

  .NOTES

#>
function Get-LnvMachineType {
    $computer = Get-CimInstance -Class "Win32_ComputerSystemProduct" -Namespace "root/cimv2"
    return $computer.Name.Substring(0, 4)
}

# SIG # Begin signature block
