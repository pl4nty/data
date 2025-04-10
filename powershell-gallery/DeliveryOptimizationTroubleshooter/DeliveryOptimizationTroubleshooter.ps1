<#PSScriptInfo

.VERSION 1.2.0

.GUID 9516d007-5e02-4bfd-84a4-436ea6778687

.AUTHOR carmenf

.COMPANYNAME Microsoft Corporation

.COPYRIGHT

.TAGS

.LICENSEURI

.PROJECTURI

.ICONURI

.EXTERNALMODULEDEPENDENCIES

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES
2024-04-04 v1.2.0
    Introduce MCC related checks.
    Reorganize output data.

.PRIVATEDATA

#>

<#
.DESCRIPTION
 Troubleshoot Delivery Optimization by performing device health checks and peer-to-peer configuration of the device. This PowerShell script is officially signed by Microsoft.
#>

<#
    .SYNOPSIS
        Script for:
        - Checking Device, Network, DO, P2P and MCC Settings.

    .PARAMETER HealthCheck
        A Health Checker script that displays settings to help the user to validate if there are any wrong settings in the user device, network, DO.

    .PARAMETER P2P
        Show to user the P2P efficiency of the device, errors found and Policy settings.

    .PARAMETER MCC
        Show MCC settings to allow customers to ensure the Windows device can correctly connect to the CacheHost server on the network, for supported content downloads.

    .EXAMPLE
        To run all script verifications

            DeliveryOptimizationTroubleshooter.ps1

    .EXAMPLE
        To run only Healthcheck

            DeliveryOptimizationTroubleshooter.ps1 -HealthCheck

    .EXAMPLE
        To run only P2P validation

            DeliveryOptimizationTroubleshooter.ps1 -P2P

    .EXAMPLE
        To run only MCC validation

            DeliveryOptimizationTroubleshooter.ps1 -MCC
#>

[CmdLetBinding()]
Param(
    [switch] $HealthCheck,
    [switch] $P2P,
    [switch] $MCC
)

#----------------------------------------------------------------------------------#
# Enums
Add-Type -TypeDefinition @"
    public enum TestResult
    {
        Unset,
        Fail,
        Pass,
        Disabled,
        Warn,
    }
"@

Add-Type -TypeDefinition @"
    public enum CacheHostSource
    {
        DisableDNSSD       = 0,
        DHCPOption235      = 1,
        DHCPOption235Force = 2,
    }
"@

enum DhcpOption
{
    DOGroupId  = 234
    DOMccHost  = 235
}

#----------------------------------------------------------------------------------#
# Get Custom Objects
function Get-DOErrorsTable(){
    $errorsObj = @'
[
    {
        "ErrorCode": "0x80D01001",
        "Description": "Delivery Optimization was unable to provide the service."
    },
    {
        "ErrorCode": "0x80D02002",
        "Description": "Download of a file saw no progress within the defined period."
    },
    {
        "ErrorCode": "0x80D02003",
        "Description": "Job was not found."
    },
    {
        "ErrorCode": "0x80D02004",
        "Description": "There were no files in the job."
    },
    {
        "ErrorCode": "0x80D02005",
        "Description": "No downloads currently exist."
    },
    {
        "ErrorCode": "0x80D0200B",
        "Description": "Memory stream transfer is not supported."
    },
    {
        "ErrorCode": "0x80D0200C",
        "Description": "Job has neither completed nor has it been cancelled prior to reaching the max age threshold."
    },
    {
        "ErrorCode": "0x80D0200D",
        "Description": "There is no local file path specified for this download."
    },
    {
        "ErrorCode": "0x80D02010",
        "Description": "No file is available because no URL generated an error."
    },
    {
        "ErrorCode": "0x80D02011",
        "Description": "SetProperty() or GetProperty() called with an unknown property ID."
    },
    {
        "ErrorCode": "0x80D02012",
        "Description": "Unable to call SetProperty() on a read-only property."
    },
    {
        "ErrorCode": "0x80D02013",
        "Description": "The requested action is not allowed in the current job state."
    },
    {
        "ErrorCode": "0x80D02015",
        "Description": "Unable to call GetProperty() on a write-only property."
    },
    {
        "ErrorCode": "0x80D02016",
        "Description": "Download job is marked as requiring integrity checking but integrity checking info was not specified."
    },
    {
        "ErrorCode": "0x80D02017",
        "Description": "Download job is marked as requiring integrity checking but integrity checking info could not be retrieved."
    },
    {
        "ErrorCode": "0x80D02018",
        "Description": "Unable to start a download because no download sink (either local file or stream interface) was specified."
    },
    {
        "ErrorCode": "0x80D02019",
        "Description": "An attempt to set a download sink failed because another type of sink is already set."
    },
    {
        "ErrorCode": "0x80D0201A",
        "Description": "Unable to determine file size from HTTP 200 status code."
    },
    {
        "ErrorCode": "0x80D0201B",
        "Description": "Decryption key was provided but file on CDN does not appear to be encrypted."
    },
    {
        "ErrorCode": "0x80D0201C",
        "Description": "Unable to determine file size from HTTP 206 status code."
    },
    {
        "ErrorCode": "0x80D0201D",
        "Description": "Unable to determine file size from an unexpected HTTP 2xx status code."
    },
    {
        "ErrorCode": "0x80D0201E",
        "Description": "User consent to access the network is required to proceed."
    },
    {
        "ErrorCode": "0x80D02200",
        "Description": "The download was started without providing a URI."
    },
    {
        "ErrorCode": "0x80D02201",
        "Description": "The download was started without providing a content ID."
    },
    {
        "ErrorCode": "0x80D02202",
        "Description": "The specified content ID is invalid."
    },
    {
        "ErrorCode": "0x80D02203",
        "Description": "Ranges are unexpected for the current download."
    },
    {
        "ErrorCode": "0x80D02204",
        "Description": "Ranges are expected for the current download."
    },
    {
        "ErrorCode": "0x80D03001",
        "Description": "Download job not allowed due to participation throttling."
    },
    {
        "ErrorCode": "0x80D03002",
        "Description": "Download job not allowed due to user/admin settings."
    },
    {
        "ErrorCode": "0x80D03801",
        "Description": "DO core paused the job due to cost policy restrictions."
    },
    {
        "ErrorCode": "0x80D03802",
        "Description": "DO job download mode restricted by content policy."
    },
    {
        "ErrorCode": "0x80D03803",
        "Description": "DO core paused the job due to detection of cellular network and policy restrictions."
    },
    {
        "ErrorCode": "0x80D03804",
        "Description": "DO core paused the job due to detection of power state change into non-AC mode.",
        "RelatedPolicyName": "DOMinBatteryPercentageAllowedToUpload",
        "SuggestedRemedy": "Please check your Battery level is enough to P2P."
    },
    {
        "ErrorCode": "0x80D03805",
        "Description": "DO core paused the job due to loss of network connectivity."
    },
    {
        "ErrorCode": "0x80D03806",
        "Description": "DO job download mode restricted by policy."
    },
    {
        "ErrorCode": "0x80D03807",
        "Description": "DO core paused the completed job due to detection of VPN network.",
        "RelatedPolicyName": "DOAllowVPNPeerCaching",
        "SuggestedRemedy": "Check you are connected to any VPN when you are doing P2P."
    },
    {
        "ErrorCode": "0x80D03808",
        "Description": "DO core paused the completed job due to detection of critical memory usage on the system."
    },
    {
        "ErrorCode": "0x80D03809",
        "Description": "DO job download mode restricted due to absence of the cache folder."
    },
    {
        "ErrorCode": "0x80D0380A",
        "Description": "Unable to contact one or more DO cloud services."
    },
    {
        "ErrorCode": "0x80D0380B",
        "Description": "DO job download mode restricted for unregistered caller."
    },
    {
        "ErrorCode": "0x80D0380C",
        "Description": "DO job is using the simple ranges download in simple mode."
    },
    {
        "ErrorCode": "0x80D0380D",
        "Description": "DO job paused due to unexpected HTTP response codes (e.g. 204)."
    },
    {
        "ErrorCode": "0x80D05001",
        "Description": "HTTP server returned a response with data size not equal to what was requested."
    },
    {
        "ErrorCode": "0x80D05002",
        "Description": "The Http server certificate validation has failed."
    },
    {
        "ErrorCode": "0x80D05010",
        "Description": "The specified byte range is invalid."
    },
    {
        "ErrorCode": "0x80D05011",
        "Description": "The server does not support the necessary HTTP protocol. Delivery Optimization (DO) requires that the server support the Range protocol header."
    },
    {
        "ErrorCode": "0x80D05012",
        "Description": "The list of byte ranges contains some overlapping ranges, which are not supported."
    },
    {
        "ErrorCode": "0x80D06800",
        "Description": "Too many bad pieces found during upload."
    },
    {
        "ErrorCode": "0x80D06802",
        "Description": "Fatal error encountered in core."
    },
    {
        "ErrorCode": "0x80D06803",
        "Description": "Services response was an empty JSON content."
    },
    {
        "ErrorCode": "0x80D06804",
        "Description": "Received bad or incomplete data for a content piece."
    },
    {
        "ErrorCode": "0x80D06805",
        "Description": "Content piece hash check failed."
    },
    {
        "ErrorCode": "0x80D06806",
        "Description": "Content piece hash check failed but source is not banned yet."
    },
    {
        "ErrorCode": "0x80D06807",
        "Description": "The piece was rejected because it already exists in the cache."
    },
    {
        "ErrorCode": "0x80D06808",
        "Description": "The piece requested is no longer available in the cache."
    },
    {
        "ErrorCode": "0x80D06809",
        "Description": "Invalid metainfo content."
    },
    {
        "ErrorCode": "0x80D0680A",
        "Description": "Invalid metainfo version."
    },
    {
        "ErrorCode": "0x80D0680B",
        "Description": "The swarm isn't running."
    },
    {
        "ErrorCode": "0x80D0680C",
        "Description": "The peer was not recognized by the connection manager."
    },
    {
        "ErrorCode": "0x80D0680D",
        "Description": "The peer is banned."
    },
    {
        "ErrorCode": "0x80D0680E",
        "Description": "The client is trying to connect to itself."
    },
    {
        "ErrorCode": "0x80D0680F",
        "Description": "The socket or peer is already connected."
    },
    {
        "ErrorCode": "0x80D06810",
        "Description": "The maximum number of connections has been reached."
    },
    {
        "ErrorCode": "0x80D06811",
        "Description": "The connection was lost."
    },
    {
        "ErrorCode": "0x80D06812",
        "Description": "The swarm ID is not recognized."
    },
    {
        "ErrorCode": "0x80D06813",
        "Description": "The handshake length is invalid."
    },
    {
        "ErrorCode": "0x80D06814",
        "Description": "The socket has been closed."
    },
    {
        "ErrorCode": "0x80D06815",
        "Description": "The message is too long."
    },
    {
        "ErrorCode": "0x80D06816",
        "Description": "The message is invalid."
    },
    {
        "ErrorCode": "0x80D06817",
        "Description": "The peer is an upload."
    },
    {
        "ErrorCode": "0x80D06818",
        "Description": "Cannot pin a swarm because it's not in peering mode."
    },
    {
        "ErrorCode": "0x80D06819",
        "Description": "Cannot delete a pinned swarm without using the 'force' flag."
    }
]
'@ | ConvertFrom-Json

    foreach ($obj in $errorsObj)
    {
        $intValue = [Convert]::ToInt32($obj.ErrorCode, 16)
        $obj.ErrorCode = $intValue
    }

    return $errorsObj
}

