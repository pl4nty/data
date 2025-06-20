Get-Module | ForEach-Object { Remove-Module -Name $_.Name -Force }
$PSModuleAutoloadingPreference = 'none'
Import-Module Microsoft.PowerShell.Utility

$Source = @"
                        using System;
                        using System.Text;
                        using System.Diagnostics.Tracing;
                        using Microsoft.PowerShell.Commands;
                        public static class EtwProvider
                              {
                                    public static EventSource log = new EventSource("Microsoft.Windows.Sense.CollectionEtw", EventSourceSettings.EtwSelfDescribingEventFormat);
                              }

                        [EventData]
                        public class AwsCliAuthDataUnified
                        {
                              public String awsUsersAsJson { get; set; }						  

                              public AwsCliAuthDataUnified(string awsUsersAsJson)
                              {
                                    this.awsUsersAsJson = awsUsersAsJson;
                              }
                        }
						
						[EventData]
						public class AzureCliAuthDataUnified
                        {
                              public String azureUsersAsJson { get; set; }

                              public AzureCliAuthDataUnified(string azureUsersAsJson)
                              {
                                    this.azureUsersAsJson = azureUsersAsJson;
                              }
                        }
						
						[EventData]
						public class GcpAdcAuthDataUnified
                        {
                              public String gcpUsersAsJson { get; set; }

                              public GcpAdcAuthDataUnified(string gcpUsersAsJson)
                              {
                                    this.gcpUsersAsJson = gcpUsersAsJson;
                              }
                        }
						
						[EventData]
						public class GcpGcloudAuthDataUnified
                        {
                              public String gcpUsersAsJson { get; set; }				  

                              public GcpGcloudAuthDataUnified(string gcpUsersAsJson)
                              {
                                    this.gcpUsersAsJson = gcpUsersAsJson;
                              }
                        }
"@

Add-Type -TypeDefinition $Source -Language CSharp -IgnoreWarnings
$collectedWindowsUpdatesProvider =  [EtwProvider]::log

###
### Script Functions
###

# Iterates all Windows user folders and looks for a $subPath. Returns a list of the full paths (supports both directories and files).
function GetSubPathsForAllUsers {
    param (
        [string] $subPath
    )
	
	$subDirectories = @()
    $profilesDirectory = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList").ProfilesDirectory
	$userFolders = Get-ChildItem -Path $profilesDirectory -Directory

	# Iterate through each user folder
	foreach ($userFolder in $userFolders) {
		# Check if $subPath exists and append it to the array accordingly
		$folderPath = Join-Path -Path $userFolder.FullName -ChildPath $subPath
		if (Test-Path -Path $folderPath) {
			$subDirectories += $folderPath
		}
	}
    return $subDirectories
}

# Helper function which converts arrays to json string, so that it will always be surrounded by square brackets 
function SerializeArrayAsJsonString {
	param (
        [array] $array
    )

	if ($array.Count -eq 0) {
		return '[]'
	}

	$arrayAsJsonStr = $array | ConvertTo-Json -Compress;	
	if (!$arrayAsJsonStr.StartsWith('[')) {
		$arrayAsJsonStr = '[' + $arrayAsJsonStr + ']'
	}
	return $arrayAsJsonStr
}

# Iterate registry identity store cache to find crrelation with AAD/AD username and SID
function GetUserToSidMap {
	$userToSid = @{}
	$identityStoreCacheKey = "HKLM:\SOFTWARE\Microsoft\IdentityStore\Cache"
	# Verify that the identity store cache indeed exists
	if (-not (Test-Path -Path $identityStoreCacheKey)) {
		return $userToSid
	}
	
	$iteratedKeys = 0
	$cacheKeys = Get-ChildItem -Path $identityStoreCacheKey
	foreach ($cacheKey in $cacheKeys) {
		$iteratedKeys += 1
		# To avoid script timeout, dont iterate more than a 1000 keys
		if ($iteratedKeys -ge 1000) {
			break
		}
		$cacheKeyName = Split-Path -Path $cacheKey -Leaf
		$identityCachePath = Join-Path $identityStoreCacheKey -ChildPath $cacheKeyName | Join-Path -ChildPath "IdentityCache"	
		
		# Some cache keys don't include any data and are empty
		if (-not (Test-Path -Path $identityCachePath)) {
			continue
		}
		$sidKeys = Get-ChildItem -Path $identityCachePath
		foreach ($sidKey in $sidKeys) {
			$sidKeyName = Split-Path -Path $sidKey -Leaf
			$sidKeyPath = Join-Path $identityCachePath -ChildPath $sidKeyName
			$userName = (Get-ItemProperty -Path $sidKeyPath).UserName
			$userName = $userName.ToLower()
			# Verify that the "UserName" property exists inside the key
			if ($userName -eq $null) {
				continue
			}
			if ($userToSid.Keys -notcontains $userName) {
				$userToSid[$userName] = $sidKeyName
			}
		}
	}
	
    return $userToSid
}


