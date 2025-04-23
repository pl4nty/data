#
#  Copyright 2018-2025 HP Development Company, L.P.
#  All Rights Reserved.
#
# NOTICE:  All information contained herein is, and remains the property of HP Development Company, L.P.
#
# The intellectual and technical concepts contained herein are proprietary to HP Development Company, L.P
# and may be covered by U.S. and Foreign Patents, patents in process, and are protected by
# trade secret or copyright law. Dissemination of this information or reproduction of this material
# is strictly forbidden unless prior written permission is obtained from HP Development Company, L.P.
using namespace HP.CMSLHelper

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'
#requires -Modules "HP.Private"
#requires -Modules "HP.ClientManagement"

# CMSL is normally installed in C:\Program Files\WindowsPowerShell\Modules
# but if installed via PSGallery and via PS7, it is installed in a different location
if (Test-Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll") {
  Add-Type -Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll"
}
else{
  Add-Type -Path "$PSScriptRoot\..\..\HP.Private\1.8.2\HP.CMSLHelper.dll"
}

<#
.SYNOPSIS
  Retrieves the current state of the HP Sure Admin feature

.DESCRIPTION
  This command retrieves the current state of the HP Sure Admin feature

.NOTES
  - Requires HP P21 enabled.
  - Requires HP BIOS with HP Sure Admin support.
  - This command requires elevated privileges.

.LINK
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.EXAMPLE
  Get-HPSureAdminState
#>
function Get-HPSureAdminState
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/get-hpsureadminstate")]
  param()

  $mode = "Disable"
  $sk = ""
  $signingKeyID = ""
  $ver = ""
  $lak1 = ""
  $sarc = 0
  $aarc = 0
  $local_access = ""
  $lak1_keyID = ""
  $lak1_key_enrollment_data = ""

  if ((Get-HPPrivateIsSureAdminSupported) -eq $true) {
    try { $mode = Get-HPBIOSSettingValue -Name "Enhanced BIOS Authentication Mode" } catch {}
    try { $sk = Get-HPBIOSSettingValue -Name "Secure Platform Management Signing Key" } catch {}
    try { $ver = Get-HPBIOSSettingValue -Name "Enhanced BIOS Authentication Mode Version" } catch {}
    try { $lak1 = Get-HPBIOSSettingValue -Name "Enhanced BIOS Authentication Mode Local Access Key 1" } catch {}
    try { $sarc = Get-HPBIOSSettingValue -Name "Enhanced BIOS Authentication Mode Settings Anti-Replay Counter" } catch {}
    try { $aarc = Get-HPBIOSSettingValue -Name "Enhanced BIOS Authentication Mode Actions Anti-Replay Counter" } catch {}

    #modify signingKeyID
    if ($sk) {
      #decode the base64 encoded string
      $sk_decoded = [Convert]::FromBase64String($sk)
      # hash the decoded string
      $sk_hash = Get-HPPrivateHash -Data $sk_decoded
      #encode the hashed value
      $signingKeyID = [System.Convert]::ToBase64String($sk_hash)
    }

    #calculate local access, lak1_keyID and lak1_key_enrollment_data values from lak1
    if ((-not $lak1) -and ((Get-HPBIOSSetupPasswordIsSet) -eq $true) -and ($mode -eq "Enable")) {
      $local_access = "BIOS Password Protection only"
      $lak1_keyID = "Not Configured"
    }
    elseif ((-not $lak1) -and ((Get-HPBIOSSetupPasswordIsSet) -eq $false) -and ($mode -eq "Enable")) {
      $local_access = "Not Protected"
      $lak1_keyID = "Not Configured"
    }
    elseif ($lak1 -and ($mode -eq "Enable")) {
      $local_access = "Configured"

      try {
        $lak1_length = $lak1.Length
        $lak1_substring = $lak1.substring(0,344)

        #decode the base64 encoded string
        $lak1_decoded = [Convert]::FromBase64String($lak1_substring)
        # hash the decoded string
        $lak1_hash = Get-HPPrivateHash -Data $lak1_decoded
        #encode the hashed value
        $lak1_keyID = [System.Convert]::ToBase64String($lak1_hash)

        if ($lak1_length -gt 344) {
          $pos = $lak1.IndexOf("==")
          $ked_substring = $lak1.substring($pos + 2)
          if ($ked_substring) {
            $lak1_key_enrollment_data = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($ked_substring))
          }
        }
      }
      catch {
        $lak1_keyID = ""
        $lak1_key_enrollment_data = ""
      }
    }
    else {
      $local_access = ""
      $lak1_keyID = ""
      $lak1_key_enrollment_data = ""
    }

    $result = [ordered]@{
      SureAdminMode = if ($mode -eq "Enable") { "On" } else { "Off" }
      SigningKeyID = $signingKeyID
      EnhancedAuthenticationVersion = $ver
      SettingsCounter = $sarc
      ActionsCounter = $aarc
      LocalAccess = $local_access
      LocalAccessKey1 = $lak1
      LAK1_KeyID = $lak1_keyID
      LAK1_KeyEnrollmentData = $lak1_key_enrollment_data
    }

    New-Object -TypeName PSObject -Property $result
  }
}

<#
.SYNOPSIS
  Creates a payload for authorizing a firmware update

.DESCRIPTION
  This command uses the provided key to sign and authorize a firmware update only to the specified file. There are three signing options to choose from:
  - Signing Key File (and Password) using -SigningKeyFile and -SigningKeyPassword parameters 
  - Signing Key Certificate using -SigningKeyCertificate parameter
  - Remote Signing using -RemoteSigningServiceKeyID and -RemoteSigningServiceURL parameters 

  Please note that using a Key File with Password in PFX format is recommended over using an X509 Certificate object because a private key in a certificate is not password protected.

  This command writes the created payload to the pipeline or to the file specified in the OutputFile parameter.
  This payload can then be passed to the Update-HPFirmware command.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Update-HPFirmware command.

.PARAMETER File
  Specifies the firmware update binary (.BIN) file

.PARAMETER SigningKeyFile
  Specifies the path to the Secure Platform Management signing key as a PFX file. If the PFX file is protected by a password (recommended),
  the SigningKeyPassword parameter should also be provided.

.PARAMETER SigningKeyPassword
  Specifies the Secure Platform Management signing key file password, if required.

.PARAMETER SigningKeyCertificate
  Specifies the Secure Platform Management signing key certificate as an X509Certificate object

.PARAMETER Nonce
   Specifies a Nonce. If nonce is specified, the Secure Platform Management subsystem will only accept commands with a nonce greater or equal to the last nonce sent. This approach helps to prevent replay attacks. If not specified, the nonce is inferred from the current local time. The current local time as the nonce works in most cases. However, this approach has a resolution of seconds, so when performing parallel operations or a high volume of operations, it is possible for the same counter to be interpreted for more than one command. In these cases, the caller should use its own nonce derivation and provide it through this parameter.

.PARAMETER TargetUUID
  Specifies the computer UUID on which to perform this operation. If not specified the payload generated will work on any computer.

.PARAMETER SingleUse
  If specified, the payload cannot be replayed. This happens because the nonce must be higher than ActionsCounter and this counter is updated and incremented every time a command generated with SingleUse flag is accepted by the BIOS.
  If not specified, the payload can be replayed as many times as desired until a payload generated with a nonce higher than
  SettingsCounter is received. This happens because SettingsCounter is not incremented by the BIOS when accepting commands.

.PARAMETER OutputFile
  Specifies the file to write output to instead of writing the output to the pipeline

.PARAMETER Quiet
  If specified, this command will suppress non-essential messages during execution. 

.PARAMETER Bitlocker
  Specifies the behavior to the BitLocker check prompt (if any). The value must be one of the following values: 
  - stop: (default option) stops execution if BitLocker is detected but not suspended, and prompts
  - ignore: skips the BitLocker check
  - suspend: suspends BitLocker if active and continues with execution 

.PARAMETER Force
  If specified, this command will force the BIOS update even if the target BIOS is already installed. 

.PARAMETER RemoteSigningServiceKeyID
  Specifies the Signing Key ID to be used

.PARAMETER RemoteSigningServiceURL
  Specifies the (Key Management Service) KMS server URL (I.e.: https://<KMSAppName>.azurewebsites.net/)

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - An HP BIOS with HP Sure Admin support is required for applying the payloads generated by this command.

.LINK
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.EXAMPLE
  New-HPSureAdminFirmwareUpdatePayload -File bios.bin -SigningKeyFile "$path\signing_key.pfx" -SigningKeyPassword "s3cr3t" -OutputFile PayloadFile.dat
  Update-HPFirmware -File bios.bin -PayloadFile PayloadFile.dat
#>
function New-HPSureAdminFirmwareUpdatePayload {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/new-hpsureadminfirmwareupdatepayload")]
  param(
    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 0)]
    [System.IO.FileInfo]$File,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $true,Position = 2)]
    [System.IO.FileInfo]$SigningKeyFile,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 3)]
    [string]$SigningKeyPassword,

    [Parameter(ValueFromPipeline = $true,ParameterSetName = "SigningKeyCert",Mandatory = $true,Position = 2)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKeyCertificate,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 1)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 2)]
    [guid]$TargetUUID = 'ffffffff-ffff-ffff-ffff-ffffffffffff',

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 3)]
    [switch]$SingleUse,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 7)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 4)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 8)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 7)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 5)]
    [switch]$Quiet,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 8)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 6)]
    [ValidateSet('stop','ignore','suspend')]
    [string]$Bitlocker = 'stop',

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 10)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 7)]
    [switch]$Force,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 8)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 9)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 10)]
    [switch]$CacheAccessToken
  )

  $params = @{
    file = $File
    SingleUse = $SingleUse
    Nonce = $Nonce
    TargetUUID = $TargetUUID
  }

  if ($PSCmdlet.ParameterSetName -eq "RemoteSigning") {
    $params.RemoteSigningServiceKeyID = $RemoteSigningServiceKeyID
    $params.RemoteSigningServiceURL = $RemoteSigningServiceURL
    $params.CacheAccessToken = $CacheAccessToken
  }
  else {
    $params.SigningKey = (Get-HPPrivateX509CertCoalesce -File $SigningKeyFile -password $SigningKeyPassword -cert $SigningKeycertificate -Verbose:$VerbosePreference).Full
  }

  [byte[]]$authorization = New-HPPrivateSureAdminFirmwareUpdateAuthorization @params
  $data = @{
    Authorization = $authorization
    FileName = $File.Name
    Quiet = $Quiet.IsPresent
    bitlocker = $Bitlocker
    Force = $Force.IsPresent
  } | ConvertTo-Json -Compress
  New-HPPrivatePortablePayload -Data $data -Purpose "hp:sureadmin:firmwareupdate" -OutputFile $OutputFile -Verbose:$VerbosePreference
}

function New-HPPrivateSureAdminFirmwareUpdateAuthorization
{
  [CmdletBinding()]
  param(
    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 0)]
    [System.IO.FileInfo]$File,

    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $true,Position = 1)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKey,

    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 1)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 2)]
    [guid]$TargetUUID = 'ffffffff-ffff-ffff-ffff-ffffffffffff',

    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 3)]
    [switch]$SingleUse,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 4)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 5)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 6)]
    [switch]$CacheAccessToken,

    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 7)]
    [switch]$SignatureInBase64
  )

  Write-Verbose "Creating authentication payload"

  $name = "Allowed BIOS Update Hash"
  $fileHash = (Get-FileHash -Path $File -Algorithm SHA256).Hash

  # set value using raw bytes
  [byte[]]$valuebytes = [byte[]] -split ($fileHash -replace '..','0x$& ')

  $setting = New-Object -TypeName SureAdminSetting
  $setting.Name = $Name
  $setting.Value = $fileHash

  $nameLen = [System.Text.Encoding]::Unicode.GetByteCount($Name)
  $valueLen = $valuebytes.Length

  $params = @{
    NameLen = $nameLen
    ValueLen = $valueLen
    SingleUse = $SingleUse
    Nonce = $Nonce
    TargetUUID = $TargetUUID
  }
  [byte[]]$header = Invoke-HPPrivateConstructHeader @params -Verbose:$VerbosePreference
  [byte[]]$payload = New-Object byte[] ($Header.Count + $nameLen + $valueLen)

  $namebytes = [System.Text.Encoding]::Unicode.GetBytes($Name)
  [System.Array]::Copy($Header,0,$payload,0,$Header.Length)
  [System.Array]::Copy($namebytes,0,$payload,$Header.Length,$namebytes.Length)
  [System.Array]::Copy($valuebytes,0,$payload,$Header.Length + $namebytes.Length,$valuebytes.Length)

  if ($PSCmdlet.ParameterSetName -eq "LocalSigning") {
    [byte[]]$signature = Invoke-HPPrivateSignData -Data $payload -Certificate $SigningKey -Verbose:$VerbosePreference
  }
  else {
    [byte[]]$signature = Invoke-HPPrivateRemoteSignData -Data $payload -CertificateId $RemoteSigningServiceKeyID -KMSUri $RemoteSigningServiceURL -CacheAccessToken:$CacheAccessToken -Verbose:$VerbosePreference
  }

  $tag = "<BEAM/>"
  if ($SignatureInBase64.IsPresent) {
    return $tag + [Convert]::ToBase64String($signature)
  }
  $tagBytes = [System.Text.Encoding]::Unicode.GetBytes($tag)
  [byte[]]$authorization = New-Object byte[] ($namebytes.Length + $valuebytes.Length + $tagBytes.Length + $Header.Length + $Signature.Length)
  $offset = 0
  [System.Array]::Copy($namebytes,0,$authorization,$offset,$namebytes.Length)
  $offset += $namebytes.Length
  [System.Array]::Copy($valuebytes,0,$authorization,$offset,$valuebytes.Length)
  $offset += $valuebytes.Length
  [System.Array]::Copy($tagBytes,0,$authorization,$offset,$tagBytes.Length)
  $offset += $tagBytes.Length
  [System.Array]::Copy($Header,0,$authorization,$offset,$Header.Length)
  $offset += $Header.Length
  [System.Array]::Copy($Signature,0,$authorization,$offset,$Signature.Length)

  #($authorization | Format-Hex)
  return $authorization
}

<#
.SYNOPSIS
  Creates a payload for authorizing multiple BIOS setting changes

.DESCRIPTION
  This command uses the provided key to sign and authorize multiple BIOS setting changes. There are three signing options to choose from:
  - Signing Key File (and Password) using -SigningKeyFile and -SigningKeyPassword parameters 
  - Signing Key Certificate using -SigningKeyCertificate parameter
  - Remote Signing using -RemoteSigningServiceKeyID and -RemoteSigningServiceURL parameters 

  Please note that using a Key File with Password in PFX format is recommended over using an X509 Certificate object because a private key in a certificate is not password protected.

  This command writes the created payload to the pipeline or to the file specified in the -OutputFile parameter.
  This payload can then be passed to the Set-HPSecurePlatformPayload command.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Set-HPSecurePlatformPayload command. Creating the payload and passing it to the Set-HPSecurePlatformPayload command via the pipeline is not a recommended production pattern.

.PARAMETER SigningKeyFile
  Specifies the path to the Secure Platform Management signing key as a PFX file. If the PFX file is protected by a password (recommended), the SigningKeyPassword parameter should also be provided.

.PARAMETER SigningKeyPassword
  Specifies the Secure Platform Management signing key file password, if required.

.PARAMETER SigningKeyCertificate
  Specifies the Secure Platform Management signing key certificate as an X509Certificate object

.PARAMETER Nonce
  Specifies a Nonce. If nonce is specified, the Secure Platform Management subsystem will only accept commands with a nonce greater or equal to the last nonce sent. This approach helps to prevent replay attacks. If not specified, the nonce is inferred from the current local time. The current local time as the nonce works in most cases. However, this approach has a resolution of seconds, so when performing parallel operations or a high volume of operations, it is possible for the same counter to be interpreted for more than one command. In these cases, the caller should use its own nonce derivation and provide it through this parameter.