function Get-DOPolicyTable(){
    $linkBase = "https://learn.microsoft.com/windows/deployment/do/waas-delivery-optimization-reference"

@"
    [
        {
            "PolicyCode": "DODownloadMode",
            "PolicyName": "Download Mode Configured",
            "Description": "The download method that DO can use in downloads.",
            "Link": "$linkBase#download-mode"
        },
        {
            "PolicyCode": "DOGroupId",
            "PolicyName": "Group ID",
            "Description": "Unique GUID group id to create a custom group.",
            "Link": "$linkBase#group-id"
        },
        {
            "PolicyCode": "DOGroupIdSource",
            "PolicyName": "Group ID Source",
            "Description": "Restrict peer selection to a specific source.",
            "Link": "$linkBase#select-the-source-of-group-ids"
        },
        {
            "PolicyCode": "DORestrictPeerSelectionBy",
            "PolicyName": "Restrict Peer Selection",
            "Description": "Restriction to set peering boundary.",
            "Link": "$linkBase#select-a-method-to-restrict-peer-selection"
        },
        {
            "PolicyCode": "DODelayForegroundDownloadFromHttp",
            "PolicyName": "Delay Foreground from Http",
            "Description": "Control the time to wait for peering (foreground).",
            "Link": "$linkBase#delay-foreground-download-from-http-in-secs"
        },
        {
            "PolicyCode": "DODelayBackgroundDownloadFromHttp",
            "PolicyName": "Delay Background from Http",
            "Description": "Control the time to wait for peering (background).",
            "Link": "$linkBase#delay-background-download-from-http-in-secs"
        },
        {
            "PolicyCode": "DOAllowVPNPeerCaching",
            "PolicyName": "Enable Peering on VPN",
            "Description": "Allow device to use peering while connected to a VPN.",
            "Link": "$linkBase#enable-peer-caching-while-the-device-connects-via-vpn"
        },
        {
            "PolicyCode": "DOMaxCacheAge",
            "PolicyName": "Max Cache Age",
            "PolicyUnit": "(secs)",
            "Description": "Max number of seconds a file can be held in DO cache.",
            "Link": "$linkBase#max-cache-age"
        },
        {
            "PolicyCode": "DOMaxCacheSize",
            "PolicyName": "Max Cache Size",
            "PolicyUnit": "%",
            "Description": "Percentage of available disk drive space allowed​.",
            "Link": "$linkBase#max-cache-size"
        },
        {
            "PolicyCode": "DOAbsoluteMaxCacheSize",
            "PolicyName": "Absolute Max Cache Size",
            "PolicyUnit": "GB",
            "Description": "Max number of gigabytes the DO cache can use.",
            "Link": "$linkBase#absolute-max-cache-size"
        },
        {
            "PolicyCode": "DOMinBatteryPercentageAllowedToUpload",
            "PolicyName": "Allow P2P on Battery",
            "PolicyUnit": "%",
            "Description": "Specifies battery level to allow upload data.",
            "Link": "$linkBase#allow-uploads-while-the-device-is-on-battery-while-under-set-battery-level"
        },
        {
            "PolicyCode": "DOMinDiskSizeAllowedToPeer",
            "PolicyName": "Minimum Free Disk Size",
            "PolicyUnit": "GB",
            "Description": "Required minimum disk size to allow peer caching.",
            "Link": "$linkBase#minimum-disk-size-allowed-to-use-peer-caching"
        },
        {
            "PolicyCode": "DOMinFileSizeToCache",
            "PolicyName": "Minimum Peer File Size",
            "PolicyUnit": "MB",
            "Description": "Minimum content file size to use peer caching.",
            "Link": "$linkBase#minimum-peer-caching-content-file-size"
        },
        {
            "PolicyCode": "DOMinRAMAllowedToPeer",
            "PolicyName": "Minimum RAM size",
            "PolicyUnit": "GB",
            "Description": "Minimum RAM size to use peer caching.",
            "Link": "$linkBase#minimum-ram-inclusive-allowed-to-use-peer-caching"
        },
        {
            "PolicyCode": "DOMinBackgroundQoS",
            "PolicyName": "Minimum Background QoS",
            "PolicyUnit": "KB/s",
            "Description": "Specifies the minimum download speed guarantee.",
            "Link": "$linkBase#minimum-background-qos"
        }
    ]
"@ | ConvertFrom-Json

}

#----------------------------------------------------------------------------------#
# Print Functions
function Print-OSInfo()
{
    # Check OS Version
    Write-Host "`nWindows" $(Get-OSVersion) -NoNewline

    switch ($os.BuildNumber)
    {
        "10240" { Write-Host " - TH1" }
        "10586" { Write-Host " - TH2" }
        "14393" { Write-Host " - RS1" }
        "15063" { Write-Host " - RS2" }
        "16299" { Write-Host " - RS3" }
        "17134" { Write-Host " - RS4" }
        "17763" { Write-Host " - RS5" }
        "18362" { Write-Host " - Titanium 19H1" }
        "18363" { Write-Host " - Vanadium 19H2" }
        "19041" { Write-Host " - Vibranium 20H1" }
        "19042" { Write-Host " - Vibranium (v2) 20H2" }
        "19645" { Write-Host " - Manganese" }
        "19043" { Write-Host " - Vibranium (v3) 21H1" }
        "19044" { Write-Host " - Vibranium (v4) 21H2" }
        "20348" { Write-Host " - Iron" }
        "22000" { Write-Host " - Cobalt" }
        "22621" { Write-Host " - Nickel" }
        default { Write-Host "" }
    }

    # Check UUS Version
    $uusVerPath = "$env:ProgramData\Microsoft\Windows\UUS\State\_active.uusver"
    if (Test-Path $uusVerPath)
    {
        $uusVersion = Get-Content $uusVerPath
        Write-Host "UUS" $uusVersion
    }

    $PSVersion = "PS Version $($PSVersionTable.PSVersion)"
    Write-Verbose $PSVersion
}

function Print-Title([string] $TextTitle)
{
    Write-Host ("{0}`n{1}`n{0}" -f ('-' * 80), $TextTitle.ToUpper())
}

function Print-SubTitle([string] $TextSubTitle)
{
    Write-Host ("--> {0}:`n{1}" -f $TextSubTitle, ('-' * 55))
}

function Format-ResultObject([pscustomobject] $Object)
{
    $Object | Format-Table -Wrap -Property  @{ Label = "Name"; Expression={ $_.Name }; Align='left'; Width = 30; },
                                            @{ Label = "Result"; Expression={ switch ($_.Result)
                                                                                {
                                                                                    "Fail" { $color = "91"; break }
                                                                                    "Pass" { $color = "92"; break }
                                                                                    "Warn" { $color = "93"; break }
                                                                                    "Disabled" { $color = "93"; break }
                                                                                    default { $color = "37" }
                                                                                }
                                                                                $text = $_.Result.ToString().ToUpper()
                                                                                ; $e = [char]27
                                                                                ;"$e[${color}m$($text)${e}[0m"
                                                                            }; Align='center'; Width = 10;},
                                            @{ Label = "Details"; Expression={ "$($_.Details) `n" }; Align='left'; }
}

#----------------------------------------------------------------------------------#
# Device Check