function GetAwsSecretInfo {
	$awsConfigFilePaths = GetSubPathsForAllUsers ".aws\config"
	$accessKeyIds = @{}
	$detectedKeysObjList = @()
	
	foreach ($awsConfigFilePath in $awsConfigFilePaths) {
		$fileItem = Get-Item $awsConfigFilePath
		$fileContent = Get-Content -Path $awsConfigFilePath
		# Iterate through each line in the file
		for ($i = 0; $i -lt $fileContent.Length - 1; $i++) {
			$line1 = $fileContent[$i]
			$line2 = $fileContent[$i + 1]
			
			# search for pairs of access key id and secret, no matter in what order
			if ($line1 -match '^aws_access_key_id=' -and $line2 -match '^aws_secret_access_key=') {
				$accessKeyId = $line1 -replace '.*=', ''
				if ($accessKeyIds.Keys -notcontains $accessKeyId) {
					$accessKeyIds[$accessKeyId] = $true
					$detectedKeysObjList += [PSCustomObject]@{
						accessKeyId = $accessKeyId;
						lastAccessTime = $fileItem.LastAccessTime;
					}
				}
			} elseif ($line2 -match '^aws_access_key_id=' -and $line1 -match '^aws_secret_access_key=') {
				$accessKeyId = $line2 -replace '.*=', ''
				if ($accessKeyIds.Keys -notcontains $accessKeyId) {
					$accessKeyIds[$accessKeyId] = $true
					$detectedKeysObjList += [PSCustomObject]@{
						accessKeyId = $accessKeyId;
						lastAccessTime = $fileItem.LastAccessTime;
					}	
				}
			}
		}
	}

	$detectedKeysAsJson = SerializeArrayAsJsonString $detectedKeysObjList
	$newEvent = New-Object AwsCliAuthDataUnified -ArgumentList @($detectedKeysAsJson)
	$collectedWindowsUpdatesProvider.Write("AwsCliAuthDataUnified", $newEvent)
}

function GetAzureSecretInfo {
    $azureProfileFilePaths = GetSubPathsForAllUsers ".azure\azureProfile.json"
	$azureUsers = @{}
	$userToSid = GetUserToSidMap
	$detectedUsersObjList = @()
	
	foreach ($azureProfileFilePath in $azureProfileFilePaths) {
		$fileItem = Get-Item $azureProfileFilePath
		$fileContent = Get-Content -Path $azureProfileFilePath
		$jsonObject = $fileContent | ConvertFrom-Json
		
		foreach ($subInfo in $jsonObject.subscriptions) {
			if ($subInfo.state -ne "Enabled") {
				continue
			}
			if ($azureUsers.Keys -notcontains $subInfo.user.name) {
				$azureUsers[$subInfo.user.name] = $true
				if ($userToSid.Keys -contains $subInfo.user.name) {
					$userSid = $userToSid[$subInfo.user.name]
				} else {
					$userSid = ""
				}

				$detectedUsersObjList += [PSCustomObject]@{
					userName = $subInfo.user.name;
					userType = $subInfo.user.type;
					tenantId = $subInfo.tenantId;
					homeTenantId = $subInfo.homeTenantId;
					lastAccessTime = $fileItem.LastAccessTime;
					userSid = $userSid;
				}	
			}
		}
	}

	
	$detectedUsersAsJson = SerializeArrayAsJsonString $detectedUsersObjList
	$newEvent = New-Object AzureCliAuthDataUnified -ArgumentList @($detectedUsersAsJson)
	$collectedWindowsUpdatesProvider.Write("AzureCliAuthDataUnified", $newEvent)
}

function GetGcpAdcCredentials {
	$gcloudClinetIds = @{}
	$detectedUsersObjList = @()

	# Fetch info on adc credentials. Each application_default_credentials.json includes only one user.
	$adcCredentialsPaths = GetSubPathsForAllUsers "AppData\Roaming\gcloud\application_default_credentials.json"
	foreach ($adcCredentialsPath in $adcCredentialsPaths) {
		$fileItem = Get-Item $adcCredentialsPath
		$fileContent = Get-Content -Path $adcCredentialsPath
		$jsonObject = $fileContent | ConvertFrom-Json
		
		if ($gcloudClinetIds.Keys -notcontains $jsonObject.client_id) {
			$gcloudClinetIds[$jsonObject.client_id] = $true
			$detectedUsersObjList += [PSCustomObject]@{
				clientId = $jsonObject.client_id;
				userType = $jsonObject.type;
				lastAccessTime = $fileItem.LastAccessTime;
			}

		}
	}

	$detectedUsersAsJson = SerializeArrayAsJsonString $detectedUsersObjList
	$newEvent = New-Object GcpAdcAuthDataUnified -ArgumentList @($detectedUsersAsJson)
	$collectedWindowsUpdatesProvider.Write("GcpAdcAuthDataUnified", $newEvent)
}

