#
#  Copyright 2018-2024 HP Development Company, L.P.
#  All Rights Reserved.
#
# NOTICE:  All information contained herein is, and remains the property of HP Inc.
#
# The intellectual and technical concepts contained herein are proprietary to HP Inc
# and may be covered by U.S. and Foreign Patents, patents in process, and are protected by
# trade secret or copyright law. Dissemination of this information or reproduction of this material
# is strictly forbidden unless prior written permission is obtained from HP Inc.

using namespace HP.CMSLHelper

Set-StrictMode -Version 3.0
$ErrorActionPreference = "Stop"
#requires -Modules "HP.Private"

# CMSL is normally installed in C:\Program Files\WindowsPowerShell\Modules
# but if installed via PSGallery and via PS7, it is installed in a different location
if (Test-Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll") {
  Add-Type -Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll"
}
else{
  Add-Type -Path "$PSScriptRoot\..\..\HP.Private\1.8.1\HP.CMSLHelper.dll"
}

<#
.SYNOPSIS
  Retrieves the HP Secure Platform Management state

.DESCRIPTION
  This command retrieves the state of the HP Secure Platform Management.

.LINK
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.NOTES
  - Requires HP BIOS with Secure Platform Management support.
  - This command requires elevated privileges.

.EXAMPLE
  Get-HPSecurePlatformState
#>
function Get-HPSecurePlatformState {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPSecurePlatformState")]
  param()
  $mi_result = 0
  $data = New-Object -TypeName provisioning_data_t
  $c = '[DfmNativeSecurePlatform]::get_secureplatform_provisioning' + (Test-OSBitness) + '([ref]$data,[ref]$mi_result);'
  $result = Invoke-Expression -Command $c
  Test-HPPrivateCustomResult -result $result -mi_result $mi_result -Category 0x04

  $kek_mod = $data.kek_mod
  [array]::Reverse($kek_mod)

  $sk_mod = $data.sk_mod
  [array]::Reverse($sk_mod)

  # calculating EndorsementKeyID
  $kek_encoded = [System.Convert]::ToBase64String($kek_mod)
  # $kek_decoded = [Convert]::FromBase64String($kek_encoded)
  # $kek_hash = Get-HPPrivateHash -Data $kek_decoded
  # $kek_Id = [System.Convert]::ToBase64String($kek_hash)

  # calculating SigningKeyID
  $sk_encoded = [System.Convert]::ToBase64String($sk_mod)
  # $sk_decoded = [Convert]::FromBase64String($sk_encoded)
  # $sk_hash = Get-HPPrivateHash -Data $sk_decoded
  # $sk_Id = [System.Convert]::ToBase64String($sk_hash)

  # get Sure Admin Mode and Local Access values
  $sure_admin_mode = ""
  $local_access = ""
  if ((Get-HPPrivateIsSureAdminSupported) -eq $true) {
    $sure_admin_state = Get-HPSureAdminState
    $sure_admin_mode = $sure_admin_state.SureAdminMode
    $local_access = $sure_admin_state.LocalAccess
  }

  # calculate FeaturesInUse
  $featuresInUse = ""
  if ($data.features_in_use -eq "SureAdmin") {
    $featuresInUse = "SureAdmin ($sure_admin_mode, Local Access - $local_access)"
  }
  else {
    $featuresInUse = $data.features_in_use
  }

  $obj = [ordered]@{
    State = $data.State
    Version = "$($data.subsystem_version[0]).$($data.subsystem_version[1])"
    Nonce = $($data.arp_counter)
    FeaturesInUse = $featuresInUse
    EndorsementKeyMod = $kek_mod
    SigningKeyMod = $sk_mod
    EndorsementKeyID = $kek_encoded
    SigningKeyID = $sk_encoded
  }
  return New-Object -TypeName PSCustomObject -Property $obj
}


<#
.SYNOPSIS
  Creates an HP Secure Platform Management payload to provision a _Key Endorsement_ key

