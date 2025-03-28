<#
  .SYNOPSIS
  Returns the machine type for a specified model

  .DESCRIPTION
  By specifying a search string representing model friendly name, this cmdlet
  will return the possible machine types that match. Most models have more
  than one possible machine type. Providing a more detailed model name to
  search for will help reduce the number of results returned.

  .PARAMETER ModelName
  Mandatory: True

  .EXAMPLE
  $ Find-LnvMachineType -ModelName 'ThinkPad P1 Gen 5'

  .EXAMPLE
  $ Find-LnvMachineType -ModelName 'ThinkPad P1 '

  .INPUTS

  .OUTPUTS

  .NOTES
  A space after the model name such as 'ThinkPad P1 ' will limit the search to
  ThinkPad P1 models and not include ThinkPad P15 or ThinkPad P16 models.
  Likewise, use 'ThinkPad X1 ' to search for ThinkPad X1 Carbon and Yoga models
  and exclude ThinkPad X13 models.
#>
function Find-LnvMachineType {
    param (
        [parameter(position = 0, Mandatory = $true, helpMessage = "Enter the Model name to search for")] [String] $ModelName
    )

    $ModelName = $ModelName.ToLower().TrimStart()

    try {
        [xml]$catalog = Get-LnvDATCatalog
    }
    catch {
        Write-Output $_
        return
    }
    $nodes = $catalog.ModelList.Model | Where-Object { $_.name.ToLower().Trim().Contains("$ModelName") }

    #add a message if 0
    foreach ($node in $nodes) {
        Write-Output -InputObject ($node.name + " = " + $node.Types.Type )
    }

}

# SIG # Begin signature block
