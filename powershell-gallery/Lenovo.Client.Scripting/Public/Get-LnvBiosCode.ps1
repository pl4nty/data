<#
  .SYNOPSIS
  Parse the 4-character BIOS code from the device

  .DESCRIPTION
  This cmdlet will read the BIOS image name from the device and return the
  first four characters which can be used as the BIOS code in targeting
  actions to the model uniquely.

  .PARAMETER

  .EXAMPLE
  Get-LnvBiosCode

  .INPUTS

  .OUTPUTS

  .NOTES

#>
  function Get-LnvBiosCode {
    #probs need to mock this
    $biosversion = Get-CimInstance -Class "Win32_Bios" -Namespace "root/cimv2" | Select-Object $_.SMBIOSBIOSVersion
    return $biosversion.SMBIOSBIOSVersion.SubString(0, 4)
}

# SIG # Begin signature block
