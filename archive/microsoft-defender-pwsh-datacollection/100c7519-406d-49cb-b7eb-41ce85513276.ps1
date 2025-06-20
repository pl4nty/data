$PSModuleAutoloadingPreference = 'none'
Get-Module | ForEach-Object { Remove-Module -Name $_.Name -Force }
Import-Module -Name 'Microsoft.PowerShell.Utility'
Import-Module -Name 'CimCmdlets'
Import-Module -Name 'Microsoft.PowerShell.Management'

if($ExecutionContext.SessionState.LanguageMode -eq "ConstrainedLanguage")
{
    Write-Host "Exitcode_ConstrainedLanguage"
    exit 1120
}

$global:StartCpu = Get-CimInstance -class win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object -ExpandProperty Average
$global:StartTime = Get-Date
$global:ExitCode = -1
$global:EventQueryTimespan = 0


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
public class NdrCollectorSccmAgentInfoEvent
{
    public string SiteCode { get; set;}
    public string ServerFqdn {get;set;}
}
"@

function OutputFinalStats {
    try {
        # Define unexpected values
        $invalidValues = @($null, 0)
        $defaultValue = -1

        Write-Host "Writing telemtry" 

        # Calculate and display time duration
        if ($global:StartTime -isnot [DateTime]) {
            throw "Invalid start time: $global:StartTime"
        }

        $operationDuration = [Math]::Round((New-TimeSpan -Start $global:StartTime -End (Get-Date) | Select-Object -ExpandProperty TotalSeconds), 2)  
        Write-Host "Duration->$operationDuration"

        # Retrieve total memory and process information
        $totalMemoryCapacity = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum
        $currentProcessInfo = Get-Process -Id $Pid -ErrorAction Stop
        $currentProcessWorkingSetSize = $currentProcessInfo.WS / 1024

        # Calculate and display memory utilization
        $memoryUsagePercentage = $defaultValue
        if ($totalMemoryCapacity -notin $invalidValues) {
            $memoryUsagePercentage = [Math]::Round(($currentProcessInfo.WS * 100 / $totalMemoryCapacity), 2)
        }
        Write-Host "Memory->$($currentProcessWorkingSetSize)Kb,$memoryUsagePercentage%"

        # Calculate and display CPU usage
        $runningPeriodInSeconds = $((New-TimeSpan -Start $currentProcessInfo.StartTime).TotalSeconds)
        $totalLogicalProcessors = (Get-CimInstance -class Win32_processor | Measure-Object -Property NumberOfLogicalProcessors -Sum ).sum
        $currentCPUUsage = [Math]::Round(($currentProcessInfo.CPU), 2)
        $cpuUsagePercentage = $defaultValue
        if ($totalLogicalProcessors -notin $invalidValues -and $runningPeriodInSeconds -notin $invalidValues) {
            $cpuUsagePercentage = [Math]::Round((($currentProcessInfo.CPU * 100 / $runningPeriodInSeconds) / $totalLogicalProcessors), 2)
        }
        Write-Host "CPU->$currentCPUUsage,$cpuUsagePercentage%"

        # Calculate and display total CPU usage
        $averageCpuLoad = [Math]::Round((Get-CimInstance -class win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object -ExpandProperty Average), 2)
        Write-Host "TotalCpu->$global:StartCpu%,$averageCpuLoad%"
    }
    catch {
        Write-Host "OutputFinalStats: Operation failed due to $($_.ToString()) at line $($_.InvocationInfo.ScriptLineNumber)"
    }
}

function ExitWithCode {
    param
    (
        $exitcode
    )
    $host.SetShouldExit($exitcode)
    exit
}

