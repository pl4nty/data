# Remove pre loaded modules to mitigate exploit
Get-Module | ForEach-Object { Remove-Module -Name $_.Name -Force }
$PSModuleAutoloadingPreference = 'none'

# Load modules
Import-Module -Name 'Microsoft.PowerShell.Management'
Import-Module -Name 'CimCmdlets'
Import-Module -Name 'Microsoft.PowerShell.Utility'

$global:BasePath = "HKLM:\SOFTWARE\Microsoft\Virtual Machine\Guest\Parameters"
try
{
    if(!$(Test-Path $global:BasePath -ErrorAction Stop))
    {
        exit 1000
    }
}
catch
{
    Write-Host "Error on Test-Path: $_"
    exit 1004
}

try
{
    $Model = Get-WmiObject Win32_ComputerSystem -ErrorAction Stop | Select-Object -ExpandProperty Model -Unique -First 1
    if($Model -ne "Virtual Machine")
    {
        Write-Host "Model is not VM"
        exit 1005
    }
}
catch
{
    Write-Host "Error on Get-WmiObject: $_"
    exit 1006
}

function Get-RegistryValue
{
    param([string]$KeyName)
    return $(Get-ItemProperty -Path $global:BasePath -Name $KeyName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $KeyName)
}

function Get-IPAddress()
{
    param([string]$Hostname)

    $Empty = @()
    if([string]::IsNullOrEmpty($Hostname))
    {
        return $Empty;
    }

    $DnsResult = $null
    try
    {
        $DnsResult = [System.Net.Dns]::GetHostEntry($Hostname).AddressList | Where-Object {$_.AddressFamily -eq "InterNetwork"}
    }
    catch 
    {
        return $Empty
    }

    if($DnsResult -eq $null)
    {
        return $Empty
    }

    return @($DnsResult | ForEach-Object {$_.ToString()})
}

function ConvertTo-JsonString
{
    param([string[]]$IpAddresses)

    if($IpAddresses.Count -eq 0)
    {
        return "[]"
    }

    return $("[`"" + $($IpAddresses -join "`",`"") + "`"]") # Avoiding ConvertTo-Json for efficiency and lower PS Versions

}

$EtwWriter = @"
using System;
using System.Text;
using System.Diagnostics.Tracing;
using Microsoft.PowerShell.Commands;

[EventSource(Name = "Microsoft.Windows.NdrCollector", Guid = "ac39453b-eb9e-463f-b8ff-9c1a08b5931b")]
public sealed class NdrCollectorEventSource : EventSource
{
    public NdrCollectorEventSource() : base(EventSourceSettings.EtwSelfDescribingEventFormat | EventSourceSettings.ThrowOnEventWriteErrors) { }
}

[EventData]
public class NdrCollectorVirtualMachineInfoEvent
{
    public string HostName { get; set; }
    public string PhysicalHostName { get; set; }
    public string PhysicalHostNameFullyQualified { get; set; }
    public string VirtualMachineId { get; set; }
    public string VirtualMachineName { get; set; }
    public string OsVersion { get; set; }
    public string IPAddresses { get; set; }
    public uint HostingSystemEditionId { get; set; }
}
"@

$HostName = Get-RegistryValue "HostName"
$PhysicalHostName = Get-RegistryValue "PhysicalHostName"
$PhysicalHostNameFullyQualified = Get-RegistryValue "PhysicalHostNameFullyQualified"

if([string]::IsNullOrEmpty($HostName) -and
    [string]::IsNullOrEmpty($PhysicalHostName) -and
    [string]::IsNullOrEmpty($PhysicalHostNameFullyQualified))
{
    Write-Host "Values are empty"
    exit 1002
}

$EditionId = Get-RegistryValue "HostingSystemEditionId"
if($EditionId -eq 168 -or $EditionId -eq 199)
{
    Write-Host "Azure VM"
    exit 1007
}

