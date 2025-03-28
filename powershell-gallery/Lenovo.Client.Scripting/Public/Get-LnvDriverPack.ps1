<#
  .SYNOPSIS
  Get an SCCM Driver Pack

  .DESCRIPTION
  This cmdlet will download the SCCM Driver Pack based on the specified machine
  type, OS and OS build version. Tab completion can be used to select the OS
  build version in the correct format. The cmdlet will download the file to the
  env:TEMP folder by default. The path can be set with the -DownloadPath parameter.

  .PARAMETER MachineType
  Mandatory: True
  The four-character Machine Type of the target device

  .PARAMETER WindowsVersion
  Mandatory: True
  Specified as 10 or 11

  .PARAMETER OSBuildVersion
  Mandatory: True
  Four-character OS Build version designator. Can use tab completion. Can specify
  Latest to get the pack for the most recent OS Build Version.

  .PARAMETER DownloadPath
  Mandatory: False
  Path to download pack to.  $env:TEMP folder will be used by default.

  .EXAMPLE
  Get-LnvDriverPack -MachineType 21DD -WindowsVersion win11 -OSBuildVersion 21H2 -DownloadPath 'C:\driverpacks\'

  .INPUTS

  .OUTPUTS

  .NOTES

#>
function Get-LnvDriverPack {
    param (
        [ValidateLength(4,4)]
        [parameter(position = 0, Mandatory = $true, helpMessage = "Enter the four-charcter Machine Type")]
        [String] $MachineType,

        [parameter(position = 1, Mandatory = $true, helpMessage = "Enter the OS as 10 or 11")]
        [ValidateSet("10", "11")]
        [String] $WindowsVersion,

        [parameter(position = 2, Mandatory = $true, helpMessage = "Enter the build version such as 1909 or Latest")]
        [ValidateSet("1709", "1803", "1809", "1903", "1909", "2004", "20H2", "21H1", "21H2", "22H2", "23H2", "24H2", "Latest")]
        [String] $OSBuildVersion,

        [parameter(Mandatory = $false)]
        [string]$DownloadPath
    )

    $WindowsVersion2 = "win" + $WindowsVersion
    $MachineType = $MachineType.ToUpper()
    if ([string]::IsNullOrWhiteSpace($DownloadPath)) {
        $DownloadPath = $env:TEMP
    } else {
        if(-not (Test-Path $DownloadPath -ErrorAction SilentlyContinue)) {
            New-Item -Path $DownloadPath -ItemType Directory
        }
    }

    try {
        [xml]$catalog = Get-LnvDATCatalog
    }
    catch {
        Write-Output $_
        return
    }

    try {
        $node = $catalog.ModelList.Model | Where-Object { $_.Types.Type -eq "$MachineType" }
        if (($OSBuildVersion -eq 'Latest') -and ($node.SCCM.Count -gt 0)) {
            $pack = $node.SCCM[$node.SCCM.Count-1]
        } else {
            $pack = $node.SCCM | Where-Object { (($_.version -eq "$OSBuildVersion") -and ($_.os -eq "$WindowsVersion2")) }
        }

        $url = $pack.'#text'
        if ([string]::IsNullOrWhiteSpace($url)) {
            Write-Output "Driver Pack not available for $($WindowsVersion2) $($OSBuildVersion)"
        }
        else {
            $filename = $url.SubString(($url.LastIndexOf('/')+1))
            $DownloadPath = $DownloadPath + "\" + $filename
            Start-BitsTransfer -Source $url -Destination $DownloadPath -ErrorAction Stop
            Write-Output -InputObject "File downloaded to $DownloadPath"
        }

    }
    catch {
        Write-Output $_
        Write-Output -InputObject "Driver Pack not available for $($WindowsVersion2) $($OSBuildVersion)"
    }
}

# SIG # Begin signature block
