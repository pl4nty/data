<#
  .SYNOPSIS

  .DESCRIPTION

  .PARAMETER

  .EXAMPLE

  .INPUTS

  .OUTPUTS

  .NOTES

#>


function Get-LnvDockList {
    $url_1 = "https://download.lenovo.com/cdrt/cv-dm/dm-supported-docks.json"

    try {
        return Invoke-RestMethod -URI $url_1
    }
    catch {
        Write-Output -InputObject "Could not download the dock list."
    }
}

# SIG # Begin signature block
