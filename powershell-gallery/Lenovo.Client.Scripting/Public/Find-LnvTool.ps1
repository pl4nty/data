<#
  .SYNOPSIS
  Returns details about the currently available version of a specified Lenovo tool.

  .DESCRIPTION
  Returns a set of details about the specified Lenovo tool including the URL to
  download the latest version, the version number, and the SHA256 CRC for file.

  .PARAMETER Tool
  Mandatory: True
  Possible values:  DockManager, SystemUpdate, ThinInstaller, UpdateRetriever

  .EXAMPLE
  Find-LnvTool -Tool ThinInstaller

  .EXAMPLE
  Find-LnvTool ThinInstaller

  .EXAMPLE
  $url = (Find-LnvTool -Tool UpdateRetriever).url

  .INPUTS

  .OUTPUTS
  An object consisting of "name", "version", "crc", "url" elements

  .NOTES

#>
function Find-LnvTool {
    param (
        [parameter(position = 0, Mandatory = $true, helpMessage = "Enter the tool name or use tab completion")]
        [ValidateSet("DockManager", "SystemUpdate", "ThinInstaller", "UpdateRetriever")]
        [String] $Tool,
        [Switch] $Url
    )

    try {
        [xml]$catalog = Get-LnvDATCatalog
    }
    catch {
        Write-Output $_
        return
    }

    Switch($Tool)
    {
        'DockManager' { $toolName = "Lenovo Dock Manager" }
        'SystemUpdate' { $toolName = "Lenovo System Update" }
        'ThinInstaller' { $toolName = "Lenovo Thin Installer" }
        'UpdateRetriever' { $toolName = "Lenovo Update Retriever" }
    }

    $node = $catalog.ModelList.ToolList.Tool | Where-Object { $_.name -eq "$toolName" }
    if($null -eq $node)
    {
        Write-Output "$toolName was not found"
    } else {
        if ($Url) {
            return $node.'#text'
        } else {
            return $node
        }
    }
}

# SIG # Begin signature block
