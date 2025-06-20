# Remove pre loaded modules to mitigate exploit
Get-Module | ForEach-Object { Remove-Module -Name $_.Name -Force }
$PSModuleAutoloadingPreference = 'none'
Import-Module -Name 'CimCmdlets'
Import-Module -Name 'Microsoft.PowerShell.Utility'
Import-Module -Name 'Microsoft.PowerShell.Management'
Import-Module -name 'NetConnection'
Import-Module -name 'NetTCPIP'

function Get-MacFromIp
{
    param(
    [Parameter(Mandatory=$true)]
    [string]$RemoteIP
    )
    
    $arpTable = Get-NetNeighbor -IPAddress $RemoteIP -State Stale,Reachable -ErrorAction SilentlyContinue | Select-Object -First 1
    if($arpTable -ne $null -and $arpTable -ne "00-00-00-00-00-00")
    {
        return $arpTable.LinkLayerAddress
    }

    return $null
}

function Get-DefaultGatewayIpAddress
{
    param(
        [Parameter(Mandatory=$true)]
        [string]$LocalIp
    )

    $DefaultGatewayIp = $null
    try
    {
        $DefaultGatewayIps = (Get-CimInstance Win32_networkAdapterConfiguration -ErrorAction Stop | ?{$_.IPAddress -contains $LocalIp}  | Select-Object -ExpandProperty DefaultIPGateway)
        if($DefaultGatewayIps.count -gt 0)
        {
           return $DefaultGatewayIps
        }            
    }
    catch
    { }

    try
    {
        $Index = Get-NetIPAddress -IPAddress $LocalIp -AddressFamily IPv4 | Select-Object -ExpandProperty InterfaceIndex
        $DefaultGatewayIps = Get-NetRoute -InterfaceIndex $Index | where {$_.DestinationPrefix -eq '0.0.0.0/0' -or $_.DestinationPrefix -eq "::/0"} | Select-Object -ExpandProperty NextHop
        return $DefaultGatewayIps
    }
    catch
    { }

    return $null
}


function Get-StaticRoutes
{
    param(
    [Parameter(Mandatory=$true)]
    [string]$Index
    )

    try
    {
        $StaticRoutes = Get-NetRoute -InterfaceIndex $Index | Where-Object -FilterScript { $_.DestinationPrefix -Ne "0.0.0.0/0" } | Where-Object -FilterScript { $_.NextHop -Ne "::" } | Where-Object -FilterScript { $_.NextHop -Ne "0.0.0.0" } | Where-Object -FilterScript { ($_.NextHop.SubString(0,6) -Ne "fe80::") } | Select-Object -ExpandProperty NextHop | Get-Unique
        return $StaticRoutes
    }
    catch
    { }

    return $null  
}

function WriteEtw
{
    param(
        [Parameter(Mandatory=$true)]
        [AllowEmptyString()]
        [string]$Ip,
        [Parameter(Mandatory=$true)]
        [AllowEmptyString()]
        [string]$NetworkName,
        [Parameter(Mandatory=$true)]
        [byte]$IsStaticRoute,
        [Parameter(Mandatory=$true)]
        [AllowEmptyString()]
        [string]$NetworkAdapterId
        )
    
    try
    {
        if([string]::IsNullOrEmpty($Ip))
        {
            Write-Host "Cannot get Ip address"
            return $null 
        }

        if([string]::IsNullOrEmpty($NetworkName))
        {
            Write-Host "Cannot get NetworkName"
            return $null 
        }

        $Mac = Get-MacFromIp $Ip
        if([string]::IsNullOrEmpty($Mac))
        {
            Write-Host "Cannot get Mac address from Ip"
            return $null 
        }
    
        $etw = New-Object "NdrCollectorDefaultGatewayDiscoveryEvent" -Property @{
            Ip = $Ip
            Mac = $Mac
            NetworkName = $NetworkName 
            IsStaticRoute = $IsStaticRoute
            NetworkAdapterId = $NetworkAdapterId
            AdapterDefaultGatewaysMac = $Mac
        }

        $global:EtwProvider.Write("NdrCollectorDefaultGatewayDiscoveryEvent", $etw)
    }

    catch
    {
        Write-Host $_.Exception.ToString()
    }
}

