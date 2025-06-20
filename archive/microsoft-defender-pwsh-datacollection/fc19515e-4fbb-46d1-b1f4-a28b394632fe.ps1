
Get-Module | ForEach-Object { Remove-Module -Name $_.Name -Force }
$PSModuleAutoloadingPreference = 'none'
Import-Module Microsoft.PowerShell.Utility
Import-Module Microsoft.PowerShell.Management
Import-Module Microsoft.PowerShell.Security

$Source = @"
                        using System;
                        using System.Text;
                        using System.Diagnostics.Tracing;
                        using Microsoft.PowerShell.Commands;
                        
                        public static class BrowserExtensionEtwProvider
                        {
                            public static EventSource log = new EventSource("Microsoft.Windows.Sense.BrowserExtensionCollection", EventSourceSettings.EtwSelfDescribingEventFormat  | EventSourceSettings.ThrowOnEventWriteErrors);
                        }

                        [EventData] // [EventData] makes it possible to pass an instance of the class as an argument to EventSource.Write().
                        public class CollectedExtension
                        {
                            public CollectedExtension() {}

                            public String User { get; set; }

                            public String Id { get; set; }

                            public String TargetSoftware { get; set; }

                            public String Vendor { get; set; }

                            public String Name { get; set; }

                            public String Description { get; set; }

                            public String Version { get; set; }

                            public String VersionName { get; set; }

                            public bool Enabled { get; set; }

                            public String Permissions { get; set; }

                            public String OptionalPermissions { get; set; }

                            public String ActivePermissions { get; set; }

                            public String GrantedPermissions { get; set; }

                            public String InstallationTime { get; set; }

                            public bool InstalledByDefault { get; set; }

                            public bool InstalledFromStore { get; set; }

                            public bool InstalledByOEM { get; set; }

                            public bool IsApp { get; set; }

                            public int LocationFlags { get; set; }

                            public String InstallationPath { get; set; }

                            public int DisableReasons { get; set; }
                        }

                        [EventData] 
                        public class CollectedExtensionsIndex
                        {
							public String Index { get; set; }
                            
                            public String TargetSoftware { get; set; }

                            public CollectedExtensionsIndex(string targetSoftware, string index)
                            {
						        this.Index = index;
                                this.TargetSoftware = targetSoftware;
                            }
                        } 
"@

Add-Type -TypeDefinition $Source -Language CSharp -IgnoreWarnings
$collectedExtensionProvider = [BrowserExtensionEtwProvider]::log

##########################################################################

class BrowserConfig
{
    [String]$TargetSoftware
    [String]$Path
    [String[]]$Index = @()
}

