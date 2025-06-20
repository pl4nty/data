Get-Module | ForEach-Object { Remove-Module -Name $_.Name -Force }
$PSModuleAutoloadingPreference = 'none'
Import-Module Microsoft.PowerShell.Utility
Import-Module Defender
Import-Module Microsoft.PowerShell.Management

$Source = @"
                        using System;
                        using System.Text;
                        using System.Diagnostics.Tracing;
                        using Microsoft.PowerShell.Commands;

                        public static class WDEtwProvider
                        {
                            public static EventSource log = new EventSource("Microsoft.Windows.Sense.WDCollection", EventSourceSettings.EtwSelfDescribingEventFormat  | EventSourceSettings.ThrowOnEventWriteErrors);
                        }

                        [EventData] // [EventData] makes it possible to pass an instance of the class as an argument to EventSource.Write().
                        public class CollectedWDConfig
                        {
						    public bool DisableScriptScanning { get; set; }
                            public int SubmitSamplesConsent { get; set; }
                            public int EnableNetworkProtection { get; set; }
                            public int SignatureUpdateInterval { get; set; }
                            public bool EnableLowCpuPriority { get; set; }
                            public int ScanParameters { get; set; }
                            public String ScanScheduleTime { get; set; }
                            public int CloudExtendedTimeout { get; set; }
                            public bool DisableArchiveScanning { get; set; }
                            public int ScanScheduleDay { get; set; }
                            public bool DisableScanningNetworkFiles { get; set; }
                            public int CloudBlockLevel { get; set; }
                            public int ScanAvgCPULoadFactor { get; set; }
                            public bool DisableScanningMappedNetworkDrivesForFullScan { get; set; }
                            public String ScanScheduleQuickScanTime { get; set; }
                            public int QuarantinePurgeItemsAfterDelay { get; set; }
                            public bool UILockdown { get; set; }
                            public bool DisableOnAccessProtection { get; set; }
                            public bool DisableRemovableDriveScanning { get; set;}
                            public String AntiMalwareProductVersion { get; set;}
                            public String AntiSpywareSignatureVersion { get; set;}
                            public String AntiMalwareEngineVersion { get; set;}
                            public String AntiVirusSignatureVersion { get; set;}
                            public bool Cve2022_30190_Mitigated { get; set; }

                            public CollectedWDConfig(bool disableScriptScanning, int submitSamplesConsent, int enableNetworkProtection, int signatureUpdateInterval,
                                                     bool enableLowCpuPriority, int scanParameters, string scanScheduleTime, int cloudExtendedTimeout,
                                                     bool disableArchiveScanning, int scanScheduleDay, bool disableScanningNetworkFiles, int cloudBlockLevel,
                                                     int scanAvgCPULoadFactor, bool disableScanningMappedNetworkDrivesForFullScan, string scanScheduleQuickScanTime,
                                                     int quarantinePurgeItemsAfterDelay, bool uiLockdown, bool disableOnAccessProtection, bool disableRemovableDriveScanning,
                                                     string antiMalwareProductVersion, string antiSpywareSignatureVersion, string antiMalwareEngineVersion, string antiVirusSignatureVersion, bool cve2022_30190_Mitigated)
                            {
								this.DisableScriptScanning = disableScriptScanning;
                                this.SubmitSamplesConsent = submitSamplesConsent;
                                this.EnableNetworkProtection = enableNetworkProtection;
                                this.SignatureUpdateInterval = signatureUpdateInterval;
                                this.EnableLowCpuPriority = enableLowCpuPriority;
                                this.ScanParameters = scanParameters;;
                                this.ScanScheduleTime = scanScheduleTime;
                                this.CloudExtendedTimeout = cloudExtendedTimeout;
                                this.DisableArchiveScanning = disableArchiveScanning;
                                this.ScanScheduleDay = scanScheduleDay;;
                                this.DisableScanningNetworkFiles = disableScanningNetworkFiles;
                                this.CloudBlockLevel = cloudBlockLevel;
                                this.ScanAvgCPULoadFactor = scanAvgCPULoadFactor;
                                this.DisableScanningMappedNetworkDrivesForFullScan = disableScanningMappedNetworkDrivesForFullScan;
                                this.ScanScheduleQuickScanTime = scanScheduleQuickScanTime;
                                this.QuarantinePurgeItemsAfterDelay = quarantinePurgeItemsAfterDelay;
                                this.UILockdown = uiLockdown;
                                this.DisableOnAccessProtection = disableOnAccessProtection;
                                this.DisableRemovableDriveScanning = disableRemovableDriveScanning;
                                this.AntiMalwareProductVersion =  antiMalwareProductVersion;
                                this.AntiSpywareSignatureVersion = antiSpywareSignatureVersion;
                                this.AntiMalwareEngineVersion = antiMalwareEngineVersion;
                                this.AntiVirusSignatureVersion = antiVirusSignatureVersion;
                                this.Cve2022_30190_Mitigated = cve2022_30190_Mitigated;
                            }
                        }

