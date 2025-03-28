
<#
  .SYNOPSIS
  Get Serial number of device

  .DESCRIPTION
  Returns the serial number of the running device

  .PARAMETER

  .EXAMPLE
  Get-LnvSerial

  .INPUTS

  .OUTPUTS

  .NOTES

#>
function Get-LnvSerial {
    $computer = Get-CimInstance -Class "Win32_ComputerSystemProduct" -Namespace "root/cimv2"
    return $computer.IdentifyingNumber
}
# SIG # Begin signature block