[System.Diagnostics.Tracing.EventSource(Name = "Microsoft.Windows.NdrCollector", Guid = "ac39453b-eb9e-463f-b8ff-9c1a08b5931b")]
class NdrEventSource : System.Diagnostics.Tracing.EventSource
{
     NdrEventSource() : base([System.Diagnostics.Tracing.EventSourceSettings]::EtwSelfDescribingEventFormat -bOr [System.Diagnostics.Tracing.EventSourceSettings]::ThrowOnEventWriteErrors) { }
}

[System.Diagnostics.Tracing.EventData()]
class NdrCollectorDefaultGatewayDiscoveryEvent
{
    [string]$Ip
    [string]$Mac
    [string]$NetworkName
    [byte]$IsStaticRoute
    [string]$NetworkAdapterId
    [string]$AdapterDefaultGatewaysMac
}

$global:EtwProvider =  [NdrEventSource]::new()

try
{
    $Interfaces = Get-NetConnectionProfile

    foreach($Interface in $Interfaces)
    {
        $NetworkName = $Interface.Name
        $InterfaceIndex =  $Interface.InterfaceIndex
        $NetworkAdapterId = $Interface.InstanceID
        # Default gateway
        $IpAddress = Get-NetIPAddress -InterfaceIndex $InterfaceIndex -AddressFamily IPv4 -ErrorAction Stop | Select-Object -First 1 -ExpandProperty IPAddress
        $DefaultGatewayIps = Get-DefaultGatewayIpAddress -LocalIp $IpAddress
        foreach($DefaultGatewayIp in $DefaultGatewayIps)
        {
            WriteEtw -Ip $DefaultGatewayIp -NetworkName $NetworkName -IsStaticRoute 0 -NetworkAdapterId $NetworkAdapterId
        }

        # Static Routes
        $StaticRoutes = Get-StaticRoutes -Index $InterfaceIndex
        foreach($StaticRoute in $StaticRoutes)
        {
            if ($DefaultGatewayIps  -NotContains $StaticRoute)
            {
                WriteEtw -Ip $StaticRoute -NetworkName $NetworkName -IsStaticRoute 1 -NetworkAdapterId $NetworkAdapterId
            }
        }
    }

}
catch
{
    Write-Host $_.Exception.ToString()
}
# SIG # Begin signature block
# MIIoZgYJKoZIhvcNAQcCoIIoVzCCKFMCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCJyJfEBYGNp9+M
# qK3UCPCu9vYdsGtRGK1X4H7wGHUXgaCCDZcwggYVMIID/aADAgECAhMzAAAEOExw
# F8dThPTzAAAAAAQ4MA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjQxMTE1MDAwMTIzWhcNMjUxMTEzMDAwMTIzWjCBlDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE+MDwGA1UEAxM1TWlj
# cm9zb2Z0IFdpbmRvd3MgRGVmZW5kZXIgQWR2YW5jZWQgVGhyZWF0IFByb3RlY3Rp
# b24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC7XRtbYKag9kcj7xkU
# ngKJasJqOoGURz5mjsXKDgxWbKkHzjZn2dUlQetNwLN3RrR/2rrNhGM4Vour57xq
# L6MijWd6HfBkGZAl/h3ALhPLrertldZ0FhEzt/kLSsbx/2xq5Vwlt7RkRzwJSoeO
# 4jnXQUaG+dAb9mQW87vtDEARcKJqTTGB5W685hOyg4FWkb1nGPc4WgYE53Ri2XZv
# cCvuCsz5JmIbPjoQQHKomxaAr+wuea7o+r0M/bbm2Ok8v9LcX9bGx1ch515nXVkK
# PfCDQQbJ27pOlEEVOuu9WOHqs5zDCRO5Q4u6VrO/Q9+YF0snySMgsSJQ04BMeKDz
# uoHdAgMBAAGjggFzMIIBbzAfBgNVHSUEGDAWBggrBgEFBQcDAwYKKwYBBAGCN0wv
# ATAdBgNVHQ4EFgQU02W11Adr5UTyXh234s3aOhbYszEwRQYDVR0RBD4wPKQ6MDgx
# HjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEWMBQGA1UEBRMNNDUxODk0
# KzUwMzM3MzAfBgNVHSMEGDAWgBRIbmTlUAXTgqoXNzcitW2oynUClTBUBgNVHR8E
# TTBLMEmgR6BFhkNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9N
# aWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3JsMGEGCCsGAQUFBwEBBFUwUzBR
# BggrBgEFBQcwAoZFaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0
# cy9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3J0MAwGA1UdEwEB/wQCMAAw
# DQYJKoZIhvcNAQELBQADggIBAJFkkzz+21rdOP2DeayTmrKJr3DK/NC2aKa+1TSl
# vaOVCWsqb1pcyqeLzUzCBuNCww5re19s/OESbO65iY3Ky7LquPeI8ZLWPugu8YRm
# 3s3rubr7d+GE0sx8NsOrkl4rfMpcweJ4grwFgrbvXDWEXvZBINlon7UIRsXB+oRH
# astYgbi5mV/1Y5s48vRHaErdlfJVPuyZ3cINFUM/FWMC2pQT17Qsc+76VR0JBC3W
# EHbj6bMkwNJ2881VAthRw2HuR+VSeDo4Qye+WDoq8YGo0wP1futayOCtQKv8ss8E
# E+PhNJhbojtwxKkrj4OspfPcUuna2bl0XFYWmMcK7Nd8ZF/yXEhOm1XQ+34d6KuA
# L3PvUm91X7Dp40jwMj1hMdpGi/p+SAOwzmeYMUw9+ZSaqrPDnDENSiiHCLayYN+E
# 3GMyo2Ha46Dhoop3jWnfMeTOIuY8hL5qiMeRg2WVHT3Y00UKThBnNo3XEf4zmpnx
# J4y/KDP+ntELIl52LLEQL5rzsGum6YRNxhySKbiimX9aj3zUFryeMk9WPgI1ACVG
# tflE5jeQ27eyOhdkwwYTOftQMhknSLXRbKe3q9FOraeYuORsBsyP+G29bnKPIZcs
# MkjsXy3N6HmJV/HYryosl9aaPejoITRumEuhwtt9zcVuCKwg/UY8nA2elYn6mwss
# 4NoRMIIHejCCBWKgAwIBAgIKYQ6Q0gAAAAAAAzANBgkqhkiG9w0BAQsFADCBiDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWlj
# cm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTEwHhcNMTEwNzA4
# MjA1OTA5WhcNMjYwNzA4MjEwOTA5WjB+MQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBTaWduaW5nIFBD
# QSAyMDExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAq/D6chAcLq3Y
# bqqCEE00uvK2WCGfQhsqa+laUKq4BjgaBEm6f8MMHt03a8YS2AvwOMKZBrDIOdUB
# FDFC04kNeWSHfpRgJGyvnkmc6Whe0t+bU7IKLMOv2akrrnoJr9eWWcpgGgXpZnbo
# MlImEi/nqwhQz7NEt13YxC4Ddato88tt8zpcoRb0RrrgOGSsbmQ1eKagYw8t00CT
# +OPeBw3VXHmlSSnnDb6gE3e+lD3v++MrWhAfTVYoonpy4BI6t0le2O3tQ5GD2Xuy
# e4Yb2T6xjF3oiU+EGvKhL1nkkDstrjNYxbc+/jLTswM9sbKvkjh+0p2ALPVOVpEh
# NSXDOW5kf1O6nA+tGSOEy/S6A4aN91/w0FK/jJSHvMAhdCVfGCi2zCcoOCWYOUo2
# z3yxkq4cI6epZuxhH2rhKEmdX4jiJV3TIUs+UsS1Vz8kA/DRelsv1SPjcF0PUUZ3
# s/gA4bysAoJf28AVs70b1FVL5zmhD+kjSbwYuER8ReTBw3J64HLnJN+/RpnF78Ic
# V9uDjexNSTCnq47f7Fufr/zdsGbiwZeBe+3W7UvnSSmnEyimp31ngOaKYnhfsi+E
# 11ecXL93KCjx7W3DKI8sj0A3T8HhhUSJxAlMxdSlQy90lfdu+HggWCwTXWCVmj5P
# M4TasIgX3p5O9JawvEagbJjS4NaIjAsCAwEAAaOCAe0wggHpMBAGCSsGAQQBgjcV
# AQQDAgEAMB0GA1UdDgQWBBRIbmTlUAXTgqoXNzcitW2oynUClTAZBgkrBgEEAYI3
# FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAf
# BgNVHSMEGDAWgBRyLToCMZBDuRQFTuHqp8cx0SOJNDBaBgNVHR8EUzBRME+gTaBL
# hklodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNS
# b29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3JsMF4GCCsGAQUFBwEBBFIwUDBOBggr
# BgEFBQcwAoZCaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNS
# b29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3J0MIGfBgNVHSAEgZcwgZQwgZEGCSsG
# AQQBgjcuAzCBgzA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9kb2NzL3ByaW1hcnljcHMuaHRtMEAGCCsGAQUFBwICMDQeMiAdAEwA
# ZQBnAGEAbABfAHAAbwBsAGkAYwB5AF8AcwB0AGEAdABlAG0AZQBuAHQALiAdMA0G
# CSqGSIb3DQEBCwUAA4ICAQBn8oalmOBUeRou09h0ZyKbC5YR4WOSmUKWfdJ5DJDB
# ZV8uLD74w3LRbYP+vj/oCso7v0epo/Np22O/IjWll11lhJB9i0ZQVdgMknzSGksc
# 8zxCi1LQsP1r4z4HLimb5j0bpdS1HXeUOeLpZMlEPXh6I/MTfaaQdION9MsmAkYq
# wooQu6SpBQyb7Wj6aC6VoCo/KmtYSWMfCWluWpiW5IP0wI/zRive/DvQvTXvbiWu
# 5a8n7dDd8w6vmSiXmE0OPQvyCInWH8MyGOLwxS3OW560STkKxgrCxq2u5bLZ2xWI
# UUVYODJxJxp/sfQn+N4sOiBpmLJZiWhub6e3dMNABQamASooPoI/E01mC8CzTfXh
# j38cbxV9Rad25UAqZaPDXVJihsMdYzaXht/a8/jyFqGaJ+HNpZfQ7l1jQeNbB5yH
# PgZ3BtEGsXUfFL5hYbXw3MYbBL7fQccOKO7eZS/sl/ahXJbYANahRr1Z85elCUtI
# EJmAH9AAKcWxm6U/RXceNcbSoqKfenoi+kiVH6v7RyOA9Z74v2u3S5fi63V4Guzq
# N5l5GEv/1rMjaHXmr/r8i+sLgOppO6/8MO0ETI7f33VtY5E90Z1WTk+/gFcioXgR
# MiF670EKsT/7qMykXcGhiJtXcVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQ
# zTGCGiUwghohAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEC
# EzMAAAQ4THAXx1OE9PMAAAAABDgwDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcN
# AQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUw
# LwYJKoZIhvcNAQkEMSIEIAdw82rDVtTm4CrBkTHk8JMtHyr0oV1qaHltT3DHFJbW
# MEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEAqWV6TvMwg8B9
# tntcUyArDlPM+M4JI0RaznkHB5VdpDa1dAASAzYptrS4xiPwem+gGOwpH+we0i0H
# aL4ToI5UhfDvlp1WBB+qWHU58e9CsoM9Se43nbHyFNKdOR440bJbFGm06nCKhZYb
# Zxoneh+J9J6GLgUQKhmkWn7wnlh23oCSPDwR6To12JnHRPrZLxBoN+38SGqlV4KB
# 07gCEAAFWaz3BIdAZ6ucogVTvCqM8Zk+XTT6cx+5hqfIU2XiE2PLik0kKJtFcKtu
# hVz9C0Kee1ZxfW3CIUsj2uVMgwlhR6kBS998P83RPG1t4WtlqP9XPgpBBCDFK1u+
# 8QDgRlAEyaGCF68wgherBgorBgEEAYI3AwMBMYIXmzCCF5cGCSqGSIb3DQEHAqCC
# F4gwgheEAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFZBgsqhkiG9w0BCRABBKCCAUgE
# ggFEMIIBQAIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQCAQUABCA2JgbUmIXT
# zTeiuxkoGO3xalu5q5XUWJ0HGnix9EqJ8wIGaC4/K6axGBIyMDI1MDYwNTE0NDIz
# OS43OFowBIACAfSggdmkgdYwgdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMg
# TGltaXRlZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjU3MUEtMDVFMC1EOTQ3
# MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloIIR/jCCBygw
# ggUQoAMCAQICEzMAAAH7y8tsN2flMJUAAQAAAfswDQYJKoZIhvcNAQELBQAwfDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWlj
# cm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwHhcNMjQwNzI1MTgzMTEzWhcNMjUx
# MDIyMTgzMTEzWjCB0zELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVk
# MScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046NTcxQS0wNUUwLUQ5NDcxJTAjBgNV
# BAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQCowlZB5YCrgvC9KNiyM/RS+G+bSPRoA4mIwuDSwt/E
# qhNcB0oPqgy6rmsXmgSI7FX72jHQf3lDx+GhmrfH2XGC5nJM4riXbG1yC0kK2NdG
# WUzZtOmM6DflFSsHLRwCWgFT0YkGzssE2txsfqsGI6+oNA2Jw9FnCrXrHKMyJ1TU
# nUAm5q33Iufu1qJ+gPnxuVgRwG+SPl0fWVr3NTzjpAN46hE7o1yocuwPHz/NUpnE
# /fSZbpjtEyyq0HxwYKAbBVW6s6do0tezfWpNFPJUdfymk52hKKEJd6p5uAkJHMbz
# Mb97+TShoGMUUaX7y4UQvALKHjAr1nn5rNPN9rYYPinqKG2yRezeWdbTlQp8MmEA
# AO3q+I5zRGT9zzM6KrOHSUql/95ZRjaj+G9wM9k2Atoe/J8OpvwBZoq87fqJFlJe
# qFLDxLEmjRMKmxsKOa3HQukeeptvVQXtyrT2QJx9ZMM9w3XaltgupyTRsgh88ptz
# seeuQ1CSz+ZJtVlOcPJPc7zMX2rgMJ9Z6xKvVqTJwN24bEJ0oG+C0mHVjEOrWyRP
# B5jHmIBZecHsozKWzdZBltO5tMIsu3xefy36yVwqbkOS+hu5uYdKuK5MDfBPIjLg
# XFqZMqbRUO72ZZ2zwy2NRIlXA1VWUFdpDdkxxWOKPJWhQ1W4Fj0xzBhwhArrbBDb
# QQIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFEdVIZhQ1DdHA6XvXMgC5SMgqDUqMB8G
# A1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8GA1UdHwRYMFYwVKBSoFCG
# Tmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUy
# MFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBsBggrBgEFBQcBAQRgMF4w
# XAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY2Vy
# dHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3J0MAwG
# A1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQD
# AgeAMA0GCSqGSIb3DQEBCwUAA4ICAQDDOggo5jZ2dSN9a4yIajP+i+hzV7zpXBZp
# k0V2BGY6hC5F7ict21k421Mc2TdKPeeTIGzPPFJtkRDQN27Ioccjk/xXzuMW20ae
# VHTA8/bYUB5tu8Bu62QwxVAwXOFUFaJYPRUCe73HR+OJ8soMBVcvCi6fmsIWrBtq
# xcVzsf/QM+IL4MGfe1TF5+9zFQLKzj4MLezwJintZZelnxZv+90GEOWIeYHulZya
# wHze5zj8/YaYAjccyQ4S7t8JpJihCGi5Y6vTuX8ozhOd3KUiKubx/ZbBdBwUTOZS
# 8hIzqW51TAaVU19NMlSrZtMMR3e2UMq1X0BRjeuucXAdPAmvIu1PggWG+AF80PeY
# vV55JqQp/vFMgjgnK3XlJeEd3mgj9caNKDKSAmtYDnusacALuu7f9lsU0Iwr8mPp
# fxfgvqYE5hrY0YrAfgDftgYOt5wn+pddZRi98tiocZ/xOFiXXZiDWvBIqlYuiUD8
# HV6oHDhNFy9VjQi802Lmyb7/8cn0DDo0m5H+4NHtfu8NeJylcyVE2AUzIANvwAUi
# 9A90epxGlGitj5hQaW/N4nH/aA1jJ7MCiRusWEAKwnYF/J4vIISjoC7AQefnXU8o
# Tx0rgm+WYtKgePtUVHc0cOTfNGTHQTGSYXxo52m+gqG7AELGhn8mFvNLOu9nvgZW
# MoojK3kUDTCCB3EwggVZoAMCAQICEzMAAAAVxedrngKbSZkAAAAAABUwDQYJKoZI
# hvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
# DgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24x
# MjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmljYXRlIEF1dGhvcml0eSAy
# MDEwMB4XDTIxMDkzMDE4MjIyNVoXDTMwMDkzMDE4MzIyNVowfDELMAkGA1UEBhMC
# VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgUENBIDIwMTAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoIC
# AQDk4aZM57RyIQt5osvXJHm9DtWC0/3unAcH0qlsTnXIyjVX9gF/bErg4r25Phdg
# M/9cT8dm95VTcVrifkpa/rg2Z4VGIwy1jRPPdzLAEBjoYH1qUoNEt6aORmsHFPPF
# dvWGUNzBRMhxXFExN6AKOG6N7dcP2CZTfDlhAnrEqv1yaa8dq6z2Nr41JmTamDu6
# GnszrYBbfowQHJ1S/rboYiXcag/PXfT+jlPP1uyFVk3v3byNpOORj7I5LFGc6XBp
# Dco2LXCOMcg1KL3jtIckw+DJj361VI/c+gVVmG1oO5pGve2krnopN6zL64NF50Zu
# yjLVwIYwXE8s4mKyzbnijYjklqwBSru+cakXW2dg3viSkR4dPf0gz3N9QZpGdc3E
# XzTdEonW/aUgfX782Z5F37ZyL9t9X4C626p+Nuw2TPYrbqgSUei/BQOj0XOmTTd0
# lBw0gg/wEPK3Rxjtp+iZfD9M269ewvPV2HM9Q07BMzlMjgK8QmguEOqEUUbi0b1q
# GFphAXPKZ6Je1yh2AuIzGHLXpyDwwvoSCtdjbwzJNmSLW6CmgyFdXzB0kZSU2LlQ
# +QuJYfM2BjUYhEfb3BvR/bLUHMVr9lxSUV0S2yW6r1AFemzFER1y7435UsSFF5PA
# PBXbGjfHCBUYP3irRbb1Hode2o+eFnJpxq57t7c+auIurQIDAQABo4IB3TCCAdkw
# EgYJKwYBBAGCNxUBBAUCAwEAATAjBgkrBgEEAYI3FQIEFgQUKqdS/mTEmr6CkTxG
# NSnPEP8vBO4wHQYDVR0OBBYEFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMFwGA1UdIARV
# MFMwUQYMKwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTATBgNVHSUEDDAK
# BggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMC
# AYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvX
# zpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20v
# cGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcmwwWgYI
# KwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDANBgkqhkiG
# 9w0BAQsFAAOCAgEAnVV9/Cqt4SwfZwExJFvhnnJL/Klv6lwUtj5OR2R4sQaTlz0x
# M7U518JxNj/aZGx80HU5bbsPMeTCj/ts0aGUGCLu6WZnOlNN3Zi6th542DYunKmC
# VgADsAW+iehp4LoJ7nvfam++Kctu2D9IdQHZGN5tggz1bSNU5HhTdSRXud2f8449
# xvNo32X2pFaq95W2KFUn0CS9QKC/GbYSEhFdPSfgQJY4rPf5KYnDvBewVIVCs/wM
# nosZiefwC2qBwoEZQhlSdYo2wh3DYXMuLGt7bj8sCXgU6ZGyqVvfSaN0DLzskYDS
# PeZKPmY7T7uG+jIa2Zb0j/aRAfbOxnT99kxybxCrdTDFNLB62FD+CljdQDzHVG2d
# Y3RILLFORy3BFARxv2T5JL5zbcqOCb2zAVdJVGTZc9d/HltEAY5aGZFrDZ+kKNxn
# GSgkujhLmm77IVRrakURR6nxt67I6IleT53S0Ex2tVdUCbFpAUR+fKFhbHP+Crvs
# QWY9af3LwUFJfn6Tvsv4O+S3Fb+0zj6lMVGEvL8CwYKiexcdFYmNcP7ntdAoGokL
# jzbaukz5m/8K6TT4JDVnK+ANuOaMmdbhIurwJ0I9JZTmdHRbatGePu1+oDEzfbzL
# 6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNTTY3ugm2lBRDBcQZqELQdVTNYs6FwZvKhggNZ
# MIICQQIBATCCAQGhgdmkgdYwgdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMg
# TGltaXRlZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjU3MUEtMDVFMC1EOTQ3
# MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMKAQEwBwYF
# Kw4DAhoDFQAEcefs0Ia6xnPZF9VvK7BjA/KQFaCBgzCBgKR+MHwxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBU
# aW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUAAgUA6+vZ+zAiGA8yMDI1
# MDYwNTA4NTUyM1oYDzIwMjUwNjA2MDg1NTIzWjB3MD0GCisGAQQBhFkKBAExLzAt
# MAoCBQDr69n7AgEAMAoCAQACAiXCAgH/MAcCAQACAhKyMAoCBQDr7St7AgEAMDYG
# CisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAIAgEA
# AgMBhqAwDQYJKoZIhvcNAQELBQADggEBAIjiUZcaA4BDi1HVU2gwyRh/wjtc/o1X
# W0U56+91We/LZNVABaluOx5whcG7gkYy8FOyn1J0tWMgL6nyNNkh6a/BwBbM5dob
# E24tWTni5VecsmBBbeTwVIH+EC98JLYiqqUav9HQcH8lOKx3aUmANCPUzLIn2LCO
# S4E6NSR0j5N/MjKAOl4KkHruH0IPZiNblytclfMZaGS6bQcTA30YYZtU3zQELHJP
# aCYkcRGXdd8hBTaTZoU/t9/GTuFSddLRH81URlJjOyjYUbtl+Z11oqI/WvPkzeFZ
# UNDR5kid+wYlWeYwi+1gJFEb7aB5at3joJiPXF5YFpGYzQ+DOaAsHHoxggQNMIIE
# CQIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
# A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYw
# JAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAfvLy2w3
# Z+UwlQABAAAB+zANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqG
# SIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCB/fezWBSz2LfkyCE8dGsQHvYup0C/I
# S1w6bhxGG+YJezCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EIDnbAqv8oIWV
# U1iJawIuwHiqGMRgQ/fEepioO7VJJOUYMIGYMIGApH4wfDELMAkGA1UEBhMCVVMx
# EzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoT
# FU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUt
# U3RhbXAgUENBIDIwMTACEzMAAAH7y8tsN2flMJUAAQAAAfswIgQgFXLVUXJ+mFWE
# m6SpuADkuENVF0m5UP+zQbmGJ8MhdqgwDQYJKoZIhvcNAQELBQAEggIAmOiyKPWF
# /wo6E6mHpd7C0m9wlcH+uSth2Vq75orLlSRhpykP6uV7hK51XqO37OseX7Et0WUa
# NM+fSCxsaG30P5DavS5ON5hU0cplHOPIjTMVPfTSbhq8Scg2BIhb0C7GnUCS2hiy
# R1lqNh1cX9hrW2SZ9v0GLc5PyS3UN3qRyBKslPRZ2XIZy8oI5claog/gek0fqdcJ
# A2Mfls8avpm4bPtw/401WWXc424TIi3vvLeuz7rPYzb28BeJqBkr6dcGl5YkrWEc
# bcAESXmj9xOuz3pHtpxezUhUtflf0qsJicvWK5gTXioJND9FzFioB6LHko4nYU0j
# L0DSQMuwYNIkv7xsymy5oQ9lelai63wIr00Ekelh8FXPQlmpdOnWExyR3U2N2yBT
# 9Jqxe4LlWf9eKGk79JRBwZz+buRENLRM+jHjFocSaL9OhDRrS+kpAUNiOTc+pgtO
# vIZ+kCxH1lJQqw9hVY7mZCHhyfTp4o8F1RaKXjytstoR2gBvXiCuQsIhOXjELs9q
# Y0EynDNXzFpjpecfrGfPrdR9oTPFZhqpDnSjdG4J8pQZwm+gvgHARUWb7SCoycei
# kzSVUukR60Q3XCSdImB9BG5fk5eiVdlSdAQAnutaAefe7gH3t9hykBMDJGEktkly
# xR06qyRSkY4wiqU3lrwQleYxb3wjV2WW5bo=
# SIG # End signature block
