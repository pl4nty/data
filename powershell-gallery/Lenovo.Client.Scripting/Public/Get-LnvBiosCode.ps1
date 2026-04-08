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

    try {
            $biosversion = Get-CimInstance -Class "Win32_Bios" -Namespace "root/cimv2" -Property "SMBIOSBIOSVersion"
            if ($null -eq $biosversion)
            {
                Write-Output -InputObject 'Unable to read BIOS version information from device.'
                return
            }
            else
            {
                # The BIOS code is the first 4 characters of the SMBIOSBIOSVersion property
                return $biosversion.SMBIOSBIOSVersion.SubString(0, 4)
            }

    }
    catch {
        Write-Output -InputObject 'An unexpected error occurred while reading BIOS version information.'
    }
}

# SIG # Begin signature block