function Check-AdminPrivileges([string] $InvocationLine)
{
    if (IsElevated)
    {
        return $true;
    }

    $ScriptPath = $MyInvocation.PSCommandPath

    # The new process can't resolve working dir when script is launched like .\dolog.ps1, so we have to parse
    # and rebuild the full script path and param list.
    $scriptParams = ""
    $firstParam = $InvocationLine.IndexOf('-')

    if($firstParam -gt 0)
    {
        $scriptParams = $InvocationLine.Substring($firstParam-1)
    }

    $scriptCmd = "$ScriptPath $scriptParams"

    $arg = "-NoExit -Command `"$scriptCmd`""

    #Check Powershell version to use the right path
    if ($PSVersionTable.PSVersion.Major -lt 7)
    {
        $PSPath = "powershell.exe"
    }
    else
    {
        $PSPath = "pwsh.exe"
    }

    $proc = Start-Process $PSPath -ArgumentList $arg -Verb Runas -ErrorAction Stop

    return $false
}

function IsElevated
{
    $wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $prp = new-object System.Security.Principal.WindowsPrincipal($wid)
    $adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
    $isElevated = $prp.IsInRole($adm)
    return $isElevated
}

function Check-NetInterface()
{
    $outputName = "Network Interface"
    $result = [TestResult]::Unset
    $description = " "

    try
    {
        $query = "SELECT * FROM Win32_NetworkAdapter WHERE NOT PNPDeviceID LIKE 'ROOT\\%'"
        $interfaces = Get-WmiObject -Query $query | Sort index
        $networkInterface = @()

        #Save in a string all the interfaces found
        foreach ($interface in $interfaces)
        {
            $name = $interface.NetConnectionID
            $description = $interface.Name

            if ($name)
            {
               $networkInterface += "($name) $description "
            }
        }

        if ($networkInterface)
        {
            $result = [TestResult]::Pass
            $description = $networkInterface -join " - "
        }
        else
        {
            $result = [TestResult]::Fail
            $description = "No network"
        }

        [pscustomobject] @{ Name = $outputName; Result = $result; Details = $description }
    }
    catch
    {
        [pscustomobject] @{ Name = $outputName; Result = $null; Details = $_.Exception }
    }
}

function Check-CacheFolder()
{
    $outputName = "Cache Folder Access"
    $result = [TestResult]::Unset
    $description = ""

    try
    {
        $dosvcWorkingDir = $doConfig.WorkingDirectory
        if (!(Test-Path $dosvcWorkingDir)) { throw "Cache folder not found: $dosvcWorkingDir" }

        $acl = Get-Acl $dosvcWorkingDir

        $IdentityReferenceDO = "NT SERVICE\DoSvc"
        $IdentityReferenceNS = "NT AUTHORITY\NETWORK SERVICE"
        $inheritanceFlags = [System.Security.AccessControl.InheritanceFlags]::ContainerInherit -bor ([System.Security.AccessControl.InheritanceFlags]::ObjectInherit)

        # Filter to DO/NS permissions
        $permissionEntries = $acl.Access | where { @($IdentityReferenceDO, $IdentityReferenceNS) -contains $_.IdentityReference.Value }
        # This might be interesting here: Write-Verbose $permissionEntries

        # Look for Allow/FullControl/Full inheritance
        $permissionEntries = $permissionEntries | where { ($_.AccessControlType -eq "Allow") -and ($_.FileSystemRights -eq "FullControl") -and ($_.InheritanceFlags -eq $inheritanceFlags) }

        if ($permissionEntries)
        {
            $result = [TestResult]::Pass
        }
        else
        {
            $description = "Required permissions missing"
            $result = [TestResult]::Fail
        }

        [pscustomobject] @{ Name = $outputName; Result = $result; Details = $description }
    }
    catch
    {
        [pscustomobject] @{ Name = $outputName; Result = $null; Details = $_.Exception }
    }
}

function Check-Service([string] $ServiceName)
{
    $outputName = "Service Status"
    $result = [TestResult]::Unset
    $description = ""

    try
    {
        $service = Get-Service -Name $ServiceName
        if ($service -and ($service.StartType -ne "Disabled"))
        {
            if ($service.Status -eq "Running")
            {
                $description = "$ServiceName running"
                $result = [TestResult]::Pass
            }
            else
            {
                $description = "$ServiceName stopped"
                $result = [TestResult]::Warn
            }
        }
        else
        {
            $description = "$ServiceName disabled"
            $result = [TestResult]::Fail
        }

        [pscustomobject] @{ Name = $outputName; Result = $result; Details = $description }
    }
    catch
    {
        [pscustomobject] @{ Name = $outputName; Result = $null; Details = $_.Exception }
    }
}

function Check-KeyAccess()
{
    $outputName = "Registry Key Access"
    $result = [TestResult]::Unset
    $description = ""

    try
    {
        Remove-PSDrive HKU -ErrorAction SilentlyContinue

        $drive = New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS
        $testPath = Test-Path -Path HKU:\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization
        if (!$testPath) { throw "Registry Key not found" }
        # TODO: Check permissions on key

        # $doConfig.WorkingDirectory is the cache path, which may be redirected elsewhere. The state directory doesn't follow that redirection.
        $path = "$env:windir\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\State\dosvcState.dat"

        $testPath = Test-Path -Path $path -PathType Leaf
        if (!$testPath)
        {
            $description = "Registry file not found"
            $result = [TestResult]::Fail
        }
        else
        {
            # TODO: Check permissions on file
            $result = [TestResult]::Pass
        }

        [pscustomobject] @{ Name = $outputName; Result = $result; Details = $description }
    }
    catch
    {
        [pscustomobject] @{ Name = $outputName; Result = $null; Details = $_.Exception }
    }
    finally
    {
        Remove-PSDrive HKU -ErrorAction SilentlyContinue
    }
}

function Check-RAMRequired()
{
    $outputName = "RAM"
    $result = [TestResult]::Unset
    $description = ""

    try
    {
        $totalRAM = (Get-WmiObject Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum | Select-Object -ExpandProperty Sum)/1GB

        if ($totalRAM -ge $doConfig.MinTotalRAM)
        {
            $description = "$totalRAM GB"
            $result = [TestResult]::Pass
        }
        else
        {
            $description = "Local RAM: $totalRAM GB | RAM Requirements: $($doConfig.MinTotalRAM) GB."
            $result = [TestResult]::Fail
        }

        [pscustomobject] @{ Name = $outputName; Result = $result; Details = $description }
    }
    catch
    {
        [pscustomobject] @{ Name = $outputName; Result = $null; Details = $_.Exception }
    }
}

function Check-DiskRequired()
{
    $outputName = "Disk"
    $result = [TestResult]::Unset
    $description = ""

    try
    {
        $diskSize = Get-WmiObject -Class win32_logicaldisk | Where-Object DeviceId -eq $env:SystemDrive | Select-Object @{N='Disk'; E={$_.DeviceId}}, @{N='Size'; E={[math]::Round($_.Size/1GB,2)}}, @{N='FreeSpace'; E={[math]::Round($_.FreeSpace/1GB,2)}}

        if ($diskSize.FreeSpace -ge $doConfig.MinTotalDiskSize)
        {
            $result = [TestResult]::Pass
            $description = "$($diskSize.Disk) | Total Size: $($diskSize.Size)GB | Free Space: $($diskSize.FreeSpace)GB"
        }
        else
        {
            $result = [TestResult]::Fail
            $description = "Free Space Requirements: $($doConfig.MinTotalDiskSize)GB. | Local Free Space: $($diskSize.FreeSpace)GB"
        }

        [pscustomobject] @{ Name = $outputName; Result = $result; Details = $description }
    }
    catch
    {
        [pscustomobject] @{ Name = $outputName; Result = $null; Details = $_.Exception }
    }
}

function Check-Vpn()
{
    $outputName = "VPN"
    $result = [TestResult]::Unset
    $description = ""

    try
    {
        $vpn = Get-VpnConnection
        if (!$vpn)
        {
            $result = [TestResult]::Pass
        }
        else
        {
            $activeVPN = $vpn | Where-Object ConnectionStatus -eq "Connected"  | Select-Object -ExpandProperty Name
            if ($activeVPN)
            {
                $result = [TestResult]::Warn
                $description = "Connected: $activeVPN"
            }
            else
            {
                $AllVPN = (($vpn | Select-Object -ExpandProperty Name) -join " - ")
                $result = [TestResult]::Pass
                $description = "Not connected: $AllVPN"
            }
        }

        [pscustomobject] @{ Name = $outputName; Result = $result; Details = $description }
    }
    catch
    {
        [pscustomobject] @{ Name = $outputName; Result = $null; Details = $_.Exception }
    }
}

function Check-PowerBattery()
{
    $outputName = "Power"
    $result = [TestResult]::Unset
    $description = ""

    try
    {
        $battery = Get-WmiObject -Class win32_battery

        #PC:
        if (!$battery)
        {
            $result = [TestResult]::Pass
            $plan = Get-WmiObject -Class win32_powerplan -Namespace "root\cimv2\power" | Where-Object IsActive -eq true | Select-Object -ExpandProperty ElementName
            $description = "A/C: $plan"
        }
        #Notebook:
        else
        {
            $batteryPercentage = $battery.EstimatedChargeRemaining
            $batteryStatus = Get-WmiObject -Class BatteryStatus -Namespace root\wmi -ComputerName "localhost" -ErrorAction SilentlyContinue -ErrorVariable ProcessError

            if ($ProcessError)
            {
                $result = [TestResult]::Fail
                $description = "WMI Error ( Check https://learn.microsoft.com/en-us/previous-versions/tn-archive/ff406382(v=msdn.10) ) | Error: $($ProcessError.Exception)"
            }
            elseif ($batteryStatus.PowerOnline)
            {
                $result = [TestResult]::Pass
                $description = "A/C: $batteryPercentage% (charging)"
            }
            else
            {
                $batteryLevelForSeeding = $doConfig.BatteryPctToSeed
                if ($batteryPercentage -ge $batteryLevelForSeeding)
                {
                    $result = [TestResult]::Pass
                }
                else
                {
                    $result = [TestResult]::Fail
                }
                $description = "Battery: $batteryPercentage% ($batteryLevelForSeeding% required to upload)"
            }
        }

        [pscustomobject] @{ Name = $outputName; Result = $result; Details = $description }
    }
    catch
    {
        [pscustomobject] @{ Name = $outputName; Result = $null; Details = $_.Exception }
    }
}

#----------------------------------------------------------------------------------#
# Connection Check

function Test-Port([int] $Port, [switch] $Optional)
{
    $outputName = "Check Port"
    $oldPreference = $Global:ProgressPreference
    $result = [TestResult]::Unset
    $description = "$Port"

    try
    {
        $Global:ProgressPreference = 'SilentlyContinue'
        $resultTest = Test-NetConnection -Computer localhost -Port $Port -WarningAction SilentlyContinue -InformationLevel 'Quiet'

        if ($resultTest)
        {
            $result = [TestResult]::Pass
        }
        else
        {
            if ($Optional -or ((Check-DownloadMode).Result -ne [TestResult]::Pass))
            {
                $result = [TestResult]::Warn
            }
            else
            {
                $result = [TestResult]::Fail
            }
        }

        [pscustomobject] @{ Name = $outputName; Result = $result; Details = $description }
    }
    catch
    {
        [pscustomobject] @{ Name = $outputName; Result = $null; Details = $_.Exception }
    }
    finally
    {
        $Global:ProgressPreference = $oldPreference
    }
}

function Check-DownloadMode()
{
    $outputName = "Download Mode"
    $result = [TestResult]::Fail
    $downloadMode = $doConfig.DownloadMode

    if (@("Lan", "Group", "Internet") -contains $downloadMode)
    {
        $result = [TestResult]::Pass
    }

    [pscustomobject] @{ Name = $outputName; Result = $result; Details = $downloadMode }
}

function Test-Hostname([string] $HostName)
{
    $outputName = "Host Connection"
    $description = $HostName
    $result = [TestResult]::Unset

    try
    {
        $dnsHostnames = Resolve-DnsName $HostName | Select-Object -Unique -Property NameHost | % {[string]$_.NameHost}
        $dnsHostnames = $dnsHostnames | Where {!$_.Equals("")}

        $result = [TestResult]::Fail

        # Check if the list of hostnames is empty
        if ($dnsHostnames -eq $null)
        {
            $description = "Failed to resolve DNS: $HostName"
        }
        else
        {
            foreach($dnsHostname in $dnsHostnames)
            {
                $test = Test-NetConnection $dnsHostname -Port 80 -WarningAction SilentlyContinue
                if ($test.TcpTestSucceeded)
                {
                    $result = [TestResult]::Pass
                    break
                }
            }
        }

        [pscustomobject] @{ Name = $outputName; Result = $result; Details = $description }
    }
    catch
    {
        [pscustomobject] @{ Name = $outputName; Result = $null; Details = $_.Exception }
    }
}

function Get-GeoResponse()
{
    $url = "https://geo.prod.do.dsp.mp.microsoft.com/geo?doClientVersion=$((Get-OSVersion).ToString())"
    $contentType = $null
    $statusCode = 0
    $details = $null
    $success = $false

    try
    {
        $httpResponse = Get-WebRequestData $url

        Write-Verbose $httpResponse.RawContent

        $contentType = $httpResponse.Headers["Content-Type"]
        $statusCode = $httpResponse.StatusCode

        if (($statusCode -eq 200) -and ($contentType -eq "text/json"))
        {
            $details = ConvertFrom-Json $httpResponse.Content
            $success = $true
        }
        else
        {
            $details = $httpResponse.Content
        }
    }
    catch [System.Net.WebException]
    {
        $details = "Unable to reach DO's GEO service. Exception: $($_.Exception.Message)"
    }
    catch
    {
        $details = "HR: $($_.Exception.HResult) - $($_.Exception.Message)"
    }

    [pscustomobject] @{ StatusCode = $statusCode; Type = $contentType; Details = $details; Success = $success}
}

function Test-InternetInfo()
{
    $resultInt = [TestResult]::Fail
    $outputNameInt = "Internet Access"
    $msgInt = ""

    $resultIp = [TestResult]::Fail
    $outputNameIp = "External IP"
    $msgIp = "Unable to get External IP in Geo Response!"

    $testResults = @()
    $geoResponse = Get-GeoResponse

    if (($geoResponse.StatusCode -eq 0) -or ($geoResponse.Type -eq $null) )
    {
        $msgInt = $geoResponse.Details
    }
    elseif ($geoResponse.StatusCode -ne 200)
    {
        $msgInt = "Unable to reach DO's GEO service. Status Code: $($httpResponse.StatusCode) - $($httpResponse.StatusDescription)"
    }
    elseif ($geoResponse.Type -eq "text/html")
    {
        $resultInt = [TestResult]::Warn
        $msgInt = "Possible captive portal detected!"
    }
    elseif ($geoResponse.Type -ne "text/json")
    {
        $msgInt = "Unexpected Content-Type in GEO response: '$contentType'"
    }
    elseif ([string]::IsNullOrEmpty($geoResponse.Details.Version) -or [string]::IsNullOrEmpty($geoResponse.Details.KeyValue_EndpointFullUri))
    {
        $msgInt = "Invalid GEO response: $($geoResponse.Details)"
    }
    elseif ([string]::IsNullOrEmpty($geoResponse.Details.ExternalIpAddress) -or ($geoResponse.Details.ExternalIpAddress -eq "0.0.0.0"))
    {
        $msgInt = "Invalid GEO response!"
        $msgIp = " Invalid External IP in Geo Response! IP: $($geoResponse.Details.ExternalIpAddress)"
    }
    else
    {
        $resultInt = [TestResult]::Pass
        $resultIp  = [TestResult]::Pass

        $msgIp = $geoResponse.Details.ExternalIpAddress
    }

    $testResults += [pscustomobject] @{ Name = $outputNameInt; Result = $resultInt; Details = $msgInt; Connection = ($resultInt -eq [TestResult]::Pass) }
    $testResults += [pscustomobject] @{ Name = $outputNameIp;  Result = $resultIp;  Details = $msgIp }

    return $testResults
}

function Check-ByteRange()
{
    $outputName = "HTTP Byte-Range Support"
    $result = [TestResult]::Unset
    $description = ""

    try
    {
        $uri = "http://dl.delivery.mp.microsoft.com/filestreamingservice/files/52fa8751-747d-479d-8f22-e32730cc0eb1"
        $request = [System.Net.WebRequest]::Create($uri)

        # Set request
        $request.Method = "GET"
        $request.AddRange("bytes", 0, 9)

        $return = $request.GetResponse()
        $statusCode = [int]$return.StatusCode
        $contentRange = $return.GetResponseHeader("Content-Range")
        $description = "$statusCode - $($return.StatusCode) , Content-Range: $contentRange"

        if(($statusCode -eq 206) -and ($contentRange -eq "bytes 0-9/25006511"))
        {
            $result = [TestResult]::Pass
        }
        else
        {
            $result = [TestResult]::Fail
        }

        Write-Verbose $return.Headers.ToString()
        [pscustomobject] @{ Name = $outputName; Result = $result; Details = $description }
    }
    catch
    {
        [pscustomobject] @{ Name = $outputName; Result = $null; Details = $_.Exception }
    }

}

#----------------------------------------------------------------------------------#
# P2P Check
function Import-Winrt()
{
    $Module = "BurntToast"
    Write-Progress -Activity "Importing WinRT" -Status "Checking Powershell Version" -PercentComplete 0

    # Adding this Start-Sleep to Write-Progress works in Powershell 7
    if ($PSVersionTable.PSVersion.Major -gt 6)
    {
        Start-Sleep -Seconds 1
    }

    Write-Progress -Activity "Importing WinRT" -Status "Load WinRT" -PercentComplete 50
    try
    {
        if ($PSVersionTable.PSVersion.Major -lt 6)
        {
            $null = [Windows.Management.Policies.NamedPolicy,Windows.Management.Policies,ContentType=WindowsRuntime]
        }
        else
        {
            $burntToastIsInstalled = Check-ModuleIsInstalled $Module
            if (-not $burntToastIsInstalled)
            {
                throw "Unable to find $Module installation!"
            }

            $path = (Get-Item (Get-Module -ListAvailable $Module).Path).DirectoryName
            $path = $path + "\lib\Microsoft.Windows.SDK.NET\"
            if (-not (Test-Path -Path $path))
            {
                throw "BurntToast path doesn't exists: $path"
            }

            $dllsPath = Get-ChildItem -Path $path -Filter *.dll -Recurse | %{$_.FullName}
            if (-not $dllsPath)
            {
                throw [System.IO.FileNotFoundException] "Dlls not found in $path"
            }

            Add-Type -AssemblyName $dllsPath
        }
    }
    catch
    {
        Write-Error $_.Exception
    }

    Write-Progress -Activity "Importing WinRT" -Status "Finish WinRT Check" -Completed
}

function Load-Module ([string] $Module)
{
    try
    {
        $oldProgressPreference = $Global:ProgressPreference
        $Global:ProgressPreference = "SilentlyContinue"

        $null = Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
        Install-Module -Name $Module -WarningAction SilentlyContinue -Scope CurrentUser
    }
    catch
    {
        Write-Error $_.Exception
    }
    finally
    {
        if ($oldProgressPreference)
        {
            $Global:ProgressPreference = $oldProgressPreference
        }
    }
}

function Get-PolicyData([string] $PolicyCode)
{
    $return = [string]::Empty
    $description = [string]::Empty
    $fail = $false

    try
    {
        $policy = [Windows.Management.Policies.NamedPolicy]::GetPolicyFromPath("DeliveryOptimization", $PolicyCode)

        if ($policy.IsManaged)
        {
            $description = "Policy set."
            switch ($policy.Kind.ToString())
            {
                "Int32" { $return = $policy.GetInt32().ToString() }
                "Int64" { $return = $policy.GetInt64().ToString() }
                default { $return = $policy.GetString() }
            }
        }
        else
        {
            $description = "Policy not set."
        }
    }
    catch
    {
        $description = "Failure to get policy: $($_.Exception.Message)."
        $fail = $true
    }

    Write-Verbose "The $PolicyCode value is: [$return] - $description"
    [pscustomobject] @{ PolicyCodeValue = $return; Details = $description ; Fail = $fail}
}

function Check-PeerEfficiency()
{
    Write-Progress -Activity "Checking Peer Efficiency" -Status "Gathering data to determine P2P efficiency (it can take a few minutes)" -PercentComplete 10
    $logInfo = "Peer Efficiency for this month:  "

    try
    {
        $downloadInfo = Get-DeliveryOptimizationPerfSnapThisMonth
        Write-Verbose $downloadInfo

        $totalPeer = $downloadInfo.DownloadLanBytes + $downloadInfo.DownloadInternetBytes
        if ($totalPeer -eq 0)
        {
            $peerEfficiency = 0
        }
        else
        {
            $totalDownloaded = $downloadInfo.DownloadHttpBytes + $totalPeer
            $peerEfficiency = [math]::Round(($totalPeer * 100 / $totalDownloaded), 2)
        }

        Write-Progress -Activity "Checking Peer Efficiency" -Status "Creating return" -PercentComplete 80
        $description = "$peerEfficiency %"
    }
    catch
    {
        Write-Error $_.Exception
        $description = "Failure in Get-DeliveryOptimizationPerfSnapThisMonth."
    }
    finally
    {
        Write-Progress -Activity "Checking Peer Efficiency" -Status "Returning data" -Completed
    }


    [pscustomobject] @{ Peer_Info = $logInfo; Description = $description}
}

function Get-PeerLogErrors()
{
    # Adding this Start-Sleep to Write-Progress works in Powershell 7
    if ($PSVersionTable.PSVersion.Major -gt 6)
    {
        Start-Sleep -Seconds 1
    }

    Write-Progress -Activity "Finding errors in DO logs" -Status "Parsing logs (it can take a couple of minutes)" -PercentComplete 10

    $startDate = (Get-Date).AddDays(-15)
    $hrRegistered = (Get-DeliveryOptimizationLog -LevelFilter 3) | Where-Object {($_.TimeCreated -gt $startDate) -and ($_.ErrorCode -ne $null)} | Sort-Object -Property ErrorCode -Unique
    Write-Progress -Activity "Finding errors in DO logs" -Status "Filtering errors" -PercentComplete 40

    if($hrRegistered)
    {
        Write-Progress -Activity "Finding errors in DO logs" -Status "Returning errors" -PercentComplete 80
        Get-DOErrorsTable | Where-Object {$hrRegistered.ErrorCode -contains $_.ErrorCode}
    }

    Write-Progress -Activity "Finding errors in DO logs" -Status "Returning errors" -Completed
}

function Get-DOPolicies([pscustomobject] $ErrorsFound)
{
    $policyTable = Get-DOPolicyTable
    $policyOutputs = @()
    $percentComp = 0

    # Adding this Start-Sleep to Write-Progress works in Powershell 7
    if ($PSVersionTable.PSVersion.Major -gt 6)
    {
        Start-Sleep -Seconds 1
    }

    Write-Progress -Activity "Checking DO Policies" -Status "Getting policy data" -PercentComplete $percentComp

    try
    {
        foreach($policy in $policyTable)
        {
            $policyRelatedError = $false
            $policyValue = $null

            Write-Progress -Activity "Checking DO Policies" -Status "Getting $($policy.PolicyCode) data" -PercentComplete $percentComp
            $percentComp += 100/$policyTable.Count

            #Policy Setup adjustments.
            $policyValue = (Get-PolicyData -PolicyCode $policy.PolicyCode).PolicyCodeValue

            if($policyValue)
            {
                if($policy.PolicyUnit)
                {
                    $policyValue += " $($policy.PolicyUnit)"
                }

                if($policy.PolicyCode -eq "DODownloadMode")
                {
                    $policyValue = switch ( $policyValue)
                    {
                        0 { "CdnOnly - 0" }
                        1 { "LAN - 1" }
                        2 { "Group - 2" }
                        3 { "Internet - 3" }
                        99 { "Simple - 99" }
                        100 { "Bypass - 100" }
                        default {  $policyValue }
                    }
                }
            }

            $policyError = $ErrorsFound | Where-Object {$_.RelatedPolicyName -eq $policy.PolicyCode}

            if ($policyError)
            {
                $description = $policyError.SuggestedRemedy
                $policyRelatedError = $true
            }
            else
            {
                $description = $policy.Description
            }

            $description += "`r`nMORE INFO: $($policy.Link)`r`n"
            $policyOutputs += [pscustomobject] @{ Name = $policy.PolicyName; Configuration = $policyValue; MoreInfo = $description; PolicySuggestion = $policyRelatedError }
        }
    }
    catch
    {
        Write-Error $_.Exception
    }

    Write-Progress -Activity "Checking DO Policies" -Status "Returning data" -Completed
    return $policyOutputs
}

#----------------------------------------------------------------------------------#
# MCC Check
function Check-ConfiguredCacheHostServer()
{
    $outputName = "DOCacheHost Server Configured"
    $progressActivity = "Checking if device is configured to use CacheHost Server"
    $description = [string]::Empty

    Write-Progress -Activity $progressActivity -Status "Checking Windows 11 Settings" -PercentComplete 10
    $vpnCacheServerPolicyInWin11 = Get-DODisallowCacheServerPolicyInWin11
    if($vpnCacheServerPolicyInWin11.disallowMccOnVpn)
    {
        if ($vpnCacheServerPolicyInWin11.VpnConnected)
        {
            return [pscustomobject] @{ Name = $outputName; Result = [TestResult]::Fail; Details = "MCC usage is disabled because DO is set to disallow CacheServer downloads on VPN, and you are connected to a VPN." }
        }
        else
        {
            $description += "[Warning: DODisallowCacheServerDownloadsOnVPN is set, so a VPN connection will disallow CacheServer downloads] "
        }
    }

    Write-Progress -Activity $progressActivity -Status "Getting Cache Host Data" -PercentComplete 40
    $mccHostInfo = Get-CacheHostServer

    Write-Progress -Activity $progressActivity -Status "Validating Data" -PercentComplete 70
    # ------------------------------------------------------------------ #
    # 1 -> Validate if no MCC config was found
    # [ERROR]
    $descriptionValidation = Check-CacheHostNotFound -CacheHostObject $mccHostInfo
    if ($descriptionValidation)
    {
        $description += $descriptionValidation
        return [pscustomobject] @{ Name = $outputName; Result = [TestResult]::Fail; Details = $description }
    }

    # ------------------------------------------------------------------ #
    # 2 -> Validate if PolicyCacheHostSource is DHCPOption235Force and, CacheHostPolicy and DHCPOptionSet are set
    # [WARN] - Returning DHCP Option Value
    $descriptionValidation = Check-DHCPOption235WithCacheHostPolicyAndDHCPOptionSet -CacheHostObject $mccHostInfo
    if ($descriptionValidation.Description)
    {
        $description += $descriptionValidation.Description
        return [pscustomobject] @{ Name = $outputName; Result = [TestResult]::Warn; Details = $descriptionValidation.Description; MCCHost = $descriptionValidation.CacheHost }
    }

    # ------------------------------------------------------------------ #
    # 3 -> Validate if GeoCacheHostFlag is set and possibles cache hosts.
    # [SUCCESS]
    $geoCacheHostFlagValidation = Check-GeoCacheHostFlagSetToUseDhcpOption -CacheHostObject $mccHostInfo
    if ($geoCacheHostFlagValidation.Description)
    {
        $description += $geoCacheHostFlagValidation.Description
        return [pscustomobject] @{ Name = $outputName; Result = [TestResult]::Warn; Details = $description; MCCHost = $geoCacheHostFlagValidation.CacheHost }
    }

    # ------------------------------------------------------------------ #
    # 4 -> Validate DisableDNSSD cases.
    # [SUCCESS]
    if ($mccHostInfo.PolicyCacheHostSource -eq [CacheHostSource]::DisableDNSSD)
    {
        $disableDNSSDValidation = Check-DisableDNSSDCases -CacheHostObject $mccHostInfo
        $description += $disableDNSSDValidation.Description
        return [pscustomobject] @{ Name = $outputName; Result = [TestResult]::Pass; Details = $description; MCCHost = $disableDNSSDValidation.CacheHost }
    }

    # ------------------------------------------------------------------ #
    # 5 -> Validate DHCP Option235 cases.
    # [SUCCESS]
    $dhcpOption235Validation = Check-DHCPOption235Cases -CacheHostObject $mccHostInfo
    $description += $dhcpOption235Validation.Description
    return [pscustomobject] @{ Name = $outputName; Result = [TestResult]::Pass; Details = $description; MCCHost = $dhcpOption235Validation.CacheHost }

    Write-Progress -Activity $progressActivity -Status "Returning data" -Completed
}

function Check-DHCPOption235Cases([pscustomobject] $CacheHostObject)
{

    $description = "This device has CacheHostSource configured to use <$([Int32]$CacheHostObject.PolicyCacheHostSource) = $($CacheHostObject.PolicyCacheHostSource)>, so it will dynamically use "
    $cacheHost = [string]::Empty

    if (!$CacheHostObject.DHCPCacheHost)
    {
        if($CacheHostObject.GeoCacheHost)
        {
            $description += "the Cache Host '$($CacheHostObject.GeoCacheHost)' set via Delivery Optimization Cloud Service."
            $cacheHost = $CacheHostObject.GeoCacheHost
        }
        else
        {
            $description += "the Cache Host '$($CacheHostObject.PolicyCacheHost)' set via 'DOCacheHost' Policy"
            $cacheHost = $CacheHostObject.PolicyCacheHost
        }
    }
    else
    {
        $description += "the DHCP option: $($CacheHostObject.DHCPCacheHost)."
        $cacheHost = $CacheHostObject.DHCPCacheHost
    }

    return [pscustomobject] @{ Description = $description; CacheHost = $cacheHost }
}

function Check-DisableDNSSDCases([pscustomobject] $CacheHostObject)
{
    $description = "This device has CacheHostSource configured to use <0 = DisableDNSSD> and "
    $cacheHost = [string]::Empty

    if($CacheHostObject.GeoCacheHost)
    {
        $description += "The CacheHost server '$($CacheHostObject.GeoCacheHost)' is set via Delivery Optimization Cloud Service."
        $cacheHost = $CacheHostObject.GeoCacheHost
    }
    else
    {
        $description += "The CacheHost server '$($CacheHostObject.PolicyCacheHost)' is set via DOCacheHost Policy."
        $cacheHost = $CacheHostObject.PolicyCacheHost
    }

    return [pscustomobject] @{ Description = $description; CacheHost = $cacheHost }
}

function Check-GeoCacheHostFlagSetToUseDhcpOption([pscustomobject] $CacheHostObject)
{
    $description = [string]::Empty
    $cacheHost = [string]::Empty

    if ($CacheHostObject.GeoDhcpFlagIsSet)
    {
        if (($CacheHostObject.DHCPCacheHost) -and ($CacheHostObject.GeoCacheHost))
        {
            $description = "Both DHCP option $($CacheHostObject.DHCPCacheHost) and GeoCacheHost $($CacheHostObject.GeoCacheHost) are set, but $($CacheHostObject.GeoCacheHost) will be used as MCC Cache Server because DHCPOption235 flag is set in Delivery Optimization Cloud Service."
            $cacheHost = $($CacheHostObject.GeoCacheHost)
        }
        elseif ($CacheHostObject.DHCPCacheHost)
        {
            $description = "The DHCP option $($CacheHostObject.DHCPCacheHost) will be dynamically used as MCC Cache Server because DHCPOption235 flag is set in Delivery Optimization Cloud Service."
            $cacheHost = $CacheHostObject.DHCPCacheHost
        }
        else
        {
            $description = "The GeoCacheHost $($CacheHostObject.GeoCacheHost) will be dynamically used as MCC Cache Server because DHCPOption235 flag is set in Delivery Optimization Cloud Service."
            $cacheHost = $CacheHostObject.GeoCacheHost
        }
    }

    return [pscustomobject] @{ Description = $description; CacheHost = $cacheHost }
}

function Check-DHCPOption235WithCacheHostPolicyAndDHCPOptionSet([pscustomobject] $CacheHostObject)
{
    $description = [string]::Empty
    $cacheHost = $null

    if (($CacheHostObject.PolicyCacheHostSource -eq [CacheHostSource]::DHCPOption235Force) -and
            ![string]::IsNullOrEmpty($CacheHostObject.PolicyCacheHost) -and
            ![string]::IsNullOrEmpty($CacheHostObject.DHCPCacheHost))
    {
        $description = "Detecting both CacheHost Policy and DHCP Option set. Therefore, DHCP Option 235 Force string $($CacheHostObject.DHCPCacheHost) will be used according < $([Int32]$CacheHostObject.PolicyCacheHostSource) = $($CacheHostObject.PolicyCacheHostSource)>."
        $cacheHost = $CacheHostObject.DHCPCacheHost
    }
    elseif (($CacheHostObject.PolicyCacheHostSource -eq [CacheHostSource]::DHCPOption235) -and
            ![string]::IsNullOrEmpty($CacheHostObject.PolicyCacheHost) -and
            ![string]::IsNullOrEmpty($CacheHostObject.DHCPCacheHost))
    {
        $description = "Detecting both CacheHost Policy and DHCP Option set. Therefore, the Cache Host Policy string $($CacheHostObject.PolicyCacheHost) will be used according < $([Int32]$CacheHostObject.PolicyCacheHostSource) = $($CacheHostObject.PolicyCacheHostSource)>."
        $cacheHost = $CacheHostObject.PolicyCacheHost
    }

    return [pscustomobject] @{ Description = $description; CacheHost = $cacheHost }
}

function Check-CacheHostNotFound([pscustomobject] $CacheHostObject)
{
    $infoPage = "https://learn.microsoft.com/en-us/windows/deployment/do/waas-delivery-optimization-reference#cache-server-hostname"
    $description = [string]::Empty

    if ([string]::IsNullOrEmpty($CacheHostObject.PolicyCacheHost) -and
        [string]::IsNullOrEmpty($CacheHostObject.GeoCacheHost)    -and
        [string]::IsNullOrEmpty($CacheHostObject.DHCPCacheHost))
    {
        $description = "Unable to get any MCC CacheHost configuration on this device. For more information: $infoPage"
    }

    return $description
}

function Get-CacheHostServer()
{
    $dhcpGeoFlag = $false
    $cacheHostPolicy = $null
    $dhcpCacheHost = $null
    $cacheHostSourcePolicy = Get-DOCacheHostSource

    if($cacheHostSourcePolicy -in [CacheHostSource]::DHCPOption235, [CacheHostSource]::DHCPOption235Force)
    {
        $dhcpCacheHost = Get-DhcpStringOptionValue([Int32][DhcpOption]::DOMccHost)
    }

    if (([string]::IsNullOrEmpty($dhcpCacheHost)) -or ($cacheHostSourcePolicy -ne [CacheHostSource]::DHCPOption235Force))
    {
        $cacheHostPolicy = (Get-PolicyData -PolicyCode "DOCacheHost").PolicyCodeValue
    }

    if(([string]::IsNullOrEmpty($cacheHostPolicy)) -and ([string]::IsNullOrEmpty($dhcpCacheHost)))
    {
        $geoCacheHostRequest = Get-CacheHostServerFromGeoService
        $geoCacheHost = $geoCacheHostRequest.CacheHost
        if($geoCacheHostRequest.CacheHostFlag -eq 1)
        {
            $dhcpGeoFlag = $true
            $dhcpCacheHost = Get-DhcpStringOptionValue([Int32][DhcpOption]::DOMccHost)
        }
    }

    $returnValue = [pscustomobject] @{ PolicyCacheHost = $cacheHostPolicy; PolicyCacheHostSource = $cacheHostSourcePolicy; GeoCacheHost = $geoCacheHost; GeoDhcpFlagIsSet = $dhcpGeoFlag; DHCPCacheHost = $dhcpCacheHost}
    Write-Verbose $returnValue
    $returnValue
}

function Get-DOCacheHostSource()
{
    $cacheHostSourcePolicy = (Get-PolicyData -PolicyCode "DOCacheHostSource").PolicyCodeValue

    if (![string]::IsNullOrEmpty($cacheHostSourcePolicy) -and ([Int32]$cacheHostSourcePolicy -le [CacheHostSource]::DHCPOption235Force))
    {
        [System.Enum]::Parse([CacheHostSource], $cacheHostSourcePolicy)
    }
}

function Get-CacheHostServerFromGeoService()
{
    $geoResponse = Get-GeoResponse
    Write-Verbose $geoResponse.Details

    [pscustomobject] @{ CacheHost = $geoResponse.Details.CacheHost; CacheHostFlag = $geoResponse.Details.CacheHostFlag }
}

function Get-DODisallowCacheServerPolicyInWin11()
{
    $isWin11 = $false
    $disallowMccOnVpn = $false
    $vpnConn = $false

    try
    {
        $isWin11 = ((Get-OSVersion).Build -ge 22621)
        if ($isWin11)
        {
            $disallowMccOnVpn = ((Get-PolicyData -PolicyCode "DODisallowCacheServerDownloadsOnVPN").PolicyCodeValue) -eq "1"

            if($disallowMccOnVpn -eq $true)
            {
                $vpn = Get-VPNconnection | Where-Object {$_.ConnectionStatus -eq "Connected"}

                if ($vpn.Length -ne 0) { $vpnConn = $true }
            }
        }
    }
    catch
    {
        Write-Error $_.Exception
    }

    [pscustomobject] @{ DisallowMccOnVpn = $disallowMccOnVpn; VpnConnected = $vpnConn }
}

function Add-PInvokeTypes()
{
    $csharpCode = @'
    namespace Microsoft.DO.PInvoke
    {
        using System;
        using System.Net;
        using System.Net.NetworkInformation;
        using System.Net.Sockets;
        using System.Runtime.InteropServices;
        using System.Text;

        public static class Dhcp
        {
            private const uint DhcpApiRequest_Synchronous = 0x02;

            [StructLayout(LayoutKind.Sequential)]
            private struct DHCPAPI_PARAMS
            {
                public uint Flags;
                public uint OptionId;
                [MarshalAs(UnmanagedType.Bool)]
                public bool IsVendor;
                public IntPtr Data;
                public uint nBytesData;
            }

            [StructLayout(LayoutKind.Sequential)]
            private struct DHCPCAPI_PARAMS_ARRAY
            {
                public uint nParams;
                public IntPtr Params;
            }

            [DllImport("dhcpcsvc.dll", SetLastError = false)]
            private static extern uint DhcpCApiInitialize(out uint Version);

            [DllImport("dhcpcsvc.dll", SetLastError = false)]
            private static extern void DhcpCApiCleanup();

            [DllImport("dhcpcsvc.dll", SetLastError = false)]
            private static extern uint DhcpRequestParams([In, Optional] uint Flags, [In, Optional] IntPtr Reserved,
                [MarshalAs(UnmanagedType.LPWStr)] string AdapterName, [In, Optional] IntPtr ClassId, [In] DHCPCAPI_PARAMS_ARRAY SendParams,
                [In, Out] DHCPCAPI_PARAMS_ARRAY RecdParams, [Out] IntPtr Buffer, ref uint BufferSizeHolder,
                [Optional, MarshalAs(UnmanagedType.LPWStr)] string RequestIdStr);

            private static byte[] GetDhcpOption(string adapterGuid, uint optionId)
            {
                uint version = 0;
                uint result = DhcpCApiInitialize(out version);
                if (result != 0)
                {
                    throw new Exception(string.Format("DhcpCApiInitialize failed with error code {0}", result));
                }

                IntPtr reqParamsBuffer = IntPtr.Zero;
                try
                {
                    var sendParams = new DHCPCAPI_PARAMS_ARRAY()
                    {
                        nParams = 0,
                        Params = IntPtr.Zero,
                    };

                    DHCPAPI_PARAMS optionParam = new DHCPAPI_PARAMS()
                    {
                        Flags = 0,
                        OptionId = optionId,
                        IsVendor = false,
                        Data = IntPtr.Zero,
                        nBytesData = 0
                    };

                    var requestParams = new DHCPCAPI_PARAMS_ARRAY()
                    {
                        nParams = 1,
                        Params = Marshal.AllocHGlobal(Marshal.SizeOf<DHCPAPI_PARAMS>())
                    };
                    Marshal.StructureToPtr(optionParam, requestParams.Params, false);

                    // 1024 bytes should be enough for our purposes
                    reqParamsBuffer = Marshal.AllocHGlobal(1024);
                    uint bufferSize = 1024;
                    result = DhcpRequestParams(
                        Flags: DhcpApiRequest_Synchronous,
                        Reserved: IntPtr.Zero,
                        AdapterName: adapterGuid,
                        ClassId: IntPtr.Zero,
                        SendParams: sendParams,
                        RecdParams: requestParams,
                        Buffer: reqParamsBuffer,
                        BufferSizeHolder: ref bufferSize,
                        RequestIdStr: null);
                    if (result != 0)
                    {
                        throw new Exception(string.Format("DhcpRequestParams failed with error code {0}", result));
                    }

                    var recdParam = Marshal.PtrToStructure<DHCPAPI_PARAMS>(requestParams.Params);
                    if ((recdParam.Data == IntPtr.Zero) || (recdParam.nBytesData == 0))
                    {
                        return null;
                    }

                    byte[] optionValueData = new byte[recdParam.nBytesData];
                    Marshal.Copy(recdParam.Data, optionValueData, 0, (int)recdParam.nBytesData);
                    return optionValueData;
                }
                finally
                {
                    if (reqParamsBuffer != IntPtr.Zero)
                    {
                        Marshal.FreeHGlobal(reqParamsBuffer);
                    }

                    DhcpCApiCleanup();
                }
            }

            public static string GetDhcpOptionString(string adapterGuid, uint optionId)
            {
                byte[] optionValueData = GetDhcpOption(adapterGuid, optionId);
                if (optionValueData == null || optionValueData.Length == 0)
                {
                    return string.Empty;
                }
                string dhcpOption = Encoding.ASCII.GetString(optionValueData);
                return dhcpOption.EndsWith("\0") ? dhcpOption.Remove(dhcpOption.Length - 1) : dhcpOption;
            }

            public static uint? GetDhcpOptionUInt32(string adapterGuid, uint optionId)
            {
                byte[] optionValueData = GetDhcpOption(adapterGuid, optionId);
                if (optionValueData == null || optionValueData.Length == 0)
                {
                    return null;
                }
                return BitConverter.ToUInt32(optionValueData, 0);
            }
        }

        public static class Net
        {
            private struct NET_LUID
            {
                public ulong Value;
            }

            [DllImport("iphlpapi.dll", SetLastError = true)]
            private static extern uint ConvertInterfaceGuidToLuid(ref Guid Guid, out NET_LUID Luid);

            private static NET_LUID GetLuidForNetworkAdapter(NetworkInterface adapter)
            {
                NET_LUID luid = new NET_LUID();
                var guid = Guid.Parse(adapter.Id);
                uint result = ConvertInterfaceGuidToLuid(ref guid, out luid);
                if (result != 0)
                {
                    throw new System.ComponentModel.Win32Exception();
                }
                return luid;
            }

            private const int IF_MAX_STRING_SIZE = 256;
            private const int IF_MAX_PHYS_ADDRESS_LENGTH = 32;

            [StructLayout(LayoutKind.Sequential)]
            private struct MIB_IF_ROW2
            {
                public NET_LUID InterfaceLuid;
                public uint InterfaceIndex;
                public Guid InterfaceGuid;
                [MarshalAs(UnmanagedType.ByValArray, SizeConst = (IF_MAX_STRING_SIZE + 1)*2)]
                public byte[] Alias;
                [MarshalAs(UnmanagedType.ByValArray, SizeConst = (IF_MAX_STRING_SIZE + 1)*2)]
                public byte[] Description;
                public uint PhysicalAddressLength;
                [MarshalAs(UnmanagedType.ByValArray, SizeConst = IF_MAX_PHYS_ADDRESS_LENGTH)]
                public byte[] PhysicalAddress;
                [MarshalAs(UnmanagedType.ByValArray, SizeConst = IF_MAX_PHYS_ADDRESS_LENGTH)]
                public byte[] PermanentPhysicalAddress;
                public uint Mtu;
                public uint Type;
                public uint TunnelType;
                public uint MediaType;
                public uint PhysicalMediumType;
                public uint AccessType;
                public uint DirectionType;
                public uint InterfaceAndOperStatusFlags;
                public uint OperStatus;
                public uint AdminStatus;
                public uint MediaConnectState;
                public Guid NetworkGuid;
                public uint ConnectionType;
                public ulong TransmitLinkSpeed;
                public ulong ReceiveLinkSpeed;
                public ulong InOctets;
                public ulong InUcastPkts;
                public ulong InNUcastPkts;
                public ulong InDiscards;
                public ulong InErrors;
                public ulong InUnknownProtos;
                public ulong InUcastOctets;
                public ulong InMulticastOctets;
                public ulong InBroadcastOctets;
                public ulong OutOctets;
                public ulong OutUcastPkts;
                public ulong OutNUcastPkts;
                public ulong OutDiscards;
                public ulong OutErrors;
                public ulong OutUcastOctets;
                public ulong OutMulticastOctets;
                public ulong OutBroadcastOctets;
                public ulong OutQLen;
            }

            // Enum to help interpret the bit fields that make up MIB_IF_ROW2.InterfaceAndOperStatusFlags.
            [Flags]
            private enum eInterfaceAndOperStatusFlags
            {
                None = 0,
                HardwareInterface = 1 << 0,
                FilterInterface = 1 << 1,
                ConnectorPresent = 1 << 2,
                NotAuthenticated = 1 << 3,
                NotMediaConnected = 1 << 4,
                Paused = 1 << 5,
                LowPower = 1 << 6,
                EndPointInterface = 1 << 7
            }

            [DllImport("iphlpapi.dll", CharSet = CharSet.Auto)]
            private static extern uint GetIfEntry2(ref MIB_IF_ROW2 pIfRow);

            public static bool IsConnectorPresent(NetworkInterface adapter)
            {
                var luid = GetLuidForNetworkAdapter(adapter);
                var row = new MIB_IF_ROW2
                {
                    InterfaceLuid = luid
                };
                uint result = GetIfEntry2(ref row);
                if (result != 0)
                {
                    throw new System.ComponentModel.Win32Exception();
                }

                var flags = (eInterfaceAndOperStatusFlags)row.InterfaceAndOperStatusFlags;
                return (flags & eInterfaceAndOperStatusFlags.ConnectorPresent) != 0;
            }
        }
    }
'@;

    # If source code is changed and script is executed in the same PS session, then Add-Type will fail.
    # Close and reopen the PS session to workaround this.
    Add-Type -TypeDefinition $csharpCode
}

function Confirm-IsLinkLocal([IPAddress] $Ip)
{
    $ipBytes = $Ip.GetAddressBytes()
    return (($ipBytes[0] -eq 169) -and ($ipBytes[1] -eq 254))
}

function Confirm-HasPreferredAddress([System.Net.NetworkInformation.NetworkInterface] $Adapter)
{
    $preferredIpv4Address = $Adapter.GetIPProperties().UnicastAddresses.Address |
        Where-Object { $_.AddressFamily -eq [System.Net.Sockets.AddressFamily]::InterNetwork }
    return ($preferredIpv4Address -and ![IPAddress]::IsLoopback($preferredIpv4Address) `
        -and !(Confirm-IsLinkLocal -Ip $preferredIpv4Address))
}

