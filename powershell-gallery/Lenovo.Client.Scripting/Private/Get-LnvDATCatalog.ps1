<#
  .SYNOPSIS

  .DESCRIPTION
    Obtains the Driver Automation Tool catalog

  .PARAMETER

  .EXAMPLE

  .INPUTS

  .OUTPUTS

  .NOTES
    Changed in 1.1.0 to use the Get-LnvXmlFilePvt function which
    handles throwing the various HTML error return codes.
#>


function Get-LnvDATCatalog {
    $url = "https://download.lenovo.com/cdrt/td/catalogv2.xml"
    return Get-LnvXmlFilePvt $url
}

# SIG # Begin signature block
