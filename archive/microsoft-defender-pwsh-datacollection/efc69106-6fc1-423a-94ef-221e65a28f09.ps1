﻿# Remove pre loaded modules to mitigate exploit
Get-Module | ForEach-Object { Remove-Module -Name $_.Name -Force }
$PSModuleAutoloadingPreference = 'none'
Import-Module -Name 'CimCmdlets'
Import-Module -Name 'Microsoft.PowerShell.Utility'

$EtwWriter = @"
using System;
using System.Text;
using System.Diagnostics.Tracing;
using Microsoft.PowerShell.Commands;

[EventSource(Name = "Microsoft.Windows.NdrCollector", Guid = "ac39453b-eb9e-463f-b8ff-9c1a08b5931b")]
public sealed class SenseEventSource : EventSource
{
    public SenseEventSource() : base(EventSourceSettings.EtwSelfDescribingEventFormat | EventSourceSettings.ThrowOnEventWriteErrors) { }
}

public static class EtwProvider
{
    public static EventSource log = new SenseEventSource();
}

[EventData]
public class ModelCollectorNdrScannerEvent
{
    public string Model { get; set; }
    public string Vendor { get; set; }
    public string NetworkInfoAsJson { get; set; }
    public string ComputerInfoAsJson { get; set; }
    public string Fqdn { get; set; }
}
"@

Add-Type -TypeDefinition $EtwWriter -Language CSharp -IgnoreWarnings
$global:EtwCollectorProvider =  [EtwProvider]::log

try {
    $ModelAndVendor= Get-CimInstance Win32_ComputerSystem | Select-Object Manufacturer,SystemFamily,HypervisorPresent,Model,PCSystemType,DNSHostName,Domain -Unique -First 1
}
catch {
    exit
}

if($ModelAndVendor.PCSystemType -eq 1)
{
    $DeviceType = "Desktop"
}
else
{
    $DeviceType = "Laptop"
}

if($ModelAndVendor.Model -eq "Virtual Machine")
{
    $Model = $ModelAndVendor.Model
}
else
{
    $Model = $DeviceType + ": " + $ModelAndVendor.SystemFamily
}

$NetworkInterfaces = @()
$NetworkInterfacesTeaming = @()

try {
    $NetworkInterfaces = @(Get-NetAdapter | Select-Object Name, InterfaceDescription, MacAddress, InterfaceType, PhysicalMediaType)
    $NetworkInterfacesTeaming = @(Get-NetLbfoTeam)
}
catch {}

$NetworkData = New-Object psobject @{
NetworkInterfaces = $NetworkInterfaces
NicTeamInfo = $NetworkInterfacesTeaming
} | ConvertTo-Json -Compress

try {
    $OsInfo = Get-CimInstance -class Win32_OperatingSystem | Select-Object Caption,Version,OSArchitecture,LastBootUptime
    $ProcessorInfo = Get-CimInstance Win32_Processor | Select-Object ProcessorId, DeviceId, Name, Description, NumberOfLogicalProcessors, Manufacturer
}
catch {}

$ComputerInfo = New-Object psobject @{
    OsInfo = $OsInfo
    ProcessorInfo = $ProcessorInfo
    } | ConvertTo-Json -Compress

$Fqdn = $ModelAndVendor.DNSHostName + "." + $ModelAndVendor.Domain

$etw = New-Object "ModelCollectorNdrScannerEvent" -Property @{
    Vendor = $ModelAndVendor.Manufacturer
    Model = $Model
    NetworkInfoAsJson = $NetworkData
    ComputerInfoAsJson = $ComputerInfo
    Fqdn = $Fqdn
}