function Confirm-PhysicalNetworkType([System.Net.NetworkInformation.NetworkInterface] $Adapter)
{
    # Check IsConnectorPresent first because checking NetworkInterfaceType alone is insufficient.
    # Example: .NET reports Ethernet type for both physical and virtual NICs.
    $isConnectorPresent = [Microsoft.DO.PInvoke.Net]::IsConnectorPresent($Adapter);
    if ($isConnectorPresent)
    {
        $physicalNetworkType = @([System.Net.NetworkInformation.NetworkInterfaceType]::Ethernet,
                            [System.Net.NetworkInformation.NetworkInterfaceType]::FastEthernetT,
                            [System.Net.NetworkInformation.NetworkInterfaceType]::FastEthernetFx,
                            [System.Net.NetworkInformation.NetworkInterfaceType]::GigabitEthernet,
                            [System.Enum]::Parse([System.Net.NetworkInformation.NetworkInterfaceType], 55),
                            [System.Net.NetworkInformation.NetworkInterfaceType]::Wireless80211,
                            [System.Enum]::Parse([System.Net.NetworkInformation.NetworkInterfaceType], 161))
        return $physicalNetworkType.Contains($Adapter.NetworkInterfaceType)
    }
}

# This and other related methods are based on DO client's native code so that we find the same network interface.
# This ensures the Troubleshooter and DO client's results match.
function Get-LocalIPv4Adapter()
{
    $validVirtualInterface = $null

    # Find a physical adapter or, if one is not present, the first virtual adapter, that is in running state
    # and has the preferred IPv4 address (not loopback and not link-local).
    $adapters = [System.Net.NetworkInformation.NetworkInterface]::GetAllNetworkInterfaces()
    foreach ($adapter in $adapters)
    {
        $statusCheck = $adapter.OperationalStatus -eq [System.Net.NetworkInformation.OperationalStatus]::UP
        $addrCheck = Confirm-HasPreferredAddress $adapter
        $isPhysical = Confirm-PhysicalNetworkType $adapter
        $resultString = "Checks: Status = $statusCheck, Address = $addrCheck, IsPhysical = $isPhysical"
        Write-Verbose "Testing NIC: $($adapter.Id), $($adapter.Name), $($adapter.Description) => $resultString"

        if ($statusCheck -and $addrCheck)
        {
            if ($isPhysical)
            {
                return $adapter
            }

            # We have a virtual interface, use it if it's the first time through here
            # and continue the loop to look for physical ones.
            if (-not $validVirtualInterface)
            {
                $validVirtualInterface = $adapter
            }
        }
    }

    if ($validVirtualInterface)
    {
        return $validVirtualInterface
    }
}