try {
    $service_status = Get-Service -Name "CcmExec" -ErrorAction Ignore

    if ($null -eq $service_status) {
        # No service, No SCCM Agent
        $global:ExitCode = 1101

    }
    elseif ($service_status.Status -eq "running") {
        try {
            Add-Type -TypeDefinition $EtwWriter -Language CSharp -IgnoreWarnings
            $global:EtwCollectorProvider = [EtwProvider]::log
            $siteCode = ""

            $InstallInfoDP = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\SMS\DP" -ErrorAction SilentlyContinue
            if ((-Not [string]::IsNullOrEmpty($InstallInfoDP)) -and (-Not [string]::IsNullOrEmpty($InstallInfoDP.SiteCode))) {
                $siteCode = $InstallInfoDP.SiteCode
                $global:ExitCode = 1100
            }
            else {
                $InstallInfo = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\SMS\Mobile Client" -ErrorAction SilentlyContinue
                if ((-Not [string]::IsNullOrEmpty($InstallInfo)) -and (-Not [string]::IsNullOrEmpty($InstallInfo.AssignedSiteCode))) {
                    $siteCode = $InstallInfo.AssignedSiteCode
                    $global:ExitCode = 1100
                }
                else {
                    $InstallInfo = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\CCM\CcmEval" -ErrorAction SilentlyContinue
                    if ((-Not [string]::IsNullOrEmpty($InstallInfo)) -and (-Not [string]::IsNullOrEmpty($InstallInfo.SiteCode))) {
                        $siteCode = $InstallInfo.SiteCode
                        $global:ExitCode = 1100
                    }
                    else {
                        $InstallInfo = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\CCM\ExternalEventAgent\Criterias\Differentiation\ATPHealthStatusStateMessage\SyncStatus" -ErrorAction SilentlyContinue
                        if ((-Not [string]::IsNullOrEmpty($InstallInfo)) -and (-Not [string]::IsNullOrEmpty($InstallInfo.SiteCode))) {
                            $siteCode = $InstallInfo.SiteCode
                            $global:ExitCode = 1100
                        }
                        else {
                            # Couldn't find Registry Keys
                            $global:ExitCode = 1106
                        }
                    }
                }
            }

            $ServerFqdn = ""
            if ((-Not [string]::IsNullOrEmpty($InstallInfoDP)) -and (-Not [string]::IsNullOrEmpty($InstallInfoDP.ManagementPoints))) {
                $ServerFqdn = $InstallInfoDP.ManagementPoints
            }
            else {
                $InstallInfo = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\CCM\LocationServices" -ErrorAction SilentlyContinue
                if ((-Not [string]::IsNullOrEmpty($InstallInfo)) -and (-Not [string]::IsNullOrEmpty($InstallInfo.EventLastUsedMP))) {
                    $ServerFqdn = $InstallInfo.EventLastUsedMP
                }
                else {
                    $InstallInfo = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\CCM\" -ErrorAction SilentlyContinue
                    if ((-Not [string]::IsNullOrEmpty($InstallInfo)) -and (-Not [string]::IsNullOrEmpty($InstallInfo.LookupMPList))) {
                        $ServerFqdn = $InstallInfo.LookupMPList
                    }
                    else {
                        # Couldn't find Registry Keys
                        $global:ExitCode = $global:ExitCode + 10
                    }
                }
            }

            # we found both values empty, no point in creating object.
            if ([string]::IsNullOrEmpty($ServerFqdn) -and (-Not [string]::IsNullOrEmpty($siteCode))) {
                $global:ExitCode = 1200
            }

            $etw = New-Object "NdrCollectorSccmAgentInfoEvent" -Property @{
                SiteCode   = $siteCode
                ServerFqdn = $ServerFqdn
            }
            $global:EtwCollectorProvider.Write("NdrCollectorSccmAgentInfoEvent", $etw)

        }
        catch {
            Write-Host $_
            # internal error
            $global:ExitCode = 1102
        }
    }

    elseif ($service_status.Status -eq "Stopped") {
        # Service Exists but Stopped
        $global:ExitCode = 1103
    }
    else {
        # Everything worked but we got no match to anything
        $global:ExitCode = 1104
    }
}
catch {
    # unknown error
    Write-Host $_
    $global:ExitCode = 1105
}

OutputFinalStats
ExitWithCode $ExitCode

