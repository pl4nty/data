<#
  .SYNOPSIS
  Returns the friendly model name of the specified machine type or BIOS imgage
  code.

  .DESCRIPTION
  This cmdlet returns the friendly model name by searching Machine Type or
  BIOS image code. This is useful in cases where a management portal may
  display the 10 character Machine Type Model(MTM) number and the user needs to
  know the model name of that device. The Machine Type is the first four
  characters of the MTM. The BIOS image code is the first four characters of
  the BIOS build version string.

  .PARAMETER MachineType
  Mandatory: True

  .EXAMPLE
  Find-LnvModel -MachineType '21DD'

  .EXAMPLE
  Find-LnvModel -Bios 'n3qe'

  .EXAMPLE
  Find-LnvModel '21DD'

  .EXAMPLE
  Find-LnvModel 'n3qe'

  .INPUTS

  .OUTPUTS

  .NOTES
  The output will also show the other machine types associated with this model.
#>
function Find-LnvModel
{
  [CmdletBinding(DefaultParameterSetName = 'MT')]
  param (
    [ValidateLength(4, 4)][parameter(position = 0, Mandatory = $true, helpMessage = "Enter the four-character Machine Type to search for", ParameterSetName = "MT")] [String] $MachineType,
    [ValidateLength(4, 4)][parameter(position = 0, Mandatory = $true, helpMessage = "Enter the four-character BIOS Image Name to search for", ParameterSetName = "BIOS")] [String] $Bios
  )

  if (-not[string]::IsNullOrWhiteSpace($MachineType))
  {
    $searchString = $MachineType.ToUpper().Trim()
  }
  elseif (-not[string]::IsNullOrWhiteSpace($Bios))
  {
    $searchString = $Bios.ToUpper().Trim()
  }
  else
  {
    return
  }

  try
  {
    [xml]$catalog = Get-LnvDATCatalog
  }
  catch
  {
    Write-Output $_
    return
  }
  $node = $catalog.ModelList.Model | Where-Object { ($_.Types.Type.Contains("$searchString")) -or ($_.BIOS.image.ToUpper() -eq $("$searchString")) }
  if ($null -eq $node)
  {
    Write-Output "No models were found with $searchString"
    return
  }
  Write-Output -InputObject ($node.name)
}

# SIG # Begin signature block
