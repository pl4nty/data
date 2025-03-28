<#
  .SYNOPSIS
  Get Product number of device

  .DESCRIPTION
  Returns the full 10-character product number of the running device

  .PARAMETER

  .EXAMPLE
  Get-LnvProductNumber

  .INPUTS

  .OUTPUTS

  .NOTES

#>
function Get-LnvProductNumber {
    $computer = Get-CimInstance -Class "Win32_ComputerSystemProduct" -Namespace "root/cimv2"
    return $computer.Name
}

# SIG # Begin signature block