.PARAMETER InputFile
  Specifies the file (relative or absolute) path to process containing one or more BIOS settings

.PARAMETER InputFormat
  Specifies the input file format (XML, JSON, CSV, or BCU)

.PARAMETER TargetUUID
  Specifies the computer UUID on which to perform this operation. If not specified, the payload generated will work on any computer.

.PARAMETER OutputFile
  Specifies the file to write output to instead of writing the output to the pipeline

.PARAMETER OutputFormat
  Specifies the output file format (default or BCU)

.PARAMETER RemoteSigningServiceKeyID
  Specifies the Signing Key ID to be used

.PARAMETER RemoteSigningServiceURL
  Specifies the (Key Management Service) KMS server URL (I.e.: https://<KMSAppName>.azurewebsites.net/)

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - An HP BIOS with HP Sure Admin support is required for applying the payloads generated by this command.

.LINK
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.EXAMPLE
  $payload = New-HPSureAdminBIOSSettingsListPayload -SigningKeyFile "$path\signing_key.pfx" -InputFile "settings.BCU" -Format BCU
  $payload | Set-HPSecurePlatformPayload

.EXAMPLE
  New-HPSureAdminBIOSSettingsListPayload -SigningKeyFile "$path\signing_key.pfx" -SigningKeyPassword "s3cr3t" -InputFile "settings.BCU" -Format BCU -OutputFile PayloadFile.dat
  Set-HPSecurePlatformPayload -PayloadFile PayloadFile.dat
#>
function New-HPSureAdminBIOSSettingsListPayload
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/new-hpsureadminbiossettingslistpayload")]
  param(
    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 0)]
    [System.IO.FileInfo]$InputFile,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 1)]
    [ValidateSet('XML','JSON','BCU','CSV')]
    [Alias('Format')]
    [string]$InputFormat = $null,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $true,Position = 2)]
    [System.IO.FileInfo]$SigningKeyFile,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 3)]
    [string]$SigningKeyPassword,

    [Parameter(ValueFromPipeline = $true,ParameterSetName = "SigningKeyCert",Mandatory = $true,Position = 3)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKeyCertificate,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 2)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 3)]
    [guid]$TargetUUID = 'ffffffff-ffff-ffff-ffff-ffffffffffff',

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 7)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 7)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 4)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 5)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 6)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 7)]
    [switch]$CacheAccessToken,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 8)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 8)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 8)]
    [ValidateSet('default','BCU')]
    [string]$OutputFormat = 'default'
  )

  Write-Verbose "InputFormat specified: '$InputFormat'. Reading file..."
  [System.Collections.Generic.List[SureAdminSetting]]$settingsList = $null
  $settingsList = Get-HPPrivateSettingsFromFile -FileName $InputFile -Format $InputFormat

  $params = @{
    SettingsList = $settingsList
    Nonce = $Nonce
    TargetUUID = $TargetUUID
  }

  if ($PSCmdlet.ParameterSetName -eq "RemoteSigning") {
    $params.RemoteSigningServiceKeyID = $RemoteSigningServiceKeyID
    $params.RemoteSigningServiceURL = $RemoteSigningServiceURL
    $params.CacheAccessToken = $CacheAccessToken
  }
  else {
    $params.SigningKey = (Get-HPPrivateX509CertCoalesce -File $SigningKeyFile -password $SigningKeyPassword -cert $SigningKeycertificate -Verbose:$VerbosePreference).Full
  }

  $settingsList = New-HPPrivateSureAdminBIOSSettingsObject @params

  if ($OutputFormat -eq 'default') {
    $data = $settingsList | ConvertTo-Json
    New-HPPrivatePortablePayload -Data $data -Purpose "hp:sureadmin:biossettingslist" -OutputFile $OutputFile
  }
  elseif ($OutputFormat -eq 'BCU') {
    $dict = New-HPPrivateBIOSSettingsDefinition -SettingsDefinitionFile $InputFile -Format $InputFormat
    New-HPPrivateSureAdminSettingsBCU -settingsList $settingsList -SettingsDefinition $dict -OutputFile $OutputFile
  }
}

function New-HPPrivateBIOSSettingsDefinition
{
  [CmdletBinding()]
  param(
    $SettingsDefinitionFile,
    $Format
  )

  $dict = @{}
  switch ($format) {
    { $_ -eq 'XML' } {
      Write-Verbose "Reading XML settings definition $settingsDefinitionFile"
      [xml]$settingsDefinitionXml = Get-Content $SettingsDefinitionFile
      $entries = ([xml]$settingsDefinitionXml).ImagePal.BIOSSettings.BIOSSetting
      foreach ($entry in $entries) {
        [string[]]$valueList = @()
        foreach ($v in $entry.SelectNodes("ValueList/Value/text()"))
        {
          $valueList += $v.Value
        }
        if ($valueList -le 1) {
          [string[]]$valueList = @()
        }
        $dict[$entry.Name] = [pscustomobject]@{
          Name = $entry.Name
          Value = $entry.Value
          ValueList = $valueList
        }
      }
    }

    { $_ -eq 'BCU' } {
      Write-Verbose "Reading BCU settings definition $settingsDefinitionFile"

      $list = [ordered]@{}
      $currset = ""

      switch -regex -File $settingsDefinitionFile {
        '^\S.*$' {
          $currset = $matches[0].trim()
          if ($currset -ne "BIOSConfig 1.0" -and -not $currset.StartsWith(";")) {
            $list[$currset] = New-Object System.Collections.Generic.List[System.String]
          }
        }

        '^\s.*$' {
          # value (indented)
          $c = $matches[0].trim()
          $list[$currset].Add($c)
        }
      }

      foreach ($s in $list.keys) {
        [string[]]$valueList = @()
        if ($list[$s].Count -gt 1) {
          $valueList = $list[$s]
        }

        $dict[$s] = [pscustomobject]@{
          Name = $s
          Value = Get-HPPrivateDesiredValue -Value $list[$s]
          ValueList = $valueList
        }
      }
    }

    { $_ -eq 'CSV' } {
      Write-Verbose "Reading CSV settings definition $settingsDefinitionFile"
      $content = Get-HPPrivateFileContent $settingsDefinitionFile
      $items = $content | ConvertFrom-Csv

      foreach ($item in $items) {

        [string[]]$valueList = @()
        if ($item.CURRENT_VALUE.contains(',')) {
          foreach ($v in $item.CURRENT_VALUE -split ',')
          {
            if ($v.StartsWith("*")) {
              $valueList += $v.substring(1)
            }
            else {
              $valueList += $v
            }
          }
        }

        $dict[$item.Name] = [pscustomobject]@{
          Name = $item.Name
          Value = (Get-HPPrivateDesiredValue $item.CURRENT_VALUE)
          ValueList = $valueList
        }
      }
    }

    { $_ -eq 'JSON' } {
      Write-Verbose "Reading JSON settings definition $settingsDefinitionFile"
      [string]$content = Get-HPPrivateFileContent $settingsDefinitionFile
      $list = $Content | ConvertFrom-Json

      foreach ($item in $list) {

        [string[]]$valueList = @()
        if ($item.PSObject.Properties.Name -match 'Elements') {
          [string[]]$valueList = $item.Elements
        }
        elseif ($item.PSObject.Properties.Name -match 'PossibleValues') {
          [string[]]$valueList = $item.PossibleValues
        }

        $dict[$item.Name] = [pscustomobject]@{
          Name = $item.Name
          Value = $item.Value
          ValueList = $valueList
        }
      }
    }
  }

  $dict['SetSystemDefaults'] = [pscustomobject]@{
    Name = 'SetSystemDefaults'
    Value = ''
    ValueList = @()
  }

  $dict['Allowed BIOS Update Hash'] = [pscustomobject]@{
    Name = 'Allowed BIOS Update Hash'
    Value = ''
    ValueList = @()
  }

  return $dict
}

function New-HPPrivateSureAdminSettingsBCU
{
  [CmdletBinding()]
  param(
    $SettingsList,
    $SettingsDefinition,
    $Platform,
    [System.IO.FileInfo]$OutputFile,
    [switch]$SkipSettingDefinition
  )

  Write-Verbose "Found $($SettingsList.Count) settings"
  $now = Get-Date
  $output += "BIOSConfig 1.0`n"
  $output += ";`n"
  $output += ";     Created by CMSL function $((Get-PSCallStack)[1].Command)`n"
  $output += ";     Date=$now`n"
  $output += ";`n"
  $output += ";     Found $($SettingsList.Count) settings`n"
  $output += ";`n"
  foreach ($entry in $SettingsList) {
    $output += "$($entry.Name)`n"
    if ($SkipSettingDefinition.IsPresent) {
      $output += "`t$($entry.Value)`n"
    }
    else {
      if (-not $SettingsDefinition -or -not $SettingsDefinition.ContainsKey($entry.Name)) {
        throw "Setting definition not found: $($entry.Name)"
      }
      $definition = $SettingsDefinition[$entry.Name]
      if ($entry.Value.contains(",") -and $definition.ValueList.Count -gt 0) {
        $entry.Value.Split(",") | ForEach-Object {
          $c = $_.trim()
          $output += "`t$c`n"
        }
      }
      elseif ($definition.ValueList.Count -gt 0) {
        foreach ($v in $definition.ValueList) {
          if ($v -eq $entry.Value) {
            $output += "`t*$($v)`n"
          }
          else {
            $output += "`t$($v)`n"
          }
        }
      }
      else {
        $output += "`t$($entry.Value)`n"
      }
    }
    $output += ";Signature=$($entry.AuthString)`n"
  }

  if ($OutputFile) {
    Write-Verbose "Will output to file $OutputFile"
    $f = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputFile)
    Out-File -FilePath $f -Encoding utf8 -InputObject $output
  }
  else {
    Write-Verbose 'Will output to console'
    $output
  }
}

function New-HPPrivatePortablePayload {
  param(
    [string]$Data,
    [string]$Purpose,
    [System.IO.FileInfo]$OutputFile
  )

  $output = New-Object -TypeName PortableFileFormat
  $output.timestamp = Get-Date
  $output.purpose = $Purpose
  $output.Data = [System.Text.Encoding]::UTF8.GetBytes($Data)

  if ($OutputFile) {
    Write-Verbose "Will output to file $OutputFile"
    $f = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputFile)
    $output | ConvertTo-Json -Compress | Out-File -FilePath $f -Encoding utf8
  }
  else {
    $output | ConvertTo-Json -Compress
  }
}

function New-HPPrivateSureAdminBIOSSettingsObject {
  [CmdletBinding()]
  param(
    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 0)]
    [System.Collections.Generic.List[SureAdminSetting]]$SettingsList,

    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $false,Position = 1)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 1)]
    [switch]$SingleUse,

    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 2)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 3)]
    [guid]$TargetUUID = 'ffffffff-ffff-ffff-ffff-ffffffffffff',

    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $true,Position = 4)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKey,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 4)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 5)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 6)]
    [switch]$CacheAccessToken
  )

  Write-Verbose "Signing settings list"

  $params = @{
    Nonce = $Nonce
    TargetUUID = $TargetUUID
  }

  if ($PSCmdlet.ParameterSetName -eq "LocalSigning") {
    $params.SigningKey = $SigningKey
    for ($i = 0; $i -lt $SettingsList.Count; $i++) {
      $setting = $SettingsList[$i]
      $params.Name = $setting.Name
      $params.Value = $setting.Value

      if ($setting.AuthString -eq $null) {
        $SettingsList[$i] = New-HPPrivateSureAdminBIOSSettingObject @params -Verbose:$VerbosePreference
      }
    }
  }
  else {
    $params.CertificateId = $RemoteSigningServiceKeyID
    $params.KMSUri = $RemoteSigningServiceURL
    $params.CacheAccessToken = $CacheAccessToken
    $params.SettingsList = $SettingsList
    $SettingsList = Invoke-HPPrivateRemoteSignSureAdminSettings @params -Verbose:$VerbosePreference
  }

  return $SettingsList
}

function Invoke-HPPrivateRemoteSignSureAdminSettings {
  [CmdletBinding()]
  param(
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 0)]
    [guid]$TargetUUID = 'ffffffff-ffff-ffff-ffff-ffffffffffff',

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 1)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 2)]
    [System.Collections.Generic.List[SureAdminSetting]]$SettingsList,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 3)]
    [string]$CertificateId,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 4)]
    [string]$KMSUri,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 5)]
    [switch]$CacheAccessToken,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 6)]
    [switch]$SingleUse
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($KMSUri -and -not ($KMSUri.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($KMSUri) -or $KMSUri.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if (-not $KMSUri.EndsWith('/')) {
    $KMSUri += '/'
  }
  $KMSUri += 'api/commands/sureadminauth'

  $jsonPayload = New-HPPrivateSureAdminRemoteSigningSettingsJson -settingsList $SettingsList -nonce $Nonce -TargetUUID $TargetUUID -CertificateId $CertificateId -SingleUse:$SingleUse
  $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
  $response,$responseContent = Send-HPPrivateKMSRequest -KMSUri $KMSUri -JsonPayload $jsonPayload -AccessToken $accessToken

  if ($response -eq "OK") {
    $responseObject = $responseContent | ConvertFrom-Json

    $settings = New-Object System.Collections.Generic.List[SureAdminSetting]
    for ($i = 0; $i -lt $responseObject.settings.Count; $i++) {
      $settings.Add([SureAdminSetting]@{
          Name = $responseObject.settings[$i].Name
          Value = $responseObject.settings[$i].Value
          AuthString = $responseObject.settings[$i].AuthString
        }) | Out-Null
    }
    # Return a list of [SureAdminSetting]
    $settings
  }
  else {
    Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
  }
}

function New-HPPrivateSureAdminBIOSSettingObject {
  [CmdletBinding()]
  param(
    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 0)]
    [string]$Name,

    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 1)]
    [AllowEmptyString()]
    [string]$Value,

    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 2)]
    [switch]$SingleUse,

    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 3)]
    [uint32]$Nonce,

    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 4)]
    [guid]$TargetUUID,

    [Parameter(ParameterSetName = "LocalSigning",Mandatory = $true,Position = 5)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKey,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 5)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 6)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 7)]
    [switch]$CacheAccessToken
  )

  [SureAdminSetting]$setting = New-Object -TypeName SureAdminSetting
  $setting.Name = $Name
  $setting.Value = $Value

  if ($PSCmdlet.ParameterSetName -eq "LocalSigning") {
    if ($Name -eq "Setup Password" -or $Name -eq "Power-On Password") {
      $SettingValueForSigning = "<utf-16/>" + $Value
    }
    else {
      $SettingValueForSigning = $Value
    }

    $nameLen = [System.Text.Encoding]::Unicode.GetByteCount($setting.Name)
    $valueLen = [System.Text.Encoding]::Unicode.GetByteCount($SettingValueForSigning)

    $params = @{
      NameLen = $nameLen
      ValueLen = $valueLen
      SingleUse = $SingleUse
      Nonce = $Nonce
      TargetUUID = $TargetUUID
    }
    [byte[]]$header = Invoke-HPPrivateConstructHeader @params -Verbose:$VerbosePreference
    [byte[]]$payload = Invoke-HPPrivateConstructPayload -Header $header -Name $setting.Name -Value $SettingValueForSigning -Verbose:$VerbosePreference
    [byte[]]$signature = Invoke-HPPrivateSignData -Data $payload -Certificate $SigningKey -Verbose:$VerbosePreference
    $setting.AuthString = Invoke-HPPrivateConstructAuthorization -Header $header -Signature $signature -Verbose:$VerbosePreference
  }
  else {
    $settings = New-Object System.Collections.Generic.List[SureAdminSetting]
    $settings.Add($setting)
    $setting = (Invoke-HPPrivateRemoteSignSureAdminSettings -TargetUUID $TargetUUID -Nonce $Nonce -CertificateId $RemoteSigningServiceKeyID -KMSUri $RemoteSigningServiceURL -CacheAccessToken:$CacheAccessToken -SingleUse:$SingleUse -SettingsList $settings)[0]
  }

  return $setting
}

