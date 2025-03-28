<#
  .SYNOPSIS

  .DESCRIPTION

  .PARAMETER

  .EXAMPLE

  .INPUTS

  .OUTPUTS

  .NOTES

#>


function Get-LnvTaxonomy {
    $url_1 = "https://download.lenovo.com/luc/taxonomy_ltd.ini"

    try {
        $useragent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36"
        Invoke-WebRequest -URI $url_1 -OutFile taxonomy.txt -UserAgent $useragent -ErrorAction Stop
    }
    catch {
        throw "Could not download the taxonomy file."
    }
    return Get-Content taxonomy.txt
}

# SIG # Begin signature block