function Get-DhcpStringOptionValue([Int32] $OptionNumber)
{
    Add-PInvokeTypes

    $foundAdapter = Get-LocalIPv4Adapter
    if (-not $foundAdapter)
    {
        Write-Verbose "No suitable network adapter found"
        return $null
    }

    $adapterDesc = "ID = $($foundAdapter.Id), name = $($foundAdapter.Name), description = $($foundAdapter.Description)"
    Write-Verbose "To query DHCP option = $OptionNumber, found IPv4 adapter: $adapterDesc"
    $adapterGuid = $foundAdapter.Id;

    try
    {
        $strOptionValue = [Microsoft.DO.PInvoke.Dhcp]::GetDhcpOptionString($adapterGuid, $OptionNumber)
        if (-not $strOptionValue)
        {
            # As a sanity check, see if subnet mask can be retrieved. It must be present in all IPv4 network adapters.
            # So, if this works, then we have confidence that the net adapter and P/Invoke code is working fine.
            # TODO Remove this once we are able to test the Option235 value in some environment (Azure?).
            $subnetMaskOption = 1
            $subnetMask = [Microsoft.DO.PInvoke.Dhcp]::GetDhcpOptionUInt32($adapterGuid, $subnetMaskOption)
            if ($subnetMask)
            {
                $subnetMaskString = ($subnetMask -as [ipaddress]).IPAddressToString
                Write-Verbose "Subnet mask from DHCP options = $subnetMaskString"
            }
            else
            {
                Write-Verbose "Subnet mask cannot be retrieved from DHCP options"
            }
        }
        return $strOptionValue
    }
    catch
    {
        Write-Error $_.Exception
    }
}