function New-HPPrivateSureAdminRemoteSigningJson {
  [CmdletBinding()]
  param(
    [string]$CertificateId,
    [byte[]]$Data
  )

  $blob = [Convert]::ToBase64String($Data)
  $payload = [ordered]@{
    keyId = $CertificateId
    commandBlob = $blob
  }

  $payload | ConvertTo-Json -Compress
}

function New-HPPrivateSureAdminRemoteSigningSettingsJson {
  [CmdletBinding()]
  param(
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 0)]
    [guid]$TargetUUID = 'ffffffff-ffff-ffff-ffff-ffffffffffff',

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 1)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 2)]
    [System.Collections.Generic.List[SureAdminSetting]]$SettingsList,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 3)]
    [string]$CertificateId,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 4)]
    [switch]$SingleUse
  )

  $settings = New-Object System.Collections.ArrayList
  for ($i = 0; $i -lt $SettingsList.Count; $i++) {
    $settings.Add([pscustomobject]@{
        Name = $SettingsList[$i].Name
        Value = $SettingsList[$i].Value
        Nonce = $Nonce
        TargetUUID = $TargetUUID
        isSingleUse = $SingleUse.IsPresent
      }) | Out-Null
  }

  $payload = [ordered]@{
    keyId = $CertificateId
    settings = $settings
  }

  $payload | ConvertTo-Json -Compress
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Invoke-HPPrivateRemoteSignData {
  [CmdletBinding()]
  param(
    [byte[]]$Data,
    [string]$CertificateId,
    [string]$KMSUri,
    [switch]$CacheAccessToken
  )

  if (-not $KMSUri.EndsWith('/')) {
    $KMSUri += '/'
  }
  $KMSUri += 'api/commands/p21signature'

  $jsonPayload = New-HPPrivateSureAdminRemoteSigningJson -CertificateId $CertificateId -Data $Data
  $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
  $response,$responseContent = Send-HPPrivateKMSRequest -KMSUri $KMSUri -JsonPayload $jsonPayload -AccessToken $accessToken -Verbose:$VerbosePreference

  if ($response -eq "OK") {
    $responseObject = $responseContent | ConvertFrom-Json
    [System.Convert]::FromBase64String($responseObject.signature)
  }
  else {
    Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
  }
}

<#
.SYNOPSIS
  Creates a payload for resetting BIOS settings to default values

.DESCRIPTION
  This command uses the provided key to sign and authorize resetting BIOS settings to default values. There are three signing options to choose from:
  - Signing Key File (and Password) using -SigningKeyFile and -SigningKeyPassword parameters 
  - Signing Key Certificate using -SigningKeyCertificate parameter
  - Remote Signing using -RemoteSigningServiceKeyID and -RemoteSigningServiceURL parameters 

  Please note that using a Key File with Password in PFX format is recommended over using an X509 Certificate object because a private key in a certificate is not password protected.

  This command writes the created payload to the pipeline or to the file specified in the OutputFile parameter.
  This payload can then be passed to the Set-HPSecurePlatformPayload command.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Set-HPSecurePlatformPayload command. Creating the payload and passing it to the Set-HPSecurePlatformPayload command via the pipeline is not a recommended production pattern.

.PARAMETER SigningKeyFile
  Specifies the path to the Secure Platform Management signing key, as a PFX file. If the PFX file is protected by a password (recommended),
  the SigningKeyPassword parameter should also be provided.

.PARAMETER SigningKeyPassword
  Specifies the Secure Platform Management signing key file password, if required.

.PARAMETER SigningKeyCertificate
  Specifies the Secure Platform Management signing key certificate as an X509Certificate object

.PARAMETER Nonce
  Specifies a Nonce. If nonce is specified, the Secure Platform Management subsystem will only accept commands with a nonce greater or equal to the last nonce sent. This approach helps to prevent replay attacks. If not specified, the nonce is inferred from the current local time. The current local time as the nonce works in most cases. However, this approach has a resolution of seconds, so when performing parallel operations or a high volume of operations, it is possible for the same counter to be interpreted for more than one command. In these cases, the caller should use its own nonce derivation and provide it through this parameter.

.PARAMETER TargetUUID
  Specifies the computer UUID on which to perform this operation. If not specified the payload generated will work on any computer.

.PARAMETER OutputFile
  Specifies the file to write output to instead of writing the output to the pipeline

.PARAMETER RemoteSigningServiceKeyID
  Specifies the Signing Key ID to be used

.PARAMETER RemoteSigningServiceURL
  Specifies the (Key Management Service) KMS server URL (I.e.: https://<KMSAppName>.azurewebsites.net/)

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - An HP BIOS with HP Sure Admin support is required for applying the payloads generated by this command.

.LINK
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.EXAMPLE
  $payload = New-HPSureAdminSettingDefaultsPayload -SigningKeyFile "$path\signing_key.pfx"
  $payload | Set-HPSecurePlatformPayload

.EXAMPLE
  New-HPSureAdminSettingDefaultsPayload -SigningKeyFile "$path\signing_key.pfx" -SigningKeyPassword "s3cr3t" -OutputFile PayloadFile.dat
  Set-HPSecurePlatformPayload -PayloadFile PayloadFile.dat
#>
function New-HPSureAdminSettingDefaultsPayload
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/new-hpsureadminsettingdefaultspayload")]
  param(
    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $true,Position = 0)]
    [System.IO.FileInfo]$SigningKeyFile,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 1)]
    [string]$SigningKeyPassword,

    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $true,Position = 0)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKeyCertificate,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 1)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 0)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 1)]
    [guid]$TargetUUID = 'ffffffff-ffff-ffff-ffff-ffffffffffff',

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 2)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 3)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 4)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 5)]
    [switch]$CacheAccessToken
  )

  $params = @{
    Name = "SetSystemDefaults"
    Value = ""
    Nonce = $Nonce
    TargetUUID = $TargetUUID
  }

  if ($PSCmdlet.ParameterSetName -eq "RemoteSigning") {
    $params.RemoteSigningServiceKeyID = $RemoteSigningServiceKeyID
    $params.RemoteSigningServiceURL = $RemoteSigningServiceURL
    $params.CacheAccessToken = $CacheAccessToken
  }
  else {
    $params.SigningKey = (Get-HPPrivateX509CertCoalesce -File $SigningKeyFile -password $SigningKeyPassword -cert $SigningKeycertificate -Verbose:$VerbosePreference).Full
  }

  [SureAdminSetting]$setting = New-HPPrivateSureAdminBIOSSettingObject @params -Verbose:$VerbosePreference
  $data = $setting | ConvertTo-Json
  New-HPPrivatePortablePayload -Data $data -Purpose "hp:sureadmin:resetsettings" -OutputFile $OutputFile
}

<#
.SYNOPSIS
  Creates a payload for enabling the HP Sure Admin feature

.DESCRIPTION
  This command uses the provided key to sign and authorize the operation of enabling HP Sure Admin. There are three signing options to choose from:
  - Signing Key File (and Password) using -SigningKeyFile and -SigningKeyPassword parameters 
  - Signing Key Certificate using -SigningKeyCertificate parameter
  - Remote Signing using -RemoteSigningServiceKeyID and -RemoteSigningServiceURL parameters 

  Please note that using a Key File with Password in PFX format is recommended over using an X509 Certificate object because a private key in a certificate is not password protected.

  This command writes the created payload to the pipeline or to the file specified in the OutputFile parameter.
  This payload can then be passed to the Set-HPSecurePlatformPayload command.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Set-HPSecurePlatformPayload command. Creating the payload and passing it to the Set-HPSecurePlatformPayload command via the pipeline is not a recommended production pattern.

.PARAMETER SigningKeyFile
  Specifies the path to the Secure Platform Management signing key, as a PFX file. If the PFX file is protected by a password (recommended),
  the SigningKeyPassword parameter should also be provided.

.PARAMETER SigningKeyPassword
  Specifies the Secure Platform Management signing key file password, if required.

.PARAMETER SigningKeyCertificate
  Specifies the Secure Platform Management signing key certificate, as an X509Certificate object.

.PARAMETER Nonce
   Specifies a Nonce. If nonce is specified, the Secure Platform Management subsystem will only accept commands with a nonce greater or equal to the last nonce sent. This approach helps to prevent replay attacks. If not specified, the nonce is inferred from the current local time. The current local time as the nonce works in most cases. However, this approach has a resolution of seconds, so when performing parallel operations or a high volume of operations, it is possible for the same counter to be interpreted for more than one command. In these cases, the caller should use its own nonce derivation and provide it through this parameter.

.PARAMETER TargetUUID
  Specifies the computer UUID on which to perform this operation. If not specified the payload generated will work on any computer.

.PARAMETER SingleUse
  If specified, the payload cannot be replayed. This happens because the nonce must be higher than ActionsCounter and this counter is updated and incremented every time a command generated with SingleUse flag is accepted by the BIOS.
  If not specified, the payload can be replayed as many times as desired until a payload generated with a nonce higher than
  SettingsCounter is received. This happens because SettingsCounter is not incremented by the BIOS when accepting commands.

.PARAMETER OutputFile
  Specifies the file to write output to instead of writing the output to the pipeline

.PARAMETER RemoteSigningServiceKeyID
  Specifies the Signing Key ID to be used

.PARAMETER RemoteSigningServiceURL
  Specifies the (Key Management Service) KMS server URL (I.e.: https://<KMSAppName>.azurewebsites.net/)

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - An HP BIOS with HP Sure Admin support is required for applying the payloads generated by this command.

.LINK
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.EXAMPLE
  $payload = New-HPSureAdminEnablePayload -SigningKeyFile "$path\signing_key.pfx"
  $payload | Set-HPSecurePlatformPayload

.EXAMPLE
  New-HPSureAdminEnablePayload -SigningKeyFile "$path\signing_key.pfx" -SigningKeyPassword "s3cr3t" -OutputFile PayloadFile.dat
  Set-HPSecurePlatformPayload -PayloadFile PayloadFile.dat
#>
function New-HPSureAdminEnablePayload
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/new-hpsureadminenablepayload")]
  param(
    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $true,Position = 1)]
    [System.IO.FileInfo]$SigningKeyFile,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 2)]
    [string]$SigningKeyPassword,

    [Parameter(ValueFromPipeline = $true,ParameterSetName = "SigningKeyCert",Mandatory = $true,Position = 1)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKeyCertificate,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 0)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 1)]
    [guid]$TargetUUID = 'ffffffff-ffff-ffff-ffff-ffffffffffff',

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 2)]
    [switch]$SingleUse,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 3)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 4)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 5)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 6)]
    [switch]$CacheAccessToken
  )

  $params = @{
    Name = "Enhanced BIOS Authentication Mode"
    Value = "Enable"
    SingleUse = $SingleUse
    Nonce = $Nonce
    TargetUUID = $TargetUUID
    OutputFile = $OutputFile
  }

  if ($PSCmdlet.ParameterSetName -eq "SigningKeyFile") {
    $params.SigningKeyFile = $SigningKeyFile
    $params.SigningKeyPassword = $SigningKeyPassword
  }
  elseif ($PSCmdlet.ParameterSetName -eq "SigningKeyCert") {
    $params.SigningKeyCertificate = $SigningKeyCertificate
  }
  elseif ($PSCmdlet.ParameterSetName -eq "RemoteSigning") {
    $params.RemoteSigningServiceKeyID = $RemoteSigningServiceKeyID
    $params.RemoteSigningServiceURL = $RemoteSigningServiceURL
    $params.CacheAccessToken = $CacheAccessToken
  }

  New-HPSureAdminBIOSSettingValuePayload @params -Verbose:$VerbosePreference
}

<#
.SYNOPSIS
  Creates a payload for disabling the HP Sure Admin feature

.DESCRIPTION
  This command uses the provided key to sign and authorize the operation of disabling HP Sure Admin. There are three signing options to choose from:
  - Signing Key File (and Password) using -SigningKeyFile and -SigningKeyPassword parameters 
  - Signing Key Certificate using -SigningKeyCertificate parameter
  - Remote Signing using -RemoteSigningServiceKeyID and -RemoteSigningServiceURL parameters 

  Please note that using a Key File with Password in PFX format is recommended over using an X509 Certificate object because a private key in a certificate is not password protected.


  This command writes the created payload to the pipeline or to the file specified in the OutputFile parameter. This payload can then be passed to the Set-HPSecurePlatformPayload command.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Set-HPSecurePlatformPayload command. Creating the payload and passing it to the Set-HPSecurePlatformPayload command via the pipeline is not a recommended production pattern.

.PARAMETER SigningKeyFile
  Specifies the path to the Secure Platform Management signing key, as a PFX file. If the PFX file is protected by a password (recommended),
  the SigningKeyPassword parameter should also be provided.

.PARAMETER SigningKeyPassword
  Specifies the Secure Platform Management signing key file password, if required.

.PARAMETER SigningKeyCertificate
  Specifies the Secure Platform Management signing key certificate, as an X509Certificate object.

.PARAMETER Nonce
  Specifies a Nonce. If nonce is specified, the Secure Platform Management subsystem will only accept commands with a nonce greater or equal to the last nonce sent. This approach helps to prevent replay attacks. If not specified, the nonce is inferred from the current local time. The current local time as the nonce works in most cases. However, this approach has a resolution of seconds, so when performing parallel operations or a high volume of operations, it is possible for the same counter to be interpreted for more than one command. In these cases, the caller should use its own nonce derivation and provide it through this parameter.

.PARAMETER TargetUUID
  Specifies the computer UUID on which to perform this operation. If not specified the payload generated will work on any computer.

.PARAMETER SingleUse
  If specified, the payload cannot be replayed. This happens because the nonce must be higher than ActionsCounter and this counter is updated and incremented every time a command generated with SingleUse flag is accepted by the BIOS.
  If not specified, the payload can be replayed as many times as desired until a payload generated with a nonce higher than
  SettingsCounter is received. This happens because SettingsCounter is not incremented by the BIOS when accepting commands.

.PARAMETER OutputFile
  Specifies the file to write output to instead of writing the output to the pipeline

.PARAMETER RemoteSigningServiceKeyID
  Specifies the Signing Key ID to be used

.PARAMETER RemoteSigningServiceURL
  Specifies the (Key Management Service) KMS server URL (I.e.: https://<KMSAppName>.azurewebsites.net/)

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - An HP BIOS with HP Sure Admin support is required for applying the payloads generated by this command.

.LINK
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.EXAMPLE
  $payload = New-HPSureAdminDisablePayload -SigningKeyFile "$path\signing_key.pfx"
  $payload | Set-HPSecurePlatformPayload

.EXAMPLE
  New-HPSureAdminDisablePayload -SigningKeyFile "$path\signing_key.pfx" -SigningKeyPassword "s3cr3t" -OutputFile PayloadFile.dat
  Set-HPSecurePlatformPayload -PayloadFile PayloadFile.dat
#>
function New-HPSureAdminDisablePayload
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/new-hpsureadmindisablepayload")]
  param(
    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $true,Position = 1)]
    [System.IO.FileInfo]$SigningKeyFile,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 2)]
    [string]$SigningKeyPassword,

    [Parameter(ValueFromPipeline = $true,ParameterSetName = "SigningKeyCert",Mandatory = $true,Position = 1)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKeyCertificate,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 0)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 1)]
    [guid]$TargetUUID = 'ffffffff-ffff-ffff-ffff-ffffffffffff',

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 2)]
    [switch]$SingleUse,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 3)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 4)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 5)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 6)]
    [switch]$CacheAccessToken
  )

  $params = @{
    Name = "Enhanced BIOS Authentication Mode"
    Value = "Disable"
    SingleUse = $SingleUse
    Nonce = $Nonce
    TargetUUID = $TargetUUID
    OutputFile = $OutputFile
  }

  if ($PSCmdlet.ParameterSetName -eq "SigningKeyFile") {
    $params.SigningKeyFile = $SigningKeyFile
    $params.SigningKeyPassword = $SigningKeyPassword
  }
  elseif ($PSCmdlet.ParameterSetName -eq "SigningKeyCert") {
    $params.SigningKeyCertificate = $SigningKeyCertificate
  }
  elseif ($PSCmdlet.ParameterSetName -eq "RemoteSigning") {
    $params.RemoteSigningServiceKeyID = $RemoteSigningServiceKeyID
    $params.RemoteSigningServiceURL = $RemoteSigningServiceURL
    $params.CacheAccessToken = $CacheAccessToken
  }

  New-HPSureAdminBIOSSettingValuePayload @params -Verbose:$VerbosePreference
}

