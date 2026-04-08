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

    do {
        try {
            #(New-Object System.Net.WebClient).DownloadFile($Url, $DestinationPath)
            Start-BitsTransfer -Source $Url -Destination $DestinationPath -ErrorAction Stop
            $stop = $true
        }catch {
            if ($retrycount -gt 3) {
                $stop = $true
            }
            else {
                Start-Sleep -Seconds 5
                $retrycount = $retrycount + 1
            }
        }
    }

    While ($stop -eq $false)

    # Guard: if all retries failed and the file was never created, return false immediately.
    if (-not (Test-Path -Path $DestinationPath)) {
        return $false
    }

    #Return if the file is .txt or .html to ignore Readme files from CRC and size check
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