try
{
    Add-Type -TypeDefinition $EtwWriter -Language CSharp -IgnoreWarnings
}
catch
{
    [version]$InstalledDotNETVersion = Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -Recurse |
        Get-ItemProperty -Name Version -ErrorAction SilentlyContinue |
        Where-Object { $_.PSChildName -match '^(?!S)\p{L}'} |
        Select-Object -ExpandProperty Version | Sort-Object | Select-Object -Last 1

    Write-Host "Error on Add-Type: $_"
    Write-Host ".Net Version: $($InstalledDotNETVersion.ToString())"
    Write-Host "Powershell Version: $($PSVersionTable.PSVersion.ToString())"
    exit 1001
}

$OsMajor = Get-RegistryValue "HostingSystemOsMajor"
$OsMinor = Get-RegistryValue "HostingSystemOsMinor"

$VirtualMachineHostInfoEtw = New-Object "NdrCollectorVirtualMachineInfoEvent" -Property @{
    HostName = $HostName
    PhysicalHostName = $PhysicalHostName
    PhysicalHostNameFullyQualified = $PhysicalHostNameFullyQualified
    VirtualMachineId = Get-RegistryValue "VirtualMachineId"
    VirtualMachineName = Get-RegistryValue "VirtualMachineName"
    HostingSystemEditionId = $EditionId
    OsVersion = if(![string]::IsNullOrEmpty($OsMajor)) { "$OsMajor.$OsMinor"} else { $null }
}

try
{
    $NameToResolve = if(![string]::IsNullOrEmpty($VirtualMachineHostInfoEtw.PhysicalHostNameFullyQualified)) { $VirtualMachineHostInfoEtw.PhysicalHostNameFullyQualified } else { $VirtualMachineHostInfoEtw.HostName }
    $IPs = Get-IPAddress $NameToResolve
    $VirtualMachineHostInfoEtw.IPAddresses = ConvertTo-JsonString $IPs
}
catch 
{
    Write-Host "Error while resolving DNS: $_"
}

try
{
    $EtwProvider =  New-Object NdrCollectorEventSource # For .Net 4.6, use new-object instead [NdrCollectorEventSource]::new()
    $EtwProvider.Write("NdrCollectorVirtualMachineInfoEvent", $VirtualMachineHostInfoEtw)
}
catch
{
    Write-Host "Error while writing ETW: $_"
    exit 1003
}


