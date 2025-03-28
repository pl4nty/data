<#
  .SYNOPSIS
  Gets the BIOS Password state of the system

  .DESCRIPTION
  This cmdlet gets the BIOS password state of the system and interprets it to
  return the set of passwords set on the device. If the -Number switch is used,
  then the PasswordState number will be returned instead.

  .PARAMETER Number
  Mandatory: False

  .EXAMPLE
  Get-LnvBiosPasswordSet

  .EXAMPLE
  Get-LnvBiosPasswordSet -Number

  .INPUTS

  .OUTPUTS

  .NOTES
  THIS CMDLET REQUIRES ADMIN RIGHTS TO EXECUTE. Make sure the PowerShell
  session is running with elevated privileges.
#>
function Get-LnvBiosPasswordsSet {
  param (
    [parameter(Mandatory = $false, Position = 0)]
    [Switch]$Number
)
    try{
      $lbp = Get-CimInstance -ClassName "Lenovo_BiosPasswordSettings" -Namespace "root/wmi"
    }
    catch {
      Write-Output "Access denied. Please run as administrator"
      return
    }

    if ($Number) {
      Write-Output -InputObject $lbp.PasswordState
    } else {
      Switch ($lbp.PasswordState) {
          0 { Write-Output -InputObject "No BIOS Password Set" }

          1 { Write-Output -InputObject "Only Power On Password" }

          2 { Write-Output -InputObject "Only Supervisor Password" }

          3 { Write-Output -InputObject "User HDD and/or User HDD and Master Password" }

          5 { Write-Output -InputObject "Power On + User HDD and/or User HDD and Master Password" }

          6 { Write-Output -InputObject "Supervisor + User HDD and/or User HDD and Master Password" }

          7 { Write-Output -InputObject "Supervisor + Power On + User HDD and/or User HDD and Master Password" }

          64 { Write-Output -InputObject "Only System Management Password" }

          65 { Write-Output -InputObject "System Management + Power On Password" }

          66 { Write-Output -InputObject "Supervisor + System Management Password" }

          67 { Write-Output -InputObject "Supervisor + System Management + Power On Password" }

          68 { Write-Output -InputObject "System Management + User HDD and/or User HDD Master Password" }

          69 { Write-Output -InputObject "System Management + Power On + User HDD and/or User HDD Master Password" }

          70 { Write-Output -InputObject "Supervisor + System Management + User HDD and/or User HDD Master Password" }

          71 { Write-Output -InputObject "Supervisor + System Management + Power On + User HDD and/or User HDD Master Password" }
      }
    }
}

# SIG # Begin signature block