function GetGcpGcloudCliCredentials {
	$gcloudUserNames = @{}
	$detectedUsersObjList = @()

	$gcloudCredentialsPaths = GetSubPathsForAllUsers "AppData\Roaming\gcloud\legacy_credentials"
	foreach ($gcloudCredentialsPath in $gcloudCredentialsPaths) {
		$folders = Get-ChildItem -Path $gcloudCredentialsPath -Directory

		# Iterate through each folder and treat them as strings
		foreach ($folder in $folders) {
			$userName = $folder.Name
			# Use a dictionary to avoid duplications (in case the same gcloud user was used in several local windows users)
			if ($gcloudUserNames.Keys -notcontains $userName) {
				$gcloudUserNames[$userName] = $true
				$detectedUsersObjList += [PSCustomObject]@{
					userName = $userName;
					lastAccessTime = $folder.LastAccessTime;
				}
			}
		}
	}

	$detectedUsersAsJson = SerializeArrayAsJsonString $detectedUsersObjList
	$newEvent = New-Object GcpGcloudAuthDataUnified -ArgumentList @($detectedUsersAsJson)
	$collectedWindowsUpdatesProvider.Write("GcpGcloudAuthDataUnified", $newEvent)
}


# Main
GetAwsSecretInfo
GetAzureSecretInfo
GetGcpAdcCredentials
GetGcpGcloudCliCredentials
# SIG # Begin signature block
# MIIoZwYJKoZIhvcNAQcCoIIoWDCCKFQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAVXJEF6eR0wTZV
# Ip0CPKlq/1azfgwRiTZaXbJeZThzeaCCDZcwggYVMIID/aADAgECAhMzAAAEOExw
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
# LwYJKoZIhvcNAQkEMSIEIHychoTFpAPK1yN3ClIezBylOqipaBf3iEnNn+q6z2QD
# MEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEAFKvJBuewKW5i
# kuGC0WVIqXpzL2ngvGLP/V+fwWv/L/LLHtu4b5siSGy4SFaWdOOc+0MX/uXFukTP
# +KcmsNCso2yYugaa+A+kItdtXL21sXrb/QaN+KwsvA9JEAPDa1w2MuH+V01ZQ+qe
# aSO/Ix8hNQhfxMeR4oXq/0xKFccFi7ssuCOnCQA7Sis+x40mPyBi/0slpUOODBYp
# jfTUwK9hUG0d+2DDs3ok2aR8wt07geqRK84KREX9plDdsVYZuRgB8Lv8MAC9Xzkt
# 2oUsMw3kkUiapaI1QKsw3ymM3CjKvMkUJzqrkd2FLMidejRFKzbwbWhey5sBMT4l
# gwoy9olmMaGCF7AwghesBgorBgEEAYI3AwMBMYIXnDCCF5gGCSqGSIb3DQEHAqCC
# F4kwgheFAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkE
# ggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQCAQUABCAaWe7lhCcP
# OTBL08rSWtCV8p8Aa7EvP+wEm9P51cxm0QIGaC4/K6a3GBMyMDI1MDYwNTE0NDIz
# OS45MDlaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
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
# hkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgHuFc8ER2axX4OZ1yq9WjmEXyaWO6
# dJrAMFza+rac2YkwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCA52wKr/KCF
# lVNYiWsCLsB4qhjEYEP3xHqYqDu1SSTlGDCBmDCBgKR+MHwxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1l
# LVN0YW1wIFBDQSAyMDEwAhMzAAAB+8vLbDdn5TCVAAEAAAH7MCIEIBVy1VFyfphV
# hJukqbgA5LhDVRdJuVD/s0G5hifDIXaoMA0GCSqGSIb3DQEBCwUABIICAJiGVMO5
# 0VUQJv4JmxgOS1Utvj1X8IvhoU8ukCAXpFJ7Eyw1OQnbhr2f/nQYG5G6kGYDwyyP
# Vla7XauKlMi2+aqQ6dw3vsUS0FdzarPHDp88eu+G6UCXM3BU1j6yL8dvBbyT+iUu
# VEvZFbn98fYB3eWShu4Y3fsizNtLzj1/Hmj0OPvKD6Owo8QlDiwJrxCXbKZIW6iO
# Z/1XGufFiADMm/MhSGkbBzmOf4aL1UG8I8Js0O6SC3b6yZpahiwA//dCkbLo60ZB
# nX3A0aOQxZNwTuFNstTAro++Kzpg7Sex6s5V2mDsyQKE2c64GiLVXVkFtUZ3c9zf
# xIbndlxYgX9z7h9ISt+fYSR5mHQXj8s9FTWrMgVGU3Mur9r3ewjVI13+k6qjQ6Qq
# dt/q7iC/wv7Ky/1LOefx8CpMZq3RFpCLwPQU9+pNGe6+XuflpqUilR5SZWQKpavC
# he/bqSr9NpQzjOo2YJ1JvvQTilTB6/GwFiE8RbjYwks06Su+camK0k9hZ+Q6vUiA
# x29Mef+0IoJX3A8sBX0cAV3RRgqGSP8oMn2lGDjhfii6YSaxHLb7ci5cVuNd4ycA
# RZzL2amLWo5pk1s6thINZR6YLiU3/nNgiTe1uGvjX2B/r3t0c6SR/SrFuAYh6kmA
# dKIumAd11x1M2Z1IU03Zm5/ifaQkPIGEAjCB
# SIG # End signature block