# ExitCode   Description
# -1         Unexpected behavior
# 1100       everything is okay, we have SCCM Agent with data
# 1101       Service wasn't found, Normal behavior
# 1102       Internal error
# 1103       Service is stopped
# 1104       Service is not stopped or running
# 1105       Unknown Error
# 1106       Found Server Fqdn but no Site code in registry
# 1110       Found Site code but no Server Fqdn in registry
# 1116       Registry Keys weren't found
# 1120       Constained Language Mode
# 1200       Seccm Agent with empty values for site and server
# SIG # Begin signature block
# MIIoZAYJKoZIhvcNAQcCoIIoVTCCKFECAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCJRrPBFtNLDPuM
# 0LkUWtRGpob5Yy+ohdFKtViWrzqK0qCCDZcwggYVMIID/aADAgECAhMzAAAEOExw
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
# zTGCGiMwghofAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEC
# EzMAAAQ4THAXx1OE9PMAAAAABDgwDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcN
# AQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUw
# LwYJKoZIhvcNAQkEMSIEIKNffagGDsQPi/LgeZpw904A7CCqXokU3UYw+uu6JZXm
# MEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEAKy3lLCpfXzna
# +LRNiVsW+Eriuzs7He6nDwwZ2hafvDg5M7d/liZrwTZyd4tEP0GvDG7MkAKcrxAV
# QDyZKH0KH/+eKiRyqBnKcZNBjlrWrLv0tTx3umgvad3vTNOXNbLtcCftk1NEkaji
# ETko8bmp1MPDQ5axZJTCiI1RwrtQHXgxiA8H4JBNa27wCLvGej93PZowej+8RtkX
# 1AomAoFKK1uMZlkhXBCVOarEBS9dPVwBMf5lG+Xf3uaQIO+0bOlLrhpRaDbwoSJG
# OQd/oimxsUuui2beN9I/zWyffgYpwiKOqy0B0p1A8ZbedoYn1EyBsV78h7aFOkQF
# P3q4i6kBbaGCF60wghepBgorBgEEAYI3AwMBMYIXmTCCF5UGCSqGSIb3DQEHAqCC
# F4YwgheCAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkE
# ggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQCAQUABCB86EKbDJO7
# rf6XSTeog1fthea+oNJZnHxI4ToXLZ4trAIGaC3lfojGGBMyMDI1MDYwNTE0NDIz
# Ny43MDJaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjoyRDFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCEfswggco
# MIIFEKADAgECAhMzAAAB/XP5aFrNDGHtAAEAAAH9MA0GCSqGSIb3DQEBCwUAMHwx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1p
# Y3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTI0MDcyNTE4MzExNloXDTI1
# MTAyMjE4MzExNlowgdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjJEMUEtMDVFMC1EOTQ3MSUwIwYD
# VQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEAoWWs+D+Ou4JjYnRHRedu0MTFYzNJEVPnILzc02R3
# qbnujvhZgkhp+p/lymYLzkQyG2zpxYceTjIF7HiQWbt6FW3ARkBrthJUz05ZnKpc
# F31lpUEb8gUXiD2xIpo8YM+SD0S+hTP1TCA/we38yZ3BEtmZtcVnaLRp/Avsqg+5
# KI0Kw6TDJpKwTLl0VW0/23sKikeWDSnHQeTprO0zIm/btagSYm3V/8zXlfxy7s/E
# VFdSglHGsUq8EZupUO8XbHzz7tURyiD3kOxNnw5ox1eZX/c/XmW4H6b4yNmZF0wT
# Zuw37yA1PJKOySSrXrWEh+H6++Wb6+1ltMCPoMJHUtPP3Cn0CNcNvrPyJtDacqjn
# ITrLzrsHdOLqjsH229Zkvndk0IqxBDZgMoY+Ef7ffFRP2pPkrF1F9IcBkYz8hL+Q
# jX+u4y4Uqq4UtT7VRnsqvR/x/+QLE0pcSEh/XE1w1fcp6Jmq8RnHEXikycMLN/a/
# KYxpSP3FfFbLZuf+qIryFL0gEDytapGn1ONjVkiKpVP2uqVIYj4ViCjy5pLUceMe
# qiKgYqhpmUHCE2WssLLhdQBHdpl28+k+ZY6m4dPFnEoGcJHuMcIZnw4cOwixojRO
# r+Nq71cJj7Q4L0XwPvuTHQt0oH7RKMQgmsy7CVD7v55dOhdHXdYsyO69dAdK+nWl
# yYcCAwEAAaOCAUkwggFFMB0GA1UdDgQWBBTpDMXA4ZW8+yL2+3vA6RmU7oEKpDAf
# BgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQ
# hk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQl
# MjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBe
# MFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2Nl
# cnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAM
# BgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQE
# AwIHgDANBgkqhkiG9w0BAQsFAAOCAgEAY9hYX+T5AmCrYGaH96TdR5T52/PNOG7y
# SYeopv4flnDWQLhBlravAg+pjlNv5XSXZrKGv8e4s5dJ5WdhfC9ywFQq4TmXnUev
# PXtlubZk+02BXK6/23hM0TSKs2KlhYiqzbRe8QbMfKXEDtvMoHSZT7r+wI2IgjYQ
# wka+3P9VXgERwu46/czz8IR/Zq+vO5523Jld6ssVuzs9uwIrJhfcYBj50mXWRBcM
# hzajLjWDgcih0DuykPcBpoTLlOL8LpXooqnr+QLYE4BpUep3JySMYfPz2hfOL3g0
# 2WEfsOxp8ANbcdiqM31dm3vSheEkmjHA2zuM+Tgn4j5n+Any7IODYQkIrNVhLdML
# 09eu1dIPhp24lFtnWTYNaFTOfMqFa3Ab8KDKicmp0AthRNZVg0BPAL58+B0UcoBG
# KzS9jscwOTu1JmNlisOKkVUVkSJ5Fo/ctfDSPdCTVaIXXF7l40k1cM/X2O0JdAS9
# 7T78lYjtw/PybuzX5shxBh/RqTPvCyAhIxBVKfN/hfs4CIoFaqWJ0r/8SB1CGsyy
# IcPfEgMo8ceq1w5Zo0JfnyFi6Guo+z3LPFl/exQaRubErsAUTfyBY5/5liyvjAgy
# DYnEB8vHO7c7Fg2tGd5hGgYs+AOoWx24+XcyxpUkAajDhky9Dl+8JZTjts6BcT9s
# YTmOodk/SgIwggdxMIIFWaADAgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqG
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
# VjCCAj4CAQEwggEBoYHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjoyRDFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcG
# BSsOAwIaAxUAoj0WtVVQUNSKoqtrjinRAsBUdoOggYMwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsFAAIFAOvsKQYwIhgPMjAy
# NTA2MDUxNDMyMzhaGA8yMDI1MDYwNjE0MzIzOFowdDA6BgorBgEEAYRZCgQBMSww
# KjAKAgUA6+wpBgIBADAHAgEAAgIflzAHAgEAAgISNzAKAgUA6+16hgIBADA2Bgor
# BgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAID
# AYagMA0GCSqGSIb3DQEBCwUAA4IBAQAZpirB1hR2ex37BGz/q/FwDoFOQIj2Uy1F
# emaTVVXqioPsDwHSO8SXA+/5n6DCw5FFSA79hxZi5bE7khAAdLGwZT6KFEBdWwPS
# H29eaaQuphMIGfjzbWdIncHvOKkB6TeaLnMtJzgrKSCZTCM9CpwJqZhkUGdYjkWC
# BLUlmGrFYu7LGwL7LO72ibroNOqfiiuQeEOIPzGdeogTHoinpd3Rc1bStw6tV0N3
# C3rsH5BatSUfLkzPruuHhEkK26jvqJufInmkY53H/wzI53pmk8zIM6cF1dU3yenJ
# nHbtOHZ0zlS/MKjLm+57gTKJ+CB6lna+mVd7TqsCEO2J1WaPrXQyMYIEDTCCBAkC
# AQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQG
# A1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAH9c/loWs0M
# Ye0AAQAAAf0wDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG
# 9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgL6agt9Nk54Je8vAMDnAE4MP0XJv70OVU
# EJYcpk7xScYwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCCAKEgNyUowvIfx
# /eDfYSupHkeF1p6GFwjKBs8lRB4NRzCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0
# YW1wIFBDQSAyMDEwAhMzAAAB/XP5aFrNDGHtAAEAAAH9MCIEIFqbLG07ux7/PHB1
# 45O7W8bkJ5lWr1Z90MDrI+3y2HSKMA0GCSqGSIb3DQEBCwUABIICAEUEkI4bt95y
# iZkfBHAdv/rQRW+lKgdlDC5Qqk8Fv5QdFKrRqoZEE2vDC1jBvm2ICjVyw1Ewal7M
# msduFmcyKv3336EdQmXKhh+dmCtkxbJvyiSOAKgGnP4eUL+xLOAsUitJtpZ7rEJ9
# Rf88rXzQ1gg01XXDEQ4DDMBnXmbJdozAhrzVVp6Wyu8OYmx5m7AtNiph3kEPxraV
# iCBDw64pSeG0nvi6VNQNkb1gVm52QwdSNmHsC28qVtJIiNpGyJMModzLwVwXKdWv
# 6B4GRqV9xAu/AXxHeOqqgWA7Z0LXftizVHnO0Ll0D1LtdI8OouHowfsj/25sbj22
# IBqBlB/zKqmI9YZglGOcHL1vz09/ThVqHyrWP6/QkYrE0eYgEgQq5idHp5EizztQ
# OrFS5i1rq8Kgm/Dnej+9L8IRTVyIDmFBzh+idBfx2EMsHx+oC+lpyvXYKtfpIivj
# PLJmSwJIjCIWVXqxPsLx7baI68g2/BG7fgzlq3Iycgr5gu4eYr3koZjrvpdCExtB
# xcqf4gfOOxJyXqWmu6G2Jjdu0xG0lJaiNoH2N4xg+qhI6Rs6023i8/bPXZx1/4jK
# pFj/Q2f1bec3TWVD9XUAlexA5edJLokppJ+XQHIhjQzNhxsTvi/kAsVzV8EcwvLi
# suIB0OIt0q2IcytjcjjM5YP4Brr6xDrb
# SIG # End signature block