<#
.SYNOPSIS
  Creates a payload for provisioning a local access key

.DESCRIPTION
  This command uses the provided key to sign and authorize updating HP Sure Admin local access keys. There are three signing options to choose from:
  - Signing Key File (and Password) using -SigningKeyFile and -SigningKeyPassword parameters 
  - Signing Key Certificate using -SigningKeyCertificate parameter
  - Remote Signing using -RemoteSigningServiceKeyID and -RemoteSigningServiceURL parameters 

  Please note that using a Key File with Password in PFX format is recommended over using an X509 Certificate object because a private key in a certificate is not password protected.

  Setting a local access key allows system administrators to authorize commands locally with the HP Sure Admin phone app. Reference the Convert-HPSureAdminCertToQRCode command to learn more about how to transfer a local access key to the HP Sure Admin phone app.

  This command writes the created payload to the pipeline or to the file specified in the OutputFile parameter. This payload can then be passed to the Set-HPSecurePlatformPayload command.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Set-HPSecurePlatformPayload command. Creating the payload and passing it to the Set-HPSecurePlatformPayload command via the pipeline is not a recommended production pattern.

.PARAMETER SigningKeyFile
  Specifies the path to the Secure Platform Management signing key as a PFX file. If the PFX file is protected by a password (recommended),
  the SigningKeyPassword parameter should also be provided.

.PARAMETER SigningKeyPassword
  Specifies the Secure Platform Management signing key file password, if required.

.PARAMETER LocalAccessKeyFile
  Specifies the path to the local access key as a PFX file. If the PFX file is protected by a password (recommended),
  the LocalAccessKeyPassword parameter should also be provided.

.PARAMETER LocalAccessKeyPassword
  Specifies the local access key file password, if required

.PARAMETER SigningKeyCertificate
  Specifies the Secure Platform Management signing key certificate as an X509Certificate object

.PARAMETER Nonce
  Specifies a Nonce. If nonce is specified, the Secure Platform Management subsystem will only accept commands with a nonce greater or equal to the last nonce sent. This approach helps to prevent replay attacks. If not specified, the nonce is inferred from the current local time. The current local time as the nonce works in most cases. However, this approach has a resolution of seconds, so when performing parallel operations or a high volume of operations, it is possible for the same counter to be interpreted for more than one command. In these cases, the caller should use its own nonce derivation and provide it through this parameter.

.PARAMETER TargetUUID
  Specifies the computer UUID on which to perform this operation. If not specified, the payload generated will work on any computer.

.PARAMETER SingleUse
  If specified, the payload cannot be replayed. This happens because the nonce must be higher than ActionsCounter and this counter is updated and incremented every time a command generated with SingleUse flag is accepted by the BIOS.
  If not specified, the payload can be replayed as many times as desired until a payload generated with a nonce higher than
  SettingsCounter is received. This happens because SettingsCounter is not incremented by the BIOS when accepting commands.

.PARAMETER OutputFile
  Specifies the file to write output to instead of writing the output to the pipeline

.PARAMETER Id
  Specifies the Int Id from 1,2, or 3 that gets appended to the setting name

.PARAMETER KeyEnrollmentData
  Specifies the KeyEnrollmentData to use to get Sure Admin Local Access key from certificate

.PARAMETER RemoteSigningServiceKeyID
  Specifies the Signing Key ID to be used

.PARAMETER RemoteSigningServiceURL
  Specifies the (Key Management Service) KMS server URL (I.e.: https://<KMSAppName>.azurewebsites.net/)

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - An HP BIOS with HP Sure Admin support is required for applying the payloads generated by this command.

.LINK
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.EXAMPLE
  $payload = New-HPSureAdminLocalAccessKeyProvisioningPayload -SigningKeyFile "$path\signing_key.pfx" -LocalAccessKeyFile "$path\local_access_key.pfx"
  $payload | Set-HPSecurePlatformPayload

.EXAMPLE
  New-HPSureAdminLocalAccessKeyProvisioningPayload -SigningKeyFile "$path\signing_key.pfx" -SigningKeyPassword "s3cr3t" -LocalAccessKeyFile "$path\local_access_key.pfx" -LocalAccessKeyPassword "lak_s3cr3t" -OutputFile PayloadFile.dat
  Set-HPSecurePlatformPayload -PayloadFile PayloadFile.dat
#>
function New-HPSureAdminLocalAccessKeyProvisioningPayload
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/new-hpsureadminlocalaccesskeyprovisioningpayload")]
  param(
    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $true,Position = 1)]
    [System.IO.FileInfo]$SigningKeyFile,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 2)]
    [string]$SigningKeyPassword,

    [Parameter(ValueFromPipeline = $true,ParameterSetName = "SigningKeyCert",Mandatory = $true,Position = 1)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKeyCertificate,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 0)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 1)]
    [guid]$TargetUUID = 'ffffffff-ffff-ffff-ffff-ffffffffffff',

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 2)]
    [switch]$SingleUse,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $true,Position = 6)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $true,Position = 6)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 3)]
    [System.IO.FileInfo]$LocalAccessKeyFile,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 7)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 7)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 4)]
    [string]$LocalAccessKeyPassword,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 8)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 8)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 5)]
    [ValidateSet(1,2,3)]
    [int]$Id = 1,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 6)]
    [string]$KeyEnrollmentData,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 7)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 8)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 9)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 10)]
    [switch]$CacheAccessToken
  )

  $localAccessKey = (Get-HPPrivateX509CertCoalesce -File $LocalAccessKeyFile -password $LocalAccessKeyPassword -cert $null -Verbose:$VerbosePreference).Full
  [string]$pubKeyBase64 = Get-HPPrivateSureAdminLocalAccessKeyFromCert -LocalAccessKey $localAccessKey -KeyEnrollmentData $KeyEnrollmentData

  $params = @{
    Name = "Enhanced BIOS Authentication Mode Local Access Key " + $Id
    Value = $pubKeyBase64
    SingleUse = $SingleUse
    Nonce = $Nonce
    TargetUUID = $TargetUUID
    OutputFile = $OutputFile
  }
  if ($PSCmdlet.ParameterSetName -eq "SigningKeyFile") {
    $params.SigningKeyFile = $SigningKeyFile
    $params.SigningKeyPassword = $SigningKeyPassword
  }
  elseif ($PSCmdlet.ParameterSetName -eq "SigningKeyCert") {
    $params.SigningKeyCertificate = $SigningKeyCertificate
  }
  elseif ($PSCmdlet.ParameterSetName -eq "RemoteSigning") {
    $params.RemoteSigningServiceKeyID = $RemoteSigningServiceKeyID
    $params.RemoteSigningServiceURL = $RemoteSigningServiceURL
    $params.CacheAccessToken = $CacheAccessToken
  }

  New-HPSureAdminBIOSSettingValuePayload @params -Verbose:$VerbosePreference
}

<#
.SYNOPSIS
  Creates a payload for authorizing a single BIOS setting change

.DESCRIPTION
  This command uses the provided key to sign and authorize a single BIOS setting change. There are three signing options to choose from:
  - Signing Key File (and Password) using -SigningKeyFile and -SigningKeyPassword parameters 
  - Signing Key Certificate using -SigningKeyCertificate parameter
  - Remote Signing using -RemoteSigningServiceKeyID and -RemoteSigningServiceURL parameters 

  Please note that using a Key File with Password in PFX format is recommended over using an X509 Certificate object because a private key in a certificate is not password protected.

  This command writes the created payload to the pipeline or to the file specified in the OutputFile parameter.
  This payload can then be passed to the Set-HPSecurePlatformPayload command.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Set-HPSecurePlatformPayload command. Creating the payload and passing it to the Set-HPSecurePlatformPayload command via the pipeline is not a recommended production pattern.

.PARAMETER Name
  Specifies the name of a setting. Note that the setting name is usually case sensitive.

.PARAMETER Value
  Specifies the new value of a setting

.PARAMETER SigningKeyFile
  Specifies the path to the Secure Platform Management signing key as a PFX file. If the PFX file is protected by a password (recommended),
  the SigningKeyPassword parameter should also be provided.

.PARAMETER SigningKeyPassword
  Specifies the Secure Platform Management signing key file password, if required

.PARAMETER SigningKeyCertificate
  Specifies the Secure Platform Management signing key certificate as an X509Certificate object

.PARAMETER Nonce
   Specifies a Nonce. If nonce is specified, the Secure Platform Management subsystem will only accept commands with a nonce greater or equal to the last nonce sent. This approach helps to prevent replay attacks. If not specified, the nonce is inferred from the current local time. The current local time as the nonce works in most cases. However, this approach has a resolution of seconds, so when performing parallel operations or a high volume of operations, it is possible for the same counter to be interpreted for more than one command. In these cases, the caller should use its own nonce derivation and provide it through this parameter.

.PARAMETER TargetUUID
  Specifies the computer UUID on which to perform this operation. If not specified, the payload generated will used on any computer.

.PARAMETER SingleUse
  If specified, the payload cannot be replayed. This happens because the nonce must be higher than ActionsCounter and this counter is updated and incremented every time a command generated with SingleUse flag is accepted by the BIOS.
  If not specified, the payload can be replayed as many times as desired until a payload generated with a nonce higher than
  SettingsCounter is received. This happens because SettingsCounter is not incremented by the BIOS when accepting commands.

.PARAMETER OutputFile
  Specifies the file to write output to instead of writing the output to the pipeline

.PARAMETER RemoteSigningServiceKeyID
  Specifies the Signing Key ID to be used

.PARAMETER RemoteSigningServiceURL
  Specifies the (Key Managmenet Service) KMS server URL (I.e.: https://<KMSAppName>.azurewebsites.net/)

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - An HP BIOS with HP Sure Admin support is required for applying the payloads generated by this command.

.LINK
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.EXAMPLE
  $payload = New-HPSureAdminBIOSSettingValuePayload -Name "Setting Name" -Value "New Setting Value" -SigningKeyFile "$path\signing_key.pfx"
  $payload | Set-HPSecurePlatformPayload

.EXAMPLE
  New-HPSureAdminBIOSSettingValuePayload -Name "Setting Name" -Value "New Setting Value" -SigningKeyFile "$path\signing_key.pfx" -SigningKeyPassword "s3cr3t" -OutputFile PayloadFile.dat
  Set-HPSecurePlatformPayload -PayloadFile PayloadFile.dat
#>
function New-HPSureAdminBIOSSettingValuePayload
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/new-hpsureadminbiossettingvaluepayload")]
  param(
    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 0)]
    [string]$Name,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 1)]
    [AllowEmptyString()]
    [string]$Value,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $true,Position = 2)]
    [System.IO.FileInfo]$SigningKeyFile,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 3)]
    [string]$SigningKeyPassword,

    [Parameter(ValueFromPipeline = $true,ParameterSetName = "SigningKeyCert",Mandatory = $true,Position = 2)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKeyCertificate,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 2)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 3)]
    [guid]$TargetUUID = 'ffffffff-ffff-ffff-ffff-ffffffffffff',

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 4)]
    [switch]$SingleUse,

    [Parameter(ParameterSetName = "SigningKeyFile",Mandatory = $false,Position = 7)]
    [Parameter(ParameterSetName = "SigningKeyCert",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 5)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 6)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 7)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 8)]
    [switch]$CacheAccessToken
  )

  if ($PSCmdlet.ParameterSetName -eq "RemoteSigning") {
    $params = @{
      Name = $Name
      Value = $Value
      SingleUse = $SingleUse
      Nonce = $Nonce
      TargetUUID = $TargetUUID
      RemoteSigningServiceKeyID = $RemoteSigningServiceKeyID
      RemoteSigningServiceURL = $RemoteSigningServiceURL
      CacheAccessToken = $CacheAccessToken
    }
  }
  else {
    $signingKey = (Get-HPPrivateX509CertCoalesce -File $SigningKeyFile -password $SigningKeyPassword -cert $SigningKeycertificate -Verbose:$VerbosePreference).Full
    $params = @{
      Name = $Name
      Value = $Value
      SingleUse = $SingleUse
      Nonce = $Nonce
      TargetUUID = $TargetUUID
      SigningKey = $signingKey
    }
  }

  [SureAdminSetting]$setting = New-HPPrivateSureAdminBIOSSettingObject @params -Verbose:$VerbosePreference
  $data = $setting | ConvertTo-Json
  New-HPPrivatePortablePayload -Data $data -Purpose "hp:sureadmin:biossetting" -OutputFile $OutputFile -Verbose:$VerbosePreference
}

function Invoke-HPPrivateConstructHeader {
  [CmdletBinding()]
  param(
    [uint32]$NameLen,
    [uint32]$ValueLen,
    [switch]$SingleUse,
    [uint32]$Nonce,
    [guid]$TargetUUID
  )

  $data = New-Object -TypeName SureAdminSignatureBlockHeader

  $data.Version = 1
  $data.NameLength = $NameLen
  $data.ValueLength = $ValueLen
  $data.OneTimeUse = [byte]($SingleUse.IsPresent)
  $data.Nonce = $Nonce
  $data.Reserved = 1
  $data.Target = $TargetUUID.ToByteArray()

  [byte[]]$header = (Convert-HPPrivateObjectToBytes -obj $data -Verbose:$VerbosePreference)[0]
  return $header
}

function Invoke-HPPrivateConstructPayload {
  [CmdletBinding()]
  param(
    [byte[]]$Header,
    [string]$Name,
    [string]$Value
  )

  $nameLen = [System.Text.Encoding]::Unicode.GetByteCount($Name)
  $valueLen = [System.Text.Encoding]::Unicode.GetByteCount($Value)
  [byte[]]$payload = New-Object byte[] ($Header.Count + $nameLen + $valueLen)

  $namebytes = [System.Text.Encoding]::Unicode.GetBytes($Name)
  [System.Array]::Copy($Header,0,$payload,0,$Header.Length)
  [System.Array]::Copy($namebytes,0,$payload,$Header.Length,$namebytes.Length)
  if ($valueLen -ne 0) {
    Write-Verbose "Copying value to payload"
    $valuebytes = [System.Text.Encoding]::Unicode.GetBytes($Value)
    [System.Array]::Copy($valuebytes,0,$payload,$Header.Length + $namebytes.Length,$valuebytes.Length)
  }
  else {
    Write-Verbose "No value was specified for this setting"
  }

  return $payload
}

function Invoke-HPPrivateConstructAuthorization {
  [CmdletBinding()]
  param(
    [byte[]]$Header,
    [byte[]]$Signature
  )

  [byte[]]$authorization = New-Object byte[] ($Header.Length + $Signature.Length)
  [System.Array]::Copy($Header,0,$authorization,0,$Header.Length)
  [System.Array]::Copy($Signature,0,$authorization,$Header.Length,$Signature.Length)

  [string]$encodedAuth = "<BEAM/>" + [Convert]::ToBase64String($authorization)
  return $encodedAuth
}

function Get-HPPrivatePublicKeyModulus ($cert)
{
  $key = $cert.PublicKey.key
  $parameters = $key.ExportParameters($false);
  return $parameters.Modulus
}

