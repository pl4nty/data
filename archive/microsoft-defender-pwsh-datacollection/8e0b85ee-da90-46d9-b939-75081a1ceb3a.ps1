Get-Module | ForEach-Object { Remove-Module -Name $_.Name -Force }
$PSModuleAutoloadingPreference = 'none'
Import-Module Microsoft.PowerShell.Utility
Import-Module Microsoft.PowerShell.Management

$Source = @"
                        using System;
                        using System.Text;
                        using System.Diagnostics.Tracing;
                        using Microsoft.PowerShell.Commands;

                        public static class EtwProvider
                        {
                            public static EventSource log = new EventSource("Microsoft.Windows.Sense.CollectionEtw", EventSourceSettings.EtwSelfDescribingEventFormat  | EventSourceSettings.ThrowOnEventWriteErrors);
                        }

                        [EventData] // [EventData] makes it possible to pass an instance of the class as an argument to EventSource.Write().
                        public class CollectedService
                        {
							    public String ID { get; set; }
                                public String Name { get; set; }
                                public String DisplayName { get; set; }
                                public String Description { get; set; }
                                public String ServiceType { get; set; }
                                public String StartMode { get; set; }
                                public String Path { get; set; }
                                public String Parameters { get; set; }
                                public String ExecutingAccount { get; set; }
                                public String Sddl;
                                public bool IsPathSuspicious  { get; set; }
                                public bool IsPathUnquoted { get; set; }
                                public bool HasCachedPlainPassword { get; set; }
                                public String Status  { get; set; }

                                public CollectedService(string Id, string name, string displayName, string description, string serviceType, string startMode, string path, string parameters, string executingAccount,string sddl, bool isPathSuspicious, bool isPathUnquoted, bool hasCachedPlainPassword, string status)
                                {
									this.ID = Id;
                                    this.Name = name;
                                    this.DisplayName = displayName;
                                    this.Description = description;
                                    this.ServiceType = serviceType;
                                    this.StartMode = startMode;
                                    this.Path = path;
                                    this.Parameters = parameters;
                                    this.ExecutingAccount = executingAccount;
                                    this.Sddl = sddl;
                                    this.IsPathSuspicious = isPathSuspicious;
                                    this.IsPathUnquoted = isPathUnquoted;
                                    this.HasCachedPlainPassword = hasCachedPlainPassword;
                                    this.Status = status;
                                }
                        }

                        [EventData]
                        public class CollectedServicseIndex
                        {
							    public String Index { get; set; }

                                public CollectedServicseIndex(string index)
                                {
							        this.Index = index;
                                }
                        }
"@

Add-Type -TypeDefinition $Source -Language CSharp -IgnoreWarnings
$CollectedServiceProvider =  [EtwProvider]::log

$Keys = Get-ChildItem HKLM:\System\CurrentControlSet\\services
$Services = $Keys | Foreach-Object { Get-ItemProperty $_.PsPath}


$servicesIndex = @()