# SIG # Begin signature block
# MIIoZwYJKoZIhvcNAQcCoIIoWDCCKFQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCH7rKfqJ60iaJ9
# B4ZcYj20M+5XeCPV8cyflWveoMK7xaCCDZcwggYVMIID/aADAgECAhMzAAAEOExw
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
# zTGCGiYwghoiAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEC
# EzMAAAQ4THAXx1OE9PMAAAAABDgwDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcN
# AQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUw
# LwYJKoZIhvcNAQkEMSIEIHH6nU9XFtH6nvqb2zMHhlx2HhvpFek00b6sl4bg2Sf9
# MEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEAerrLK8t3uCRL
# waIx3I3FsLPW0icWg3EvQ75JREPlIOg4cCE0tnw+GbbYFS2w4YlcQQyYZWUahp8w
# s4PT4it4ScWUJEtBwtB8alH7GUTVj/ygRjpDf2yuIO/TIlgcEtoMcJ0X1KwOVzDZ
# Kg5XZU5F7Doqst4wcx+MKxezSVVxKugnlcqT8SBzi3EFUC6RUd2sIzPNF2xbzhEx
# aFtI6T/WdjYC61MB3R1kwZvf2UV3CNfUHh19y3eEfGy3gKo6TpQreT8SU1Qps98E
# uy5gduN4m/VzX7aYyV+cKcDGVs8dsJXagpKzIX7qYzGwWkdeSm5MN9FgVnlJAl3w
# ykO9quRe9qGCF7AwghesBgorBgEEAYI3AwMBMYIXnDCCF5gGCSqGSIb3DQEHAqCC
# F4kwgheFAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkE
# ggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQCAQUABCCIMjPug6xL
# A9EJbY4tX1HWatHPnDHYw0ZK2+9jBw8QhQIGaC4KRnyWGBMyMDI1MDYwNTE0NDI0
# MC4xODRaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo0QzFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCEf4wggco
# MIIFEKADAgECAhMzAAAB/xI4fPfBZdahAAEAAAH/MA0GCSqGSIb3DQEBCwUAMHwx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1p
# Y3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTI0MDcyNTE4MzExOVoXDTI1
# MTAyMjE4MzExOVowgdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjRDMUEtMDVFMC1EOTQ3MSUwIwYD
# VQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEAyeiV0pB7bg8/qc/mkiDdJXnzJWPYgk9mTGeI3pzQ
# psyrRJREWcKYHd/9db+g3z4dU4VCkAZEXqvkxP5QNTtBG5Ipexpph4PhbiJKwvX+
# US4KkSFhf1wflDAY1tu9CQqhhxfHFV7vhtmqHLCCmDxhZPmCBh9/XfFJQIUwVZR8
# RtUkgzmN9bmWiYgfX0R+bDAnncUdtp1xjGmCpdBMygk/K0h3bUTUzQHb4kPf2ylk
# KPoWFYn2GNYgWw8PGBUO0vTMKjYD6pLeBP0hZDh5P3f4xhGLm6x98xuIQp/RFnzB
# bgthySXGl+NT1cZAqGyEhT7L0SdR7qQlv5pwDNerbK3YSEDKk3sDh9S60hLJNqP7
# 1iHKkG175HAyg6zmE5p3fONr9/fIEpPAlC8YisxXaGX4RpDBYVKpGj0FCZwisiZs
# xm0X9w6ZSk8OOXf8JxTYWIqfRuWzdUir0Z3jiOOtaDq7XdypB4gZrhr90KcPTDRw
# vy60zrQca/1D1J7PQJAJObbiaboi12usV8axtlT/dCePC4ndcFcar1v+fnClhs9u
# 3Fn6LkHDRZfNzhXgLDEwb6dA4y3s6G+gQ35o90j2i6amaa8JsV/cCF+iDSGzAxZY
# 1sQ1mrdMmzxfWzXN6sPJMy49tdsWTIgZWVOSS9uUHhSYkbgMxnLeiKXeB5MB9QMc
# OScCAwEAAaOCAUkwggFFMB0GA1UdDgQWBBTD+pXk/rT/d7E/0QE7hH0wz+6UYTAf
# BgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQ
# hk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQl
# MjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBe
# MFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2Nl
# cnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAM
# BgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQE
# AwIHgDANBgkqhkiG9w0BAQsFAAOCAgEAOSNN5MpLiyunm866frWIi0hdazKNLgRp
# 3WZPfhYgPC3K/DNMzLliYQUAp6WtgolIrativXjOG1lIjayG9r6ew4H1n5XZdDfJ
# 12DLjopap5e1iU/Yk0eutPyfOievfbsIzTk/G51+uiUJk772nVzau6hI2KGyGBJO
# vAbAVFR0g8ppZwLghT4z3mkGZjq/O4Z/PcmVGtjGps2TCtI4rZjPNW8O4c/4aJRm
# YQ/NdW91JRrOXRpyXrTKUPe3kN8N56jpl9kotLhdvd89RbOsJNf2XzqbAV7XjV4c
# aCglA2btzDxcyffwXhLu9HMU3dLYTAI91gTNUF7BA9q1EvSlCKKlN8N10Y4iU0ny
# IkfpRxYyAbRyq5QPYPJHGA0Ty0PD83aCt79Ra0IdDIMSuwXlpUnyIyxwrDylgfOG
# yysWBwQ/js249bqQOYPdpyOdgRe8tXdGrgDoBeuVOK+cRClXpimNYwr61oZ2/kPM
# zVrzRUYMkBXe9WqdSezh8tytuulYYcRK95qihF0irQs6/WOQJltQX79lzFXE9FFl
# n9Mix0as+C4HPzd+S0bBN3A3XRROwAv016ICuT8hY1InyW7jwVmN+OkQ1zei66Lr
# U5RtAz0nTxx5OePyjnTaItTSY4OGuGU1SXaH49JSP3t8yGYA/vorbW4VneeD721F
# gwaJToHFkOIwggdxMIIFWaADAgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqG
# SIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkg
# MjAxMDAeFw0yMTA5MzAxODIyMjVaFw0zMDA5MzAxODMyMjVaMHwxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBU
# aW1lLVN0YW1wIFBDQSAyMDEwMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
# AgEA5OGmTOe0ciELeaLL1yR5vQ7VgtP97pwHB9KpbE51yMo1V/YBf2xK4OK9uT4X
# YDP/XE/HZveVU3Fa4n5KWv64NmeFRiMMtY0Tz3cywBAY6GB9alKDRLemjkZrBxTz
# xXb1hlDcwUTIcVxRMTegCjhuje3XD9gmU3w5YQJ6xKr9cmmvHaus9ja+NSZk2pg7
# uhp7M62AW36MEBydUv626GIl3GoPz130/o5Tz9bshVZN7928jaTjkY+yOSxRnOlw
# aQ3KNi1wjjHINSi947SHJMPgyY9+tVSP3PoFVZhtaDuaRr3tpK56KTesy+uDRedG
# bsoy1cCGMFxPLOJiss254o2I5JasAUq7vnGpF1tnYN74kpEeHT39IM9zfUGaRnXN
# xF803RKJ1v2lIH1+/NmeRd+2ci/bfV+AutuqfjbsNkz2K26oElHovwUDo9Fzpk03
# dJQcNIIP8BDyt0cY7afomXw/TNuvXsLz1dhzPUNOwTM5TI4CvEJoLhDqhFFG4tG9
# ahhaYQFzymeiXtcodgLiMxhy16cg8ML6EgrXY28MyTZki1ugpoMhXV8wdJGUlNi5
# UPkLiWHzNgY1GIRH29wb0f2y1BzFa/ZcUlFdEtsluq9QBXpsxREdcu+N+VLEhReT
# wDwV2xo3xwgVGD94q0W29R6HXtqPnhZyacaue7e3PmriLq0CAwEAAaOCAd0wggHZ
# MBIGCSsGAQQBgjcVAQQFAgMBAAEwIwYJKwYBBAGCNxUCBBYEFCqnUv5kxJq+gpE8
# RjUpzxD/LwTuMB0GA1UdDgQWBBSfpxVdAF5iXYP05dJlpxtTNRnpcjBcBgNVHSAE
# VTBTMFEGDCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wEwYDVR0lBAww
# CgYIKwYBBQUHAwgwGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQD
# AgGGMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAU1fZWy4/oolxiaNE9lJBb
# 186aGMQwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29t
# L3BraS9jcmwvcHJvZHVjdHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3JsMFoG
# CCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcnQwDQYJKoZI
# hvcNAQELBQADggIBAJ1VffwqreEsH2cBMSRb4Z5yS/ypb+pcFLY+TkdkeLEGk5c9
# MTO1OdfCcTY/2mRsfNB1OW27DzHkwo/7bNGhlBgi7ulmZzpTTd2YurYeeNg2Lpyp
# glYAA7AFvonoaeC6Ce5732pvvinLbtg/SHUB2RjebYIM9W0jVOR4U3UkV7ndn/OO
# PcbzaN9l9qRWqveVtihVJ9AkvUCgvxm2EhIRXT0n4ECWOKz3+SmJw7wXsFSFQrP8
# DJ6LGYnn8AtqgcKBGUIZUnWKNsIdw2FzLixre24/LAl4FOmRsqlb30mjdAy87JGA
# 0j3mSj5mO0+7hvoyGtmW9I/2kQH2zsZ0/fZMcm8Qq3UwxTSwethQ/gpY3UA8x1Rt
# nWN0SCyxTkctwRQEcb9k+SS+c23Kjgm9swFXSVRk2XPXfx5bRAGOWhmRaw2fpCjc
# ZxkoJLo4S5pu+yFUa2pFEUep8beuyOiJXk+d0tBMdrVXVAmxaQFEfnyhYWxz/gq7
# 7EFmPWn9y8FBSX5+k77L+DvktxW/tM4+pTFRhLy/AsGConsXHRWJjXD+57XQKBqJ
# C4822rpM+Zv/Cuk0+CQ1ZyvgDbjmjJnW4SLq8CdCPSWU5nR0W2rRnj7tfqAxM328
# y+l7vzhwRNGQ8cirOoo6CGJ/2XBjU02N7oJtpQUQwXEGahC0HVUzWLOhcGbyoYID
# WTCCAkECAQEwggEBoYHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo0QzFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcG
# BSsOAwIaAxUAqROMbMS8JcUlcnPkwRLFRPXFspmggYMwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsFAAIFAOvrpRIwIhgPMjAy
# NTA2MDUwNTA5MzhaGA8yMDI1MDYwNjA1MDkzOFowdzA9BgorBgEEAYRZCgQBMS8w
# LTAKAgUA6+ulEgIBADAKAgEAAgIDpQIB/zAHAgEAAgIS7TAKAgUA6+z2kgIBADA2
# BgorBgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIB
# AAIDAYagMA0GCSqGSIb3DQEBCwUAA4IBAQCCQjJOd3/flPDTlcveKbTR8cG7OFb5
# pSsZYi/Np3FtaUUXcgeiOgTihn/ElMEncDFjOXyZYzTU1eHOPZDTrqo5NXycw39r
# fZSskPtU4uct8yfJLp+SCN5akxazE8TEEFCKP36z9xhmPWzbCYaPuFsR7A2MDilR
# JKS4jdfJQFBNdFW5P3pkbFPb1dOivVVMS3rBE0sqKszCGRzOvYMQORP4wlzCpfZT
# qC765wS9l9l1qd2I32SgK7SYNZqlp4b60P4JxiNPwEAGuZpEgTA/y0N+Nx0brrTY
# mqlGyi7ULsFHpl0MyAtaugEKfJQnChvqNY+EAKGqOmW9et5tHnVxtioeMYIEDTCC
# BAkCAQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
# BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEm
# MCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAH/Ejh8
# 98Fl1qEAAQAAAf8wDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsq
# hkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgWVqROPAF0AXpbsdayKOPdcj4lE8K
# iYFymd+2irvfJ7owgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCDkMu++yQJ3
# aaycIuMT6vA7JNuMaVOI3qDjSEV8upyn/TCBmDCBgKR+MHwxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1l
# LVN0YW1wIFBDQSAyMDEwAhMzAAAB/xI4fPfBZdahAAEAAAH/MCIEIIOGJnZ7Lww9
# TsTS1J/I0Sui/6OgSCWBPj3I9XTXzXF+MA0GCSqGSIb3DQEBCwUABIICACApl/bU
# hsQxuK6Z9cfVbB9HS1+rfjWbAbswabjnQdb/RMrUcIxTJB7nntMf9lcDFfpsniTL
# 3CL8jZMbiTbLNCj2dyUAQDT6/qHhh137rYTORxJLeLPd6inro3Ov4+yIirRrRr7u
# CATWZ+zVp1e3rFqUEiEDEvrmEvWhzuFf+BFd4+/eVjIfyxvB5b96YqkdrsUST57k
# A1VLeQ7hnU8m7i1UuHn8tstkPIH+YkXrN6nRA79HVG2y0jSRKvsKHUCGeKna4i0A
# Y3BO0rGlnFrupHnipxTlinflIl+qVWpM4mFPPl4FEYVQG25ZFASdk/a8z/8GmU3w
# vKjGtmLn4iqftI6WpLv1Xms+RzZnJcjbwOs9hnrETaQp0FHykmWRstdZeWdNAKhA
# bZaGzk7imK1Iv9fa6ZzJ52mgdPyTyokVOScO4Syp3YOK5OiVz2ZRVojtm4mv9O5T
# pGqOrPyRYoZnuaurmRaaqGnEUlfvQMryuhykOssfe3QLPscm7+6VF+z8zrVHSnTN
# 01jpmY3oY/PaE4C583Dl1uqyE1FD0Ja+cWvpn0gdmb4TzKwNCJPgw0IfQWhhjjK3
# Ls3mL4vsvBSpcDRU1YKz7ZeRLkvafsyBs0gjAbiCi5rjDYy1WKrGsXCl+ofpIPfJ
# 2BEv7PjUnGSjk8P8Djmq1FmKGOLIVnWP7PtB
# SIG # End signature block