.DESCRIPTION
  This command creates an HP Secure Platform Management payload to provision a _Key Endorsement_ key. The purpose of the endorsement key is to protect the signing key against unauthorized changes.
  Only holders of the key endorsement private key may change the signing key.

  There are three endorsement options to choose from:
  - Endorsement Key File (and Password) using -EndorsementKeyFile and -EndorsementKeyPassword parameters 
  - Endorsement Key Certificate using -EndorsementKeyCertificate parameter
  - Remote Endorsement using -RemoteEndorsementKeyID and -RemoteSigningServiceURL parameters 

  Please note that using a Key File with Password in PFX format is recommended over using an X509 Certificate object because a private key in a certificate is not password protected.

  This command writes the created payload to the pipeline or to the file specified in the OutputFile parameter.
  This payload can then be passed to the Set-HPSecurePlatformPayload command.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Set-HPSecurePlatformPayload command. Creating the payload and passing it to the Set-HPSecurePlatformPayload command via the pipeline is not a recommended production pattern.

.PARAMETER EndorsementKeyFile
  Specifies the _Key Endorsement_ key certificate as a PFX (PKCS #12) file

.PARAMETER EndorsementKeyPassword
  Specifies the password for the _Endorsement Key_ PFX file. If no password was used when the PFX was created (not recommended), this parameter may be omitted.

.PARAMETER EndorsementKeyCertificate
  Specifies the endorsement key certificate as an X509Certificate object

.PARAMETER BIOSPassword
  Specifies the BIOS setup password, if any. Note that the password will be in the clear in the generated payload.

.PARAMETER OutputFile
  Specifies the file to write output to instead of writing the output to the pipeline

.PARAMETER RemoteEndorsementKeyID
  Specifies the Endorsement Key ID to be used

.PARAMETER RemoteSigningServiceURL
  Specifies the Key Management Services (KMS) server URL (I.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.LINK
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.NOTES
  The Key Endorsement private key must never leave a secure server. The payload must be created on a secure server, then may be transferred to a client.

  - Requires HP BIOS with Secure Platform Management support.

.EXAMPLE
   $payload = New-HPSecurePlatformEndorsementKeyProvisioningPayload -EndorsementKeyFile "$path\endorsement_key.pfx"
   ...
   $payload | Set-HPSecurePlatformPayload

#>
function New-HPSecurePlatformEndorsementKeyProvisioningPayload {
  [CmdletBinding(DefaultParameterSetName = "EK_FromFile",HelpUri = "https://developers.hp.com/hp-client-management/doc/New-HPSecurePlatformEndorsementKeyProvisioningPayload")]
  param(
    [Parameter(ParameterSetName = "EK_FromFile",Mandatory = $true,Position = 0)]
    [System.IO.FileInfo]$EndorsementKeyFile,

    [Parameter(ParameterSetName = "EK_FromFile",Mandatory = $false,Position = 1)]
    [string]$EndorsementKeyPassword,

    [Parameter(ParameterSetName = "EK_FromBytes",Mandatory = $true,Position = 0)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$EndorsementKeyCertificate,

    [Parameter(ParameterSetName = "EK_FromFile",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "EK_FromBytes",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 0)]
    [string]$BIOSPassword,

    [Parameter(ParameterSetName = "EK_FromFile",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "EK_FromBytes",Mandatory = $false,Position = 3)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 1)]
    [string]$RemoteEndorsementKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 2)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 3)]
    [switch]$CacheAccessToken
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($RemoteSigningServiceURL -and -not ($RemoteSigningServiceURL.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($RemoteSigningServiceURL) -or $RemoteSigningServiceURL.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if ($PSCmdlet.ParameterSetName -eq "RemoteSigning") {
    if (-not $RemoteSigningServiceURL.EndsWith('/')) {
      $RemoteSigningServiceURL += '/'
    }
    $RemoteSigningServiceURL += 'api/commands/p21ekpubliccert'
    $jsonPayload = New-HPPrivateRemoteSecurePlatformProvisioningJson -EndorsementKeyID $RemoteEndorsementKeyID
    $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
    $response,$responseContent = Send-HPPrivateKMSRequest -KMSUri $RemoteSigningServiceURL -JsonPayload $jsonPayload -AccessToken $accessToken -Verbose:$VerbosePreference
  
    if ($response -eq "OK") {
      $crt = [Convert]::FromBase64String($responseContent)
    }
    else {
      Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
    }
  }
  else {
    $crt = (Get-HPPrivateX509CertCoalesce -File $EndorsementKeyFile -cert $EndorsementKeyCertificate -password $EndorsementKeyPassword -Verbose:$VerbosePreference).Certificate
  }

  Write-Verbose "Creating EK provisioning payload"
  if ($BIOSPassword) {
    $passwordLength = $BIOSPassword.Length
  }
  else {
    $passwordLength = 0
  }

  $opaque = New-Object opaque4096_t
  $opaqueLength = 4096
  $mi_result = 0
  $cmd = '[DfmNativeSecurePlatform]::get_ek_provisioning_data' + (Test-OSBitness) + '($crt,$($crt.Count),$BIOSPassword, $passwordLength, [ref]$opaque, [ref]$opaqueLength,  [ref]$mi_result);'
  $result = Invoke-Expression -Command $cmd
  Test-HPPrivateCustomResult -result $result -mi_result $mi_result -Category 0x04

  $output = New-Object -TypeName PortableFileFormat
  $output.Data = $opaque.raw[0..($opaqueLength - 1)]
  $output.purpose = "hp:provision:endorsementkey"
  $output.timestamp = Get-Date

  if ($OutputFile) {
    Write-Verbose "Will output to file $OutputFile"
    $f = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputFile)
    $output | ConvertTo-Json -Compress | Out-File $f -Encoding utf8
  }
  else {
    $output | ConvertTo-Json -Compress
  }
}


<#
.SYNOPSIS
  Creates an HP Secure Platform Management payload to provision a _Signing Key_ key

.DESCRIPTION
  This command creates an HP Secure Platform Management payload to provision a _Signing Key_ key. The purpose of the signing key is to sign commands for the Secure Platform Management. The Signing key is protected by the endorsement key. As a result, the endorsement key private key must be available when provisioning or changing the signing key.
  There are three signing options to choose from:
  - Signing Key File (and Password) using -SigningKeyFile and -SigningKeyPassword parameters 
  - Signing Key Certificate using -SigningKeyCertificate parameter
  - Remote Signing using -RemoteSigningServiceKeyID and -RemoteSigningServiceURL parameters 

  There are three endorsement options to choose from:
  - Endorsement Key File (and Password) using -EndorsementKeyFile and -EndorsementKeyPassword parameters 
  - Endorsement Key Certificate using -EndorsementKeyCertificate parameter
  - Remote Endorsement using -RemoteEndorsementKeyID and -RemoteSigningServiceURL parameters 

  Please note that using a Key File with Password in PFX format is recommended over using an X509 Certificate object because a private key in a certificate is not password protected.

  This command writes the created payload to the pipeline or to the file specified in the -OutputFile parameter. This payload can then be passed to the Set-HPSecurePlatformPayload command.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Set-HPSecurePlatformPayload command. Please note that creating the payload and passing it to the Set-HPSecurePlatformPayload command via the pipeline is not a recommended production pattern.

.PARAMETER EndorsementKeyFile
  Specifies the _Key Endorsement_ key certificate as a PFX (PKCS #12) file

.PARAMETER EndorsementKeyPassword
  Specifies the password for the _Endorsement Key_ PFX file. If no password was used when the PFX was created (which is not recommended), this parameter may be omitted.

.PARAMETER EndorsementKeyCertificate
  Specifies the endorsement key certificate as an X509Certificate object

.PARAMETER SigningKeyFile
  Specifies the path to the Secure Platform Management signing key as a PFX file. If the PFX file is protected by a password (recommended), the SigningKeyPassword parameter should also be provided.

.PARAMETER SigningKeyCertificate
  Specifies the Secure Platform Management signing key certificate as an X509Certificate object

.PARAMETER SigningKeyPassword
  Specifies the Secure Platform Management signing key file password, if required.

.PARAMETER Nonce
  Specifies a Nonce. If nonce is specified, the Secure Platform Management subsystem will only accept commands with a nonce greater or equal to the last nonce sent. This approach helps to prevent replay attacks. If not specified, the nonce is inferred from the current local time. The current local time as the nonce works in most cases. However, this approach has a resolution of seconds, so when performing parallel operations or a high volume of operations, it is possible for the same counter to be interpreted for more than one command. In these cases, the caller should use its own nonce derivation and provide it through this parameter.

.PARAMETER OutputFile
  Specifies the file to write output to instead of writing the output to the pipeline

.PARAMETER RemoteEndorsementKeyID
  Specifies the Endorsement Key ID to be used

.PARAMETER RemoteSigningKeyID
  Specifies the Signing Key ID to be provisioned

.PARAMETER RemoteSigningServiceURL
  Specifies the (Key Management Service) KMS server URL (I.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.LINK
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.NOTES
  - Requires HP BIOS with Secure Platform Management support.

.EXAMPLE
  $payload = New-HPSecurePlatformSigningKeyProvisioningPayload -EndorsementKeyFile "$path\endorsement_key.pfx"  `
               -SigningKeyFile "$path\signing_key.pfx"
  ...
  $payload | Set-HPSecurePlatformPayload

#>
function New-HPSecurePlatformSigningKeyProvisioningPayload {
  [CmdletBinding(DefaultParameterSetName = "EF_SF",HelpUri = "https://developers.hp.com/hp-client-management/doc/New-HPSecurePlatformSigningKeyProvisioningPayload")]
  param(
    [Parameter(ParameterSetName = "EF_SF",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "EF_SB",Mandatory = $true,Position = 0)]
    [System.IO.FileInfo]$EndorsementKeyFile,

    [Parameter(ParameterSetName = "EF_SF",Mandatory = $false,Position = 1)]
    [Parameter(ParameterSetName = "EF_SB",Mandatory = $false,Position = 1)]
    [string]$EndorsementKeyPassword,

    [Parameter(ParameterSetName = "EF_SF",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "EB_SF",Mandatory = $false,Position = 2)]
    [System.IO.FileInfo]$SigningKeyFile,

    [Parameter(ParameterSetName = "EF_SF",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "EB_SF",Mandatory = $false,Position = 3)]
    [string]$SigningKeyPassword,

    [Parameter(ParameterSetName = "EB_SF",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "EB_SB",Mandatory = $true,Position = 0)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$EndorsementKeyCertificate,

    [Parameter(ValueFromPipeline = $true,ParameterSetName = "EB_SB",Mandatory = $false,Position = 2)]
    [Parameter(ValueFromPipeline = $true,ParameterSetName = "EF_SB",Mandatory = $false,Position = 2)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKeyCertificate,

    [Parameter(ParameterSetName = "EF_SF",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "EB_SF",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "EF_SB",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "EB_SB",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 1)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "EF_SF",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "EB_SF",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "EF_SB",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "EB_SB",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 2)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 3)]
    [string]$RemoteEndorsementKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 4)]
    [string]$RemoteSigningKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 5)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 6)]
    [switch]$CacheAccessToken
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($RemoteSigningServiceURL -and -not ($RemoteSigningServiceURL.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($RemoteSigningServiceURL) -or $RemoteSigningServiceURL.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if ($PSCmdlet.ParameterSetName -eq "RemoteSigning") {
    if (-not $RemoteSigningServiceURL.EndsWith('/')) {
      $RemoteSigningServiceURL += '/'
    }
    $RemoteSigningServiceURL += 'api/commands/p21skprovisioningpayload'

    $params = @{
      EndorsementKeyID = $RemoteEndorsementKeyID
      Nonce = $Nonce
    }
    if ($RemoteSigningKeyID) {
      $params.SigningKeyID = $RemoteSigningKeyID
    }

    $jsonPayload = New-HPPrivateRemoteSecurePlatformProvisioningJson @params
    $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
    $response,$responseContent = Send-HPPrivateKMSRequest -KMSUri $RemoteSigningServiceURL -JsonPayload $jsonPayload -AccessToken $accessToken -Verbose:$VerbosePreference
  
    if ($response -eq "OK") {
      return $responseContent
    }
    else {
      Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
    }
  }
  else {
    $ek = Get-HPPrivateX509CertCoalesce -File $EndorsementKeyFile -password $EndorsementKeyPassword -cert $EndorsementKeyCertificate -Verbose:$VerbosePreference
    $sk = $null
    if ($SigningKeyFile -or $SigningKeyCertificate) {
      $sk = Get-HPPrivateX509CertCoalesce -File $SigningKeyFile -password $SigningKeyPassword -cert $SigningKeyCertificate -Verbose:$VerbosePreference
    }

    Write-Verbose "Creating SK provisioning payload"

    $payload = New-Object sk_provisioning_t
    $sub = New-Object sk_provisioning_payload_t

    $sub.Counter = $nonce
    if ($sk) {
      $sub.mod = $Sk.Modulus
    }
    else {
      Write-Verbose "Assuming deprovisioning due to missing signing key update"
      $sub.mod = New-Object byte[] 256
    }
    $payload.Data = $sub
    Write-Verbose "Using counter value of $($sub.Counter)"
    $out = Convert-HPPrivateObjectToBytes -obj $sub -Verbose:$VerbosePreference
    $payload.sig = Invoke-HPPrivateSignData -Data $out[0] -Certificate $ek.Full -Verbose:$VerbosePreference


    Write-Verbose "Serializing payload"
    $out = Convert-HPPrivateObjectToBytes -obj $payload -Verbose:$VerbosePreference

    $output = New-Object -TypeName PortableFileFormat
    $output.Data = ($out[0])[0..($out[1] - 1)];
    $output.purpose = "hp:provision:signingkey"
    $output.timestamp = Get-Date

    if ($OutputFile) {
      Write-Verbose "Will output to file $OutputFile"
      $f = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputFile)
      $output | ConvertTo-Json -Compress | Out-File -FilePath $f -Encoding utf8
    }
    else {
      $output | ConvertTo-Json -Compress
    }
  }
}

function New-HPPrivateRemoteSecurePlatformProvisioningJson {
  [CmdletBinding()]
  param(
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 1)]
    [uint32]$Nonce,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 2)]
    [string]$EndorsementKeyId,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 3)]
    [string]$SigningKeyId
  )

  $payload = [ordered]@{
    EKId = $EndorsementKeyId
  }

  if ($Nonce) {
    $payload['Nonce'] = $Nonce
  }

  if ($SigningKeyId) {
    $payload['SKId'] = $SigningKeyId
  }

  $payload | ConvertTo-Json -Compress
}

<#
.SYNOPSIS
  Creates a deprovisioning payload

.DESCRIPTION
  This command creates a payload to deprovision the HP Secure Platform Management. The caller must have access to the Endorsement Key private key in order to create this payload.

  There are three endorsement options to choose from:
  - Endorsement Key File (and Password) using -EndorsementKeyFile and -EndorsementKeyPassword parameters 
  - Endorsement Key Certificate using -EndorsementKeyCertificate parameter
  - Remote Endorsement using -RemoteEndorsementKeyID and -RemoteSigningServiceURL parameters 
  
  Please note that using a Key File with Password in PFX format is recommended over using an X509 Certificate object because a private key in a certificate is not password protected.

  This command writes the created payload to the pipeline or to the file specified in the -OutputFile parameter. This payload can then be passed to the Set-HPSecurePlatformPayload command.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Set-HPSecurePlatformPayload command. Creating the payload and passing it to the Set-HPSecurePlatformPayload command via the pipeline is not a recommended production pattern.

.PARAMETER EndorsementKeyFile
  Specifies the _Key Endorsement_ key certificate as a PFX (PKCS #12) file

.PARAMETER EndorsementKeyPassword
  The password for the endorsement key certificate file. If no password was used when the PFX was created (which is not recommended), this parameter may be omitted.

.PARAMETER EndorsementKeyCertificate
  Specifies the endorsement key certificate as an X509Certificate object

.PARAMETER Nonce
  Specifies a Nonce. If nonce is specified, the Secure Platform Management subsystem will only accept commands with a nonce greater or equal to the last nonce sent. This approach helps to prevent replay attacks. If not specified, the nonce is inferred from the current local time. The current local time as the nonce works in most cases. However, this approach has a resolution of seconds, so when performing parallel operations or a high volume of operations, it is possible for the same counter to be interpreted for more than one command. In these cases, the caller should use its own nonce derivation and provide it through this parameter.

.PARAMETER RemoteEndorsementKeyID
  Specifies the Endorsement Key ID to be used

.PARAMETER RemoteSigningServiceURL
  Specifies the (Key Management Service) KMS server URL (I.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.LINK
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.PARAMETER OutputFile
  Specifies the file to write output to instead of writing the output to the pipeline

.NOTES
  - Requires HP BIOS with Secure Platform Management support.

.EXAMPLE
  New-HPSecurePlatformDeprovisioningPayload -EndorsementKeyFile kek.pfx | Set-HPSecurePlatformPayload

.EXAMPLE
  New-HPSecurePlatformDeprovisioningPayload -EndorsementKeyFile kek.pfx -OutputFile deprovisioning_payload.dat
#>
function New-HPSecurePlatformDeprovisioningPayload {
  [CmdletBinding(DefaultParameterSetName = "EF",HelpUri = "https://developers.hp.com/hp-client-management/doc/New-HPSecurePlatformDeprovisioningPayload")]
  param(
    [Parameter(ParameterSetName = "EF",Mandatory = $true,Position = 0)]
    [string]$EndorsementKeyFile,

    [Parameter(ParameterSetName = "EF",Mandatory = $false,Position = 1)]
    [string]$EndorsementKeyPassword,

    [Parameter(ParameterSetName = "EF",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "EB",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 1)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "EB",Mandatory = $true,Position = 0)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$EndorsementKeyCertificate,

    [Parameter(ParameterSetName = "EB",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "EF",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 2)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 3)]
    [string]$RemoteEndorsementKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 4)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 5)]
    [switch]$CacheAccessToken
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($RemoteSigningServiceURL -and -not ($RemoteSigningServiceURL.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($RemoteSigningServiceURL) -or $RemoteSigningServiceURL.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  New-HPSecurePlatformSigningKeyProvisioningPayload @PSBoundParameters
}

<#
.SYNOPSIS
  Applies a payload to HP Secure Platform Management

.DESCRIPTION
  This command applies a properly encoded payload created by one of the New-HPSecurePlatform*, New-HPSureRun*, New-HPSureAdmin*, or New-HPSureRecover* commands to the BIOS.
  
  Payloads created by means other than the commands mentioned above are not supported.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Set-HPSecurePlatformPayload command. Creating the payload and passing it to the Set-HPSecurePlatformPayload command via the pipeline is not a recommended production pattern.

.PARAMETER Payload
  Specifies the payload to apply. This parameter can also be specified via the pipeline.

.PARAMETER PayloadFile
  Specifies the payload file to apply. This file must contain a properly encoded payload.

.LINK
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.NOTES
  - Requires HP BIOS with Secure Platform Management support.
  - This command requires elevated privileges.

.EXAMPLE
  Set-HPSecurePlatformPayload -Payload $payload

.EXAMPLE
  Set-HPSecurePlatformPayload -PayloadFile .\payload.dat

.EXAMPLE
  $payload | Set-HPSecurePlatformPayload
#>
function Set-HPSecurePlatformPayload {

  [CmdletBinding(DefaultParameterSetName = "FB",HelpUri = "https://developers.hp.com/hp-client-management/doc/Set-HPSecurePlatformPayload")]
  param(
    [Parameter(ParameterSetName = "FB",ValueFromPipeline = $true,Position = 0,Mandatory = $True)] [string]$Payload,
    [Parameter(ParameterSetName = "FF",ValueFromPipeline = $true,Position = 0,Mandatory = $True)] [System.IO.FileInfo]$PayloadFile
  )

  if ($PSCmdlet.ParameterSetName -eq "FB") {
    Write-Verbose "Setting payload string"
    [PortableFileFormat]$type = ConvertFrom-Json -InputObject $Payload
  }
  else {
    Write-Verbose "Setting from file $PayloadFile"
    $Payload = Get-Content -Path $PayloadFile -Encoding UTF8
    [PortableFileFormat]$type = ConvertFrom-Json -InputObject $Payload
  }

  $mi_result = 0
  $pbytes = $type.Data
  Write-Verbose "Setting payload from document with type $($type.purpose)"

  $cmd = $null
  switch ($type.purpose) {
    "hp:provision:endorsementkey" {
      $cmd = '[DfmNativeSecurePlatform]::set_ek_provisioning' + (Test-OSBitness) + '($pbytes,$pbytes.length, [ref]$mi_result);'
    }
    "hp:provision:signingkey" {
      $cmd = '[DfmNativeSecurePlatform]::set_sk_provisioning' + (Test-OSBitness) + '($pbytes,$pbytes.length, [ref]$mi_result);'
    }
    "hp:surerecover:provision:os_image" {
      $cmd = '[DfmNativeSureRecover]::set_surerecover_osr_provisioning' + (Test-OSBitness) + '($pbytes,$pbytes.length, [ref]$mi_result);'
    }
    "hp:surerecover:provision:recovery_image" {
      $cmd = '[DfmNativeSureRecover]::set_surerecover_re_provisioning' + (Test-OSBitness) + '($pbytes,$pbytes.length, [ref]$mi_result);'
    }
    "hp:surerecover:failover:os_image" {
      if (-not (Get-HPSureRecoverState).ImageIsProvisioned) {
        throw [System.IO.InvalidDataException]"Custom OS Recovery Image is required to configure failover"
      }
      $cmd = '[DfmNativeSureRecover]::set_surerecover_osr_failover' + (Test-OSBitness) + '($pbytes,$pbytes.length,[ref]$mi_result);'
    }
    "hp:surerecover:deprovision" {
      $cmd = '[DfmNativeSureRecover]::set_surerecover_deprovision_opaque' + (Test-OSBitness) + '($pbytes,$pbytes.length, [ref]$mi_result);'
    }
    "hp:surerecover:scheduler" {
      $cmd = '[DfmNativeSureRecover]::set_surerecover_schedule' + (Test-OSBitness) + '($pbytes,$pbytes.length, [ref]$mi_result);'
    }
    "hp:surerecover:configure" {
      $cmd = '[DfmNativeSureRecover]::set_surerecover_configuration' + (Test-OSBitness) + '($pbytes,$pbytes.length, [ref]$mi_result);'
    }
    "hp:surerecover:trigger" {
      $cmd = '[DfmNativeSureRecover]::set_surerecover_trigger' + (Test-OSBitness) + '($pbytes,$pbytes.length, [ref]$mi_result);'
    }
    "hp:surerecover:service_event" {
      $cmd = '[DfmNativeSureRecover]::raise_surerecover_service_event_opaque' + (Test-OSBitness) + '($null,0, [ref]$mi_result);'
    }
    "hp:surerrun:manifest" {
      $mbytes = $type.Meta1
      $cmd = '[DfmNativeSureRun]::set_surererun_manifest' + (Test-OSBitness) + '($pbytes,$pbytes.length, $mbytes, $mbytes.length, [ref]$mi_result);'
    }
    "hp:sureadmin:biossetting" {
      $Payload | Set-HPPrivateBIOSSettingValuePayload -Verbose:$VerbosePreference
    }
    "hp:sureadmin:biossettingslist" {
      $Payload | Set-HPPrivateBIOSSettingsListPayload -Verbose:$VerbosePreference
    }
    "hp:sureadmin:resetsettings" {
      $Payload | Set-HPPrivateBIOSSettingDefaultsPayload -Verbose:$VerbosePreference
    }
    "hp:sureadmin:firmwareupdate" {
      $Payload | Set-HPPrivateFirmwareUpdatePayload -Verbose:$VerbosePreference
    }
    default {
      throw [System.IO.InvalidDataException]"Document type $($type.purpose) not recognized"
    }
  }
  if ($cmd) {
    $result = Invoke-Expression -Command $cmd
    Test-HPPrivateCustomResult -result $result -mi_result $mi_result -Category 0x04
  }
}

# SIG # Begin signature block
