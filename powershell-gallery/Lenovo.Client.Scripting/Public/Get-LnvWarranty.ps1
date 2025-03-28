<#
  .SYNOPSIS
  Get warranty of device

  .DESCRIPTION
  Returns the warranty of the running device

  .PARAMETER

  .EXAMPLE
  Get-LnvWarranty

  .INPUTS

  .OUTPUTS

  .NOTES
#>

function Get-LnvWarranty
{
    $Warranty = Get-CimInstance -Namespace root/Lenovo -ClassName Lenovo_WarrantyInformation

    if ($null -eq $Warranty -or [string]::IsNullOrEmpty($Warranty.EndDate) -or $Warranty.EndDate -eq "null")
    {
        return "Warranty unavailable"
    }
    else
    {
        return $Warranty.EndDate
    }
}
# SIG # Begin signature block
