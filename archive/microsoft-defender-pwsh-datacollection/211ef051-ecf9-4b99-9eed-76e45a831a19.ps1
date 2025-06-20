Get-Module | ForEach-Object { Remove-Module -Name $_.Name -Force }
$PSModuleAutoloadingPreference = 'none'
Import-Module Microsoft.PowerShell.Utility
Import-Module Microsoft.PowerShell.Management

<#
{
"Data":{
    "IsPII":true,
    "ScrubMethod":3,
    "ScrubType":21,
    "PropertyType":1,
    "PropertyValue":"[
        {\"HResult\":0,\"Key\":\"Cve2022_30190_Mitigated",\"Value\":\"true\"},
        {\"HResult\":0,\"Key\":\"HKEY_LOCAL_MACHINE\\\\SOFTWARE\\\\Policies\\\\Microsoft\\\\Windows\\\\WindowsUpdate\\\\DeferFeatureUpdates",\"Value\":\"0\"},
    ]
 }
#>
$Source = @"
                        using System;
                        using System.Text;
                        using System.Diagnostics.Tracing;
                        using Microsoft.PowerShell.Commands;

                        public static class TvmInfoGatheringCollectorProvider
                        {
                            public static EventSource log = new EventSource("Microsoft.Windows.Sense.TvmInfoGatheringCollectorEtw", EventSourceSettings.EtwSelfDescribingEventFormat  | EventSourceSettings.ThrowOnEventWriteErrors);
                        }

                        [EventData] // [EventData] makes it possible to pass an instance of the class as an argument to EventSource.Write().
                        public class CollectedInfoGathringValue
                        {
							    public int HResult { get; set; }
                                public String Key { get; set; }
                                public String Value { get; set; }

                                public CollectedInfoGathringValue(int hResult, string key, string value)
                                {
									this.HResult = hResult;
                                    this.Key = key;
                                    this.Value = value;
                                }
                        }

                        [EventData]
                        public class CollectedInfoGathringValues
                        {
							    public String Data { get; set; }

                                public CollectedInfoGathringValues(string data)
                                {
							        this.Data = data;
                                }
                        }
"@

Add-Type -TypeDefinition $Source -Language CSharp -IgnoreWarnings

function IsCVE2022_41040_RewriteRuleSet()
{
    try
    {
        Import-Module WebAdministration
        if (-not (Get-Module -Name "WebAdministration"))
        {
            return "NotApplicable"
        }

        $result = "NotMitigated"
        $rules = Get-WebConfiguration -Filter "system.webServer/rewrite/rules/*" -PSPath "IIS:\Sites\Default Web Site"

        foreach ($rule in $rules)
        {

            if($rule.PSPath -eq "MACHINE/WEBROOT/APPHOST/Default Web Site")
            {
                if($rule.enabled -eq $true)
                {
                    if($rule.conditions.Collection[0].input -eq "{UrlDecode:{REQUEST_URI}}")
                    {
                        if($rule.conditions.Collection[0].matchType -eq "Pattern")
                        {
                            if($rule.conditions.Collection[0].ignoreCase -eq $true)
                            {
                                if($rule.conditions.Collection[0].negate -eq $false)
                                {
                                    if($rule.conditions.Collection[0].pattern -eq "(?=.*autodiscover)(?=.*powershell)")
                                    {
                                        if($rule.match.url -eq ".*")
                                        {
                                            if($rule.action.type -eq "AbortRequest")
                                            {
                                                # IIS installed, URL rewrite module installed and the rewrite rule exist
                                                $result = "Mitigated"
                                            }
                                            else
                                            {
                                                $result = "NotMitigated"
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            if($rule.stopProcessing -eq $true)
            {
                return $result
            }
        }
    }
    catch
    {
        # if IIS is not installed or the URL rewrite module is not installed then an exception with be thorwn
        return "NotMitigated"
    }
}

<#
    This function runs the given $PowershellFunction and return a CollectedInfoGathringValue object of (hResult, Key, valueToReport).
#>
Function Create-CollectedInfoGathringValueObject
{
    Param(
        [Parameter()]
        [System.Object[]]
        $CollectedDataResult,

        [Parameter()]
        [String]
        $Key
    )

    New-Object CollectedInfoGathringValue($CollectedDataResult[0], $Key, $CollectedDataResult[1])
}

$CollectedInfoGathringValues = @()


#------------------------------------------------------------------------------------------------------------------------------------------------
# Get CVE_2022_30190_mitigation_status
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
$cve2022_30190_mitigated = If ($regKey -eq $null) { "Mitigated" } Else { "NotMitigated" }

$CollectedInfoGathringValues +=  Create-CollectedInfoGathringValueObject -Key "CVE_2022_30190_mitigation_status" -CollectedDataResult (0, $cve2022_30190_mitigated)
#------------------------------------------------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------------------------------------------------
# Get CVE_2013_3900_mitigation_status
$cve_2013_3900_regKey32bit = Get-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Cryptography\Wintrust\Config -Name "EnableCertPaddingCheck" -ErrorAction SilentlyContinue
$cve_2013_3900_regKey64bit = Get-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Wow6432Node\Microsoft\Cryptography\Wintrust\Config -Name "EnableCertPaddingCheck" -ErrorAction SilentlyContinue
$cve_2013_3900_32bitMitigated = ($cve_2013_3900_regKey32bit.EnableCertPaddingCheck -eq 1)
$cve_2013_3900_64bitMitigated = ![Environment]::Is64BitOperatingSystem -or ($cve_2013_3900_regKey64bit.EnableCertPaddingCheck -eq 1)

$cve_2013_3900_mitigated = If ($cve_2013_3900_32bitMitigated -and $cve_2013_3900_64bitMitigated) { "Mitigated" } Else { "NotMitigated" }

$CollectedInfoGathringValues +=  Create-CollectedInfoGathringValueObject -Key "CVE_2013_3900_mitigation_status" -CollectedDataResult (0, $cve_2013_3900_mitigated)
#------------------------------------------------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------------------------------------------------
# Get CVE_2022_41040_mitigation_status
$cve_2022_41040_mitigated = IsCVE2022_41040_RewriteRuleSet
$CollectedInfoGathringValues +=  Create-CollectedInfoGathringValueObject -Key "CVE_2022_41040_mitigation_status" -CollectedDataResult (0, $cve_2022_41040_mitigated)
#------------------------------------------------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------------------------------------------------
# Get CVE_2023_36884_mitigation_status
$cve_2023_36884_mitigated_status = $true
$cve_2023_36884_mitigated = "Mitigated"

"Excel.exe", "Graph.exe", "MSAccess.exe", "MSPub.exe", "Powerpnt.exe", "Visio.exe", "WinProj.exe", "WinWord.exe", "Wordpad.exe" | ForEach-Object {
    $cve_2023_36884_regKey32bit = Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BLOCK_CROSS_PROTOCOL_FILE_NAVIGATION' -Name $_ -ErrorAction SilentlyContinue

    if ($cve_2023_36884_regKey32bit -eq $null) {
        $cve_2023_36884_mitigated_status = $false
    }
    else {
        $type = (Get-Item -Path $cve_2023_36884_regKey32bit.PSPath).GetValueKind($_)
        if ($type -ne [Microsoft.Win32.RegistryValueKind]::DWord) {
            $cve_2023_36884_mitigated_status = $false
        }

        $value = (Get-Item -Path $cve_2023_36884_regKey32bit.PSPath).GetValue($_)
        if ($value -ne 1) {
            $cve_2023_36884_mitigated_status = $false
        }
    }
}

$cve_2023_36884_mitigated = if ($cve_2023_36884_mitigated_status ) { "Mitigated" } else { "NotMitigated" }
$CollectedInfoGathringValues +=  Create-CollectedInfoGathringValueObject -Key "CVE_2023_36884_mitigation_status" -CollectedDataResult (0, $cve_2023_36884_mitigated)
#------------------------------------------------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------------------------------------------------
# Get CVE_2023_21716_mitigation_status
$regKeyRtfFiles15 = Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Word\Security\FileBlock -Name "RtfFiles" -ErrorAction SilentlyContinue
$regKeyOpenInProtectedView15 = Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Word\Security\FileBlock -Name "OpenInProtectedView" -ErrorAction SilentlyContinue
$regKeyRtfFiles16 = Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Word\Security\FileBlock -Name "RtfFiles" -ErrorAction SilentlyContinue
$regKeyOpenInProtectedView16 = Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Word\Security\FileBlock -Name "OpenInProtectedView" -ErrorAction SilentlyContinue

$office_13_Mitigated = ($regKeyRtfFiles15.RtfFiles -eq 2) -and ($regKeyOpenInProtectedView15.OpenInProtectedView -eq 0)
$office_16_19_21_Mitigated = ($regKeyRtfFiles16.RtfFiles -eq 2) -and ($regKeyOpenInProtectedView16.OpenInProtectedView -eq 0)

$cve_2023_21716_mitigated = If ($office_13_Mitigated -or $office_16_19_21_Mitigated) { "Mitigated" } Else { "NotMitigated" }

$CollectedInfoGathringValues +=  Create-CollectedInfoGathringValueObject -Key "CVE_2023_21716_mitigation_status" -CollectedDataResult (0, $cve_2023_21716_mitigated)
#------------------------------------------------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------------------------------------------------
# Get CVE_2021_34527_mitigation_status
$cve_2021_34527_mitigated_status = $false

try {
    $spoolerService = Get-Service -Name Spooler -ErrorAction SilentlyContinue
    if ($spoolerService.Status -eq 'Running' -or $spoolerService.StartType -ne 'Disabled') {
        $gpoPath = "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers"
        $nameValue = "RegisterSpoolerRemoteRpcEndPoint"
        $expectedValue = 2
        $lastGPOChangeTime = $null

        if (Test-Path -Path $gpoPath) {
            $BinaryValue = Get-ItemProperty -Path $gpoPath -ErrorAction SilentlyContinue
            if ($BinaryValue.$nameValue -eq $expectedValue) {
                $events = Get-EventLog -LogName System | Where-Object {$_.Source -eq "Microsoft-Windows-GroupPolicy"} | Select-Object -First 1
                if ($events) {
                    $lastGPOChangeTime = $events.TimeGenerated
                    $processStartTime = $null
                    $service = sc.exe queryex Spooler
                    if ($service -and $service.Count -ge 9) {
                        $processId = $service[9].split(" ")[-1]
                        if ($processId) {
                            $wmiProcess = Get-WmiObject -Query "SELECT * FROM Win32_Process WHERE ProcessId = $processId"
                            $processStartTime = [Management.ManagementDateTimeConverter]::ToDateTime($wmiProcess.CreationDate)   
                        }
                    }
                    if ($processStartTime -ne $null -and $lastGPOChangeTime -ne $null) {
                        $cve_2021_34527_mitigated_status = $lastGPOChangeTime -lt $processStartTime
                    }
                }
            }
        }
    } else{
        $cve_2021_34527_mitigated_status = $true
    }
} catch {
    $cve_2021_34527_mitigated_status = $false
}

$cve_2021_34527_mitigated = if ($cve_2021_34527_mitigated_status) { "Mitigated" } else { "NotMitigated" }
$CollectedInfoGathringValues +=  Create-CollectedInfoGathringValueObject -Key "CVE_2021_34527_mitigation_status" -CollectedDataResult (0, $cve_2021_34527_mitigated)
#------------------------------------------------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------------------------------------------------
# Get Bootiful_Mind_mitigation_status
# https://www.bleepingcomputer.com/news/security/pkfail-secure-boot-bypass-lets-attackers-install-uefi-malware/
$bootiful_mind_status = "undefined"

try
{
    if([System.Text.Encoding]::ASCII.GetString((Get-SecureBootUEFI PK).bytes) -match "DO NOT TRUST|DO NOT SHIP") {
        $bootiful_mind_status = "Found"
    } else {
        $bootiful_mind_status = "NotFound"
    }
} catch {
    $bootiful_mind_status = "Unknown"
}

$CollectedInfoGathringValues += Create-CollectedInfoGathringValueObject -Key "Bootiful_Mind_status" -CollectedDataResult (0, $bootiful_mind_status)
#------------------------------------------------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------------------------------------------------
# Get CVE_2024_38063_mitigation_status
$cve_2024_38063_mitigated_status = $false

# Retrieve and check the IPv6 registry key
$ipv6_regKey = Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters' -Name 'DisabledComponents' -ErrorAction SilentlyContinue

# Check if the registry key exists
if ($ipv6_regKey -ne $null) {

    # Retrieve the value of DisabledComponents
    $value = (Get-Item -Path $ipv6_regKey.PSPath).GetValue('DisabledComponents')
    # 255 - all flags are set to 1, IPv6 is fully disabled
    if ($value -eq 255) {
        $cve_2024_38063_mitigated_status = $true
    }
}

$cve_2024_38063_mitigated = if ($cve_2024_38063_mitigated_status) { "Mitigated" } else { "NotMitigated" }
$CollectedInfoGathringValues += Create-CollectedInfoGathringValueObject -Key "CVE_2024_38063_mitigation_status" -CollectedDataResult (0, $cve_2024_38063_mitigated)

#------------------------------------------------------------------------------------------------------------------------------------------------

##########################################################################################################################################
# Process generated data and send to ETW
##########################################################################################################################################
$CollectedInfoGathringValuesProvider = [TvmInfoGatheringCollectorProvider]::log

# Prepare the CollectedInfoGathringValues object to send to ETW
$CollectedInfoGathringValuesAsJson = ConvertTo-Json -InputObject $CollectedInfoGathringValues -Compress
$CollectedInfoGathringValuesObject = New-Object CollectedInfoGathringValues($CollectedInfoGathringValuesAsJson)

# Send data to ETW
$CollectedInfoGathringValuesProvider.Write("CollectedInfoGathringValues", $CollectedInfoGathringValuesObject)
# SIG # Begin signature block
# MIIoZAYJKoZIhvcNAQcCoIIoVTCCKFECAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDrZ+zmUZ1YOsXH
# VCYiJE4lXU6iMdD+/3vStzre6ldcs6CCDZcwggYVMIID/aADAgECAhMzAAAEOExw
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
# LwYJKoZIhvcNAQkEMSIEIJeW5I7TJs6DSXdAf5a8oxLOkIFcR6m6cdVVfYYz9ri1
# MEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEAsPEV1XBphAye
# oFeXhdgnAuF+MVBBgqPLvf6BPDSCsPFnQTt6EFy/IFRdmrc7tN64loDRlwz7Ev9t
# vnODc5icRu79OuO0Z/rYfghrQa1frNOitVAqu/jHEwc5fMMZNBFlqIvCUXvarpaE
# r3cvINHeQcfFYKxkyS85nT+OpUbfdmgDtt/6rwZxAkugxAvp9QBQvOXbx9xD6las
# +oobqW2YJG8u6usw7hXdluZMMRpBvBeduRnAnpPcP9tEVFnNLe/EIsFkGYtCUl0R
# YaioFC0QYBOZVUt9+ixxmvBWx6YV0DihOS24VtN1PQi+rnxowetHkp+TQ2E0Pq9e
# gU3rU0dSQaGCF60wghepBgorBgEEAYI3AwMBMYIXmTCCF5UGCSqGSIb3DQEHAqCC
# F4YwgheCAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkE
# ggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQCAQUABCBCKpu1tYSX
# FUl4s9cHNQZ371byzPkUAJPmZgjahSIvfQIGaC5XWFniGBMyMDI1MDYwNTE0NDI0
# MS4yODFaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo2NTFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCEfswggco
# MIIFEKADAgECAhMzAAAB9ZkJlLzxxlCMAAEAAAH1MA0GCSqGSIb3DQEBCwUAMHwx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1p
# Y3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTI0MDcyNTE4MzEwMVoXDTI1
# MTAyMjE4MzEwMVowgdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjY1MUEtMDVFMC1EOTQ3MSUwIwYD
# VQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEAzO90cFQTWd/WP84IT7JMIW1fQL61sdfgmhlfT0nv
# YEb2kvkNF073ZwjveuSWot387LjE0TCiG93e6I0HzIFQBnbxGP/WPBUirFq7WE5R
# AsuhNfYUL+PIb9jJq3CwWxICfw5t/pTyIOHjKvo1lQOTWZypir/psZwEE7y2uWAP
# bZJTFrKen5R73x2Hbxy4eW1DcmXjym2wFWv10sBH40ajJfe+OkwcTdoYrY3KkpN/
# RQSjeycK0bhjo0CGYIYa+ZMAao0SNR/R1J1Y6sLkiCJO3aQrbS1Sz7l+/qJgy8fy
# EZMND5Ms7C0sEaOvoBHiWSpTM4vc0xDLCmc6PGv03CtWu2KiyqrL8BAB1EYyOShI
# 3IT79arDIDrL+de91FfjmSbBY5j+HvS0l3dXkjP3Hon8b74lWwikF0rzErF0n3kh
# VAusx7Sm1oGG+06hz9XAy3Wou+T6Se6oa5LDiQgPTfWR/j9FNk8Ju06oSfTh6c03
# V0ulla0Iwy+HzUl+WmYxFLU0PiaXsmgudNwVqn51zr+Bi3XPJ85wWuy6GGT7nBDm
# XNzTNkzK98DBQjTOabQXUZ884Yb9DFNcigmeVTYkyUXZ6hscd8Nyq45A3D3bk+nX
# nsogK1Z7zZj6XbGft7xgOYvveU6p0+frthbF7MXv+i5qcD9HfFmOq4VYHevVesYb
# 6P0CAwEAAaOCAUkwggFFMB0GA1UdDgQWBBRV4Hxb9Uo0oHDwJZJe22ixe2B1ATAf
# BgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQ
# hk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQl
# MjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBe
# MFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2Nl
# cnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAM
# BgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQE
# AwIHgDANBgkqhkiG9w0BAQsFAAOCAgEAcwxmVPaA9xHffuom0TOSp2hspuf1G0cH
# W/KXHAuhnpW8/Svlq5j9aKI/8/G6fGIQMr0zlpau8jy83I4zclGdJjl5S02SxDlU
# KawtWvgf7ida06PgjeQM1eX4Lut4bbPfT0FEp77G76hhysXxTJNHv5y+fwThUeii
# clihZwqcZMpa46m+oV6igTU6I0EnneotMqFs0Q3zHgVVr4WXjnG2Bcnkip42edyg
# /9iXczqTBrEkvTz0UlltpFGaQnLzq+No8VEgq0UG7W1ELZGhmmxFmHABwTT6sPJF
# V68DfLoC0iB9Qbb9VZ8mvbTV5JtISBklTuVAlEkzXi9LIjNmx+kndBfKP8dxG/xb
# RXptQDQDaCsS6ogLkwLgH6zSs+ul9WmzI0F8zImbhnZhUziIHheFo4H+ZoojPYcg
# TK6/3bkSbOabmQFf95B8B6e5WqXbS5s9OdMdUlW1gTI1r5u+WAwH2KG7dxneoTbf
# /jYl3TUtP7AHpyck2c0nun/Q0Cycpa9QUH/Dy01k6tQomNXGjivg2/BGcgZJ0Hw8
# C6KVelEJ31xLoE21m9+NEgSKCRoFE1Lkma31SyIaynbdYEb8sOlZynMdm8yPldDw
# uF54vJiEArjrcDNXe6BobZUiTWSKvv1DJadR1SUCO/Od21GgU+hZqu+dKgjKAYde
# TIvi9R2rtLYwggdxMIIFWaADAgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqG
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
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo2NTFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcG
# BSsOAwIaAxUAJsAKu48NbR5YRg3WSBQCyjzdkvaggYMwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsFAAIFAOvr8igwIhgPMjAy
# NTA2MDUxMDM4MzJaGA8yMDI1MDYwNjEwMzgzMlowdDA6BgorBgEEAYRZCgQBMSww
# KjAKAgUA6+vyKAIBADAHAgEAAgIBfTAHAgEAAgIT7zAKAgUA6+1DqAIBADA2Bgor
# BgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAID
# AYagMA0GCSqGSIb3DQEBCwUAA4IBAQBu9jCRycMlgysxj9LR9xIJ0275pwjLRtA8
# dpkF9MYDGJdflrqHnpzgUYqJxmajnMM/zp6B+2aF1Hx/YJmrSJ3fVsuCpz9QDeOs
# gVqN7LiPa1hT5LUMOcguirDu66whfHgdYjBf9Y9DVAvNjrXOnk5CV6jZcC0Js4Ll
# ODwwTTwJ0IUrWdk795wN/vOzAWH8ttEIVKGws2Hqxm8ykbLMgSwJnHQ9fr8d16n2
# 1tRtYxhKuIkE0fNYu26dpdSiT2h+YmiQHu762WTWhftjEsyiDur3S/Ucw3gu9/+x
# FvK5g+y+ab0/7Mwb1uPF81Rbe8uWFb5bujeJ3TZFk/MYlVtTeTO/MYIEDTCCBAkC
# AQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQG
# A1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAH1mQmUvPHG
# UIwAAQAAAfUwDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG
# 9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgv9zXNt8xYTNa+33cIpKUgLc9b9eeNk92
# niD7MTB4t7YwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCDB1vLSFwh09ISu
# 4kdEv4/tg9eR1Yk8w5x7j5GThqaPNTCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0
# YW1wIFBDQSAyMDEwAhMzAAAB9ZkJlLzxxlCMAAEAAAH1MCIEIO7zO5gZ+YswIIcz
# Uw4qthk/9EM6t1aYQtAY5Iwtfr9eMA0GCSqGSIb3DQEBCwUABIICAMh0/tVeDaJ3
# og7E2rSTXOIS4x5ACcxGdXvEk+u1dlOWRTG3ZG21hASwMU3WYjyE9RllGd7FwIHa
# XV+XgcnQUT8h4UoOdNXkCv+Et9Z6OD6zcUzX0qwTF1O1Kq0BhV4+MdgqV1GTOAmL
# pu8oTssgTrKV1Fht1GL26t7qFG/mhKD4E8n/cJtHN67YBAOlTgzF5k0ERx3+/HSB
# dCDZnQHv6IdQ9JKpOVLlhlR/Fvr8lUHtuBykiN9Sy/qCc+uG0x/ezLk3qFHdB/2U
# n0gZFx6Ktv5rfdvq6w7IbWbfvsOXGCJJf2pItux3CtpkUlEgLHq6zqFlMv7snS2C
# NqrNJjtQ2k59JYCy74ajWPtzUshJ/gb46ZUHfh+ic1Rjka/6QIDb79PfCpnocZRp
# 9mS9diupLdMizanmX4D3dnup0RytFIqfcRxmF484sYnUf6/En23xzbWxKob/1kKz
# 5+muCJVIN9/1o2VA7r19Z082ANa8EF7lCDQb9LhokyP92k0B9VBk9ErLe3aMZ08z
# QYywXr7+Nk5TCdzlJxXXS6Ez11tECRtJhqxEp60r3HRpI9XvIXItQwLenE9OWftR
# IZp/MP4Of8Ev7/6b/Glhr8YoVcvQHHl9OLghcZUhVsVpCUjJnyk9mXGpaFFyLPhQ
# jcjH4dwiWyCmGTdMhGvfQgehCCWcK3tD
# SIG # End signature block
