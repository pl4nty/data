<#
  .SYNOPSIS
  Get Model Name of device

  .DESCRIPTION
  Returns the model name of the running device

  .PARAMETER

  .EXAMPLE
  Get-LnvModelName

  .INPUTS

  .OUTPUTS

  .NOTES

#>
function Get-LnvModelName {
    $computer = Get-CimInstance -Class "Win32_ComputerSystemProduct" -Namespace "root/cimv2"
    return $computer.Version
}

# SIG # Begin signature block