$chromiumBrowsersConfig = @(
    New-Object -TypeName BrowserConfig -Property @{TargetSoftware = "chrome"; Path = "AppData\Local\Google\Chrome\User Data\" };
    New-Object -TypeName BrowserConfig -Property @{TargetSoftware = "edge"; Path = "AppData\Local\Microsoft\Edge\User Data\" };
)

$firefoxConfig = New-Object -TypeName BrowserConfig -Property @{TargetSoftware = "firefox"; Path = "AppData\Roaming\Mozilla\Firefox\Profiles\" };

function Parse-Chromium-Extension()
{
    param(
        [Parameter(Mandatory = $true)]
        [string]$TargetSoftware,
        [Parameter(Mandatory = $true)]
        [string]$User,
        [Parameter(Mandatory = $true)]
        [string]$ExtensionId,
        [Parameter(Mandatory = $true)]
        [System.Object]$ExtensionProps
    )

    $NonBlockListValues = @(0, $null)

    $result = New-Object -TypeName CollectedExtension
    $result.User = $User
    $result.Id = $ExtensionId
    $result.TargetSoftware = $TargetSoftware
    $result.Vendor = $ExtensionProps.manifest.author
    $result.Name = $ExtensionProps.manifest.name
    $result.Description = $ExtensionProps.manifest.description
    $result.Version = $ExtensionProps.manifest.version
    $result.VersionName = $ExtensionProps.manifest.version_name
    # SSIRP 24035: Mark revoked extensions as disabled
    $result.Enabled = $ExtensionProps.state -eq 1 -And $ExtensionProps.blacklist_state -in $NonBlockedValues -And $ExtensionProps.omaha_blocklist_state -in $NonBlockedValues -And $ExtensionProps.extension_telemetry_service_blocklist_state -in $NonBlockedValues

    #Permissions
    $result.Permissions = $ExtensionProps.manifest.permissions | ConvertTo-Json
    $result.OptionalPermissions = $ExtensionProps.manifest.optional_permissions | ConvertTo-Json
    $result.ActivePermissions = $ExtensionProps.active_permissions | ConvertTo-Json
    $result.GrantedPermissions = $ExtensionProps.granted_permissions | ConvertTo-Json
    #End Permissions
    $result.InstallationTime = $ExtensionProps.install_time
    $result.InstalledByDefault = $ExtensionProps.was_installed_by_default
    $result.InstalledFromStore = $ExtensionProps.from_webstore
    $result.InstalledByOEM = $ExtensionProps.was_installed_by_oem
    $result.IsApp = $null -ne $ExtensionProps.manifest.app
    $result.LocationFlags = $ExtensionProps.location
    $result.InstallationPath = $ExtensionProps.path
    $result.DisableReasons = $ExtensionProps.disable_reasons 

    return $result
}

function Parse-Firefox-Extension()
{
    param(
        [Parameter(Mandatory = $true)]
        [string]$User,
        [Parameter(Mandatory = $true)]
        [System.Object]$ExtensionProps
    )

    $result = New-Object -TypeName CollectedExtension
    $result.User = $User
    $result.Id = $ExtensionProps.id
    $result.TargetSoftware = "firefox"

    $result.Vendor = $ExtensionProps.defaultLocale.creator
    $result.Name = $ExtensionProps.defaultLocale.name
    $result.Description = $ExtensionProps.defaultLocale.description
    $result.Version = $ExtensionProps.version
    $result.VersionName = $ExtensionProps.version
    $result.Enabled = $ExtensionProps.active
    $result.Permissions = $ExtensionProps.userPermissions | ConvertTo-Json
    $result.OptionalPermissions = $ExtensionProps.optionalPermissions | ConvertTo-Json
    $result.InstallationTime = $ExtensionProps.installDate
    $result.InstallationPath = $ExtensionProps.path

    # These fields are not relevant for firefox
    # ActivePermissions, GrantedPermissions, InstalledByDefault, InstalledFromStore, InstalledByOEM, LocationFlags, IsApp

    return $result
}

function CollectChromiumExtensions()
{
    param(
        [Parameter(Mandatory = $true)]
        [string]$UserPath
    )

    $preferencesFiles = @("Preferences", "Secure Preferences");

    # go over every browser configuration
    foreach ($config in $chromiumBrowsersConfig)
    {
        $basePath = "$($UserPath)\$($config.Path)"
        
        if (Test-Path -Path $basePath)
        {
            # Default profile folder
            $profiles = @("Default")

            # In addition to default profile folder other profiles will be named "Profile #" where # is a number
            # Add all existing profiles so we can scan them as well
            foreach ($p in (Get-ChildItem -Path $basePath -Filter "Profile*").Name)
            {
                $profiles += $p
            }

            foreach ($profile in $profiles)
            {
                foreach ($pref in $preferencesFiles)
                {
                    $preferencesPath = "$($basePath)$($profile)\$($pref)"
                    
                    if (Test-Path -Path $preferencesPath)
                    {
                        $preferences = Get-Content -Raw -Encoding UTF8 -Path $preferencesPath |  ConvertFrom-Json
                        $settings = $preferences.extensions.settings
                
                        # create new extensions index array
                        foreach ($extension in $settings.PSObject.Properties)
                        {
                            try
                            {
                                $collectedExtension = Parse-Chromium-Extension -ExtensionId $extension.Name  -ExtensionProps $extension.Value -TargetSoftware $config.TargetSoftware -User ($UserPath | Split-Path -Leaf)
                                $collectedExtensionProvider.Write("CollectedExtension", $collectedExtension)
                                
                                # add the current extensions to the index 
                                $config.Index += $extension.Name
                            }
                            catch
                            {
                                Write-Host "Error occurred while parsing extension:$($extension.Name)"
                                Write-Host $_
                            }
                        }
                    }
                }
            }
        }
    }
}

function CollectFirefoxExtensions()
{
    param(
        [Parameter(Mandatory = $true)]
        [string]$UserPath
    )

    $profilesPath = "$($UserPath)\$($firefoxConfig.Path)"

    # check if the extension folder exists
    if (Test-Path -Path $profilesPath)
    {
        $profilesFolders = Get-ChildItem -Path $profilesPath -Directory

        foreach ($profile in $profilesFolders)
        {
            $extensionsFile = "$($profilesPath)\$($profile)\extensions.json"
            
            if (Test-Path -Path $extensionsFile)
            {
                $preferences = Get-Content -Raw -Path $extensionsFile |  ConvertFrom-Json
                $addons = $preferences.addons

                foreach ($extension in $addons)
                {
                    try 
                    {
                        # parse and send only non default extensions
                        if ($extension.type -eq "extension" -And $extension.location -eq "app-profile")
                        {
                            $collectedExtension = Parse-Firefox-Extension -User ($UserPath | Split-Path -Leaf) -ExtensionProps $extension
                            $collectedExtensionProvider.Write("CollectedExtension", $collectedExtension)

                            # add the current extensions to the index 
                            $firefoxConfig.Index += $collectedExtension.Id
                        }
                    }
                    catch 
                    {
                        Write-Host "Error occurred while parsing firefox extension:$($extension.id)"
                        Write-Host $_
                    }
                        
                }
            }
        }
    }
    
}

function SendIndexEventIfNeeded()
{
    param(
        [Parameter(Mandatory = $true)]
        [BrowserConfig]$BrowserConfig
    )

    if ($BrowserConfig.Index.Count -gt 0)
    {
        try
        {
            # since the index event is aggreagated for all users it might contain the same ids
            # first remove duplicates
            $uniqueExtensions = $BrowserConfig.Index | sort -uniq
            
            $extensionsIndexAsJson = ConvertTo-Json -InputObject $uniqueExtensions -Compress
            $extensionsIndexEvent = New-Object -TypeName CollectedExtensionsIndex -ArgumentList $BrowserConfig.TargetSoftware, $extensionsIndexAsJson
            $collectedExtensionProvider.Write("CollectedExtensionsIndex", $extensionsIndexEvent)
        }
        catch
        {
            Write-Host "Error occurred while sending extensions index"
            Write-Host $_
        }
    }
}


try
{
    $localUsers = Get-WmiObject Win32_UserProfile -Filter "Special = False" | Select LocalPath

    # foreach user 
    foreach ($user in $localUsers)
    {
        $userPath = $user.LocalPath

        # Collect chromium based extensions (chrome + edge chromium)
        CollectChromiumExtensions -UserPath $userPath

        # Collect firefox extensions
        CollectFirefoxExtensions -UserPath $userPath
    }


    # We send index events only after we collected extensions for all users
    foreach ($config in $chromiumBrowsersConfig)
    {
        SendIndexEventIfNeeded -BrowserConfig $config
    }

    SendIndexEventIfNeeded -BrowserConfig $firefoxConfig
}
catch
{
    Write-Host "Error occurred while reading client extensions:"
    Write-Host $_
}
# SIG # Begin signature block
# MIIoZwYJKoZIhvcNAQcCoIIoWDCCKFQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBN+JiFnoOLuKuc
# Iv3AAh9KiM9J1hNRUhyVDEpGYWU/5qCCDZcwggYVMIID/aADAgECAhMzAAAEOExw
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
# LwYJKoZIhvcNAQkEMSIEIBVlqIeLx9PJYBf8NPG+iSqVGN+3f/Yvk4200K00Io0r
# MEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEARH9S13wN9Jrz
# Na8tXTpVHp+TTz6GLDmbxDmL5mTRiU/LizBZjBhLqSmpd4xlYFjMHtInRkJ49iuo
# N1WE8h2njAkpKThIg/3B5BaqkHpsUMMBrfMdxGQ9k+/VrN7+yKrSRNiqbwYiGrnk
# 9KbFzJZVZXNZeN3WCsU11/4Ekq8hjYthbqKiD1hVLtU/y+aU/qyrEgRki+CYCkHB
# ZVMKwgpB8NaD2kmOCiPBHPlQ28VHct8Et1fbGIh0qrk6756ciWDxcfIhnVqDGTUP
# 5/X7ESYEH1Z6/Sghz/c1JkrIqt3hWUGhWQrC5wv5gy57Y+8vvFaulOY+XHtgf/hN
# e9Dof99Rb6GCF7AwghesBgorBgEEAYI3AwMBMYIXnDCCF5gGCSqGSIb3DQEHAqCC
# F4kwgheFAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkE
# ggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQCAQUABCDN5gAL002h
# /f4YonQbKXAOIoyBfAUfjBqv7DdGCSnyEgIGaC3VeiAZGBMyMDI1MDYwNTE0NDIz
# OC42ODlaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjozMjFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCEf4wggco
# MIIFEKADAgECAhMzAAAB+KOhJgwMQEj+AAEAAAH4MA0GCSqGSIb3DQEBCwUAMHwx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1p
# Y3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTI0MDcyNTE4MzEwOFoXDTI1
# MTAyMjE4MzEwOFowgdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjMyMUEtMDVFMC1EOTQ3MSUwIwYD
# VQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEAxR23pXYnD2BuODdeXs2Cu/T5kKI+bAw8cbtN50Cm
# /FArjXyL4RTqMe6laQ/CqeMTxgckvZr1JrW0Mi4F15rx/VveGhKBmob45DmOcV5x
# yx7h9Tk59NAl5PNMAWKAIWf270SWAAWxQbpVIhhPWCnVV3otVvahEad8pMmoSXrT
# 5Z7Nk1RnB70A2bq9Hk8wIeC3vBuxEX2E8X50IgAHsyaR9roFq3ErzUEHlS8YnSq3
# 3ui5uBcrFOcFOCZILuVFVTgEqSrX4UiX0etqi7jUtKypgIflaZcV5cI5XI/eCxY8
# wDNmBprhYMNlYxdmQ9aLRDcTKWtddWpnJtyl5e3gHuYoj8xuDQ0XZNy7ESRwJIK0
# 3+rTZqfaYyM4XSK1s0aa+mO69vo/NmJ4R/f1+KucBPJ4yUdbqJWM3xMvBwLYycvi
# gI/WK4kgPog0UBNczaQwDVXpcU+TMcOvWP8HBWmWJQImTZInAFivXqUaBbo3wAfP
# NbsQpvNNGu/12pg0F8O/CdRfgPHfOhIWQ0D8ALCY+LsiwbzcejbrVl4N9fn2wOg2
# sDa8RfNoD614I0pFjy/lq1NsBo9V4GZBikzX7ZjWCRgd1FCBXGpfpDikHjQ05YOk
# AakdWDT2bGSaUZJGVYtepIpPTAs1gd/vUogcdiL51o7shuHIlB6QSUiQ24XYhRbb
# QCECAwEAAaOCAUkwggFFMB0GA1UdDgQWBBS9zsZzz57QlT5nrt/oitLv1OQ7tjAf
# BgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQ
# hk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQl
# MjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBe
# MFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2Nl
# cnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAM
# BgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQE
# AwIHgDANBgkqhkiG9w0BAQsFAAOCAgEAYfk8GzzpEVnGl7y6oXoytCb42Hx6TOA0
# +dkaBI36ftDE9tLubUa/xMbHB5rcNiRhFHZ93RefdPpc4+FF0DAl5lP8xKAO+293
# RWPKDFOFIxgtZY08t8D9cSQpgGUzyw3lETZebNLEA17A/CTpA2F9uh8j84KygeEb
# j+bidWDiEfayoH2A5/5ywJJxIuLzFVHacvWxSCKoF9hlSrZSG5fXWS3namf4tt69
# 0UT6AGyWLFWe895coFPxm/m0UIMjjp9VRFH7nb3Ng2Q4gPS9E5ZTMZ6nAlmUicDj
# 0NXAs2wQuQrnYnbRAJ/DQW35qLo7Daw9AsItqjFhbMcG68gDc4j74L2KYe/2goBH
# LwzSn5UDftS1HZI0ZRsqmNHI0TZvvUWX9ajm6SfLBTEtoTo6gLOX0UD/9rrhGjdk
# iCw4SwU5osClgqgiNMK5ndk2gxFlDXHCyLp5qB6BoPpc82RhO0yCzoP9gv7zv2Eo
# cAWEsqE5+0Wmu5uarmfvcziLfU1SY240OZW8ld4sS8fnybn/jDMmFAhazV1zH0QE
# RWEsfLSpwkOXaImWNFJ5lmcnf1VTm6cmfasScYtElpjqZ9GooCmk1XFApORPs/PO
# 43IcFmPRwagt00iQSw+rBeIH00KQq+FJT/62SB70g9g/R8TS6k6b/wt2UWhqrW+Q
# 8lw6Xzgex/YwggdxMIIFWaADAgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqG
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
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjozMjFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcG
# BSsOAwIaAxUAtkQt/ebWSQ5DnG+aKRzPELCFE9GggYMwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsFAAIFAOvsGQEwIhgPMjAy
# NTA2MDUxMzI0MTdaGA8yMDI1MDYwNjEzMjQxN1owdzA9BgorBgEEAYRZCgQBMS8w
# LTAKAgUA6+wZAQIBADAKAgEAAgIS5gIB/zAHAgEAAgISezAKAgUA6+1qgQIBADA2
# BgorBgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIB
# AAIDAYagMA0GCSqGSIb3DQEBCwUAA4IBAQBDh/F/3DaWF1VuP3mVBTFMNbJ3BEec
# zuFiwFKKKnJadyGO2tViC2m6gBlwAx8pCFgOG2qf9lgF4dW9bSquciXkCciERwms
# PilYcFywk0g5Im33jXkSPiloif6YXBG88fSCBd8+2rGkqhijcrzK7UAcsH+AS5nT
# +WqxAnGjjye8yzD127UVkYIKUYqlwVsWE54XdH8FJshFljhAZNqMc4Kjn9TsqRBu
# PLHDso6lZwnLhPrDjLr1CziAEu4dPbnxmrPDa7MaMffH0TxCVfURgBwp5/z+vMyL
# VFmkVKRMVDrZNkn8TtXMB0e64hWeP/rugOt+Qs5vjezrW3lbEysNnYzjMYIEDTCC
# BAkCAQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
# BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEm
# MCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAH4o6Em
# DAxASP4AAQAAAfgwDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsq
# hkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQghHsXd2LLTtSRACe8aytd+7uN/hyH
# PsGIpiaXqD5E7BIwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCDvzDPyXw1U
# kAUFYt8bR4UdjM90Qv5xnVaiKD3I0Zz3WjCBmDCBgKR+MHwxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1l
# LVN0YW1wIFBDQSAyMDEwAhMzAAAB+KOhJgwMQEj+AAEAAAH4MCIEIK33dwEXt3I0
# VtnY8UFtj+xCYKS/sndPFtBrrVaz+kULMA0GCSqGSIb3DQEBCwUABIICAIU5IqFF
# aWzyfAyRCLaubs6dAMPsgAe3uUdn7mURUCw4RxMed6ZZa1CiZTFXU6Ua0SLtj/H1
# gJnJX2IMFB28ONetFYBV29noc+62EJUNaAAzmHjDQDvWoJzuYKYxByevNSs3Wdp0
# Ku03wQTSdCng3guf+eEXAUhBkNOOBOoVg1zShPibxfgoWjYL7e+huKrdSQpXmhEU
# 2Ljlzaw/EjzUztpgcvC0EQ6SaSSiaggRX514QD9CD88bQYTkUGNvafNBF41U0dR5
# Q2V3X4fI4KbG1n7ai4IYpXFJQADS6PF82ikxkgEGlYnTRMSoshql801PurSpdZiM
# M79OnrWA3KCcK7481ONm8JanbjO3IR/DFJOqBzzQWojpd4golcpbvcjDPn6N0+JR
# 6UEjc7M/LGlTSfK2hIzDABkVGmf5GmRtN/rbNiVwiZieII9VbLF/M759TqgJi7qv
# 5Z6/lwfOT6j/wjuuRPByx4v8OusAqbWMY0IX2Fjl7s0MxXHfCc/a4v3cxjb3Ao/W
# 6x2VO33T99QToECV++fGZAb+oW/w8Usu3wngyWoDFJFBwUHkCPJzq9bNjM4P0cZE
# 0axvlmxSujhRTrkDaPQ6CE9zvxnjoSnhzLXhBoMhaHrYKvMJjRlGi5/T2x3/9AnB
# NdbJSUHIA/tlZ4DCO1foB08j/RApUzlOKOog
# SIG # End signature block