function Get-HPPrivateKeyNameFromCert ($cert)
{
  return $cert.Subject -replace "(CN=)(.*?),.*",'$2'
}

function Get-HPPrivatePrimesFromCert ($Certificate)
{
  $rsaPrivate = [xml]$Certificate.PrivateKey.ToXmlString($true)

  $p = [System.Convert]::FromBase64String($rsaPrivate.RSAKeyValue.P)
  $q = [System.Convert]::FromBase64String($rsaPrivate.RSAKeyValue.Q)

  $primes = [System.Byte[]]::new(256)

  for ($i = 0; $i -lt 128; $i++)
  {
    $primes[$i] = $p[$i]
  }

  for ($i = 0; $i -lt 128; $i++)
  {
    $primes[128 + $i] = $q[$i]
  }

  return $primes
}

function Get-HPPrivateRandomByteArray ($Length)
{
  $RandomBytes = New-Object Byte[] ($Length)

  $RNG = [Security.Cryptography.RNGCryptoServiceProvider]::Create()
  $RNG.GetBytes($RandomBytes)

  return $RandomBytes
}

function Get-HPPrivateRandomIV ()
{
  return Get-HPPrivateRandomByteArray 16
}

function Get-HPPrivateRandomSalt ()
{
  return Get-HPPrivateRandomByteArray 8
}

function Get-HPPrivatePbkdf2Bytes ($Passphrase,$Salt,$Iterations,$Length,$Metadata = $null)
{
  $Passphrase += $Metadata
  $PBKDF2 = New-Object System.Security.Cryptography.Rfc2898DeriveBytes ($Passphrase,$Salt,$Iterations)
  return $PBKDF2.GetBytes($Length)
}

function Get-HPPrivateDataEncryption ([byte[]]$AESKey,[byte[]]$Data,[byte[]]$IV)
{
  $aesManaged = New-Object System.Security.Cryptography.AesManaged
  $aesManaged.Mode = [System.Security.Cryptography.CipherMode]::CBC
  $aesManaged.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7
  $aesManaged.KeySize = 256
  $aesManaged.IV = $IV
  $aesManaged.key = $AESKey

  $encryptor = $aesManaged.CreateEncryptor()
  [byte[]]$encryptedData = $encryptor.TransformFinalBlock($Data,0,$Data.Length);
  $aesManaged.Dispose()

  return $encryptedData
}

function Get-HPPrivateKeyFromCert {
  [CmdletBinding()]
  param(
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$Certificate,
    [string]$Metadata,
    [string]$Passphrase
  )

  $iv = Get-HPPrivateRandomIV
  $salt = Get-HPPrivateRandomSalt
  $iterations = 100000
  $keysize = 32
  $aesKey = Get-HPPrivatePbkdf2Bytes $Passphrase $salt $iterations $keysize $Metadata

  $primes = Get-HPPrivatePrimesFromCert $Certificate
  $cipher = Get-HPPrivateDataEncryption $aesKey $primes $iv

  $encryptedPrimes = $salt + $iv + $cipher

  return [System.Convert]::ToBase64String($encryptedPrimes)
}

function Get-HPPrivateSureAdminLocalAccessKeyFromCert {
  [CmdletBinding()]
  param(
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$LocalAccessKey,
    [string]$KeyEnrollmentData
  )
  $modulus = Get-HPPrivatePublicKeyModulus $LocalAccessKey
  $pubKeyBase64 = [System.Convert]::ToBase64String($modulus)

  if ($KeyEnrollmentData) {
    $KeyEnrollmentDataBytes = [System.Text.Encoding]::UTF8.GetBytes($KeyEnrollmentData)
    $pubKeyBase64 += [System.Convert]::ToBase64String($KeyEnrollmentDataBytes)
  }

  return $pubKeyBase64
}

<#
.SYNOPSIS
  Extracts the key id from a certificate

.DESCRIPTION
  This command retrieves the key id from a certificate. The key id used by HP Sure Admin Key Management Service (KMS) for remote signing.

.PARAMETER Certificate
  Specifies the X509Certificate2 certificate

.PARAMETER CertificateFile
  Specifies the certificate in PFX file

.PARAMETER CertificateFilePassword
  Specifies the password for the PFX file

.EXAMPLE
  Get-HPSureAdminKeyId -Certificate X509Certificate2

.EXAMPLE
  Get-HPSureAdminKeyId -CertificateFile mypfxcert.pfx
