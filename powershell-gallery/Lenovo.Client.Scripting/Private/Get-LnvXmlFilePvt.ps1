<#
  .SYNOPSIS

  .DESCRIPTION

  .PARAMETER Url
  Mandatory: True

  .EXAMPLE

  .INPUTS

  .OUTPUTS

  .NOTES
    1.1.0 Added handling for HTTP error codes
#>


function Get-LnvXmlFilePvt {
  Param(
    [Parameter(Mandatory = $True)]
    [string]$Url
  )

  $xmlFile = $null

  #Retry policy
  $stop = $false
  $retryCount = 0
  $status = $null

  do {
    try {
      [System.XML.XMLDocument]$xmlFile = (New-Object System.Net.WebClient).DownloadString($Url)
      $stop = $true
    }
    catch {
      if ($retrycount -gt 3) {
        $stop = $true
        $status = $_
      }
      else {
        Start-Sleep -Seconds 5
        $retrycount = $retrycount + 1
      }
    }
  }
  While ($stop -eq $false)

  if($null -eq $xmlFile)
  {
    switch -Wildcard ($status)
    {
      "*400*" { throw "$($url): Bad Request (400)" }
      "*401*" { throw "$($url): Unauthorized (401)" }
      "*403*" { throw "$($url): Forbidden (403)" }
      "*404*" { throw "$($url): Not Found (404)" }
      "*407*" { throw "$($url): Proxy Authentication Required (407)" }
      "*408*" { throw "$($url): Request Timeout (408)" }
      "*500*" { throw "$($url): Internal Server Error (500)" }
      "*501*" { throw "$($url): Not Implemented (501)" }
      "*502*" { throw "$($url): Bad Gateway (502)" }
      "*503*" { throw "$($url): Service Unavailable (503)" }
      "*504*" { throw "$($url): Gateway Timeout (504)" }
      default { throw "$($url): Unknown exception `n$status"}
    }
  }

  return $xmlFile
}

# SIG # Begin signature block