$global:EtwCollectorProvider.Write("ModelCollectorNdrScannerEvent", $etw)
# SIG # Begin signature block
# MIIoZwYJKoZIhvcNAQcCoIIoWDCCKFQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBhfdBHeeupa/Gj
# +xh3/rv2/ZeZTkrMv/pp211nqW0L86CCDZcwggYVMIID/aADAgECAhMzAAAEOExw
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
# LwYJKoZIhvcNAQkEMSIEIEdlGD2HbMrTKIPdVANTIBngSr3n5Q6opqN5ytDE0Z+3
# MEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEALylr3tcZieHu
# ongTpdUWD1RK0Zxso9ZyF104jH3PY6GhsaIxcaJKC0mqbsgsk53zC4ZNsxPwuIYH
# 6IVkyj89eFrGLTrOL7SXUknU81E4mMvvkj9BLDemM88Z9CKvjhE0DvPG5GI6RSe6
# 5B1HZfN1CyCwz5EPmG/7ufXaQmHdclIkB2ki8lIdjv2Y6gmu+vESyTmlMEH1DDsn
# yCsAEKcE+tkeFqwSyjN53p+EBSo6/8ZnyiTGfahCkbZb60Pf25AImr00rhoyXyox
# ZeEQhxcPDCvsP1nLhyc+NzIMf0mA489kW0TAC4H0teBfZZBUbHQkP7HWbJE17lvL
# 1s9Xmr1G3KGCF7AwghesBgorBgEEAYI3AwMBMYIXnDCCF5gGCSqGSIb3DQEHAqCC
# F4kwgheFAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkE
# ggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQCAQUABCAvc6DTYr9A
# GCvOxq72bOpEKFeSE1+tQwKFlUoZVZfJnQIGaC4/K6aIGBMyMDI1MDYwNTE0NDIz
# OC4wMTlaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo1NzFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCEf4wggco
# MIIFEKADAgECAhMzAAAB+8vLbDdn5TCVAAEAAAH7MA0GCSqGSIb3DQEBCwUAMHwx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1p
# Y3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTI0MDcyNTE4MzExM1oXDTI1
# MTAyMjE4MzExM1owgdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjU3MUEtMDVFMC1EOTQ3MSUwIwYD
# VQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEAqMJWQeWAq4LwvSjYsjP0Uvhvm0j0aAOJiMLg0sLf
# xKoTXAdKD6oMuq5rF5oEiOxV+9ox0H95Q8fhoZq3x9lxguZyTOK4l2xtcgtJCtjX
# RllM2bTpjOg35RUrBy0cAloBU9GJBs7LBNrcbH6rBiOvqDQNicPRZwq16xyjMidU
# 1J1AJuat9yLn7taifoD58blYEcBvkj5dH1la9zU846QDeOoRO6NcqHLsDx8/zVKZ
# xP30mW6Y7RMsqtB8cGCgGwVVurOnaNLXs31qTRTyVHX8ppOdoSihCXeqebgJCRzG
# 8zG/e/k0oaBjFFGl+8uFELwCyh4wK9Z5+azTzfa2GD4p6ihtskXs3lnW05UKfDJh
# AADt6viOc0Rk/c8zOiqzh0lKpf/eWUY2o/hvcDPZNgLaHvyfDqb8AWaKvO36iRZS
# XqhSw8SxJo0TCpsbCjmtx0LpHnqbb1UF7cq09kCcfWTDPcN12pbYLqck0bIIfPKb
# c7HnrkNQks/mSbVZTnDyT3O8zF9q4DCfWesSr1akycDduGxCdKBvgtJh1YxDq1sk
# TweYx5iAWXnB7KMyls3WQZbTubTCLLt8Xn8t+slcKm5DkvobubmHSriuTA3wTyIy
# 4FxamTKm0VDu9mWds8MtjUSJVwNVVlBXaQ3ZMcVjijyVoUNVuBY9McwYcIQK62wQ
# 20ECAwEAAaOCAUkwggFFMB0GA1UdDgQWBBRHVSGYUNQ3RwOl71zIAuUjIKg1KjAf
# BgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQ
# hk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQl
# MjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBe
# MFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2Nl
# cnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAM
# BgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQE
# AwIHgDANBgkqhkiG9w0BAQsFAAOCAgEAwzoIKOY2dnUjfWuMiGoz/ovoc1e86VwW
# aZNFdgRmOoQuRe4nLdtZONtTHNk3Sj3nkyBszzxSbZEQ0DduyKHHI5P8V87jFttG
# nlR0wPP22FAebbvAbutkMMVQMFzhVBWiWD0VAnu9x0fjifLKDAVXLwoun5rCFqwb
# asXFc7H/0DPiC+DBn3tUxefvcxUCys4+DC3s8CYp7WWXpZ8Wb/vdBhDliHmB7pWc
# msB83uc4/P2GmAI3HMkOEu7fCaSYoQhouWOr07l/KM4TndylIirm8f2WwXQcFEzm
# UvISM6ludUwGlVNfTTJUq2bTDEd3tlDKtV9AUY3rrnFwHTwJryLtT4IFhvgBfND3
# mL1eeSakKf7xTII4Jyt15SXhHd5oI/XGjSgykgJrWA57rGnAC7ru3/ZbFNCMK/Jj
# 6X8X4L6mBOYa2NGKwH4A37YGDrecJ/qXXWUYvfLYqHGf8ThYl12Yg1rwSKpWLolA
# /B1eqBw4TRcvVY0IvNNi5sm+//HJ9Aw6NJuR/uDR7X7vDXicpXMlRNgFMyADb8AF
# IvQPdHqcRpRorY+YUGlvzeJx/2gNYyezAokbrFhACsJ2BfyeLyCEo6AuwEHn511P
# KE8dK4JvlmLSoHj7VFR3NHDk3zRkx0ExkmF8aOdpvoKhuwBCxoZ/JhbzSzrvZ74G
# VjKKIyt5FA0wggdxMIIFWaADAgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqG
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
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo1NzFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcG
# BSsOAwIaAxUABHHn7NCGusZz2RfVbyuwYwPykBWggYMwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsFAAIFAOvr2fswIhgPMjAy
# NTA2MDUwODU1MjNaGA8yMDI1MDYwNjA4NTUyM1owdzA9BgorBgEEAYRZCgQBMS8w
# LTAKAgUA6+vZ+wIBADAKAgEAAgIlwgIB/zAHAgEAAgISsjAKAgUA6+0rewIBADA2
# BgorBgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIB
# AAIDAYagMA0GCSqGSIb3DQEBCwUAA4IBAQCI4lGXGgOAQ4tR1VNoMMkYf8I7XP6N
# V1tFOevvdVnvy2TVQAWpbjsecIXBu4JGMvBTsp9SdLVjIC+p8jTZIemvwcAWzOXa
# GxNuLVk54uVXnLJgQW3k8FSB/hAvfCS2IqqlGr/R0HB/JTisd2lJgDQj1MyyJ9iw
# jkuBOjUkdI+TfzIygDpeCpB67h9CD2YjW5crXJXzGWhkum0HEwN9GGGbVN80BCxy
# T2gmJHERl3XfIQU2k2aFP7ffxk7hUnXS0R/NVEZSYzso2FG7ZfmddaKiP1rz5M3h
# WVDQ0eZInfsGJVnmMIvtYCRRG+2geWrd46CYj1xeWBaRmM0PgzmgLBx6MYIEDTCC
# BAkCAQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
# BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEm
# MCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAH7y8ts
# N2flMJUAAQAAAfswDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsq
# hkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQg6BZRyPVq2iGhP8YVNfC4mmOO1UdK
# 4e18gXS9qLAPPZkwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCA52wKr/KCF
# lVNYiWsCLsB4qhjEYEP3xHqYqDu1SSTlGDCBmDCBgKR+MHwxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1l
# LVN0YW1wIFBDQSAyMDEwAhMzAAAB+8vLbDdn5TCVAAEAAAH7MCIEIBVy1VFyfphV
# hJukqbgA5LhDVRdJuVD/s0G5hifDIXaoMA0GCSqGSIb3DQEBCwUABIICAEpDge8b
# kGWpY9wcgvpJTsAoc6UXT8RUcAlzYR37XHq/RhB/WuVdkkwbbs+PcH4qUQ3M6tTp
# cAQQ9tH77PHNo/hZDYrHSwq/dQiqi++sMgEeQWKO9guni09ttjd0UfHMx25D9GJN
# PpC67URfEDwd7qhZpOHvDrjTXqcVAbMbhSvHjKWL6ovKlXr59V61oJdjJAVGa1Ba
# ZzOn/ziVtYi6JlbarRgiJmeyG4e3L9UfjE50n/p9CiKyRpb6XOgbM8Ln4nB9cxYT
# DaRQmZ+g3ISH41TDLhU6OX+GfNFY5ThL5Of7f02h+WuKcLR9mFe83tzk9DEzz6pI
# WD+Ma5uroL6uRysUCTDoppSFXYoa5OloBuCEG/jRwrQUm5EQDtdqDjYesJUOCu7Y
# bFnO4L0u6FU13W9rHqu/osyTwk5uqm9r0qNpFL/mHZAgQ7UEEfB9mU3kB/kvxHFa
# EpIR0cmjOUb5kxaOLjayE9mPcdbSl8dCiFkZZ3r4YJddt9QPH1ym9n/8tQExyHPT
# Q2lnHtnrHtoiFMZAqw3iZ6Jb/Xll1c/QLynh/04YUhGsE8Iix+Hvel2fW7Mkuh37
# e1OlqGw54Pi/VrDWXG5aXxj0goCbRyLGBmWyKNXPEKVW+M0y2JJc3/tGk6vef8Df
# q+tY+4hbZ1qohUTTWjcDw9k0CaE0Dk9sr0tM
# SIG # End signature block