function Check-DownloadCacheHostServer ([string] $CacheHost)
{
    $progressActivity = "Downloading content from CacheHost Server"
    $downloadsInfo = @()
    $result = [TestResult]::Fail
    $description = [string]::Empty

    Write-Progress -Activity $progressActivity -Status "Creating MCC URL to download" -PercentComplete 10
    if ([string]::IsNullOrEmpty($CacheHost))
    {
        return [pscustomobject] @{ Name = "Download from CacheHost server"; Result = $result; Details = "Cache Host Server not found." }
    }

    Write-Progress -Activity $progressActivity -Status "Download using MCC URL" -PercentComplete 50
    $mccServers = $CacheHost -split ","
    foreach($mccServer in $mccServers)
    {
        $mccUrl = Get-MccDownloadTestUrl -CacheHost $mccServer
        try
        {
            $result = [TestResult]::Fail
            $downloadInfo = Get-WebRequestData $mccUrl
            Write-Verbose $downloadInfo.Headers

            if ($downloadInfo.StatusCode -ne 200)
            {
                $description = "Unexpected Status Code: $($downloadInfo.StatusCode) - $($downloadInfo.StatusDescription)"
            }
            elseif ($($downloadInfo.Headers.'Content-Type') -ne "application/octet-stream")
            {
                $description = "Unexpected Content-Type (Check possible captive portal): $($downloadInfo.Headers.'Content-Type')"
            }
            elseif ($downloadInfo.RawContentLength -ne 302341)
            {
                $description = "Incorrect content length size. Expected: 302341 - Received: $($downloadInfo.RawContentLength)"
            }
            else
            {
                $result = [TestResult]::Pass
                $description = "MCC Download: Status = $($downloadInfo.StatusCode), File size: $($downloadInfo.RawContentLength), Address = $mccUrl"
            }
        }
        catch
        {
            $description = "Unable to make a WebRequest using MCC Link! Exception: $($_.Exception)"
        }

        $downloadsInfo += [pscustomobject] @{ Name = "Download from CacheHost server"; Result = $result; Details = $description }
    }

    Write-Progress -Activity $progressActivity -Status "Returning data" -Completed
    return $downloadsInfo
}