ForEach ($Service in $Services) {
if(((($Service.Type -band 16 ) -eq 16 ) -or (($Service.Type -band 32 ) -eq 32))-and (($Service.Type -band 64 ) -ne 64)){ # filter only Win32 own processes and Win32 shared processes
        $servicesIndex += $Service.PSChildName
        $serviceName = $Service.PSChildName
        $displayName = ""  # fill with empty string because service's registry keys doesn't contains the display name but a path to a dll which holds the display name and the index of the string inside the dll
        $description = ""  # fill with empty string because service's registry keys doesn't contains the description but a path to a dll which holds the description and the index of the string inside the dll
        $serviceType = $Service.Type
        $startMode = $Service.Start
        $pathName = $Service.ImagePath
        $parameters = $null
        if($pathName -like "*\System32\svchost.exe -k*")
        {
            $valueExists = (Get-Item HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName\Parameters -EA Ignore).Property -contains "ServiceDll"
            if($valueExists)
            {
                $parameters = $(Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName\Parameters).ServiceDll
            }
        }
        $executingAccount = $Service.ObjectName
        $sddl = ""  # fill with empty string because service registry key contains sddl in a binary format
        $isPathSuspicious = (
            $service.ImagePath -notlike "*$Env:windir*" -and
            $service.ImagePath -notlike "*$Env:ProgramFiles*" -and
            $service.ImagePath -notlike "*$Env:ProgramFiles(x86)*" -and
            $service.ImagePath -notlike "*$Env:ProgramData*"  -and
            $service.ImagePath -notlike "*:\\windows*"  -and
            $service.ImagePath -notlike "*:\\program files*"  -and
            $service.ImagePath -notlike "*:\\program files(x86)*"  -and
            $service.ImagePath -notlike "*:\\programdata*")

    # check if the path is unquated
    $isPathUnquoted =  (($service.ImagePath -ne $null) -and ($service.ImagePath.trim() -ne '')) -and ((-not $service.ImagePath.StartsWith("`"")) -and
    (-not $service.ImagePath.StartsWith("'")))

    # check if the service path is both unquated and have a space in the executable path
    $isPathUnquoted =  $isPathUnquoted -and ((($service.ImagePath.Substring(0, $service.ImagePath.ToLower().IndexOf(".exe") + 4)) -match ".* .*") -or
                                            (($service.ImagePath.Substring(0, $service.ImagePath.ToLower().IndexOf(".bat") + 4)) -match ".* .*") -or
                                            (($service.ImagePath.Substring(0, $service.ImagePath.ToLower().IndexOf(".cmd") + 4)) -match ".* .*"))

        #if the executing account starts with 'NT SERVICE' then there is a registry key under the 'Secret' registry key but without cached password. so we can ignore it.
    if($executingAccount.StartsWith('NT SERVICE','CurrentCultureIgnoreCase'))
    {
        $hasCachedPlainPassword = $false
    }
    else
    {
        # check if the service have a registy key under secrets key so we could know if it has cached password.
        $secretKey = dir HKLM:\SECURITY\Policy\Secrets | where Name  -eq "HKEY_LOCAL_MACHINE\SECURITY\Policy\Secrets\_SC_$($service.PSChildName)"
        $hasCachedPlainPassword = ($secretKey -ne $null )
    }

    $serviceStatus = ""
    $getService = Get-Service $serviceName -ErrorAction Ignore
    if ($null -ne $getService)
    {
        $serviceStatus = $getService.Status
    }
    
    $collectedService = New-Object CollectedService($serviceName, $serviceName, $displayName, $description, $serviceType, $startMode, $pathName, $parameters, $executingAccount, $sddl, $isPathSuspicious, $isPathUnquoted, $hasCachedPlainPassword, $serviceStatus)
    $CollectedServiceProvider.Write("CollectedService", $collectedService)
    }
}

$servicesIndexAsJson = ConvertTo-Json -InputObject $servicesIndex -Compress

$collectedServicesIndex = New-Object CollectedServicseIndex($servicesIndexAsJson)

$CollectedServiceProvider.Write("CollectedServicesIndex", $collectedServicesIndex)
# SIG # Begin signature block
# MIIoSwYJKoZIhvcNAQcCoIIoPDCCKDgCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCB/FYS2Z510f25/
# 6aPrMKpQQKxdEkjUgkm8FJhENim6m6CCDZcwggYVMIID/aADAgECAhMzAAAEOExw
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
# zTGCGgowghoGAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEC
# EzMAAAQ4THAXx1OE9PMAAAAABDgwDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcN
# AQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUw
# LwYJKoZIhvcNAQkEMSIEICssSkOrrrkuO2Hjp+SkhJQ4Az43gzjyb1XqN0Pd87G9
# MEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEACJW8zmwBWmrH
# g7MOiI7ckvGtSOMWrikebw9LhgfvRQVf8dg4S8FfvChN1wxpDzg0424f/Mtpwr8A
# CCqILH+geX5LNL/oKiUR6Ac1Ccp4ZXKZ5bcs2Utb8yQRylbkJlPUjPs4ZgIRVZuh
# yq5nt2NAireuy0V+hBv8q+QrX02+uMTfMjZ7IVjR0Ohtjsxzn3c+Rg2mFxfqAiJ7
# E1c/XV0ySU4jp1XRfDWax/EmqRqQPo8nuMySiWZHFgjBFU4MlzVKzrS6RTgGjCrI
# fFKMlaHV3ZTc50L3dCfx1fTeKrCp/x2h+JjIxQ/o8fGFeYTb1AZxPRC889Lm8D+O
# jRnY+BAXx6GCF5QwgheQBgorBgEEAYI3AwMBMYIXgDCCF3wGCSqGSIb3DQEHAqCC
# F20wghdpAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFSBgsqhkiG9w0BCRABBKCCAUEE
# ggE9MIIBOQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQCAQUABCAthDh/M97U
# 3yo5nAkEzs4ZbODiPMFOg1e81GYssxbkIAIGaCZtYuJtGBMyMDI1MDYwNTE0NDIz
# NS40NDdaMASAAgH0oIHRpIHOMIHLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25z
# MScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046RTAwMi0wNUUwLUQ5NDcxJTAjBgNV
# BAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2WgghHqMIIHIDCCBQigAwIB
# AgITMwAAAgsRnVYpkvm/hQABAAACCzANBgkqhkiG9w0BAQsFADB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yNTAxMzAxOTQyNThaFw0yNjA0MjIxOTQy
# NThaMIHLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYD
# VQQLExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hp
# ZWxkIFRTUyBFU046RTAwMi0wNUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBU
# aW1lLVN0YW1wIFNlcnZpY2UwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoIC
# AQCqrPitRjAXqFh2IHzQYD3uykDPyJF+79e5CkY4aYsb93QVun4fZ3Ju/0WHrtAF
# 3JswSiAVl7p1H2zFKrvyhaVuRYcSc7YuyP0GHEVq7YVS5uF3YLlLeoyGOPKSXGs6
# agW60CqVBhPQ+2n49e6YD9wGv6Y0HmBKmnQqY/AKJijgUiRulb1ovNEcTZmTNRu1
# mY+0JjiEus+eF66VNoBv1a2MW0JPYbFBhPzFHlddFXcjf2qIkb5BYWsFL7QlBjXA
# pf2HmNrPzG36g1ybo/KnRjSgIRpHeYXxBIaCEGtR1EmpJ90OSFHxUu7eIjVfenqn
# Vtag0yAQY7zEWSXMN6+CHjv3SBNtm5ZIRyyCsUZG8454K+865bw7FwuH8vk5Q+07
# K5lFY02eBDw3UKzWjWvqTp2pK8MTa4kozvlKgrSGp5sh57GnkjlvNvt78NXbZTVI
# rwS7xcIGjbvS/2r5lRDT+Q3P2tT+g6KDPdLntlcbFdHuuzyJyx0WfCr8zHv8wGCB
# 3qPObRXK4opAInSQ4j5iS28KATJGwQabRueZvhvd9Od0wcFYOb4orUv1dD5XwFyK
# lGDPMcTPOQr0gxmEQVrLiJEoLyyW8EV/aDFUXToxyhfzWZ6Dc0l9eeth1Et2NQ3A
# /qBR5x33pjKdHJVJ5xpp2AI3ZzNYLDCqO1lthz1GaSz+PQIDAQABo4IBSTCCAUUw
# HQYDVR0OBBYEFGZcLIjfr+l6WeMuhE9gsxe98j/+MB8GA1UdIwQYMBaAFJ+nFV0A
# XmJdg/Tl0mWnG1M1GelyMF8GA1UdHwRYMFYwVKBSoFCGTmh0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQ
# Q0ElMjAyMDEwKDEpLmNybDBsBggrBgEFBQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0
# dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIw
# VGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3J0MAwGA1UdEwEB/wQCMAAwFgYD
# VR0lAQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQDAgeAMA0GCSqGSIb3DQEB
# CwUAA4ICAQCaKPVn6GLcnkbPEdM0R9q4Zm0+7JfG05+pmqP6nA4SwT26k9HlJQjq
# w/+WkiQLD4owJxooIr9MDZbiZX6ypPhF+g1P5u8BOEXPYYkOWpzFGLRLtlZHvfxp
# qAIa7mjLGHDzKr/102AXaD4mGydEwaLGhUn9DBGdMm5dhiisWAqb/LN4lm4OuX4Y
# LqKcW/0yScHKgprGgLY+6pqv0zPU74j7eCr+PDTNYM8tFJ/btUnBNLyOE4WZwBIq
# 4tnvXjd2cCOtgUnoQjFU1ZY7ZWdny3BJbf3hBrb3NB2IU4nu622tVrb1fNkwdvT5
# 01WRUBMd9oFf4xifj2j2Clbv1XGljXmd6yJjvt+bBuvJLUuc9m+vMKOWyRwUdvOl
# /E5a8zV3MrjCnY6fIrLQNzBOZ6klICPCi+2GqbViM0CI6CbZypei5Rr9hJbH8rZE
# zjaYWLnr/XPsU0wr2Tn6L9dJx2q/LAoK+oviAInj0aP4iRrMyUSO6KL2KwY6zJc6
# SDxbHkwYHdQRrPNP3SutMg6LgBSvtmfqwgaXIHkCoiUFEAz9cGIqvgjGpGppKTcT
# uoo3EEgp/zRd0wxW0QqmV3ygYGicen30KAWHrKFC8Sbwc6qC4podVZYJZmirHBP/
# uo7sQne5H0xtdvDmXDUfy5gNjLljQIUsJhQSyyXbSjSb2a5jhOUfxzCCB3EwggVZ
# oAMCAQICEzMAAAAVxedrngKbSZkAAAAAABUwDQYJKoZIhvcNAQELBQAwgYgxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jv
# c29mdCBSb290IENlcnRpZmljYXRlIEF1dGhvcml0eSAyMDEwMB4XDTIxMDkzMDE4
# MjIyNVoXDTMwMDkzMDE4MzIyNVowfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldh
# c2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIw
# MTAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDk4aZM57RyIQt5osvX
# JHm9DtWC0/3unAcH0qlsTnXIyjVX9gF/bErg4r25PhdgM/9cT8dm95VTcVrifkpa
# /rg2Z4VGIwy1jRPPdzLAEBjoYH1qUoNEt6aORmsHFPPFdvWGUNzBRMhxXFExN6AK
# OG6N7dcP2CZTfDlhAnrEqv1yaa8dq6z2Nr41JmTamDu6GnszrYBbfowQHJ1S/rbo
# YiXcag/PXfT+jlPP1uyFVk3v3byNpOORj7I5LFGc6XBpDco2LXCOMcg1KL3jtIck
# w+DJj361VI/c+gVVmG1oO5pGve2krnopN6zL64NF50ZuyjLVwIYwXE8s4mKyzbni
# jYjklqwBSru+cakXW2dg3viSkR4dPf0gz3N9QZpGdc3EXzTdEonW/aUgfX782Z5F
# 37ZyL9t9X4C626p+Nuw2TPYrbqgSUei/BQOj0XOmTTd0lBw0gg/wEPK3Rxjtp+iZ
# fD9M269ewvPV2HM9Q07BMzlMjgK8QmguEOqEUUbi0b1qGFphAXPKZ6Je1yh2AuIz
# GHLXpyDwwvoSCtdjbwzJNmSLW6CmgyFdXzB0kZSU2LlQ+QuJYfM2BjUYhEfb3BvR
# /bLUHMVr9lxSUV0S2yW6r1AFemzFER1y7435UsSFF5PAPBXbGjfHCBUYP3irRbb1
# Hode2o+eFnJpxq57t7c+auIurQIDAQABo4IB3TCCAdkwEgYJKwYBBAGCNxUBBAUC
# AwEAATAjBgkrBgEEAYI3FQIEFgQUKqdS/mTEmr6CkTxGNSnPEP8vBO4wHQYDVR0O
# BBYEFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMFwGA1UdIARVMFMwUQYMKwYBBAGCN0yD
# fQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lv
# cHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTATBgNVHSUEDDAKBggrBgEFBQcDCDAZBgkr
# BgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUw
# AwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvXzpoYxDBWBgNVHR8ETzBN
# MEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0
# cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcmwwWgYIKwYBBQUHAQEETjBMMEoG
# CCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01p
# Y1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDANBgkqhkiG9w0BAQsFAAOCAgEAnVV9
# /Cqt4SwfZwExJFvhnnJL/Klv6lwUtj5OR2R4sQaTlz0xM7U518JxNj/aZGx80HU5
# bbsPMeTCj/ts0aGUGCLu6WZnOlNN3Zi6th542DYunKmCVgADsAW+iehp4LoJ7nvf
# am++Kctu2D9IdQHZGN5tggz1bSNU5HhTdSRXud2f8449xvNo32X2pFaq95W2KFUn
# 0CS9QKC/GbYSEhFdPSfgQJY4rPf5KYnDvBewVIVCs/wMnosZiefwC2qBwoEZQhlS
# dYo2wh3DYXMuLGt7bj8sCXgU6ZGyqVvfSaN0DLzskYDSPeZKPmY7T7uG+jIa2Zb0
# j/aRAfbOxnT99kxybxCrdTDFNLB62FD+CljdQDzHVG2dY3RILLFORy3BFARxv2T5
# JL5zbcqOCb2zAVdJVGTZc9d/HltEAY5aGZFrDZ+kKNxnGSgkujhLmm77IVRrakUR
# R6nxt67I6IleT53S0Ex2tVdUCbFpAUR+fKFhbHP+CrvsQWY9af3LwUFJfn6Tvsv4
# O+S3Fb+0zj6lMVGEvL8CwYKiexcdFYmNcP7ntdAoGokLjzbaukz5m/8K6TT4JDVn
# K+ANuOaMmdbhIurwJ0I9JZTmdHRbatGePu1+oDEzfbzL6Xu/OHBE0ZDxyKs6ijoI
# Yn/ZcGNTTY3ugm2lBRDBcQZqELQdVTNYs6FwZvKhggNNMIICNQIBATCB+aGB0aSB
# zjCByzELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcT
# B1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjElMCMGA1UE
# CxMcTWljcm9zb2Z0IEFtZXJpY2EgT3BlcmF0aW9uczEnMCUGA1UECxMeblNoaWVs
# ZCBUU1MgRVNOOkUwMDItMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGlt
# ZS1TdGFtcCBTZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQCoQndUJN3Ppq2xh8RhtsR3
# 5NCZwaCBgzCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqG
# SIb3DQEBCwUAAgUA6+vwyTAiGA8yMDI1MDYwNTEwMzI0MVoYDzIwMjUwNjA2MTAz
# MjQxWjB0MDoGCisGAQQBhFkKBAExLDAqMAoCBQDr6/DJAgEAMAcCAQACAhyqMAcC
# AQACAhKZMAoCBQDr7UJJAgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkK
# AwKgCjAIAgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJKoZIhvcNAQELBQADggEBAEX5
# o1e9pWEb44Y4QkRHtGAopZjD3sTtgYhBA7QsNXwGPe6DU9fQZob2AAo0RoLfGhMr
# 6/lkGFv8z0BpHJIUxVp4QXy3MYHofVz9veYA4U+CsTrA7OhRgLVR7yPf6pwkn4IE
# Dh7qj/NIZ4Hw1UIYticIfmmG1y1caEx1kJLIB1GJaSdq5d5vGgjJwLiTOO0RLNqL
# aDpO6LN20GgPBrbJgtmKs4ndBQViri9Ejh1JrHinu/4OSA+87H6iW9UuH6+XBY7O
# kPJD+06TzTEC1AtCA4EW/ZGV3KBeQoux4c2J3RTN0O1V/8QtlCy9AucEd30VYgE4
# SYxTmJK36aDBPMQ1h70xggQNMIIECQIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEG
# A1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
# cm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFt
# cCBQQ0EgMjAxMAITMwAAAgsRnVYpkvm/hQABAAACCzANBglghkgBZQMEAgEFAKCC
# AUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCCo
# DTHe+H3qBLNEpI+07T4w4ohygNGnN4hNR/sbCQZa4zCB+gYLKoZIhvcNAQkQAi8x
# geowgecwgeQwgb0EIDTVdKu6N77bh0wdOyF+ogRN8vKJcw5jnf2/EussYkozMIGY
# MIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQG
# A1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAILEZ1WKZL5
# v4UAAQAAAgswIgQgiTU80S+MT8OK7mX5+0Ysz+FJpEhL+lr/KRm6o7w6ApUwDQYJ
# KoZIhvcNAQELBQAEggIATR1ctYtmKRX+40RurJUUyjQjr9YJUMgN//7sUjl9oLuH
# heRaQ+zIUPcgri7sllnltElLeR4HNvAiyGxuDyyHToiQOdoyY0YRjY9KqbCotPgL
# DyOOzLopA9ueOEiOOEjPxJ3ilFTqo9tB6cmU2Mvri3VoNS2bn2E5h3G21Q3BBRwb
# wav1M7XnmL4rJht7KeTV39T8aF7uD928W4kVHz84xkTY8dsbn0Mwp0nvaijvahuL
# R3QReW48EZv9etj83KbptcJSHFGiRoG46b9M36UAk3+B6g90zUonUICDHCki/XLH
# TfQYxklx5cDZxq+hQ4kuYxAr3BSjvAMzRr068YstUvMtrKYrzUCa1ONfnV5W/oIy
# 9mUCirr7sKSoPLHJpwNDTtIZUCmm7s91sxJIqVQC6OOMUSNWohfHh4v279LzU2uO
# 3gKXO6o+iWd5wqK/2aKGQo8aUzCfbFWtTX2fiHbvRq/cV6r/ILIvV7gdKQWOqlKL
# 6Z0wQdzNOeVZWv0P/k8lHAbg6lAIEg6ChLf356AOlB3lRgCgrGOqKjf472TDJUXI
# +hkTSSQAEishTf4fx4+ceQkoIaX7UXne69hg4GL725cUWZ2Ph3+/Vyn/gT6mEzDN
# 8EdXRTwetMT/h4/ecaPyrVYPhbGuQ/M6gjf49WQLPcZCzKA3eg8wjWbBlIQmqcM=
# SIG # End signature block
