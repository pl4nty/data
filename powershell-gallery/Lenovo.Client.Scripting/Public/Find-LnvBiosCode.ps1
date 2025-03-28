 <#
  .SYNOPSIS
  Find the BIOS code by seaching for model name or machine type

  .DESCRIPTION
  Shows results for search string representing model friendly name or
  machine type. The BIOS code is the first four characters of the BIOS image
  name. It is a useful data point for uniquely targeting a model.

  .PARAMETER ModelName
  Mandatory: True

  .EXAMPLE
  Find-LnvBiosCode -ModelName 'ThinkPad X13 Yoga Gen 4'

  .EXAMPLE
  Find-LnvBiosCode 'ThinkPad X13 Yoga Gen 4'

  .INPUTS

  .OUTPUTS

  .NOTES
  1.1.0 - Switched to using DAT catalog for details

#>
function Find-LnvBiosCode {
    param (
        [parameter(position = 0, Mandatory = $true, helpMessage = "Enter the Model name or Machine Type to search for")]
        [String] $ModelName
    )

    $ModelName = $ModelName.ToLower().Trim()

    try {
        [xml]$catalog = Get-LnvDATCatalog
    }
    catch {
        Write-Output $_
        return
    }

    $nodes = $catalog.ModelList.Model | Where-Object { $_.name.ToLower().Trim().Contains("$ModelName") }
    if($nodes.Count -eq 0)
    {
        Write-Output "$ModelName could not be found"
        return
    }
    foreach ($node in $nodes) {
        Write-Output -InputObject ($node.name + " = " + $node.BIOS.image )
    }

}

# SIG # Begin signature block