function Get-MccDownloadTestUrl([string] $CacheHost)
{
    # Use the file hosted on FSS that serves as the basic test for a working MCC setup in the network
    return "http://$CacheHost/filestreamingservice/files/7bc846e0-af9c-49be-a03d-bb04428c9bb5/Microsoft.png?cacheHostOrigin=dl.delivery.mp.microsoft.com"
}

function Check-DownloadPercentageCacheHost()
{
    $outputName = "Percentage of Download using DOCacheHost"
    $progressActivity = "Calculating Percentage of Download"
    $result = [TestResult]::Fail
    $percentageCacheServer = 0

    Write-Progress -Activity $progressActivity -Status "Get DeliveryOptimization Download Information" -PercentComplete 10
    $downloadInformation = Get-DeliveryOptimizationPerfSnapThisMonth
    if(-not $downloadInformation)
    {
        return [pscustomobject] @{ Name = $outputName; Result = $result; Details = "Unable to get results from Get-DeliveryOptimizationPerfSnapThisMonth." }
    }

    Write-Progress -Activity $progressActivity -Status "Calculate Percentage of CacheServer" -PercentComplete 50
    if ($downloadInformation.DownloadCacheHostBytes -ne 0)
    {
        $percentageCacheServer = 100 * ($downloadInformation.DownloadCacheHostBytes / ($downloadInformation.DownloadHttpBytes + $downloadInformation.DownloadLanBytes + $downloadInformation.DownloadInternetBytes))
        $percentageCacheServer = [math]::Round($percentageCacheServer, 2)
        $description = "This device has downloaded content from MCC this month. To improve the efficiency, check the 'DelayCacheServer' configuration below."
    }
    else
    {
        $description = "This device has not downloaded content from MCC this month."
    }

    $result = "$percentageCacheServer%"

    Write-Progress -Activity $progressActivity -Status "Returning data" -Completed
    return [pscustomobject] @{ Name = $outputName; Result = $result; Details = $description }
}