#>
function Get-HPSureAdminKeyId {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/get-hpsureadminkeyid")]
  param(
    [Parameter(ParameterSetName = "Cert",Mandatory = $true,Position = 0)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$Certificate,

    [Parameter(ParameterSetName = "File",Mandatory = $true,Position = 0)]
    [System.IO.FileInfo]$CertificateFile,

    [Parameter(ParameterSetName = "File",Mandatory = $false,Position = 1)]
    [string]$CertificateFilePassword
  )

  if ($PSCmdlet.ParameterSetName -eq "File") {
    if ($CertificateFilePassword) {
      [securestring]$CertificateFilePassword = ConvertTo-SecureString -AsPlainText -Force $CertificateFilePassword
      $Certificate = (Get-HPPrivatePublicKeyCertificateFromPFX -FileName $CertificateFile -password $CertificateFilePassword).Full
    }
    else {
      $Certificate = (Get-HPPrivatePublicKeyCertificateFromPFX -FileName $CertificateFile).Full
    }
  }

  $modulus = Get-HPPrivatePublicKeyModulus $Certificate
  $hashMod = Get-HPPrivateHash -Data $modulus
  return [System.Convert]::ToBase64String($hashMod)
}

function New-HPPrivateSureAdminEnrollmentJsonType5 {
  [CmdletBinding()]
  param(
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$Certificate,
    [string]$AADRevocation,
    [string]$KeyName
  )

  # Get the pub key
  $hashModBase64 = Get-HPSureAdminKeyId -Certificate $Certificate

  # Get full cert
  $rawBytes = $Certificate.Export("Pfx","")
  $pvtKeyBase64 = [System.Convert]::ToBase64String($rawBytes)

  $data = [ordered]@{
    KeyEnrollmentData = $null
    Ver = "002"
    Type = "005"
    KeyId = $hashModBase64
    KeyAlgo = "06"
    PvtKey = $pvtKeyBase64
    KeyExp = "00000000"
    KeyName = $KeyName
    KeyBkupEn = "0"
    CanModKeyBkup = "0"
    CanExport = "0"
    AADRevocation = $AADRevocation
  }

  $json = $data | ConvertTo-Json -Compress
  return $json
}

function New-HPPrivateSureAdminEnrollmentJsonType4 {
  [CmdletBinding()]
  param(
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$Certificate,
    [string]$AADRevocation,
    [string]$KeyName,
    [switch]$EndorsementKey
  )

  # Get the pub key
  $hashModBase64 = Get-HPSureAdminKeyId -Certificate $Certificate

  # Get full cert
  $rawBytes = $Certificate.Export("Pfx","")
  $pvtKeyBase64 = [System.Convert]::ToBase64String($rawBytes)

  $data = [ordered]@{
    KeyEnrollmentData = $null
    Ver = "002"
    Type = "004"
    KeyId = $hashModBase64
    KeyAlgo = "06"
    PvtKey = $pvtKeyBase64
    KeyExp = "00000000"
    KeyName = $KeyName
    KeyBkupEn = "0"
    CanModKeyBkup = "0"
    CanExport = "0"
    AADRevocation = $AADRevocation
  }

  $json = $data | ConvertTo-Json -Compress
  return $json
}

function New-HPPrivateSureAdminEnrollmentJson {
  [CmdletBinding()]
  param(
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$Certificate,
    [string]$Model,
    [string]$SerialNumber,
    [string]$Passphrase,
    [string]$AADRevocation,
    [string]$KeyName
  )

  # Get the pub key
  $modulus = Get-HPPrivatePublicKeyModulus $Certificate
  $hashMod = Get-HPPrivateHash -Data $modulus
  $hashModBase64 = [System.Convert]::ToBase64String($hashMod)

  if (-not $KeyName) {
    # Get the private key
    $KeyName = Get-HPPrivateKeyNameFromCert $Certificate
  }
  if (-not $KeyName) {
    throw 'Certificate subject or parameter KeyName is required to identify the key in KMS server'
  }

  if ("" -eq $Passphrase) {
    $keyAlgo = "006"
    $ver = "002"
  }
  else {
    $keyAlgo = "007"
    $ver = "002"
  }

  $data = [ordered]@{
    Ver = $ver
    Type = "001"
    KeyId = $hashModBase64
    KeyAlgo = $keyAlgo
    PvtKey = $null
    KeyExp = "00000000"
    KeyName = $KeyName
    KeyBkupEn = "0"
    CanModKeyBkup = "0"
    CanExport = "0"
    AADRevocation = $AADRevocation
  }

  if ($Model) {
    $data.Model = $Model
  }
  if ($SerialNumber) {
    $data.SerNum = $SerialNumber
  }

  $json = $data | ConvertTo-Json -Compress
  $pvtKeyBase64 = Get-HPPrivateKeyFromCert -Certificate $Certificate -Metadata $json -Passphrase $Passphrase
  $data.PvtKey = $pvtKeyBase64

  $json = $data | ConvertTo-Json -Compress
  return $json
}

<#
.SYNOPSIS
  Creates a QR-Code for transferring the private key from a certificate file to the HP Sure Admin phone app

.DESCRIPTION
  This command extracts a private key from the provided certificate file and presents it in a form of QR-Code, which can be scanned with the HP Sure Admin phone app. Once scanned the app can be used for authorizing commands and BIOS setting changes.

  Security note: It is recommended to delete the QR-Code file once it is scanned with the app. Keeping the QR-Code stored locally in your computer is not a recommended production pattern since it contains sensitive information that can be used to authorize commands.

.PARAMETER LocalAccessKeyFile
  Specifies the path to the local access key as a PFX file. If the PFX file is protected by a password (recommended), the LocalAccessKeyPassword parameter should also be provided.

.PARAMETER LocalAccessKeyPassword
  Specifies the local access key file password, if required.

.PARAMETER Model
  Specifies the computer model to be stored with the key in the phone app

.PARAMETER SerialNumber
  Specifies the serial number to be stored with the key in the phone app

.PARAMETER OutputFile
  Specifies the file to write output to instead of writing the output to the pipeline

.PARAMETER Format
  Specifies the format of your preference to save the QR-Code image file: Jpeg, Bmp, Png, Svg.

.PARAMETER ViewAs
  Specifies the view option. The possible values are: 
  - Default: creates a local file in your system and opens QR-Code image in default image viewer.
  - Text: the QR-Code is displayed by using text characters in your console.
  - None: the QR-Code is not presented to the user. This option is ideally used with the OutputFile parameter.

.PARAMETER Passphrase
  Specifies the password to protect QR-Code content

.NOTES
  - Supported on Windows Power Shell v5.
  - An HP BIOS with HP Sure Admin support is required for applying the payloads generated by this command.

.LINK
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.EXAMPLE
  Convert-HPSureAdminCertToQRCode -LocalAccessKeyFile "$path\signing_key.pfx"

.EXAMPLE
  Convert-HPSureAdminCertToQRCode -Model "PC-Model" -SerialNumber "SN-1234" -LocalAccessKeyFile "$path\signing_key.pfx" -LocalAccessKeyPassword "s3cr3t"

.EXAMPLE
  Convert-HPSureAdminCertToQRCode -Model "PC-Model" -SerialNumber "SN-1234" -LocalAccessKeyFile "$path\signing_key.pfx" -Passphrase "s3cr3t" -ViewAs Text

.EXAMPLE
  Convert-HPSureAdminCertToQRCode -LocalAccessKeyFile "$path\signing_key.pfx" -Passphrase "s3cr3t" -Format "Svg"
#>
function Convert-HPSureAdminCertToQRCode {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/convert-hpsureadmincerttoqrcode")]
  param(
    [Parameter(Mandatory = $true,Position = 0)]
    [System.IO.FileInfo]$LocalAccessKeyFile,

    [Parameter(Mandatory = $false,Position = 1)]
    [string]$LocalAccessKeyPassword,

    [Parameter(Mandatory = $false,Position = 2)]
    [string]$Model,

    [Parameter(Mandatory = $false,Position = 3)]
    [string]$SerialNumber,

    [Parameter(Mandatory = $false,Position = 4)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(Mandatory = $false,Position = 5)]
    [ValidateSet('Jpeg','Bmp','Png','Svg')]
    [string]$Format = "Jpeg",

    [Parameter(Mandatory = $false,Position = 6)]
    [ValidateSet('None','Text','Default')]
    [string]$ViewAs = "Default",

    [Parameter(Mandatory = $false,Position = 7)]
    [string]$Passphrase
  )

  if (-not $Model)
  {
    $Model = Get-HPBIOSSettingValue -Name "Product Name"
  }

  if (-not $SerialNumber)
  {
    $SerialNumber = Get-HPBIOSSettingValue -Name "Serial Number"
  }

  if ($LocalAccessKeyPassword) {
    [securestring]$LocalAccessKeyPassword = ConvertTo-SecureString -AsPlainText -Force $LocalAccessKeyPassword
    $cert = (Get-HPPrivatePublicKeyCertificateFromPFX -FileName $LocalAccessKeyFile -password $LocalAccessKeyPassword).Full
  }
  else {
    $cert = (Get-HPPrivatePublicKeyCertificateFromPFX -FileName $LocalAccessKeyFile).Full
  }

  $data = New-HPPrivateSureAdminEnrollmentJson -Certificate $cert -Model $Model -SerialNumber $SerialNumber -Passphrase $Passphrase
  New-HPPrivateQRCode -Data $data -OutputFile $OutputFile -Format $Format -ViewAs $ViewAs
}

<#
.SYNOPSIS
  Sends a local access key in PFX format to HP Sure Admin Key Management Service (KMS)

.DESCRIPTION
  This command extracts a private key from the provided certificate file, generates a JSON for the central-managed enrollment process, and sends it to the HP Sure Admin Key Management Service (KMS).
  The connection with the KMS server requires the user to authenticate with a valid Microsoft account.

.PARAMETER LocalAccessKeyFile
  Specifies the path to the local access key, as a PFX file. If the PFX file is protected by a password (recommended),
  the LocalAccessKeyPassword parameter should also be provided.

.PARAMETER LocalAccessKeyPassword
  Specifies the local access key file password, if required.

.PARAMETER KMSAppName
  Specifies the application name on Azure KMS server that will be used to compose the URI for uploading the key

.PARAMETER KMSUri
  Specifies the complete URI for uploading the key (I.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER AADGroup
  Specifies the group name in Azure Active Directory that will have access to the key

.PARAMETER KeyName
  Specifies the key name to identify the certificate. If not specified, it will use the certificate subject.

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - An HP Sure Admin KMS server is required for using this feature.

.EXAMPLE
  Send-HPSureAdminLocalAccessKeyToKMS -LocalAccessKeyFile "$path\signing_key.pfx" -KMSUri "https://MyKMSURI.azurewebsites.net/" -AADGroup "MyAADGroupName"

.EXAMPLE
  Send-HPSureAdminLocalAccessKeyToKMS -LocalAccessKeyFile "$path\signing_key.pfx" -LocalAccessKeyPassword "pass" -KMSAppName "MyAppName" -AADGroup "MyAADGroupName"
#>
function Send-HPSureAdminLocalAccessKeyToKMS {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/send-hpsureadminlocalaccesskeytokms")]
  param(
    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 0)]
    [System.IO.FileInfo]$LocalAccessKeyFile,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $false,Position = 1)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $false,Position = 1)]
    [string]$LocalAccessKeyPassword,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 2)]
    [string]$KMSUri,

    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 2)]
    [string]$KMSAppName,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 3)]
    [string]$AADGroup,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $false,Position = 4)]
    [switch]$CacheAccessToken,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $false,Position = 5)]
    [string]$KeyName
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($KMSUri -and -not ($KMSUri.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($KMSUri) -or $KMSUri.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if (-not $KMSUri) {
    $KMSUri = "https://$KMSAppName.azurewebsites.net/"
  }

  if (-not $KMSUri.contains('api/uploadkey')) {
    if (-not $KMSUri.EndsWith('/')) {
      $KMSUri += '/'
    }
    $KMSUri += 'api/uploadkey'
  }

  if ($LocalAccessKeyPassword) {
    [securestring]$LocalAccessKeyPassword = ConvertTo-SecureString -AsPlainText -Force $LocalAccessKeyPassword
    $cert = (Get-HPPrivatePublicKeyCertificateFromPFX -FileName $LocalAccessKeyFile -password $LocalAccessKeyPassword).Full
  }
  else {
    $cert = (Get-HPPrivatePublicKeyCertificateFromPFX -FileName $LocalAccessKeyFile).Full
  }

  $jsonPayload = New-HPPrivateSureAdminEnrollmentJson -Certificate $cert -AADRevocation $AADGroup -KeyName $KeyName
  $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
  $response,$responseContent = Send-HPPrivateKMSRequest -KMSUri $KMSUri -JsonPayload $jsonPayload -AccessToken $accessToken

  if ($response -ne "OK") {
    Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
  }
}

<#
.SYNOPSIS
  Adds a signing key in PFX format to HP Sure Admin Key Management Service (KMS)

.DESCRIPTION
  This command extracts a private key from the provided certificate file, generates a JSON for the central-managed enrollment process, and sends it to the HP Sure Admin Key Management Service (KMS).
  The connection with the KMS server requires the user to authenticate with a valid Microsoft account.

.PARAMETER SigningKeyFile
  Specifies the path to the signing key as a PFX file. If the PFX file is protected by a password (recommended), the -SigningKeyPassword parameter should also be provided.

.PARAMETER SigningKeyPassword
  Specifies the signing key file password, if required.

.PARAMETER Model
  Specifies the computer model to be stored with the key in the phone app

.PARAMETER SerialNumber
  Specifies the serial number to be stored with the key in the phone app

.PARAMETER KMSAppName
  Specifies the application name on Azure KMS server that will be used to compose the URI for uploading the key

.PARAMETER KMSUri
  Specifies the complete URI for uploading the key (I.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER AADGroup
  Specifies the group name in Azure Active Directory that will have access to the key

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - An HP Sure Admin KMS server is required for using this feature.

.EXAMPLE
  Add-HPSureAdminSigningKeyToKMS -SigningKeyFile "$path\signing_key.pfx" -KMSUri "https://MyKMSURI.azurewebsites.net/" -AADGroup "MyAADGroupName"

.EXAMPLE
  Add-HPSureAdminSigningKeyToKMS -SigningKeyFile "$path\signing_key.pfx" -SigningKeyPassword "pass" -KMSAppName "MyAppName" -AADGroup "MyAADGroupName"
#>
function Add-HPSureAdminSigningKeyToKMS {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/add-hpsureadminsigningkeytokms")]
  param(
    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 0)]
    [System.IO.FileInfo]$SigningKeyFile,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $false,Position = 1)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $false,Position = 1)]
    [string]$SigningKeyPassword,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 3)]
    [string]$KMSUri,

    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 3)]
    [string]$KMSAppName,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 4)]
    [string]$AADGroup,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 5)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 5)]
    [string]$KeyName,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $false,Position = 6)]
    [switch]$CacheAccessToken
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($KMSUri -and -not ($KMSUri.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($KMSUri) -or $KMSUri.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if (-not $KMSUri) {
    $KMSUri = "https://$KMSAppName.azurewebsites.net/"
  }
  if (-not $KMSUri.EndsWith('/')) {
    $KMSUri += '/'
  }
  $KMSUri += 'api/signingkeys'

  if ($SigningKeyPassword) {
    [securestring]$SigningKeyPassword = ConvertTo-SecureString -AsPlainText -Force $SigningKeyPassword
    $cert = (Get-HPPrivatePublicKeyCertificateFromPFX -FileName $SigningKeyFile -password $SigningKeyPassword).Full
  }
  else {
    $cert = (Get-HPPrivatePublicKeyCertificateFromPFX -FileName $SigningKeyFile).Full
  }

  $jsonPayload = New-HPPrivateSureAdminEnrollmentJsonType4 -Certificate $cert -AADRevocation $AADGroup -KeyName $KeyName
  $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
  $response,$responseContent = Send-HPPrivateKMSRequest -KMSUri $KMSUri -JsonPayload $jsonPayload -AccessToken $accessToken

  if ($response -ne "OK") {
    Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
  }
}

<#
.SYNOPSIS
  Retrieves the HP Sure Admin Key Management Service (KMS) server capabilities

.DESCRIPTION
  This command displays HP Sure Admin Key Management Service (KMS) capabilities.
  The connection with the KMS server requires the user to authenticate with a valid Microsoft account.

.PARAMETER KMSAppName
  Specifies the application name on Azure KMS server to be used

.PARAMETER KMSUri
  Specifies the complete URI (I.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - An HP Sure Admin KMS server is required for using this feature.

.EXAMPLE
  Get-HPSureAdminKMSCapabilities -KMSUri "https://MyKMSURI.azurewebsites.net/"

.EXAMPLE
  Get-HPSureAdminKMSCapabilities -KMSAppName "MyAppName"
#>
function Get-HPSureAdminKMSCapabilities {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPSureAdminKMSCapabilities")]
  param(
    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 3)]
    [string]$KMSUri,

    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 3)]
    [string]$KMSAppName,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $false,Position = 6)]
    [switch]$CacheAccessToken
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($KMSUri -and -not ($KMSUri.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($KMSUri) -or $KMSUri.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if (-not $KMSUri) {
    $KMSUri = "https://$KMSAppName.azurewebsites.net/"
  }
  if (-not $KMSUri.EndsWith('/')) {
    $KMSUri += '/'
  }
  $KMSUri += 'api/capabilities'

  $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
  $response,$responseContent = Send-HPPrivateKMSRequest -KMSUri $KMSUri -AccessToken $accessToken -Method get

  if ($response -ne "OK") {
    Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
  }

  return $responseContent | ConvertFrom-Json
}

<#
.SYNOPSIS
  Adds an endorsement key in PFX format to HP Sure Admin Key Management Service (KMS)

.DESCRIPTION
  This command extracts a private key from the provided certificate file, generates a JSON for the central-managed enrollment process, and sends it to the HP Sure Admin Key Management Service (KMS).
  The connection with the KMS server requires the user to authenticate with a valid Microsoft account.

.PARAMETER EndorsementKeyFile
  Specifies the path to the endorsement key as a PFX file. If the PFX file is protected by a password (recommended), the -EndorsementKeyPassword parameter should also be provided.

.PARAMETER EndorsementKeyPassword
  Specifies the endorsement key file password, if required.

.PARAMETER Model
  Specifies the computer model to be stored with the key in the phone app

.PARAMETER SerialNumber
  Specifies the serial number to be stored with the key in the phone app

.PARAMETER KMSAppName
  Specifies the application name on Azure KMS server that will be used to compose the URI for uploading the key

.PARAMETER KMSUri
  Specifies the complete URI for uploading the key (I.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER AADGroup
  Specifies the group name in Azure Active Directory that will have access to the key

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - An HP Sure Admin KMS server is required for using this feature.

.EXAMPLE
  Add-HPSureAdminEndorsementKeyToKMS -EndorsementKeyFile "$path\endorsement_key.pfx" -KMSUri "https://MyKMSURI.azurewebsites.net/" -AADGroup "MyAADGroupName"

.EXAMPLE
  Add-HPSureAdminEndorsementKeyToKMS -EndorsementKeyFile "$path\endorsement_key.pfx" -EndorsementKeyPassword "pass" -KMSAppName "MyAppName" -AADGroup "MyAADGroupName"
#>
function Add-HPSureAdminEndorsementKeyToKMS {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/add-hpsureadminendorsementkeytokms")]
  param(
    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 0)]
    [System.IO.FileInfo]$EndorsementKeyFile,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $false,Position = 1)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $false,Position = 1)]
    [string]$EndorsementKeyPassword,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 3)]
    [string]$KMSUri,

    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 3)]
    [string]$KMSAppName,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 4)]
    [string]$AADGroup,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 5)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 5)]
    [string]$KeyName,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $false,Position = 6)]
    [switch]$CacheAccessToken
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($KMSUri -and -not ($KMSUri.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($KMSUri) -or $KMSUri.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if (-not $KMSUri) {
    $KMSUri = "https://$KMSAppName.azurewebsites.net/"
  }
  if (-not $KMSUri.EndsWith('/')) {
    $KMSUri += '/'
  }
  $KMSUri += 'api/endorsementkeys'

  if ($EndorsementKeyPassword) {
    [securestring]$EndorsementKeyPassword = ConvertTo-SecureString -AsPlainText -Force $EndorsementKeyPassword
    $cert = (Get-HPPrivatePublicKeyCertificateFromPFX -FileName $EndorsementKeyFile -password $EndorsementKeyPassword).Full
  }
  else {
    $cert = (Get-HPPrivatePublicKeyCertificateFromPFX -FileName $EndorsementKeyFile).Full
  }

  $jsonPayload = New-HPPrivateSureAdminEnrollmentJsonType5 -Certificate $cert -AADRevocation $AADGroup -KeyName $KeyName
  $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
  $response,$responseContent = Send-HPPrivateKMSRequest -KMSUri $KMSUri -JsonPayload $jsonPayload -AccessToken $accessToken

  if ($response -ne "OK") {
    Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
  }
}

<#
.SYNOPSIS
  Removes an endorsement key from HP Sure Admin Key Management Service (KMS)

.DESCRIPTION
  This command sends an HTTPS request to remove the endorsement key from the HP Sure Admin Key Management Service (KMS).
  The connection with the KMS server requires the user to authenticate with a valid Microsoft account.

.PARAMETER EndorsementKeyId
  Specifies the key id encoded in base64 that is used in the server to locate the key.
  Use the Get-HPSureAdminKeyId command to extract the key id from a pfx certificate.

.PARAMETER KMSAppName
  Specifies the application name on Azure KMS server that will be used to compose the URI for uploading the key

.PARAMETER KMSUri
  Specifies the complete URI for uploading the key (I.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - An HP Sure Admin KMS server is required for using this feature.

.EXAMPLE
  Remove-HPSureAdminEndorsementKeyFromKMS -EndorsementKeyId "<IdInBase64>" -KMSUri "https://MyKMSURI.azurewebsites.net/"
#>
function Remove-HPSureAdminEndorsementKeyFromKMS {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/remove-hpsureadminendorsementkeyfromkms")]
  param(
    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 0)]
    [string]$EndorsementKeyId,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 1)]
    [string]$KMSUri,

    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 1)]
    [string]$KMSAppName,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $false,Position = 2)]
    [switch]$CacheAccessToken
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($KMSUri -and -not ($KMSUri.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($KMSUri) -or $KMSUri.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if (-not $KMSUri) {
    $KMSUri = "https://$KMSAppName.azurewebsites.net/"
  }
  if (-not $KMSUri.EndsWith('/')) {
    $KMSUri += '/'
  }
  $KMSUri += 'api/endorsementkeys'
  $KMSUri = "$KMSUri/$EndorsementKeyId"

  $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
  $response,$responseContent = Send-HPPrivateKMSRequest -Method 'DELETE' -KMSUri $KMSUri -AccessToken $accessToken

  if ($response -ne "OK") {
    Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
  }
}

<#
.SYNOPSIS
  Removes a signing key from HP Sure Admin Key Management Service (KMS)

.DESCRIPTION
  This command sends an HTTPS request to remove the signing key from the HP Sure Admin Key Management Service (KMS).
  The connection with the KMS server requires the user to authenticate with a valid Microsoft account.

.PARAMETER SigningKeyId
  Specifies the key id encoded in base64 that is used in the server to locate the key.
  Use the Get-HPSureAdminKeyId command to extract the key id from a pfx certificate.

.PARAMETER KMSUri
  Specifies the complete URI for uploading the key (i.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER KMSAppName
  Specifies the application name on Azure KMS server that will be used to compose the URI for uploading the key

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - An HP Sure Admin KMS server is required for using this feature.

.EXAMPLE
  Remove-HPSureAdminSigningKeyFromKMS -SigningKeyId "<IdInBase64>" -KMSUri "https://MyKMSURI.azurewebsites.net/"
#>
function Remove-HPSureAdminSigningKeyFromKMS {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/remove-hpsureadminsigningkeyfromkms")]
  param(
    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 0)]
    [string]$SigningKeyId,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 1)]
    [string]$KMSUri,

    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 1)]
    [string]$KMSAppName,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $false,Position = 2)]
    [switch]$CacheAccessToken
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($KMSUri -and -not ($KMSUri.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($KMSUri) -or $KMSUri.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if (-not $KMSUri) {
    $KMSUri = "https://$KMSAppName.azurewebsites.net/"
  }
  if (-not $KMSUri.EndsWith('/')) {
    $KMSUri += '/'
  }
  $KMSUri += 'api/signingkeys'
  $KMSUri = "$KMSUri/$SigningKeyId"

  $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
  $response,$responseContent = Send-HPPrivateKMSRequest -Method 'DELETE' -KMSUri $KMSUri -AccessToken $accessToken

  if ($response -ne "OK") {
    Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
  }
}

function Set-HPPrivateSureAdminKMSAccessToken {
  param(
    [string]$AccessToken
  )

  $path = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("msalcache.dat")
  $AccessToken | Out-File -FilePath $path -Encoding utf8
  Write-Verbose "Access token saved to cache"
}

<#
.SYNOPSIS
  Clears the HP Sure Admin Key Management Service (KMS) access token

.DESCRIPTION
  This command clears the access token that is used for sending keys to HP Sure Admin Key Management Service (KMS).
  The token is stored locally in msalcache.dat file when -CacheAccessToken parameter is specified in KMS commands such as the Send-HPSureAdminLocalAccessKeyToKMS command. 

.EXAMPLE
  Clear-HPSureAdminKMSAccessToken
#>
function Clear-HPSureAdminKMSAccessToken {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/clear-hpsureadminkmsaccesstoken")]
  param(
  )

  $path = [System.IO.Path]::GetTempPath() + "hp/msalcache.dat"
  Remove-Item -Path $path -ErrorAction Ignore -Force
}

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateSureAdminKMSAccessToken {
  [CmdletBinding()]
  param(
    [switch]$CacheAccessToken
  )

  [string]$clientId = "40ef700f-b021-4fe4-81fe-b2536e9701c3"
  [string]$redirectUri = "http://localhost"
  [string[]]$scopes = ("https://graph.microsoft.com/User.Read", "https://graph.microsoft.com/GroupMember.Read.All")

  $clientApplicationBuilder = [Microsoft.Identity.Client.PublicClientApplicationBuilder]::Create($clientId)
  [void]$clientApplicationBuilder.WithRedirectUri($redirectUri)
  [void]$clientApplicationBuilder.WithClientId($clientId)
  $clientApplication = $clientApplicationBuilder.Build()

  if ($CacheAccessToken.IsPresent) {
    [TokenCacheHelper]::EnableSerialization($clientApplication.UserTokenCache)
    $authenticationResult = $null
    try {
      Write-Verbose "Trying to acquire token silently"
      [Microsoft.Identity.Client.IAccount[]]$accounts = $clientApplication.GetAccountsAsync().GetAwaiter().GetResult()
      if ($accounts -and $accounts.Count -gt 0) {
        $authenticationResult = $clientApplication.AcquireTokenSilent($scopes,$accounts[0]).ExecuteAsync().GetAwaiter().GetResult()
      }
    }
    catch {
      Write-Verbose "AcquireTokenSilent Exception: $($_.Exception)"
    }

    if ($authenticationResult) {
      return $authenticationResult.AccessToken
    }
  }
  else {
    Clear-HPSureAdminKMSAccessToken
  }

  # Aquire the access token using the interactive mode
  $aquireToken = $clientApplication.AcquireTokenInteractive($scopes)
  $parentWindow = [System.Diagnostics.Process]::GetCurrentProcess().MainWindowHandle
  [void]$aquireToken.WithParentActivityOrWindow($parentWindow)

  try {
    if ($PSEdition -eq 'Core') {
      # A timeout of two minutes is defined because netcore version of MSAL cannot detect if the user navigates away or simply closes the browser
      $timeout = New-TimeSpan -Minutes 2
      $tokenSource = New-Object System.Threading.CancellationTokenSource
      $taskAuthenticationResult = $aquireToken.ExecuteAsync($tokenSource.Token)
      $endTime = [datetime]::Now.Add($timeout)
      while (!$taskAuthenticationResult.IsCompleted) {
        if ([datetime]::Now -lt $endTime) {
          Start-Sleep -Seconds 1
        }
        else {
          $tokenSource.Cancel()
          throw [System.TimeoutException]"GetMsalTokenFailureOperationTimeout"
        }
      }
      $authenticationResult = $taskAuthenticationResult.Result
    }
    else {
      $authenticationResult = $aquireToken.ExecuteAsync().GetAwaiter().GetResult()
    }
  }
  catch {
    Write-Verbose $_.Exception
    if ($_.Exception.innerException -and $_.Exception.innerException.Message) {
      throw "Could not retrieve a valid access token: " + $_.Exception.innerException.Message
    }
    throw "Could not retrieve a valid access token: " + $_.Exception
  }

  if (-not $authenticationResult) {
    throw "Could not retrieve a valid access token"
  }

  return $authenticationResult.AccessToken
}

<#
.SYNOPSIS
  Sets one or multiple device permissions on the HP Sure Admin Key Management Service (KMS)

.DESCRIPTION
  Device permissions allow IT administrators to manage local access of specific devices without having to provision a unique LAK key for each one.
  This command sends an HTTPS request for mapping a device serial number to a user email, or to an AAD group.
  The connection with the KMS server requires the user to authenticate with a valid Microsoft account.
  Existing mappings are modified by the last configuration uploaded.

.PARAMETER JsonFile
  Specifies the path to the Json file containing multiple device permissions. JSON file must be structured as follows:
  [{"deviceId":"XYZ321","userEmailAddress":"user@kms.onmicrosoft.com","adGroupName":""},
  {"deviceId":"XYZ123","userEmailAddress":"user@kms.onmicrosoft.com"},
  {"deviceId":"ZYX321","adGroupName":"admins"},
  {"deviceId":"ABC000","userEmailAddress":"user@kms.onmicrosoft.com","adGroupName":"admins"}]

.PARAMETER KMSAppName
  Specifies the application name on Azure KMS server that will be used to compose the URI for uploading the key

.PARAMETER KMSUri
  Specifies the complete URI for uploading the permissions (I.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - Supported on Windows Power Shell v7.
  - An HP Sure Admin KMS server is required for using this feature.

.EXAMPLE
  Set-HPSureAdminDevicePermissions -SerialNumber "XYZ123" -KMSAppName "MyAppName" -UserEmail "myuser@myappname.onmicrosoft.com"

.EXAMPLE
  Set-HPSureAdminDevicePermissions -SerialNumber "XYZ123" -KMSUri "https://MyKMSURI.azurewebsites.net/" -AADGroup "MyAADGroupName"

.EXAMPLE
  Set-HPSureAdminDevicePermissions -JsonFile MyJsonFile.json -KMSAppName "MyAppName" -CacheAccessToken
#>
function Set-HPSureAdminDevicePermissions {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/set-hpsureadmindevicepermissions")]
  param(
    [Parameter(ParameterSetName = "KMSUriJsonFile",Mandatory = $true,Position = 1)]
    [string]$KMSUri,

    [Parameter(ParameterSetName = "KMSAppNameJsonFile",Mandatory = $true,Position = 1)]
    [string]$KMSAppName,

    [Parameter(ParameterSetName = "KMSAppNameJsonFile",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "KMSUriJsonFile",Mandatory = $true,Position = 2)]
    [System.IO.FileInfo]$JsonFile,

    [Parameter(ParameterSetName = "KMSAppNameJsonFile",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "KMSUriJsonFile",Mandatory = $false,Position = 3)]
    [switch]$CacheAccessToken
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($KMSUri -and -not ($KMSUri.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($KMSUri) -or $KMSUri.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if (-not $KMSUri) {
    $KMSUri = "https://$KMSAppName.azurewebsites.net/"
  }

  if (-not $KMSUri.EndsWith('/')) {
    $KMSUri += '/'
  }
  $KMSUri += 'api/devicekeymappings/upload'

  if ($JsonFile) {
    $f = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($JsonFile)
    [string]$jsonPayload = Get-Content -Raw -Path $f -ErrorAction Stop
  }

  $entries = ($jsonPayload | ConvertFrom-Json)
  foreach ($entry in $entries) {
    if (($entry.PSObject.Properties.Name -match 'userEmailAddress')) {
      if ($entry.userEmailAddress -ne '') {
        Invoke-HPPrivateValidateEmail -EmailAddress $entry.userEmailAddress
      }
    }
  }

  $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
  if ($entries.Count -gt 1) {
    $jsonPayload = $entries | ConvertTo-Json -Compress
  }
  $response,$responseContent = Send-HPPrivateKMSRequest -KMSUri $KMSUri -JsonPayload $jsonPayload -AccessToken $accessToken

  if ($response -ne "OK") {
    Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
  }
}

<#
.SYNOPSIS
  Adds one device permissions to HP Sure Admin Key Management Service (KMS)

.DESCRIPTION
  Device permissions allow IT administrators to manage local access of specific devices without having to provision a unique LAK key for each one.
  This command sends an HTTPS request for mapping a device serial number to a user email, or to an AAD group.
  The connection with the KMS server requires the user to authenticate with a valid Microsoft account.
  Existing mappings are modified by the last configuration uploaded.

.PARAMETER SerialNumber
  Specifies the serial number that identifies the device.

.PARAMETER KMSAppName
  Specifies the application name on Azure KMS server that will be used to compose the URI for uploading the key

.PARAMETER KMSUri
  Specifies the complete URI for uploading the permissions (I.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER AADGroup
  Specifies the group name in Azure Active Directory that will have access to the key

.PARAMETER UserEmail
  Specifies the user email in Azure Active Directory that will have access to the key

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - Supported on Windows Power Shell v7.
  - An HP Sure Admin KMS server is required for using this feature.

.EXAMPLE
  Add-HPSureAdminDevicePermissions -SerialNumber "XYZ123" -KMSAppName "MyAppName" -UserEmail "myuser@myappname.onmicrosoft.com"

.EXAMPLE
  Add-HPSureAdminDevicePermissions -SerialNumber "XYZ123" -KMSUri "https://MyKMSURI.azurewebsites.net/" -AADGroup "MyAADGroupName"
#>
function Add-HPSureAdminDevicePermissions {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/add-hpsureadmindevicepermissions")]
  param(
    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "KMSUriAADGroup",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "KMSUriUserEmail",Mandatory = $true,Position = 1)]
    [string]$KMSUri,

    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "KMSAppNameAADGroup",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "KMSAppNameUserEmail",Mandatory = $true,Position = 1)]
    [string]$KMSAppName,

    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "KMSUriAADGroup",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "KMSAppNameAADGroup",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "KMSUriUserEmail",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "KMSAppNameUserEmail",Mandatory = $true,Position = 2)]
    [string]$SerialNumber,

    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "KMSUriAADGroup",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "KMSAppNameAADGroup",Mandatory = $true,Position = 3)]
    [string]$AADGroup,

    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "KMSUriUserEmail",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "KMSAppNameUserEmail",Mandatory = $true,Position = 3)]
    [string]$UserEmail,

    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "KMSUriAADGroup",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "KMSAppNameAADGroup",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "KMSUriUserEmail",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "KMSAppNameUserEmail",Mandatory = $false,Position = 4)]
    [switch]$CacheAccessToken
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($KMSUri -and -not ($KMSUri.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($KMSUri) -or $KMSUri.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if (-not $KMSUri) {
    $KMSUri = "https://$KMSAppName.azurewebsites.net/"
  }

  if (-not $KMSUri.EndsWith('/')) {
    $KMSUri += '/'
  }
  $KMSUri += 'api/devicekeymappings'

  $params = @{
    SerialNumber = $SerialNumber
  }
  if ($UserEmail) {
    Invoke-HPPrivateValidateEmail -EmailAddress $UserEmail
    $params.UserEmail = $UserEmail
  }
  if ($AADGroup) {
    $params.AADGroup = $AADGroup
  }
  [string]$jsonPayload = New-HPPrivateSureAdminDeviceKeyMappingJson @params

  $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
  $response,$responseContent = Send-HPPrivateKMSRequest -Method 'POST' -KMSUri $KMSUri -JsonPayload $jsonPayload -AccessToken $accessToken

  if ($response -ne "OK") {
    Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
  }
}

<#
.SYNOPSIS
  Edits existing device permissions to HP Sure Admin Key Management Service (KMS)

.DESCRIPTION
  Device permissions allow IT administrators to manage local access of specific devices without having to provision a unique LAK key for each one.
  This command sends an HTTPS request for mapping a device serial number to a user email, or to an AAD group.
  The connection with the KMS server requires the user to authenticate with a valid Microsoft account.
  Existing mappings are modified by the last configuration uploaded.

.PARAMETER SerialNumber
  Specifies the serial number that identifies the device.

.PARAMETER KMSAppName
  Specifies the application name on Azure KMS server that will be used to compose the URI for uploading the key

.PARAMETER KMSUri
  Specifies the complete URI for uploading the permissions (I.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER AADGroup
  Specifies the group name in Azure Active Directory that will have access to the key

.PARAMETER UserEmail
  Specifies the user email in Azure Active Directory that will have access to the key

.PARAMETER eTag
  Specifies the eTag informed by the Get-HPSureAdminDevicePermissions command (see examples)

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - Supported on Windows Power Shell v7.
  - An HP Sure Admin KMS server is required for using this feature.

.EXAMPLE
  Edit-HPSureAdminDevicePermissions -SerialNumber "XYZ123" -KMSAppName "MyAppName" -UserEmail "myuser@myappname.onmicrosoft.com" -eTag 'W/"datetime''2021-10-22T15%3A17%3A48.9645833Z''"'

.EXAMPLE
  $entry = Get-HPSureAdminDevicePermissions -KMSAppName 'MyAppName' -SerialNumber 'XYZ123'
  Edit-HPSureAdminDevicePermissions -SerialNumber "XYZ123" -KMSUri "https://MyKMSURI.azurewebsites.net/" -AADGroup "MyAADGroupName" -eTag $entry.eTag
#>
function Edit-HPSureAdminDevicePermissions {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/edit-hpsureadmindevicepermissions")]
  param(
    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "KMSUriAADGroup",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "KMSUriUserEmail",Mandatory = $true,Position = 1)]
    [string]$KMSUri,

    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "KMSAppNameAADGroup",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "KMSAppNameUserEmail",Mandatory = $true,Position = 1)]
    [string]$KMSAppName,

    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "KMSUriAADGroup",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "KMSAppNameAADGroup",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "KMSUriUserEmail",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "KMSAppNameUserEmail",Mandatory = $true,Position = 2)]
    [string]$SerialNumber,

    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "KMSUriAADGroup",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "KMSAppNameAADGroup",Mandatory = $true,Position = 3)]
    [AllowEmptyString()]
    [string]$AADGroup,

    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "KMSUriUserEmail",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "KMSAppNameUserEmail",Mandatory = $true,Position = 3)]
    [AllowEmptyString()]
    [string]$UserEmail,

    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $true,Position = 5)]
    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $true,Position = 5)]
    [Parameter(ParameterSetName = "KMSUriAADGroup",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "KMSAppNameAADGroup",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "KMSUriUserEmail",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "KMSAppNameUserEmail",Mandatory = $true,Position = 4)]
    [string]$eTag,

    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "KMSUriAADGroup",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "KMSAppNameAADGroup",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "KMSUriUserEmail",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "KMSAppNameUserEmail",Mandatory = $false,Position = 5)]
    [switch]$CacheAccessToken
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($KMSUri -and -not ($KMSUri.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($KMSUri) -or $KMSUri.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if (-not $KMSUri) {
    $KMSUri = "https://$KMSAppName.azurewebsites.net/"
  }

  if (-not $KMSUri.EndsWith('/')) {
    $KMSUri += '/'
  }
  $KMSUri += 'api/devicekeymappings'
  $KMSUri = "$KMSUri/$SerialNumber"

  $params = @{
    eTag = $eTag
  }
  if ($PSBoundParameters.ContainsKey('UserEmail')) {
    if ($UserEmail -ne '') {
      Invoke-HPPrivateValidateEmail -EmailAddress $UserEmail
    }
    $params.UserEmail = $UserEmail
  }
  if ($PSBoundParameters.ContainsKey('AADGroup')) {
    $params.AADGroup = $AADGroup
  }
  [string]$jsonPayload = New-HPPrivateSureAdminDeviceKeyMappingJson @params

  $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
  $response,$responseContent = Send-HPPrivateKMSRequest -Method 'PUT' -KMSUri $KMSUri -JsonPayload $jsonPayload -AccessToken $accessToken

  if ($response -ne "OK") {
    Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
  }
}

function Invoke-HPPrivateValidateEmail {
  [CmdletBinding()]
  param(
    [string]$EmailAddress
  )

  try {
    New-Object System.Net.Mail.MailAddress ($EmailAddress) | Out-Null
  }
  catch {
    throw "Invalid user email address: $EmailAddress"
  }

  if (-not ($EmailAddress -match '^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')) {
    throw "Invalid user email address: $EmailAddress"
  }

  return
}

function New-HPPrivateSureAdminDeviceKeyMappingJson {
  [CmdletBinding()]
  param(
    [string]$SerialNumber,
    [string]$UserEmail,
    [string]$AADGroup,
    $ContinuationToken,
    [string]$eTag
  )

  $data = [ordered]@{}

  if ($SerialNumber) {
    $data.deviceId = $SerialNumber
  }

  if ($PSBoundParameters.ContainsKey('UserEmail')) {
    $data.userEmailAddress = $UserEmail
  }

  if ($PSBoundParameters.ContainsKey('AADGroup')) {
    $data.adGroupName = $AADGroup
  }

  if ($eTag) {
    $data.eTag = $eTag
  }

  if ($ContinuationToken) {
    $data.continuationToken = $ContinuationToken
  }

  $json = $data | ConvertTo-Json -Compress
  return $json
}

<#
.SYNOPSIS
  Retrieves the device permissions from the HP Sure Admin Key Management Service (KMS)

.DESCRIPTION
  Device permissions allow IT administrators to manage local access of specific devices without having to provision a unique LAK key for each one.
  This command retrieves from KMS the permissions set for the specified device serial number.
  The connection with the KMS server requires the user to authenticate with a valid Microsoft account.

.PARAMETER SerialNumber
  Specifies the serial number that identifies the device

.PARAMETER KMSAppName
  Specifies the application name on Azure KMS server that will be used to compose the URI for uploading the key

.PARAMETER KMSUri
  Specifies the complete URI for uploading the permissions (I.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - Supported on Windows Power Shell v7.
  - An HP Sure Admin KMS server is required for using this feature.

.EXAMPLE
  Get-HPSureAdminDevicePermissions -SerialNumber "XYZ123" -KMSAppName "MyAppName"

.EXAMPLE
  Get-HPSureAdminDevicePermissions -SerialNumber "XYZ123" -KMSAppName "MyAppName" -CacheAccessToken
#>
function Get-HPSureAdminDevicePermissions {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/get-hpsureadmindevicepermissions")]
  param(
    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 1)]
    [string]$KMSUri,

    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 1)]
    [string]$KMSAppName,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 2)]
    [string]$SerialNumber,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $false,Position = 3)]
    [switch]$CacheAccessToken
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($KMSUri -and -not ($KMSUri.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($KMSUri) -or $KMSUri.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if (-not $KMSUri) {
    $KMSUri = "https://$KMSAppName.azurewebsites.net/"
  }

  if (-not $KMSUri.EndsWith('/')) {
    $KMSUri += '/'
  }
  $KMSUri += 'api/devicekeymappings'
  $KMSUri = "$KMSUri/$SerialNumber"

  $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
  $response,$responseContent = Send-HPPrivateKMSRequest -KMSUri $KMSUri -Method "GET" -AccessToken $accessToken

  if ($response -ne "OK") {
    Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
  }

  $responseContent | ConvertFrom-Json
}

<#
.SYNOPSIS
  Searches device permissions on HP Sure Admin Key Management Service (KMS)

.DESCRIPTION
  Device permissions allow IT administrators to manage local access of specific devices without having to provision a unique LAK key for each one.
  This command retrieves from KMS the permissions set for the specified device serial number.
  The connection with the KMS server requires the user to authenticate with a valid Microsoft account.

.PARAMETER SerialNumber
  Specifies the serial number that identifies the device

.PARAMETER KMSAppName
  Specifies the application name on Azure KMS server that will be used to compose the URI for uploading the key

.PARAMETER KMSUri
  Specifies the complete URI for uploading the permissions (I.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER AADGroup
  Specifies the group name in Azure Active Directory that will have access to the key

.PARAMETER UserEmail
  Specifies the user email in Azure Active Directory that will have access to the key

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - Supported on Windows Power Shell v7.
  - An HP Sure Admin KMS server is required for using this feature.

.EXAMPLE
  Search-HPSureAdminDevicePermissions -SerialNumber "XYZ123" -KMSAppName "MyAppName"

.EXAMPLE
  Search-HPSureAdminDevicePermissions -SerialNumber "XYZ123" -KMSAppName "MyAppName" -CacheAccessToken
#>
function Search-HPSureAdminDevicePermissions {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/search-hpsureadmindevicepermissions")]
  param(
    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "KMSUriAADGroup",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "KMSUriUserEmail",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "KMSUriSerialNumber",Mandatory = $true,Position = 1)]
    [string]$KMSUri,

    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "KMSAppNameAADGroup",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "KMSAppNameUserEmail",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "KMSAppNameSerialNumber",Mandatory = $true,Position = 1)]
    [string]$KMSAppName,

    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "KMSUriAADGroup",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "KMSAppNameAADGroup",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "KMSUriUserEmail",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "KMSAppNameUserEmail",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "KMSUriSerialNumber",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "KMSAppNameSerialNumber",Mandatory = $true,Position = 2)]
    [string]$SerialNumber,

    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "KMSUriAADGroup",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "KMSAppNameAADGroup",Mandatory = $true,Position = 3)]
    [string]$AADGroup,

    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "KMSUriUserEmail",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "KMSAppNameUserEmail",Mandatory = $true,Position = 3)]
    [string]$UserEmail,

    [Parameter(ParameterSetName = "KMSUriBoth",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "KMSAppNameBoth",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "KMSUriAADGroup",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "KMSAppNameAADGroup",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "KMSUriUserEmail",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "KMSAppNameUserEmail",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "KMSUriSerialNumber",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "KMSAppNameSerialNumber",Mandatory = $true,Position = 3)]
    [switch]$CacheAccessToken
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($KMSUri -and -not ($KMSUri.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($KMSUri) -or $KMSUri.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if (-not $KMSUri) {
    $KMSUri = "https://$KMSAppName.azurewebsites.net/"
  }

  if (-not $KMSUri.EndsWith('/')) {
    $KMSUri += '/'
  }
  $KMSUri += 'api/devicekeymappings/search'

  $params = @{}
  if ($SerialNumber) {
    $params.SerialNumber = $SerialNumber
  }
  if ($UserEmail) {
    $params.UserEmail = $UserEmail
  }
  if ($AADGroup) {
    $params.AADGroup = $AADGroup
  }

  do {
    [string]$jsonPayload = New-HPPrivateSureAdminDeviceKeyMappingJson @params
    $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
    $response,$responseContent = Send-HPPrivateKMSRequest -Method 'POST' -KMSUri $KMSUri -JsonPayload $jsonPayload -AccessToken $accessToken

    if ($response -ne "OK") {
      Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
    }

    $response = ($responseContent | ConvertFrom-Json)
    $response.deviceKeyMappings

    $params.continuationToken = $response.continuationToken
  } while ($response.continuationToken)
}

<#
.SYNOPSIS
  Removes a device permission from the HP Sure Admin Key Management Service (KMS)

.DESCRIPTION
  This command removes a device permission from the HP Sure Admin Key Management Service (KMS). Device permissions allow IT administrators to manage local access of specific devices without having to provision a unique LAK key for each device.
  This command removes the permissions set for the device specified via its serial number from KMS.
  The connection with the KMS server requires the user to authenticate with a valid Microsoft account.

.PARAMETER SerialNumber
  Specifies the serial number that identifies the device

.PARAMETER KMSAppName
  Specifies the application name on Azure KMS server that will be used to compose the URI for uploading the key

.PARAMETER KMSUri
  Specifies the complete URI for uploading the permissions (I.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.NOTES
  - Supported on Windows Power Shell v5.
  - Supported on Windows Power Shell v7.
  - An HP Sure Admin KMS server is required for using this feature.

.EXAMPLE
  Remove-HPSureAdminDevicePermissions -SerialNumber "XYZ123" -KMSAppName "MyAppName"

.EXAMPLE
  Remove-HPSureAdminDevicePermissions -SerialNumber "XYZ123" -KMSAppName "MyAppName" -CacheAccessToken
#>
function Remove-HPSureAdminDevicePermissions {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/remove-hpsureadmindevicepermissions")]
  param(
    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 1)]
    [string]$KMSUri,

    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 1)]
    [string]$KMSAppName,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $true,Position = 2)]
    [string]$SerialNumber,

    [Parameter(ParameterSetName = "KMSUri",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "KMSAppName",Mandatory = $false,Position = 3)]
    [switch]$CacheAccessToken
  )

  # only allow https or file paths with or without file:// URL prefix
  if ($KMSUri -and -not ($KMSUri.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($KMSUri) -or $KMSUri.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if (-not $KMSUri) {
    $KMSUri = "https://$KMSAppName.azurewebsites.net/"
  }

  if (-not $KMSUri.EndsWith('/')) {
    $KMSUri += '/'
  }
  $KMSUri += 'api/devicekeymappings'
  $KMSUri = "$KMSUri/$SerialNumber"

  $accessToken = Get-HPPrivateSureAdminKMSAccessToken -CacheAccessToken:$CacheAccessToken
  $response,$responseContent = Send-HPPrivateKMSRequest -KMSUri $KMSUri -Method "DELETE" -AccessToken $accessToken

  if ($response -ne "OK") {
    Invoke-HPPrivateKMSErrorHandle -ApiResponseContent $responseContent -Status $response
  }
}

function New-HPPrivateQRCode {
  param(
    [string]$Data,
    [System.IO.FileInfo]$OutputFile,
    [ValidateSet('Jpeg','Bmp','Png','Svg')]
    [string]$Format = "Jpeg",
    [ValidateSet('None','Text','Default')]
    [string]$ViewAs = "Default"
  )

  [void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

  $QRCode = [System.Byte[]]::CreateInstance([System.Byte],3918)
  switch (Test-OSBitness) {
    32 { $result = [DfmNativeQRCode]::create_qrcode32($data,$QRCode) }
    64 { $result = [DfmNativeQRCode]::create_qrcode64($data,$QRCode) }
  }

  $width = $height = $QRCode[0]
  $RGBBuffer = Convert-HPPrivateQRCodeToRGBBuffer -QRCode $QRCode

  [System.Drawing.Image]$img = New-HPPrivateImageFromRGBBuffer -RGBBuffer $RGBBuffer -Width $width -Height $height
  [System.Drawing.Image]$newImg = New-HPPrivateImageScale -Image $img -Width 250 -Height 250 -Border 10
  $img.Dispose()

  $path = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputFile)
  if ($ViewAs -eq "Default" -and $OutputFile -eq $null)
  {
    $temp = [string][math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s")) + "." + $Format
    $path = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($temp)
  }

  if ($OutputFile -or $ViewAs -eq "Default") {
    if ($Format -eq "Svg") {
      Invoke-HPPrivateWriteQRCodeToSvgFile -QRCode $QRCode -Path $path
    }
    else {
      $newImg.Save($path,[System.Drawing.Imaging.ImageFormat]::$Format)
    }
  }

  if ($ViewAs) {
    if ($ViewAs -eq "Text") {
      Invoke-HPPrivateWriteSmallQRCodeToConsole -QRCode $QRCode
    }
    elseif ($ViewAs -eq "Default") {
      Start-Process $path
      Write-Host "The file $path contains sensitive information; please delete it once you have scanned with HP Sure Admin phone app"
      if ($OutputFile -eq $null) {
        Start-Sleep -Seconds 5
        Remove-Item -Path $path -ErrorAction Ignore -Force
        Write-Host "The file was deleted; please specify an -OutputFile to keep it"
      }
    }
  }

  $newImg.Dispose()
}

function Get-HPPrivateQRCodeModule {
  param(
    [byte[]]$QRCode,
    [int]$X,
    [int]$Y
  )

  $size = $QRCode[0]
  if (0 -le $X -and $X -lt $size -and 0 -le $Y -and $Y -lt $size) {
    $index = $Y * $size + $X;
    $k = $QRCode[(($index -shr 3) + 1)]
    $i = $index -band 7
    if ((($k -shr $i) -band 1) -ne 0) {
      return $true
    }
  }

  return $false
}

function Convert-HPPrivateQRCodeToRGBBuffer {
  param(
    [byte[]]$QRCode
  )

  $len = $QRCode[0]
  $channels = 3
  $size = $len * $len * $channels #RGB color channels
  [byte[]]$RGBBuffer = [byte[]]::CreateInstance([byte],$size)
  for ($y = 0; $y -lt $len; $y++) {
    for ($x = 0; $x -lt $len; $x++) {
      $index = (($x * $len) + $y) * $channels
      if ((Get-HPPrivateQRCodeModule -QRCode $QRCode -X $x -Y $y) -eq $false) {
        $RGBBuffer[$index + 0] = 0xFF
        $RGBBuffer[$index + 1] = 0xFF
        $RGBBuffer[$index + 2] = 0xFF
      }
    }
  }

  return $RGBBuffer
}

function Invoke-HPPrivateWriteSmallQRCodeToConsole {
  param(
    [byte[]]$QRCode
  )

  $white = ([char]0x2588)
  $black = ' '
  $whiteBlack = ([char]0x2580)
  $blackWhite = ([char]0x2584)

  $size = $QRCode[0]
  Write-Host "`n"

  Write-Host -NoNewline "  "
  for ($x = 0; $x -lt $size + 2; $x++) {
    Write-Host -NoNewline $blackWhite
  }
  Write-Host ""

  for ($y = 0; $y -lt $size; $y += 2) {
    Write-Host -NoNewline "  "
    for ($x = -1; $x -lt $size + 1; $x++) {
      if (-not (Get-HPPrivateQRCodeModule -QRCode $QRCode -X $x -Y $y) -and
        -not (Get-HPPrivateQRCodeModule -QRCode $QRCode -X $x -Y ($y + 1))) {
        Write-Host -NoNewline $white
      }
      elseif (-not (Get-HPPrivateQRCodeModule -QRCode $QRCode -X $x -Y $y) -and
        (Get-HPPrivateQRCodeModule -QRCode $QRCode -X $x -Y ($y + 1))) {
        Write-Host -NoNewline $whiteBlack
      }
      elseif ((Get-HPPrivateQRCodeModule -QRCode $QRCode -X $x -Y $y) -and
        -not (Get-HPPrivateQRCodeModule -QRCode $QRCode -X $x -Y ($y + 1))) {
        Write-Host -NoNewline $blackWhite
      }
      else {
        Write-Host -NoNewline $black
      }
    }
    Write-Host ""
  }
  Write-Host "`n"
}

function Invoke-HPPrivateWriteQRCodeToSvgFile {
  param(
    [byte[]]$QRCode,
    [string]$Path
  )

  $border = 2
  $size = $QRCode[0]
  $content = ('<?xml version="1.0" encoding="UTF-8"?>' +
    '<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">' +
    '<svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="-' + $border + ' -' + $border + ' ' + ($size + $border * 2) + ' ' + ($size + $border * 2) + '" stroke="none">' +
    '<rect width="90%" height="90%" fill="#FFFFFF" dominant-baseline="central" />' +
    '<path d="')

  for ($y = 0; $y -lt $size; $y++) {
    for ($x = 0; $x -lt $size; $x++) {
      if ((Get-HPPrivateQRCodeModule -QRCode $QRCode -X $x -Y $y) -eq $true) {
        if ($x -ne 0 -or $y -ne 0) {
          $content += ' '
        }
        $content += 'M' + $x + ',' + $y + 'h1v1h-1z'
      }
    }
  }
  $content += ('" fill="#000000" />' +
    '</svg>')

  $content | Out-File -FilePath $Path -Encoding utf8
}

function New-HPPrivateImageScale {
  param(
    [System.Drawing.Image]$Image,
    [int]$Width,
    [int]$Height,
    [int]$Border = 10
  )

  $newImage = New-Object System.Drawing.Bitmap (($Width + $border * 2),($Height + $border * 2),[System.Drawing.Imaging.PixelFormat]::Format24bppRgb)
  $graphics = [System.Drawing.Graphics]::FromImage($newImage)
  $graphics.Clear([System.Drawing.Color]::White)
  $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::NearestNeighbor
  $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::Half
  $graphics.DrawImage($Image,$border,$border,$Width,$Height)
  $graphics.Flush()
  $graphics.Dispose()

  return $newImage
}

function New-HPPrivateImageFromRGBBuffer {
  param(
    [byte[]]$RGBBuffer,
    [int]$Width,
    [int]$Height,
    [int]$Border = 10
  )

  $img = New-Object System.Drawing.Bitmap ($Width,$Height,[System.Drawing.Imaging.PixelFormat]::Format24bppRgb)
  $rect = New-Object System.Drawing.Rectangle (0,0,$img.Width,$img.Height)
  $bmpData = $img.LockBits($rect,[System.Drawing.Imaging.ImageLockMode]::ReadWrite,$img.PixelFormat)
  $bufferStride = $img.Width * 3
  $targetStride = $bmpData.Stride
  $imgPtr = $bmpData.Scan0.ToInt64()

  for ($y = 0; $y -lt $img.Height; $y++) {
    [System.Runtime.InteropServices.Marshal]::Copy($RGBBuffer,$y * $bufferStride,[IntPtr]($imgPtr + $y * $targetStride),$bufferStride)
  }
  $img.UnlockBits($bmpData)

  return $img
}

function Get-HPPrivateConsoleFontSize {
  param()

  $width = 0
  switch (Test-OSBitness) {
    32 { $width = [DfmNativeQRCode]::get_console_font_width32() }
    64 { $width = [DfmNativeQRCode]::get_console_font_width64() }
  }

  $height = 0
  switch (Test-OSBitness) {
    32 { $height = [DfmNativeQRCode]::get_console_font_height32() }
    64 { $height = [DfmNativeQRCode]::get_console_font_height64() }
  }

  return $width,$height
}

function Get-HPPrivateScreenScale {
  param()

  $result = 0
  switch (Test-OSBitness) {
    32 { $result = [DfmNativeQRCode]::get_screen_scale32() }
    64 { $result = [DfmNativeQRCode]::get_screen_scale64() }
  }

  return $result
}

# SIG # Begin signature block
