<#
  .SYNOPSIS

  .DESCRIPTION

  .PARAMETER Url
  Mandatory: True

  .PARAMETER DestinationPath
  Mandatory: True

  .PARAMETER ExpectedFileSize
  Mandatory: True

  .PARAMETER UExpectedFileCRC
  Mandatory: True

  .EXAMPLE

  .INPUTS

  .OUTPUTS

  .NOTES
    1.1.0 drops CRC check of txt/html files

#>


function Get-LnvFilePvt {
    Param(
        [Parameter(Mandatory = $True)]
        [string]$Url,
        [Parameter(Mandatory = $True)]
        [string]$DestinationPath,
        [Parameter(Mandatory = $True)]
        [int]$ExpectedFileSize,
        [Parameter(Mandatory = $True)]
        [string]$ExpectedFileCRC
    )

    #Retry policy
    $stop = $false
    $retryCount = 0
    #$status = $null

    do {
        try {
            #(New-Object System.Net.WebClient).DownloadFile($Url, $DestinationPath)
            Start-BitsTransfer -Source $Url -Destination $DestinationPath -ErrorAction Stop
            $stop = $true
        }catch {
            if ($retrycount -gt 3) {
                $stop = $true
                # $status = $_
            }
            else {
                Start-Sleep -Seconds 5
                $retrycount = $retrycount + 1
            }
        }
    }

    While ($stop -eq $false)
 <#
    if(!(Test-Path $DestinationPath)){
        switch -Wildcard ($status)
        {
            "*400*" { throw "$($Url): Bad Request" }
            "*401*" { throw "$($Url): Unauthorized" }
            "*403*" { throw "$($Url): Forbidden" }
            "*404*" { throw "$($Url): Not Found" }
            "*407*" { throw "$($Url): Proxy Authentication Required" }
            "*408*" { throw "$($Url): Request Timeout" }
            "*500*" { throw "$($Url): Internal Server Error" }
            "*501*" { throw "$($Url): Not Implemented" }
            "*502*" { throw "$($Url): Bad Gateway" }
            "*503*" { throw "$($Url): Service Unavailable" }
            "*504*" { throw "$($Url): Gateway Timeout" }
            default { throw "$($Url): Unknown exception"}
        }
    }
#>
    #Return if the file is .txt
    $extension = [IO.Path]::GetExtension($DestinationPath)
    if ($extension -eq ".txt" -or $extension -eq ".html") {
        return $true
    }

    #Check file size and CRC and delete the folder if they are not equal
    $actualFileCRC = $(Get-FileHash -Path $DestinationPath -Algorithm  SHA256).Hash
    $actualFileSize = $(Get-Item -Path $DestinationPath).Length

    if ($actualFileCRC -eq $ExpectedFileCRC -and $ExpectedFileSize -eq $actualFileSize) {
        return $true
    }

    return $false
}

# SIG # Begin signature block