function Check-DelayCacheServerFallbackPolicy($PolicyName, $RecommendedValue)
{
    $outputName = "Check $($PolicyName.Substring(2))"
    $result = 0

    $policyInfo = Get-PolicyData -PolicyCode $PolicyName

    if ($policyInfo.Fail)
    {
        $description = $policyInfo.Details
    }
    elseif ($policyInfo.PolicyCodeValue)
    {
        $description = "$($policyInfo.Details) To improve % from Cache server try setting this value to $RecommendedValue seconds as a starting point."
        $result = $policyInfo.PolicyCodeValue
    }
    else
    {
        $description = "$($policyInfo.Details) By increasing this value it may improve chances of foreground downloads to pull from MCC server. Try $RecommendedValue seconds as a starting point."
    }


    return [pscustomobject] @{ Name = $outputName; Result = $result; Details = $description }
}


#----------------------------------------------------------------------------------#
# Aux Functions
function Add-Space([string] $Text, [int] $SizeSpace)
{
    return $Text + (" " * ([math]::max(0, $sizeSpace - $text.Length)))
}

function Get-OSVersion()
{
    return [Environment]::OSVersion.Version
}

function Get-WebRequestData([string] $Url)
{
    # To avoid the error "Internet Explorer engine is not available", it's advisable to create all Web requests use basic parsing only.
    # Beginning with PowerShell 6.0.0, all Web requests use basic parsing only and this option has been deprecated.
    if ($PSVersionTable.PSVersion.Major -gt 5)
    {
        Invoke-WebRequest -Uri $Url
    }
    else
    {
        Invoke-WebRequest -Uri $Url -UseBasicParsing
    }
}

function Check-ModuleIsInstalled([string] $Module)
{
    $ModuleInstalled = $null

    try
    {
        # If module is imported in the session
        $checkModuleSession = Get-Module $Module

        if ($checkModuleSession)
        {
            $ModuleInstalled = $true
            Write-Verbose "$Module was already imported in the session."
        }
        else
        {
            # If module is not imported, but available on disk
            $checkModuleAvailableDisk = Get-Module -ListAvailable | Where-Object {$_.Name -eq $Module}

            if ($checkModuleAvailableDisk)
            {
                Import-Module -ModuleInfo $checkModuleAvailableDisk
                $ModuleInstalled = $true
                Write-Verbose "$Module was installed, but it has to be imported in the session."
            }
            else
            {
                $ModuleInstalled = $false
                Write-Verbose "$Module is not installed."
            }
        }
    }
    catch
    {
        Write-Error $_.Exception
    }

    return $ModuleInstalled
}

#----------------------------------------------------------------------------------#
# MAIN FUNCTIONS:
# Heath Checker:
function Invoke-HealthChecker()
{
    Print-Title " Device Health Check:"
    Write-Host ""
    Print-SubTitle "Device Settings"

    $deviceSettings = @()
    $deviceSettings += Check-DownloadMode
    $deviceSettings += Check-Service -ServiceName "dosvc"
    $deviceSettings += Check-CacheFolder
    $deviceSettings += Check-KeyAccess
    $deviceSettings += Check-Vpn
    Format-ResultObject $deviceSettings

    Print-SubTitle "Hardware Settings"
    $hardwareCheck = @()
    $hardwareCheck += Check-RAMRequired
    $hardwareCheck += Check-DiskRequired
    $hardwareCheck += Check-PowerBattery
    Format-ResultObject $hardwareCheck

    Print-SubTitle "Connection Check"
    Write-Progress -Activity "Connection Check" -Status "Checking net interface" -PercentComplete 0
    $connectionCheck = @()
    $connectionCheck += Check-NetInterface
    Write-Progress -Activity "Connection Check" -Status "Testing port 7680" -PercentComplete 15
    $connectionCheck += Test-Port -Port 7680           # 7680 - DO port
    Write-Progress -Activity "Connection Check" -Status "Testing port 7680" -PercentComplete 30
    $connectionCheck += Test-Port -Port 3544 -Optional # 3544 - Teredo port
    Write-Progress -Activity "Connection Check" -Status "Testing internet connection" -PercentComplete 45
    $connInformation = Test-InternetInfo
    $connectionCheck += $connInformation

    $hostNames = @( "dl.delivery.mp.microsoft.com", "download.windowsupdate.com" )
    if ($connInformation.Connection -eq $true)
    {
        Write-Progress -Activity "Connection Check" -Status "Checking HTTP ByteRange" -PercentComplete 60
        $connectionCheck += Check-ByteRange

        Write-Progress -Activity "Connection Check" -Status "Checking hostnames" -PercentComplete 75
        foreach($hostName in $hostNames)
        {
            $connectionCheck += Test-Hostname -HostName $hostName
        }
    }
    else
    {
        $result = [TestResult]::Fail
        $description = "Internet check failed. Unable to check "

        #Check-ByteRange:
        $connectionCheck += [pscustomobject] @{ Name = "HTTP Byte-Range Support"; Result = $result; Details = ($description + "HTTP Byte-Range Support") }

        #Test-Hostname:
        foreach($hostName in $hostNames)
        {
            $connectionCheck += [pscustomobject] @{ Name = "Host Connection"; Result = $result; Details = ($description + $hostName) }
        }
    }

    Write-Progress -Activity "Connection Check" -Status "Showing results" -Completed

    Format-ResultObject $connectionCheck
}

# P2P Check:
function Invoke-P2PHealthChecker()
{
    Print-Title " P2P Health, Errors, Configuration:"
    Write-Host ""
    Print-SubTitle "Peer Validation"

    $peerEfficiency = Check-PeerEfficiency
    Write-Host "`n$($peerEfficiency.Peer_Info)  $($peerEfficiency.Description)"

    #***** Check Errors Found  *****#
    Write-Host ""
    if($PSVersionTable.PSVersion.Major -lt 7) { Write-Host "" } # Adding an extra breakline in PS5 to keep the pattern of the next header

    Print-SubTitle "Errors Found (excluding transient errors)"
    $errorsFound = Get-PeerLogErrors
    if($errorsFound)
    {
        $errorsFound | Format-Table -Wrap -Autosize -Property @{Label='Error Code'; e={"0x{0:X}" -f $_.ErrorCode}}, Description
    }
    else
    {
        Write-Host "  No errors Found!"
    }

    #***** Get DOPolicies *****#

    Print-SubTitle "Policy Settings"
    Get-DOPolicies -ErrorsFound $errorsFound | Format-Table -Wrap -Property @{Label='Name'; e={ "$($_.Name)  " } ; Align='Left'; },
    @{Label='Configuration'; e={ if ($_.Configuration) { " $($_.Configuration)  " } else { " Not Set " } }; Align='Center' ; },
    @{Label='More Info'; e={ if ($_.PolicySuggestion) { $color = "93"; $e = [char]27; "$e[${color}m$($_.MoreInfo)${e}[0m" } else { $_.MoreInfo } } ; }
}

# MCC Check:
function Invoke-MCCHealthChecker()
{
    Print-Title " MCC Device Setup:"

    $mccCheck = @()
    $mccCheck += Check-ConfiguredCacheHostServer
    $mccCheck += Check-DownloadCacheHostServer -CacheHost $mccCheck[0].MCCHost
    Format-ResultObject $mccCheck

    Print-Title " MCC Results on this Device:"
    $mccResults = @()
    $mccResults += Check-DownloadPercentageCacheHost
    $mccResults += Check-DelayCacheServerFallbackPolicy -PolicyName "DODelayCacheServerFallbackForeground" -RecommendedValue 30
    $mccResults += Check-DelayCacheServerFallbackPolicy -PolicyName "DODelayCacheServerFallbackBackground" -RecommendedValue 90
    Format-ResultObject $mccResults
}

#----------------------------------------------------------------------------------#
# MAIN SCRIPT:

$admin = Check-AdminPrivileges($MyInvocation.Line)
if (!$admin) { return }

#----------------------------------------------------------------------------------#
# Version number is specified in the metadata at the top of this file. This allows PS Gallery to consume it automatically.
# Use the metadata section to also display the version here.
# The version numbers must follow the rules of semantic versioning. See here for more details: https://semver.org/
$versionLine = Get-Content $MyInvocation.MyCommand.Definition -TotalCount 6 | Select-String '.VERSION'
$version = [Version]($versionLine -split ' ')[1]
Write-Host "Version $version"

$doConfig = Get-DOConfig -Verbose

#***** WinRT API (PS5 and PS7) *****#
$burntToastPreInstalled = $null
$moduleName = "BurntToast"
$onlyHealthCheck = ($HealthCheck -and !$P2P -and !$MCC)

if (-not $onlyHealthCheck)
{
    if($PSVersionTable.PSVersion.Major -gt 6)
    {
        $burntToastPreInstalled = Check-ModuleIsInstalled $moduleName

        if ($burntToastPreInstalled -eq $false)
        {
            Load-Module -Module $moduleName
        }
    }

    Import-Winrt
}
# ------------------------------- #

Print-OSInfo

if (!$HealthCheck -and !$P2P -and !$MCC)
{
    Invoke-HealthChecker
    Invoke-P2PHealthChecker
    Invoke-MCCHealthChecker
}
else
{
    if ($HealthCheck) { Invoke-HealthChecker }
    if ($P2P){ Invoke-P2PHealthChecker }
    if ($MCC){ Invoke-MCCHealthChecker }
}

#***** Remove Burnt Toast if it wasn't installed before in PS7 *****#
if ($burntToastPreInstalled -eq $false)
{
    Uninstall-Module -Name $moduleName -Force -WarningAction SilentlyContinue
}