"@
Add-Type -TypeDefinition $Source -Language CSharp -IgnoreWarnings
$CollectedConfigProvider = [WDEtwProvider]::log

try
{

    $configs = Get-MpPreference

    $disableScriptScanning = $configs.DisableScriptScanning
    $submitSamplesConsent = $configs.SubmitSamplesConsent
    $enableNetworkProtection = $configs.EnableNetworkProtection
    $signatureUpdateInterval = $configs.SignatureUpdateInterval
    $enableLowCpuPriority = $configs.EnableLowCpuPriority
    $scanParameters = $configs.ScanParameters
    $scanScheduleTime = $configs.ScanScheduleTime
    $cloudExtendedTimeout = $configs.CloudExtendedTimeout
    $disableArchiveScanning = $configs.DisableArchiveScanning
    $scanScheduleDay = $configs.ScanScheduleDay
    $disableScanningNetworkFiles = $configs.DisableScanningNetworkFiles
    $cloudBlockLevel = $configs.CloudBlockLevel
    $scanAvgCPULoadFactor = $configs.ScanAvgCPULoadFactor
    $disableScanningMappedNetworkDrivesForFullScan = $configs.DisableScanningMappedNetworkDrivesForFullScan
    $scanScheduleQuickScanTime = $configs.ScanScheduleQuickScanTime
    $quarantinePurgeItemsAfterDelay = $configs.QuarantinePurgeItemsAfterDelay
    $uiLockdown = $configs.UILockdown
    $disableRemovableDriveScanning = $configs.DisableRemovableDriveScanning

    $existsInPolicis = (Get-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -EA Ignore).Property -contains "DisableAntiSpyware"
    $existsNotInPolicis = (Get-Item 'HKLM:\SOFTWARE\Microsoft\Windows Defender' -EA Ignore).Property -contains "DisableAntiSpyware"
    $policisValue = 0
    $notPolicisValue = 0


    if($existsInPolicis){
        $policisValue = Get-ItemPropertyValue 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -name "DisableAntiSpyware"
    }

    if($existsNotInPolicis){
        $notPolicisValue = Get-ItemPropertyValue 'HKLM:\SOFTWARE\Microsoft\Windows Defender' -name "DisableAntiSpyware"
    }

    if($policisValue -eq 1 -or $notPolicisValue -eq 1){
        $disableOnAccessProtection = $true
    } else{
        $status = Get-MpComputerStatus
        $disableOnAccessProtection = !($status.OnAccessProtectionEnabled)
    }

    $productsConfig = Get-MpComputerStatus

    $antiMalwareProductVersion = $productsConfig.AMProductVersion
    $antiSpywareSignatureVersion = $productsConfig.AntispywareSignatureVersion
    $antiMalwareEngineVersion = $productsConfig.AMEngineVersion
    $antiVirusSignatureVersion = $productsConfig.AntivirusSignatureVersion

#------------------------------------------------------------------------------------------------------------------------------------------------
    $hkcrDrive = Get-PSDrive -PSProvider registry | where {$_.root -eq 'HKEY_CLASSES_ROOT'} | select name, root

    if($hkcrDrive -eq $null)
    {
        New-PSDrive -PSProvider registry -Root HKEY_CLASSES_ROOT -Name HKCR
        Set-Location HKCR:
    }
    else
    {
        Set-Location "$($hkcrDrive.Name):"
    }

    $regKey = Get-ItemProperty .\ms-msdt -Name '(default)' -ErrorAction SilentlyContinue
    $cve2022_30190_mitigated = ($regKey -eq $null)

#------------------------------------------------------------------------------------------------------------------------------------------------

    $argumentList = @($disableScriptScanning, $submitSamplesConsent, $enableNetworkProtection, $signatureUpdateInterval, $enableLowCpuPriority, $scanParameters,
        $scanScheduleTime, $cloudExtendedTimeout, $disableArchiveScanning, $scanScheduleDay, $disableScanningNetworkFiles, $cloudBlockLevel, $scanAvgCPULoadFactor,
        $disableScanningMappedNetworkDrivesForFullScan, $scanScheduleQuickScanTime, $quarantinePurgeItemsAfterDelay, $uiLockdown, $disableOnAccessProtection, $disableRemovableDriveScanning,
        $antiMalwareProductVersion, $antiSpywareSignatureVersion, $antiMalwareEngineVersion, $antiVirusSignatureVersion, $cve2022_30190_mitigated)


    $collectedConfig = New-Object CollectedWDConfig -ArgumentList $argumentList

    $CollectedConfigProvider.Write("CollectedConfig", $collectedConfig)

}
catch
{
    Write-Host "An error occurred while getting AAD information:"
    Write-Host $_
}
# SIG # Begin signature block
# MIIoZAYJKoZIhvcNAQcCoIIoVTCCKFECAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCdQNGtk00CPmCW
# EA8wVWliKzQLzUAybHug4D+yrG8A/qCCDZcwggYVMIID/aADAgECAhMzAAAEOExw
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
# LwYJKoZIhvcNAQkEMSIEIM1bnJb/juJ7dcaYcM87ljgyMJrYFcT+yb0905By/kgu
# MEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEAnXI71SlTcuMc
# bJkrod31OH4KxfQF6nX2fGHyA0Dz0dNRJEsqnl4XD2+V+bVwWDoZiJP+J5KkBmRa
# EPLjfcLH1S1umMFvaeBvlwRCsSJwk8kdXyYPzA5WUDuGq8riXFwRwdJBrckKiZvK
# XD9fEONRaoQTGcmn/m++5EJwHgMlkO/HaqbbL1+AuryNShqdSF/3I0ZoVTkyPCQm
# d41y9ATh76WgXgLikAWNVu7KepEfWTPL3bcR0PknKyLLNSBH3243fK4YnAND3wCx
# 4TMe7qb4Px3iGC4IoIob3B3nUKDSz5Y6JWN5q3ImR9+2b6IizRpehW7fUJOLBoMi
# BmJIzAFwxKGCF60wghepBgorBgEEAYI3AwMBMYIXmTCCF5UGCSqGSIb3DQEHAqCC
# F4YwgheCAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkE
# ggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQCAQUABCCSAOSkNxGQ
# jecR+hqb6zGO9MbU6EzsEIZw83UcXWRIxgIGaC5Lp9siGBMyMDI1MDYwNTE0NDIz
# OS4wNDVaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo1NTFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCEfswggco
# MIIFEKADAgECAhMzAAACAdFFWZgQzEJPAAEAAAIBMA0GCSqGSIb3DQEBCwUAMHwx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1p
# Y3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTI0MDcyNTE4MzEyMloXDTI1
# MTAyMjE4MzEyMlowgdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjU1MUEtMDVFMC1EOTQ3MSUwIwYD
# VQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEAtWrf+HzDu7sk50y5YHheCIJG0uxRSFFcHNek+Td9
# ZmyJj20EEjaU8JDJu5pWc4pPAsBI38NEAJ1b+KBnlStqU8uvXF4qnEShDdi8nPsZ
# ZQsTZDKWAgUM2iZTOiWIuZcFs5ZC8/+GlrVLM5h1Y9nfMh5B4DnUQOXMremAT9Mk
# vUhg3uaYgmqLlmYyODmba4lXZBu104SLAFsXOfl/TLhpToT46y7lI9sbI9uq3/Ae
# rh3aPi2knHvEEazilXeooXNLCwdu+Is6o8kQLouUn3KwUQm0b7aUtsv1X/OgPmsO
# Ji6yN3LYWyHISvrNuIrJ4iYNgHdBBumQYK8LjZmQaTKFacxhmXJ0q2gzaIfxF2yI
# wM+V9sQqkHkg/Q+iSDNpMr6mr/OwknOEIjI0g6ZMOymivpChzDNoPz9hkK3gVHZK
# W7NV8+UBXN4G0aBX69fKUbxBBLyk2cC+PhOoUjkl6UC8/c0huqj5xX8m+YVIk81e
# 7t6I+V/E4yXReeZgr0FhYqNpvTjGcaO2WrkP5XmsYS7IvMPIf4DCyIJUZaqoBMTo
# AJJHGRe+DPqCHg6bmGPm97MrOWv16/Co6S9cQDkXp9vMSSRQWXy4KtJhZfmuDz2v
# r1jw4NeixwuIDGw1mtV/TdSI+vpLJfUiLl/b9w/tJB92BALQT8e1YH8NphdOo1xC
# wkcCAwEAAaOCAUkwggFFMB0GA1UdDgQWBBSwcq9blqLoPPiVrym9mFmFWbyyUjAf
# BgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQ
# hk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQl
# MjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBe
# MFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2Nl
# cnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAM
# BgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQE
# AwIHgDANBgkqhkiG9w0BAQsFAAOCAgEAOjQAyz0cVztTFGqXX5JLRxFK/O/oMe55
# uDqEC8Vd1gbcM28KBUPgvUIPXm/vdDN2IVBkWHmwCp4AIcy4dZtkuUmd0fnu6aT9
# Mvo1ndsLp2YJcMoFLEt3TtriLaO+i4Grv0ZULtWXUPAW/Mn5Scjgn0xZduGPBD/X
# s3J7+get9+8ZvBipsg/N7poimYOVsHxLcem7V5XdMNsytTm/uComhM/wgR5KlDYT
# VNAXBxcSKMeJaiD3V1+HhNkVliMl5VOP+nw5xWF55u9h6eF2G7eBPqT+qSFQ+rQC
# QdIrN0yG1QN9PJroguK+FJQJdQzdfD3RWVsciBygbYaZlT1cGJI1IyQ74DQ0UBdT
# pfeGsyrEQ9PI8QyqVLqb2q7LtI6DJMNphYu+jr//0spr1UVvyDPtuRnbGQRNi1CO
# wJcj9OYmlkFgKNeCfbDT7U3uEOvWomekX60Y/m5utRcUPVeAPdhkB+DxDaev3J1y
# wDNdyu911nAVPgRkyKgMK3USLG37EdlatDk8FyuCrx4tiHyqHO3wE6xPw32Q8e/v
# muQPoBZuX3qUeoFIsyZEenHq2ScMunhcqW32SUVAi5oZ4Z3nf7dAgNau21NEPwgW
# +2wkrNqDg7Hp8yHyoOKbgEBu6REQbvSfZ5Kh4PV+S2gxf2uq6GoYDnlqABOMYwz3
# 09ISi0bPMh8wggdxMIIFWaADAgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqG
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
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo1NTFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcG
# BSsOAwIaAxUA1+26cR/yH100DiNFGWhuAv2rYBqggYMwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsFAAIFAOvr5nYwIhgPMjAy
# NTA2MDUwOTQ4MzhaGA8yMDI1MDYwNjA5NDgzOFowdDA6BgorBgEEAYRZCgQBMSww
# KjAKAgUA6+vmdgIBADAHAgEAAgIHAzAHAgEAAgITNzAKAgUA6+039gIBADA2Bgor
# BgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAID
# AYagMA0GCSqGSIb3DQEBCwUAA4IBAQB2xtVkiU+dR1VB3yG8Rc+EwQK4af9bZ2Ea
# Jd8GWgmOLMR0WxGeOcs4d1ByYTdG78HPBcdVyjSTeMYSI2w9wai6JBDys6E8ylLf
# m2+4Q0DFfM2AWgYAHfLIeHNfM/+JBUqGyy6iqEWJTigB2sHPmN0y5pZSFrYh6yRg
# W0opA3Fz9fVYBYcsXSIySxHDPotaL9x0POATNFBZ2X3d8CAW2SsKTN1zPLBz9s1e
# X0OAzMax0klJ/65iBrOlwdzYKifdWNM9BQTsosJe2aSNv606iG16ERUzlUaWkkGs
# It6iloAcsNHKDnk9IxrIRF3S//TfIYTlSwEMj/DTH8zkdpZS/Bd6MYIEDTCCBAkC
# AQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQG
# A1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAIB0UVZmBDM
# Qk8AAQAAAgEwDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG
# 9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgVLd8++ofOSZqk3J70v7nxOU3QDRUuHwD
# en8H1+h71TUwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCBYa7I6TJQRcmx0
# HaSTWZdJgowdrl9+Zrr0pIdqHtc4IzCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0
# YW1wIFBDQSAyMDEwAhMzAAACAdFFWZgQzEJPAAEAAAIBMCIEIPiVLdV0AITmfu0k
# 52NNVzoR8k/eCpPz31bbJAmDLQhuMA0GCSqGSIb3DQEBCwUABIICADfLmJsq6uDK
# kGQdxn6riVxV5AmDNRmUFxRLene4BhWSqfsI0xeqdMxZQiDUyKAvzDppwaZTldFL
# ZldWjHxAzLldXlNlj166udIgETsDWQqxe2+k/dXcswemeTvjavcrLkluM1AH0BUj
# +tEoeTdIX6kErKPnIRiVGOvRv/++wCvtM6jLRMzifWdYbNO1Qx2KVxbovGHavq2L
# b65HFwezerC18v++PT9YtouUNOb72L5DKkdUiQ/TEOUZkhvH5vrxDaq4G2KyE6UZ
# WF+nqiA1cxgxexGx8pxQt8RYREHllyU2kXUgnuz6xLXmI0Fr+zd0EmUmK8tzw6pz
# dCSRNEaW9krcUxX0ghlsqu6p7H1s52hnpRjm9KN3D1VI3BQklzFdd3IW6WegEkkb
# Ot9F9z6WH8aa+IQkAcVkbs5E6ad2xMsbPM6kw1x9tX0UXhoPc0xQI712j4sYiAb5
# hWkq0RQ8KUCtgcIOUj7+tFobk03gNfKe6rUNNbRs2cuUIuDFPd4HYEYCRuvzj75X
# UvxFfcle73DS0KZNwsFskLO2lVebktLy8Kx+80UyG+4S0AJxVN9LPXgEdKwTzEL0
# HAWPfqET4H7qJxvj+tPfVaLiW9EK0+bOuOg7+M8ycAIM/oC60UiEU2ie7vwCBMih
# 4xQ4FA1Un45DUlSzt+B1kHmxjGUyTr8P
# SIG # End signature block
