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

# CMSL is normally installed in C:\Program Files\WindowsPowerShell\Modules
# but if installed via PSGallery and via PS7, it is installed in a different location
if (Test-Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll") {
  Add-Type -Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll"
}
else{
  Add-Type -Path "$PSScriptRoot\..\..\HP.Private\1.8.2\HP.CMSLHelper.dll"
}

[Flags()] enum DeprovisioningTarget{
  AgentProvisioning = 1
  OSImageProvisioning = 2
  ConfigurationData = 4
  TriggerRecoveryData = 8
  ScheduleRecoveryData = 16
}


# Converts a BIOS value to a boolean
function ConvertValue {
  param($value)
  if ($value -eq "Enable" -or $value -eq "Yes") { return $true }
  $false
}


<#
.SYNOPSIS
  Retrieves the current state of the HP Sure Recover feature

.DESCRIPTION
  This command retrieves the current state of the HP Sure Recover feature.

  Refer to the New-HPSureRecoverConfigurationPayload command for more information on how to configure HP Sure Recover.

.PARAMETER All
  If specified, the output includes the OS Recovery Image and the OS Recovery Agent configuration.

.NOTES
  - Requires HP BIOS with HP Sure Recover support.
  - This command requires elevated privileges.

.LINK 
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.LINK 
  [Blog post: Provisioning and Configuring HP Sure Recover with HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/provisioning-and-configuring-hp-sure-recover-hp-client-management-script-library)

.EXAMPLE
  Get-HPSureRecoverState
#>
function Get-HPSureRecoverState
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPSureRecoverState")]
  param([switch]$All)

  $mi_result = 0
  $data = New-Object -TypeName surerecover_state_t

  if ((Test-OSBitness) -eq 32){
    $result = [DfmNativeSureRecover]::get_surerecover_state32([ref]$data,[ref]$mi_result)
  }
  else {
    $result = [DfmNativeSureRecover]::get_surerecover_state64([ref]$data,[ref]$mi_result)
  }

  # $result is either E_DFM_SUCCESS = 0 or E_DFM_FAILED_WITH_EXTENDED_ERROR = 0x80000711
  # When $result is 0, $mi_result is also expected to be 0. Streamline the process by just checking $mi_result
  Test-HPPrivateCustomResult -result 0x80000711 -mi_result $mi_result -Category 0x05 -Verbose:$VerbosePreference

  $fixed_version = "$($data.subsystem_version[0]).$($data.subsystem_version[1])"
  if ($fixed_version -eq "0.0") {
    Write-Verbose "Patched SureRecover version 0.0 to 1.0"
    $fixed_version = "1.0"
  }
  $SchedulerIsDisabled = ($data.schedule.window_size -eq 0)

  $RecoveryTimeBetweenRetries = ([uint32]$data.os_flags -shr 8) -band 0x0f
  $RecoveryNumberOfRetries = ([uint32]$data.os_flags -shr 12) -band 0x07
  if ($RecoveryNumberOfRetries -eq 0)
  {
    $RecoveryNumberOfRetries = "Infinite"
  }
  $imageFailoverIsConfigured = [bool]$data.image_failover

  $obj = [ordered]@{
    Version = $fixed_version
    Nonce = $data.Nonce
    BIOSFlags = ($data.os_flags -band 0xff)
    ImageIsProvisioned = (($data.flags -band 2) -ne 0)
    AgentFlags = ($data.re_flags -band 0xffff)
    AgentIsProvisioned = (($data.flags -band 1) -ne 0)
    RecoveryTimeBetweenRetries = $RecoveryTimeBetweenRetries
    RecoveryNumberOfRetries = $RecoveryNumberOfRetries
    Schedule = New-Object -TypeName PSObject -Property @{
      DayOfWeek = $data.schedule.day_of_week
      hour = [uint32]$data.schedule.hour
      minute = [uint32]$data.schedule.minute
      WindowSize = [uint32]$data.schedule.window_size
    }
    ConfigurationDataIsProvisioned = (($data.flags -band 4) -ne 0)
    TriggerRecoveryDataIsProvisioned = (($data.flags -band 8) -ne 0)
    ScheduleRecoveryDataIsProvisioned = (($data.flags -band 16) -ne 0)
    SchedulerIsDisabled = $SchedulerIsDisabled
    ImageFailoverIsConfigured = $imageFailoverIsConfigured
  }

  if ($all.IsPresent)
  {
    $ia = [ordered]@{
      Url = (Get-HPBIOSSettingValue -Name "OS Recovery Image URL")
      Username = (Get-HPBIOSSettingValue -Name "OS Recovery Image Username")
      #PublicKey = (Get-HPBiosSettingValue -name "OS Recovery Image Public Key")
      ProvisioningVersion = (Get-HPBIOSSettingValue -Name "OS Recovery Image Provisioning Version")
    }

    $aa = [ordered]@{
      Url = (Get-HPBIOSSettingValue -Name "OS Recovery Agent URL")
      Username = (Get-HPBIOSSettingValue -Name "OS Recovery Agent Username")
      #PublicKey = (Get-HPBiosSettingValue -name "OS Recovery Agent Public Key")
      ProvisioningVersion = (Get-HPBIOSSettingValue -Name "OS Recovery Agent Provisioning Version")
    }

    $Image = New-Object -TypeName PSObject -Property $ia
    $Agent = New-Object -TypeName PSObject -Property $aa

    $obj.Add("Image",$Image)
    $osFailover = New-Object System.Collections.Generic.List[PSCustomObject]
    if ($imageFailoverIsConfigured) {
      try {
        $osFailoverIndex = Get-HPSureRecoverFailoverConfiguration -Image 'os'
        $osFailover.Add($osFailoverIndex)
      }
      catch {
        Write-Warning "Error reading OS Failover configuration $($Index): $($_.Exception.Message)"
      }
      $obj.Add("ImageFailover",$osFailover)
    }

    $obj.Add("Agent",$Agent)
  }
  return New-Object -TypeName PSCustomObject -Property $obj
}

<#
.SYNOPSIS
  Retrieves the current HP Sure Recover failover configuration

.DESCRIPTION
  This command retrieves the current configuration of the HP Sure Recover failover feature.

.PARAMETER Image
  Specifies whether this command will create a configuration payload for a Recovery Agent image or a Recovery OS image. However, only the value 'os' is supported for now.

.NOTES
  - Requires HP BIOS with HP Sure Recover and Failover support.
  - This command requires elevated privileges.

.EXAMPLE
  Get-HPSureRecoverFailoverConfiguration -Image os
#>
function Get-HPSureRecoverFailoverConfiguration
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPSureRecoverFailoverConfiguration")]
  param(
    [ValidateSet("os")]
    [Parameter(Mandatory = $false,Position = 0)]
    [string]$Image = 'os'
  )

  $mi_result = 0
  $data = New-Object -TypeName surerecover_failover_configuration_t
  $index = 1

  try {
    if((Test-OSBitness) -eq 32){
      $result = [DfmNativeSureRecover]::get_surerecover_failover_configuration32([bool]$False,[int]$index,[ref]$data,[ref]$mi_result)
    }
    else {
      $result = [DfmNativeSureRecover]::get_surerecover_failover_configuration64([bool]$False,[int]$index,[ref]$data,[ref]$mi_result)
    }

    Test-HPPrivateCustomResult -result $result -mi_result $mi_result -Category 0x05 -Verbose:$VerbosePreference
  }
  catch {
    Write-Error "Failover is not configured properly. Error: $($_.Exception.Message)"
  }

  return [PSCustomObject]@{
    Index = $Index
    Version = $data.version
    Url = $data.url
    Username = $data.username
  }
}

<#
.SYNOPSIS
  Retrieves information about the HP Sure Recover embedded reimaging device

.DESCRIPTION
  This command retrieves information about the embedded reimaging device for HP Sure Recover.

.NOTES
  The embedded reimaging device is an optional hardware feature, and if not present, the field Embedded Reimaging Device is false.

.NOTES
  - Requires HP BIOS with HP Sure Recover support
  - Requires Embedded Reimaging device hardware option
  - This command requires elevated privileges.

.LINK
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.LINK
  [Blog post: Provisioning and Configuring HP Sure Recover with HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/provisioning-and-configuring-hp-sure-recover-hp-client-management-script-library)

.EXAMPLE
  Get-HPSureRecoverReimagingDeviceDetails
#>
function Get-HPSureRecoverReimagingDeviceDetails
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPSureRecoverReimagingDeviceDetails")]
  param()
  $result = @{}

  try {
    [string]$ImageVersion = Get-HPBIOSSettingValue -Name "OS Recovery Image Version"
    $result.Add("ImageVersion",$ImageVersion)
  }
  catch {}

  try {
    [string]$DriverVersion = Get-HPBIOSSettingValue -Name "OS Recovery Driver Version"
    $result.Add("DriverVersion",$DriverVersion)
  }
  catch {}

  try{
    # eMMC module is present if Embedded Storage for Recovery BIOS setting exists
    [string]$OSRsize = Get-HPBIOSSettingValue -Name "Embedded Storage for Recovery"
    $result.Add("EmbeddedReimagingDevice", $true)
  }
  catch{
    $result.Add("EmbeddedReimagingDevice", $false)
  }

  $result
}

<#
.SYNOPSIS
  Creates a payload to configure the HP Sure Recover OS or Recovery image

.DESCRIPTION
  This command creates a payload to configure a custom HP Sure Recover OS or Recovery image. There are three signing options to choose from:
  - Signing Key File (and Password) using -SigningKeyFile and -SigningKeyPassword parameters 
  - Signing Key Certificate using -SigningKeyCertificate parameter
  - Remote Signing using -RemoteSigningServiceKeyID and -RemoteSigningServiceURL parameters 

  Please note that using a Key File with Password in PFX format is recommended over using an X509 Certificate object because a private key in a certificate is not password protected.

  This command writes the created payload to the pipeline or to the file specified in the OutputFile parameter.
  This payload can then be passed to the Set-HPSecurePlatformPayload command.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Set-HPSecurePlatformPayload. Creating the payload and passing it to the Set-HPSecurePlatformPayload command via the pipeline is not a recommended production pattern.

.PARAMETER Image
  Specifies whether this command will create a configuration payload for a Recovery Agent image or a Recovery OS image. The value must be either 'agent' or 'os'.

.PARAMETER SigningKeyFile
  Specifies the path to the Secure Platform Management signing key as a PFX file. If the PFX file is protected by a password (recommended), the SigningKeyPassword parameter should also be provided.

.PARAMETER SigningKeyPassword
  Specifies the Secure Platform Management signing key file password, if required

.PARAMETER SigningKeyCertificate
  Specifies the Secure Platform Management signing key certificate as an X509Certificate object

.PARAMETER ImageCertificateFile
  Specifies the path to the image signing certificate as a PFX file. If the PFX file is protected by a password (recommended), the ImageCertificatePassword parameter should also be provided. Depending on the Image switch, this will be either the signing key file for the Agent or the OS image.
  ImageCertificateFile and PublicKeyFile are mutually exclusive.

.PARAMETER ImageCertificatePassword
  Specifies the image signing key file password, if required

.PARAMETER ImageCertificate
  Specifies the image signing key certificate as an X509Certificate object. Depending on the Image parameter, this value will be either the signing key certificate for the Agent or the OS image.

.PARAMETER PublicKeyFile
  Specifies the image signing key as the path to a base64-encoded RSA key (a PEM file).
  ImageCertificateFile and PublicKeyFile are mutually exclusive.

.PARAMETER PublicKey
  Specifies the image signing key as an array of bytes, including modulus and exponent.
  This option is currently reserved for internal use.

.PARAMETER Nonce
  Specifies a Nonce. If nonce is specified, the Secure Platform Management subsystem will only accept commands with a nonce greater or equal to the last nonce sent. This approach helps to prevent replay attacks. If not specified, the nonce is inferred from the current local time. The current local time as the nonce works in most cases. However, this approach has a resolution of seconds, so when performing parallel operations or a high volume of operations, it is possible for the same counter to be interpreted for more than one command. In these cases, the caller should use its own nonce derivation and provide it through this parameter.

.PARAMETER Version
  Specifies the operation version. Each new configuration payload must increment the last operation payload version, as available in the public WMI setting 'OS Recovery Image Provisioning Version'. If this parameter is not provided, this command will read the public wmi setting and increment it automatically.

.PARAMETER Username
  Specifies the username for accessing the url specified in the Url parameter, if any.

.PARAMETER Password
  Specifies the password for accessing the url specified in the Url parameter, if any.

.PARAMETER Url
  Specifies the url from where to download the image. If not specified, the default HP.COM location will be used. 

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
  - Requires HP BIOS with HP Sure Recover support 

.LINK 
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.LINK
  [Blog post: Provisioning and Configuring HP Sure Recover with HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/provisioning-and-configuring-hp-sure-recover-hp-client-management-script-library)  

.EXAMPLE
   $payload = New-HPSureRecoverImageConfigurationPayload -SigningKeyFile "$path\signing_key.pfx" -Image OS -ImageKeyFile  `
                 "$path\os.pfx" -username my_http_user -password `s3cr3t`  -url "http://my.company.com"
   ...
   $payload | Set-HPSecurePlatformPayload
#>
function New-HPSureRecoverImageConfigurationPayload
{
  [CmdletBinding(DefaultParameterSetName = "SKFileCert_OSFilePem",HelpUri = "https://developers.hp.com/hp-client-management/doc/New-HPSureRecoverImageConfigurationPayload")]
  param(
    [Parameter(ParameterSetName = "SKFileCert_OSBytesCert",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesCert",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "SKFileCert_OSFileCert",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFileCert",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "SKFileCert_OSBytesPem",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesPem",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "SKFileCert_OSFilePem",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFilePem",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesCert",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFileCert",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesPem",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFilePem",Mandatory = $true,Position = 0)]
    [ValidateSet("os","agent")]
    [string]$Image,

    [Parameter(ParameterSetName = "SKFileCert_OSBytesCert",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "SKFileCert_OSFileCert",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "SKFileCert_OSBytesPem",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "SKFileCert_OSFilePem",Mandatory = $true,Position = 1)]
    [System.IO.FileInfo]$SigningKeyFile,

    [Parameter(ParameterSetName = "SKFileCert_OSBytesCert",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "SKFileCert_OSFileCert",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "SKFileCert_OSBytesPem",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "SKFileCert_OSFilePem",Mandatory = $false,Position = 2)]
    [string]$SigningKeyPassword,

    [Parameter(ParameterSetName = "SKBytesCert_OSBytesCert",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFileCert",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesPem",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFilePem",Mandatory = $true,Position = 3)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKeyCertificate,


    [Parameter(ParameterSetName = "SKFileCert_OSFileCert",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFileCert",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFileCert",Mandatory = $true,Position = 1)]
    [Alias("ImageKeyFile")]
    [System.IO.FileInfo]$ImageCertificateFile,

    [Parameter(ParameterSetName = "SKFileCert_OSFileCert",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFileCert",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFileCert",Mandatory = $false,Position = 2)]
    [Alias("ImageKeyPassword")]
    [string]$ImageCertificatePassword,

    [Parameter(ParameterSetName = "SKFileCert_OSBytesCert",Mandatory = $true,Position = 6)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesCert",Mandatory = $true,Position = 6)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesCert",Mandatory = $true,Position = 1)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$ImageCertificate,


    [Parameter(ParameterSetName = "SKFileCert_OSFilePem",Mandatory = $true,Position = 7)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFilePem",Mandatory = $true,Position = 7)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFilePem",Mandatory = $true,Position = 1)]
    [System.IO.FileInfo]$PublicKeyFile,


    [Parameter(ParameterSetName = "SKFileCert_OSBytesPem",Mandatory = $true,Position = 8)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesPem",Mandatory = $true,Position = 8)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesPem",Mandatory = $true,Position = 1)]
    [byte[]]$PublicKey,


    [Parameter(ParameterSetName = "SKFileCert_OSBytesCert",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesCert",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "SKFileCert_OSFileCert",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFileCert",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "SKFileCert_OSBytesPem",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesPem",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "SKFileCert_OSFilePem",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFilePem",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesCert",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFileCert",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesPem",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFilePem",Mandatory = $false,Position = 2)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),


    [Parameter(ParameterSetName = "SKFileCert_OSBytesCert",Mandatory = $false,Position = 10)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesCert",Mandatory = $false,Position = 10)]
    [Parameter(ParameterSetName = "SKFileCert_OSFileCert",Mandatory = $false,Position = 10)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFileCert",Mandatory = $false,Position = 10)]
    [Parameter(ParameterSetName = "SKFileCert_OSBytesPem",Mandatory = $false,Position = 10)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesPem",Mandatory = $false,Position = 10)]
    [Parameter(ParameterSetName = "SKFileCert_OSFilePem",Mandatory = $false,Position = 10)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFilePem",Mandatory = $false,Position = 10)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesCert",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFileCert",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesPem",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFilePem",Mandatory = $false,Position = 3)]
    [uint16]$Version,

    [Parameter(ParameterSetName = "SKFileCert_OSBytesCert",Mandatory = $false,Position = 11)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesCert",Mandatory = $false,Position = 11)]
    [Parameter(ParameterSetName = "SKFileCert_OSFileCert",Mandatory = $false,Position = 11)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFileCert",Mandatory = $false,Position = 11)]
    [Parameter(ParameterSetName = "SKFileCert_OSBytesPem",Mandatory = $false,Position = 11)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesPem",Mandatory = $false,Position = 11)]
    [Parameter(ParameterSetName = "SKFileCert_OSFilePem",Mandatory = $false,Position = 11)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFilePem",Mandatory = $false,Position = 11)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesCert",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFileCert",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesPem",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFilePem",Mandatory = $false,Position = 4)]
    [string]$Username,

    [Parameter(ParameterSetName = "SKFileCert_OSBytesCert",Mandatory = $false,Position = 12)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesCert",Mandatory = $false,Position = 12)]
    [Parameter(ParameterSetName = "SKFileCert_OSFileCert",Mandatory = $false,Position = 12)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFileCert",Mandatory = $false,Position = 12)]
    [Parameter(ParameterSetName = "SKFileCert_OSBytesPem",Mandatory = $false,Position = 12)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesPem",Mandatory = $false,Position = 12)]
    [Parameter(ParameterSetName = "SKFileCert_OSFilePem",Mandatory = $false,Position = 12)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFilePem",Mandatory = $false,Position = 12)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesCert",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFileCert",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesPem",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFilePem",Mandatory = $false,Position = 5)]
    [string]$Password,

    [Parameter(ParameterSetName = "SKFileCert_OSBytesCert",Mandatory = $false,Position = 13)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesCert",Mandatory = $false,Position = 13)]
    [Parameter(ParameterSetName = "SKFileCert_OSFileCert",Mandatory = $false,Position = 13)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFileCert",Mandatory = $false,Position = 13)]
    [Parameter(ParameterSetName = "SKFileCert_OSBytesPem",Mandatory = $false,Position = 13)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesPem",Mandatory = $false,Position = 13)]
    [Parameter(ParameterSetName = "SKFileCert_OSFilePem",Mandatory = $false,Position = 13)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFilePem",Mandatory = $false,Position = 13)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesCert",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFileCert",Mandatory = $false,Position = 7)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesPem",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFilePem",Mandatory = $false,Position = 6)]
    [uri]$Url = "",

    [Parameter(ParameterSetName = "SKFileCert_OSBytesCert",Mandatory = $false,Position = 14)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesCert",Mandatory = $false,Position = 14)]
    [Parameter(ParameterSetName = "SKFileCert_OSFileCert",Mandatory = $false,Position = 14)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFileCert",Mandatory = $false,Position = 14)]
    [Parameter(ParameterSetName = "SKFileCert_OSBytesPem",Mandatory = $false,Position = 14)]
    [Parameter(ParameterSetName = "SKBytesCert_OSBytesPem",Mandatory = $false,Position = 14)]
    [Parameter(ParameterSetName = "SKFileCert_OSFilePem",Mandatory = $false,Position = 14)]
    [Parameter(ParameterSetName = "SKBytesCert_OSFilePem",Mandatory = $false,Position = 14)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesCert",Mandatory = $false,Position = 7)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFileCert",Mandatory = $false,Position = 8)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesPem",Mandatory = $false,Position = 7)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFilePem",Mandatory = $false,Position = 7)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "RemoteSigning_OSBytesCert",Mandatory = $true,Position = 8)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFileCert",Mandatory = $true,Position = 9)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesPem",Mandatory = $true,Position = 8)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFilePem",Mandatory = $true,Position = 8)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning_OSBytesCert",Mandatory = $true,Position = 9)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFileCert",Mandatory = $true,Position = 10)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesPem",Mandatory = $true,Position = 9)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFilePem",Mandatory = $true,Position = 9)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning_OSBytesCert",Mandatory = $false,Position = 10)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFileCert",Mandatory = $false,Position = 11)]
    [Parameter(ParameterSetName = "RemoteSigning_OSBytesPem",Mandatory = $false,Position = 10)]
    [Parameter(ParameterSetName = "RemoteSigning_OSFilePem",Mandatory = $false,Position = 10)]
    [switch]$CacheAccessToken
  )

  Write-Verbose "Creating SureRecover Image provisioning payload"


  if ($PublicKeyFile -or $PublicKey) {
    $osk = Get-HPPrivatePublicKeyCoalesce -File $PublicKeyFile -key $PublicKey -Verbose:$VerbosePreference
  }
  else {
    $osk = Get-HPPrivateX509CertCoalesce -File $ImageCertificateFile -password $ImageCertificatePassword -cert $ImageCertificate -Verbose:$VerbosePreference
  }

  $OKBytes = $osk.Modulus

  $opaque = New-Object opaque4096_t
  $opaqueLength = 4096
  $mi_result = 0

  if (-not $Version) {
    if ($image -eq "os")
    {
      $Version = [uint16](Get-HPBIOSSettingValue "OS Recovery Image Provisioning Version") + 1
    }
    else {
      $Version = [uint16](Get-HPBIOSSettingValue "OS Recovery Agent Provisioning Version") + 1
    }
    Write-Verbose "New version number is $version"
  }

  if((Test-OSBitness) -eq 32){
    $result = [DfmNativeSureRecover]::get_surerecover_provisioning_opaque32($Nonce, $Version, $OKBytes,$($OKBytes.Count),$Username, $Password, $($Url.ToString()), [ref]$opaque, [ref]$opaqueLength,  [ref]$mi_result)
  }
  else {
    $result = [DfmNativeSureRecover]::get_surerecover_provisioning_opaque64($Nonce, $Version, $OKBytes,$($OKBytes.Count),$Username, $Password, $($Url.ToString()), [ref]$opaque, [ref]$opaqueLength,  [ref]$mi_result)
  }

  Test-HPPrivateCustomResult -result $result -mi_result $mi_result -Category 0x05

  $payload = $opaque.raw[0..($opaqueLength - 1)]

  if ($PSCmdlet.ParameterSetName -eq "RemoteSigning_OSBytesCert" -or $PSCmdlet.ParameterSetName -eq "RemoteSigning_OSFileCert" -or $PSCmdlet.ParameterSetName -eq "RemoteSigning_OSBytesPem" -or $PSCmdlet.ParameterSetName -eq "RemoteSigning_OSFilePem") {
    $sig = Invoke-HPPrivateRemoteSignData -Data $payload -CertificateId $RemoteSigningServiceKeyID -KMSUri $RemoteSigningServiceURL -CacheAccessToken:$CacheAccessToken -Verbose:$VerbosePreference
  }
  else {
    $sk = Get-HPPrivateX509CertCoalesce -File $SigningKeyFile -password $SigningKeyPassword -cert $SigningKeycertificate -Verbose:$VerbosePreference
    $sig = Invoke-HPPrivateSignData -Data $payload -Certificate $sk.Full -Verbose:$VerbosePreference
  }

  [byte[]]$out = $sig + $payload

  Write-Verbose "Building output document"
  $output = New-Object -TypeName PortableFileFormat
  $output.Data = $out

  if ($Image -eq "os") {
    $output.purpose = "hp:surerecover:provision:os_image"
  }
  else {
    $output.purpose = "hp:surerecover:provision:recovery_image"
  }

  Write-Verbose "Provisioning version will be $version"
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



<#
.SYNOPSIS
  Creates a payload to deprovision HP Sure Recover

.DESCRIPTION
  This command creates a payload to deprovision the HP Sure Recover feature. There are three signing options to choose from:
  - Signing Key File (and Password) using -SigningKeyFile and -SigningKeyPassword parameters 
  - Signing Key Certificate using -SigningKeyCertificate parameter
  - Remote Signing using -RemoteSigningServiceKeyID and -RemoteSigningServiceURL parameters 

  Please note that using a Key File with Password in PFX format is recommended over using an X509 Certificate object because a private key in a certificate is not password protected.

  This command writes the created payload to the pipeline or to the file specified in the OutputFile parameter. This payload can then be passed to the Set-HPSecurePlatformPayload command.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Set-HPSecurePlatformPayload command. Creating the payload and passing it to the Set-HPSecurePlatformPayload command via the pipeline is not a recommended production pattern.

.PARAMETER SigningKeyFile
  Specifies the path to the Secure Platform Management signing key as a PFX file. If the PFX file is protected by a password (recommended), the SigningKeyPassword parameter should also be provided.

.PARAMETER SigningKeyPassword
  Specifies the Secure Platform Management signing key file password, if required.

.PARAMETER SigningKeyCertificate
  Specifies the Secure Platform Management signing key certificate as an X509Certificate object. 

.PARAMETER Nonce
  Specifies a Nonce. If nonce is specified, the Secure Platform Management subsystem will only accept commands with a nonce greater or equal to the last nonce sent. This approach helps to prevent replay attacks. If not specified, the nonce is inferred from the current local time. The current local time as the nonce works in most cases. However, this approach has a resolution of seconds, so when performing parallel operations or a high volume of operations, it is possible for the same counter to be interpreted for more than one command. In these cases, the caller should use its own nonce derivation and provide it through this parameter.

.PARAMETER RemoveOnly
  This parameter allows deprovisioning only specific parts of the Sure Recover subsystem. If not specified, the entire SureRecover is deprovisoned. Possible values are one or more of the following:

  - AgentProvisioning   - remove the Agent provisioning
  - OSImageProvisioning - remove the OS Image provisioning
  - ConfigurationData - remove HP SureRecover configuration data 
  - TriggerRecoveryData - remove the HP Sure Recover trigger definition
  - ScheduleRecoveryData - remove the HP Sure Recover schedule definition

.PARAMETER OutputFile
    Specifies the file to write output to instead of writing the output to the pipelineing output to the specified file, instead of writing it to the pipeline.

.PARAMETER RemoteSigningServiceKeyID
  Specifies the Signing Key ID to be used

.PARAMETER RemoteSigningServiceURL
  Specifies the (Key Management Service) KMS server URL (I.e.: https://<KMSAppName>.azurewebsites.net/)

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.LINK 
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.LINK
  [Blog post: Provisioning and Configuring HP Sure Recover with HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/provisioning-and-configuring-hp-sure-recover-hp-client-management-script-library)

.NOTES
  - Requires HP BIOS with HP Sure Recover support

.EXAMPLE
  New-HPSureRecoverDeprovisionPayload -SigningKeyFile sk.pfx
#>
function New-HPSureRecoverDeprovisionPayload
{
  [CmdletBinding(DefaultParameterSetName = "SF",HelpUri = "https://developers.hp.com/hp-client-management/doc/New-HPSureRecoverDeprovisionPayload")]
  param(
    [Parameter(ParameterSetName = "SF",Mandatory = $true,Position = 0)]
    [System.IO.FileInfo]$SigningKeyFile,

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 1)]
    [string]$SigningKeyPassword,

    [Parameter(ParameterSetName = "SB",Mandatory = $true,Position = 0)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKeyCertificate,

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "SB",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 0)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "SB",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 1)]
    [DeprovisioningTarget[]]$RemoveOnly,

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "SB",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 2)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 3)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 4)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 5)]
    [switch]$CacheAccessToken
  )

  Write-Verbose "Creating SureRecover deprovisioning payload"
  if ($RemoveOnly) {
    [byte]$target = 0
    $RemoveOnly | ForEach-Object { $target = $target -bor $_ }
    Write-Verbose "Will deprovision only $([string]$RemoveOnly)"
  }
  else
  {
    [byte]$target = 31 # all five bits
    Write-Verbose "No deprovisioning filter specified, will deprovision all SureRecover"
  }

  $payload = [BitConverter]::GetBytes($nonce) + $target

  if ($PSCmdlet.ParameterSetName -eq "RemoteSigning") {
    $sig = Invoke-HPPrivateRemoteSignData -Data $payload -CertificateId $RemoteSigningServiceKeyID -KMSUri $RemoteSigningServiceURL -CacheAccessToken:$CacheAccessToken -Verbose:$VerbosePreference
  }
  else {
    $sk = Get-HPPrivateX509CertCoalesce -File $SigningKeyFile -password $SigningKeyPassword -cert $SigningKeycertificate -Verbose:$VerbosePreference
    $sig = Invoke-HPPrivateSignData -Data $payload -Certificate $sk.Full -Verbose:$VerbosePreference
  }

  Write-Verbose "Building output document"
  $output = New-Object -TypeName PortableFileFormat
  $output.Data = $sig + $payload
  $output.purpose = "hp:surerecover:deprovision"
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



<#
.SYNOPSIS
    Creates a payload to configure the HP Sure Recover schedule

.DESCRIPTION
  This command creates a payload to configure a HP Sure Recover schedule. There are three signing options to choose from:
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

.PARAMETER DayOfWeek
  Specifies the day of the week for the schedule

.PARAMETER Hour
  Specifies the hour value for the schedule

.PARAMETER Minute
  Specifies the minute of the schedule

.PARAMETER WindowSize
  Specifies the windows size for the schedule activation in minutes, in case the exact configured schedule is
  missed. By default, the window is zero. The value may not be larger than 240 minutes (4 hours).

.PARAMETER Disable
  If specified, this command creates a payload to disable HP Sure Recover schedule.

.PARAMETER OutputFile
  Specifies the file to write output to instead of writing the output to the pipelineing output to the specified file, instead of writing it to the pipeline.

.PARAMETER RemoteSigningServiceKeyID
  Specifies the Signing Key ID to be used

.PARAMETER RemoteSigningServiceURL
  Specifies the (Key Management Service) KMS server URL (I.e.: https://<KMSAppName>.azurewebsites.net/)

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.LINK 
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.LINK
  [Blog post: Provisioning and Configuring HP Sure Recover with HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/provisioning-and-configuring-hp-sure-recover-hp-client-management-script-library)

.NOTES
  - Requires HP BIOS with HP Sure Recover support

.EXAMPLE
  New-HPSureRecoverSchedulePayload -SigningKeyFile sk.pfx -DayOfWeek Sunday -Hour 2

.EXAMPLE
  New-HPSureRecoverSchedulePayload -SigningKeyFile sk.pfx -Disable
#>
function New-HPSureRecoverSchedulePayload
{
  [CmdletBinding(DefaultParameterSetName = "SF",HelpUri = "https://developers.hp.com/hp-client-management/doc/New-HPSureRecoverSchedulePayload")]
  param(

    [Parameter(ParameterSetName = "SF",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "DisableSF",Mandatory = $true,Position = 0)]
    [System.IO.FileInfo]$SigningKeyFile,

    [Parameter(ValueFromPipeline,ParameterSetName = "SB",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "DisableSB",Mandatory = $true,Position = 0)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKeyCertificate,

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 1)]
    [Parameter(ParameterSetName = "DisableSF",Mandatory = $false,Position = 1)]
    [string]$SigningKeyPassword,

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "SB",Mandatory = $false,Position = 1)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 0)]
    [Parameter(ParameterSetName = "DisableRemoteSigning",Mandatory = $false,Position = 0)]
    [Parameter(ParameterSetName = "DisableSF",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "DisableSB",Mandatory = $false,Position = 1)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "SF",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "SB",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 1)]
    [surerecover_day_of_week]$DayOfWeek = [surerecover_day_of_week]::Sunday,

    [Parameter(ParameterSetName = "SF",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "SB",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 2)]
    [ValidateRange(0,23)]
    [uint32]$Hour = 0,

    [Parameter(ParameterSetName = "SF",Mandatory = $true,Position = 5)]
    [Parameter(ParameterSetName = "SB",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 3)]
    [ValidateRange(0,59)]
    [uint32]$Minute = 0,

    [Parameter(ParameterSetName = "SF",Mandatory = $true,Position = 6)]
    [Parameter(ParameterSetName = "SB",Mandatory = $true,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 4)]
    [ValidateRange(1,240)]
    [uint32]$WindowSize = 0,

    [Parameter(ParameterSetName = "DisableRemoteSigning",Mandatory = $true,Position = 1)]
    [Parameter(ParameterSetName = "DisableSF",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "DisableSB",Mandatory = $true,Position = 2)]
    [switch]$Disable,

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 7)]
    [Parameter(ParameterSetName = "SB",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "DisableRemoteSigning",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "DisableSF",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "DisableSB",Mandatory = $false,Position = 3)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 6)]
    [Parameter(ParameterSetName = "DisableRemoteSigning",Mandatory = $true,Position = 3)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 7)]
    [Parameter(ParameterSetName = "DisableRemoteSigning",Mandatory = $true,Position = 4)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 8)]
    [Parameter(ParameterSetName = "DisableRemoteSigning",Mandatory = $false,Position = 5)]
    [switch]$CacheAccessToken
  )

  Write-Verbose "Creating SureRecover scheduling payload"
  $schedule_data = New-Object -TypeName surerecover_schedule_data_t

  Write-Verbose "Will set the SureRecover scheduler"
  $schedule_data.day_of_week = $DayOfWeek
  $schedule_data.hour = $Hour
  $schedule_data.minute = $Minute
  $schedule_data.window_size = $WindowSize

  $schedule = New-Object -TypeName surerecover_schedule_data_payload_t
  $schedule.schedule = $schedule_data
  $schedule.Nonce = $Nonce

  $cmd = New-Object -TypeName surerecover_schedule_payload_t
  $cmd.Data = $schedule
  [byte[]]$payload = (Convert-HPPrivateObjectToBytes -obj $schedule -Verbose:$VerbosePreference)[0]

  if ($PSCmdlet.ParameterSetName -eq "RemoteSigning" -or $PSCmdlet.ParameterSetName -eq "DisableRemoteSigning") {
    $cmd.sig = Invoke-HPPrivateRemoteSignData -Data $payload -CertificateId $RemoteSigningServiceKeyID -KMSUri $RemoteSigningServiceURL -CacheAccessToken:$CacheAccessToken -Verbose:$VerbosePreference
  }
  else {
    $sk = Get-HPPrivateX509CertCoalesce -File $SigningKeyFile -password $SigningKeyPassword -cert $SigningKeycertificate -Verbose:$VerbosePreference
    $cmd.sig = Invoke-HPPrivateSignData -Data $payload -Certificate $sk.Full -Verbose:$VerbosePreference
  }

  Write-Verbose "Building output document"
  $output = New-Object -TypeName PortableFileFormat

  $output.Data = (Convert-HPPrivateObjectToBytes -obj $cmd -Verbose:$VerbosePreference)[0]
  $output.purpose = "hp:surerecover:scheduler"
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


<#
.SYNOPSIS
  Creates a payload to configure HP Sure Recover

.DESCRIPTION
  This command create a payload to configure HP Sure Recover. There are three signing options to choose from:
  - Signing Key File (and Password) using -SigningKeyFile and -SigningKeyPassword parameters 
  - Signing Key Certificate using -SigningKeyCertificate parameter
  - Remote Signing using -RemoteSigningServiceKeyID and -RemoteSigningServiceURL parameters 

  Please note that using a Key File with Password in PFX format is recommended over using an X509 Certificate object because a private key in a certificate is not password protected.

  This command writes the created payload to the pipeline or to the file specified in the OutputFile parameter.
  This payload can then be passed to the Set-HPSecurePlatformPayload command.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Set-HPSecurePlatformPayload command. Creating the payload and passing it to the Set-HPSecurePlatformPayload command via the pipeline is not a recommended production pattern.

.PARAMETER SigningKeyFile
  Specifies the path to the Secure Platform Management signing key as a PFX file. If the PFX file is protected by a password (recommended), the SigningKeyPassword parameter should also be provided.

.PARAMETER SigningKeyPassword
  Specifies the Secure Platform Management signing key file password, if required.

.PARAMETER SigningKeyCertificate
  Specifies the Secure Platform Management signing key certificate as an X509Certificate object.

.PARAMETER SigningKeyModulus
  The Secure Platform Management signing key modulus

.PARAMETER Nonce
  Specifies a Nonce. If nonce is specified, the Secure Platform Management subsystem will only accept commands with a nonce greater or equal to the last nonce sent. This approach helps to prevent replay attacks. If not specified, the nonce is inferred from the current local time. The current local time as the nonce works in most cases. However, this approach has a resolution of seconds, so when performing parallel operations or a high volume of operations, it is possible for the same counter to be interpreted for more than one command. In these cases, the caller should use its own nonce derivation and provide it through this parameter.

.PARAMETER BIOSFlags
  Specifies the imaging flags to set. Please note that this parameter was previously named OSImageFlags.
  None = 0 
  NetworkBasedRecovery = 1 => Enable network based recovery
  WiFi = 2 => Enable WiFi
  PartitionRecovery = 4 => Enable partition based recovery
  SecureStorage = 8 => Enable recovery from secure storage device
  SecureEraseUnit = 16 => Secure Erase Unit before recovery
  RollbackPrevention = 64 => Enforce rollback prevention 

.PARAMETER AgentFlags
  Specifies the agent flags to set:
  None = 0 => OEM OS release with in-box drivers
  DRDVD = 1 => OEM OS release with optimized drivers 
  CorporateReadyWithoutOffice = 2 => Corporate ready without office
  CorporateReadyWithOffice = 4 => Corporate ready with office
  InstallManageabilitySuite = 16 => Install current components of the Manageability Suite included on the DRDVD
  InstallSecuritySuite = 32 => Install current components of the Security Suite included on the DRDVD 
  RollbackPrevention = 64 => Enforce rollback prevention
  EnableOSUpgrade = 256 => Enable OS upgrade with approproiate DPK 
  Please note that the Image Type AgentFlags DRDVD, CorporateReadyWithOffice, and CorporateReadyWithoutOffice are mutually exclusive. If you choose to set an Image type flag, you can only set one of the three flags.

.PARAMETER OutputFile
  Specifies the file to write output to instead of writing the output to the pipelineing output to the specified file, instead of writing it to the pipeline.

.PARAMETER RemoteSigningServiceKeyID
  Specifies the Signing Key ID to be used

.PARAMETER RemoteSigningServiceURL
  Specifies the (Key Management Service) KMS server URL (I.e.: https://<KMSAppName>.azurewebsites.net/)

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.LINK 
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.LINK
  [Blog post: Provisioning and Configuring HP Sure Recover with HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/provisioning-and-configuring-hp-sure-recover-hp-client-management-script-library)

.NOTES
  - Requires HP BIOS with HP Sure Recover support

.EXAMPLE
  New-HPSureRecoverConfigurationPayload -SigningKeyFile sk.pfx -BIOSFlags WiFi -AgentFlags DRDVD

.EXAMPLE
  New-HPSureRecoverConfigurationPayload -SigningKeyFile sk.pfx -BIOSFlags WiFi,SecureStorage -AgentFlags DRDVD,RollbackPrevention
#>
function New-HPSureRecoverConfigurationPayload
{
  [CmdletBinding(DefaultParameterSetName = "SF",HelpUri = "https://developers.hp.com/hp-client-management/doc/New-HPSureRecoverConfigurationPayload")]
  param(

    [Parameter(ParameterSetName = "SF",Mandatory = $true,Position = 0)]
    [System.IO.FileInfo]$SigningKeyFile,

    [Parameter(ValueFromPipeline,ParameterSetName = "SB",Mandatory = $true,Position = 0)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKeyCertificate,

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 1)]
    [string]$SigningKeyPassword,

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "SB",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 0)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "SF",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "SB",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 1)]
    [Alias("OSImageFlags")]
    [surerecover_os_flags_no_reserved]$BIOSFlags, # does not allow setting to reserved values

    [Parameter(ParameterSetName = "SF",Mandatory = $true,Position = 5)]
    [Parameter(ParameterSetName = "SB",Mandatory = $true,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 2)]
    [surerecover_re_flags_no_reserved]$AgentFlags, # does not allow setting to reserved values

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "SB",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 3)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 4)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 5)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 6)]
    [switch]$CacheAccessToken
  )

  # Image Type AgentFlags DRDVD, CorporateReadyWithOffice. and CorporateReadyWithoutOffice are all mutually exclusive 
  # as only one of the three is valid at a time
  if ($AgentFlags -band 1 -and ($AgentFlags -band 2 -or $AgentFlags -band 4) -or
      $AgentFlags -band 2 -and ($AgentFlags -band 1 -or $AgentFlags -band 4) -or
      $AgentFlags -band 4 -and ($AgentFlags -band 1 -or $AgentFlags -band 2)){
    throw "Cannot set multiple Image Type AgentFlags: DRDVD, CorporateReadyWithOffice, and CorporateReadyWithoutOffice are mutually exclusive."
  }
  
  # surerecover_configuration_payload_t has flags enums with reserved values, 
  # but since the parameter validation ensures user cannot select reserved values to set, 
  # we can safely cast the values to uint32 to be used in the payload with reserved values
  $data = New-Object -TypeName surerecover_configuration_payload_t
  $data.os_flags = [uint32]$BIOSFlags
  $data.re_flags = [uint32]$AgentFlags
  $data.arp_counter = $Nonce

  $cmd = New-Object -TypeName surerecover_configuration_t
  $cmd.Data = $data

  [byte[]]$payload = (Convert-HPPrivateObjectToBytes -obj $data -Verbose:$VerbosePreference)[0]

  if ($PSCmdlet.ParameterSetName -eq "RemoteSigning") {
    $cmd.sig = Invoke-HPPrivateRemoteSignData -Data $payload -CertificateId $RemoteSigningServiceKeyID -KMSUri $RemoteSigningServiceURL -CacheAccessToken:$CacheAccessToken -Verbose:$VerbosePreference
  }
  else {
    $sk = Get-HPPrivateX509CertCoalesce -File $SigningKeyFile -password $SigningKeyPassword -cert $SigningKeycertificate
    $cmd.sig = Invoke-HPPrivateSignData -Data $payload -Certificate $sk.Full -Verbose:$VerbosePreference
  }

  Write-Verbose "Building output document"
  $output = New-Object -TypeName PortableFileFormat
  $output.Data = (Convert-HPPrivateObjectToBytes -obj $cmd -Verbose:$VerbosePreference)[0]
  $output.purpose = "hp:surerecover:configure"
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

<#
.SYNOPSIS
  Creates a payload to configure HP Sure Recover OS or Recovery image failover

.DESCRIPTION
  This command creates a payload to configure HP Sure Recover OS or Recovery image failover. There are three signing options to choose from:
  - Signing Key File (and Password) using -SigningKeyFile and -SigningKeyPassword parameters 
  - Signing Key Certificate using -SigningKeyCertificate parameter
  - Remote Signing using -RemoteSigningServiceKeyID and -RemoteSigningServiceURL parameters 

  Please note that using a Key File with Password in PFX format is recommended over using an X509 Certificate object because a private key in a certificate is not password protected.

  This command writes the created payload to the pipeline or to the file specified in the OutputFile parameter. This payload can then be passed to the Set-HPSecurePlatformPayload command.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Set-HPSecurePlatformPayload command. Creating the payload and passing it to the Set-HPSecurePlatformPayload command via the pipeline is not a recommended production pattern.

.PARAMETER Image
  Specifies whether this command will create a configuration payload for a Recovery Agent image or a Recovery OS  image. For now, only 'os' is supported.

.PARAMETER SigningKeyFile
  Specifies the path to the Secure Platform Management signing key, as a PFX file. If the PFX file is protected by a password (recommended),
  the SigningKeyPassword parameter should also be provided.

.PARAMETER SigningKeyPassword
  Specifies the Secure Platform Management signing key file password, if required.

.PARAMETER SigningKeyCertificate
  Specifies the Secure Platform Management signing key certificate as an X509Certificate object.

.PARAMETER Version
  Specifies the operation version. Each new configuration payload must increment the last operation payload version, as available in the Get-HPSureRecoverFailoverConfiguration. If this parameter is not provided, this command will read from current system and increment it automatically.

.PARAMETER Username
  Specifies the username for accessing the url specified in the Url parameter, if any.

.PARAMETER Password
  Specifies the password for accessing the url specified in the Url parameter, if any.

.PARAMETER Url
  Specifies the URL from where to download the image. An empty URL can be specified to deprovision Failover.

.PARAMETER Nonce
  Specifies a Nonce. If nonce is specified, the Secure Platform Management subsystem will only accept commands with a nonce greater or equal to the last nonce sent. This approach helps to prevent replay attacks. If not specified, the nonce is inferred from the current local time. The current local time as the nonce works in most cases. However, this approach has a resolution of seconds, so when performing parallel operations or a high volume of operations, it is possible for the same counter to be interpreted for more than one command. In these cases, the caller should use its own nonce derivation and provide it through this parameter.

.PARAMETER OutputFile
  Specifies the file to write output to instead of writing the output to the pipelineing output to the specified file, instead of writing it to the pipeline.

.PARAMETER RemoteSigningServiceKeyID
  Specifies the Signing Key ID to be used

.PARAMETER RemoteSigningServiceURL
  Specifies the (Key Management Service) KMS server URL (I.e.: https://<KMSAppName>.azurewebsites.net/). This URL must be HTTPS. 

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.LINK 
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.NOTES
  - Requires HP BIOS with HP Sure Recover support

.EXAMPLE
  New-HPSureRecoverFailoverConfigurationPayload -SigningKeyFile sk.pfx -Version 1 -Url ''

.EXAMPLE
  New-HPSureRecoverFailoverConfigurationPayload -SigningKeyFile sk.pfx -Image os -Version 1 -Nonce 2 -Url 'http://url.com/' -Username 'user' -Password 123
#>
function New-HPSureRecoverFailoverConfigurationPayload
{
  [CmdletBinding(DefaultParameterSetName = "SF",HelpUri = "https://developers.hp.com/hp-client-management/doc/New-HPSureRecoverFailoverConfigurationPayload")]
  param(

    [Parameter(ParameterSetName = "SF",Mandatory = $true,Position = 0)]
    [System.IO.FileInfo]$SigningKeyFile,

    [Parameter(ValueFromPipeline,ParameterSetName = "SB",Mandatory = $true,Position = 0)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKeyCertificate,

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 1)]
    [string]$SigningKeyPassword,

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "SB",Mandatory = $false,Position = 1)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 0)]
    [ValidateSet("os")]
    [string]$Image = "os",

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "SB",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 1)]
    [uint16]$Version,

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "SB",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 2)]
    [string]$Username,

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "SB",Mandatory = $false,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 3)]
    [string]$Password,

    [Parameter(ParameterSetName = "SF",Mandatory = $true,Position = 3)]
    [Parameter(ParameterSetName = "SB",Mandatory = $true,Position = 2)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 4)]
    [uri]$Url = "",

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "SB",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 5)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "SF",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "SB",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 6)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 7)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $true,Position = 8)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning",Mandatory = $false,Position = 9)]
    [switch]$CacheAccessToken
  )

  if (-not $Version) {
    try {
      $Version = (Get-HPSureRecoverFailoverConfiguration -Image $Image).Version + 1
    }
    catch {
      # It is not possible to get current version if failover is not configured yet, assigning version 1
      $Version = 1
    }
    Write-Verbose "New version number is $version"
  }

  $opaque = New-Object opaque4096_t
  $opaqueLength = 4096
  $mi_result = 0
  [byte]$index = 1

  if((Test-OSBitness) -eq 32){
    $result = [DfmNativeSureRecover]::get_surerecover_failover_opaque32($Nonce, $Version, $index, $Username, $Password, $($Url.ToString()), [ref]$opaque, [ref]$opaqueLength, [ref]$mi_result);
  }
  else {
    $result = [DfmNativeSureRecover]::get_surerecover_failover_opaque64($Nonce, $Version, $index, $Username, $Password, $($Url.ToString()), [ref]$opaque, [ref]$opaqueLength, [ref]$mi_result);
  }

  Test-HPPrivateCustomResult -result $result -mi_result $mi_result -Category 0x05

  [byte[]]$payload = $opaque.raw[0..($opaqueLength - 1)]

  if ($PSCmdlet.ParameterSetName -eq "RemoteSigning") {
    $sig = Invoke-HPPrivateRemoteSignData -Data $payload -CertificateId $RemoteSigningServiceKeyID -KMSUri $RemoteSigningServiceURL -CacheAccessToken:$CacheAccessToken -Verbose:$VerbosePreference
  }
  else {
    $sk = Get-HPPrivateX509CertCoalesce -File $SigningKeyFile -password $SigningKeyPassword -cert $SigningKeycertificate
    $sig = Invoke-HPPrivateSignData -Data $payload -Certificate $sk.Full -Verbose:$VerbosePreference
  }

  [byte[]]$out = $sig + $payload

  Write-Verbose "Building output document"
  $output = New-Object -TypeName PortableFileFormat
  $output.Data = $out
  $output.purpose = "hp:surerecover:failover:os_image"
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

<#
.SYNOPSIS
  Creates a payload to trigger HP Sure Recover events

.DESCRIPTION
  This command creates a payload to trigger HP Sure Recover. There are three signing options to choose from:
  - Signing Key File (and Password) using -SigningKeyFile and -SigningKeyPassword parameters 
  - Signing Key Certificate using -SigningKeyCertificate parameter
  - Remote Signing using -RemoteSigningServiceKeyID and -RemoteSigningServiceURL parameters 

  Please note that using a Key File with Password in PFX format is recommended over using an X509 Certificate object because a private key in a certificate is not password protected.

  This command writes the created payload to the pipeline or to the file specified in the OutputFile parameter. This payload can then be passed to the Set-HPSecurePlatformPayload command.

  Security note: Payloads should only be created on secure servers. Once created, the payload may be transferred to a client and applied via the Set-HPSecurePlatformPayload command. Creating the payload and passing it to the Set-HPSecurePlatformPayload command via the pipeline is not a recommended production pattern.

.PARAMETER SigningKeyFile
  Specifies the path to the Secure Platform Management signing key as a PFX file. If the PFX file is protected by a password (recommended), the SigningKeyPassword parameter should also be provided.

.PARAMETER SigningKeyPassword
  Specifies the Secure Platform Management signing key file password, if required.

.PARAMETER SigningKeyCertificate
  Specifies the Secure Platform Management signing key certificate as an X509Certificate object

.PARAMETER Nonce
  Specifies a Nonce. If nonce is specified, the Secure Platform Management subsystem will only accept commands with a nonce greater or equal to the last nonce sent. This approach helps to prevent replay attacks. If not specified, the nonce is inferred from the current local time. The current local time as the nonce works in most cases. However, this approach has a resolution of seconds, so when performing parallel operations or a high volume of operations, it is possible for the same counter to be interpreted for more than one command. In these cases, the caller should use its own nonce derivation and provide it through this parameter.

.PARAMETER Set
  If specified, this command sets the trigger information. This parameter is used by default and optional.

.PARAMETER Cancel
  If specified, this command clears any existing trigger definition.

.PARAMETER ForceAfterReboot
  Specifies how many reboots to count before applying the trigger. If not specified, the value defaults to 1 (next reboot).    

.PARAMETER PromptPolicy
  Specifies the prompting policy. If not specified, it will default to prompt before recovery, and on error.

.PARAMETER ErasePolicy
  Specifies the erase policy for the imaging process

.PARAMETER OutputFile
  Specifies the file to write output to instead of writing the output to the pipelineing output to the specified file, instead of writing it to the pipeline.

.PARAMETER RemoteSigningServiceKeyID
  Specifies the Signing Key ID to be used

.PARAMETER RemoteSigningServiceURL
  Specifies the (Key Management Service) KMS server URL (I.e.: https://<KMSAppName>.azurewebsites.net/)

.PARAMETER CacheAccessToken
  If specified, the access token is cached in msalcache.dat file and user credentials will not be asked again until the credentials expire.
  This parameter should be specified for caching the access token when performing multiple operations on the KMS server. 
  If access token is not cached, the user must re-enter credentials on each call of this command.

.LINK 
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.LINK
  [Blog post: Provisioning and Configuring HP Sure Recover with HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/provisioning-and-configuring-hp-sure-recover-hp-client-management-script-library)

.NOTES
  - Requires HP BIOS with HP Sure Recover support

.EXAMPLE
  New-HPSureRecoverTriggerRecoveryPayload -SigningKeyFile sk.pfx
#>
function New-HPSureRecoverTriggerRecoveryPayload
{
  [CmdletBinding(DefaultParameterSetName = "SF_Schedule",HelpUri = "https://developers.hp.com/hp-client-management/doc/New-HPSureRecoverTriggerRecoveryPayload")]
  param(

    [Parameter(ParameterSetName = "SF_Schedule",Mandatory = $true,Position = 0)]
    [Parameter(ParameterSetName = "SF_Cancel",Mandatory = $true,Position = 0)]
    [string]$SigningKeyFile,

    [Parameter(ParameterSetName = "SF_Schedule",Mandatory = $false,Position = 1)]
    [Parameter(ParameterSetName = "SF_Cancel",Mandatory = $false,Position = 1)]
    [string]$SigningKeyPassword,

    [Parameter(ValueFromPipeline,ParameterSetName = "SB_Schedule",Mandatory = $true,Position = 0)]
    [Parameter(ValueFromPipeline,ParameterSetName = "SB_Cancel",Mandatory = $true,Position = 0)]
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$SigningKeyCertificate,

    [Parameter(ParameterSetName = "SF_Schedule",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "SF_Cancel",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "SB_Schedule",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "SB_Cancel",Mandatory = $false,Position = 3)]
    [Parameter(ParameterSetName = "RemoteSigning_Schedule",Mandatory = $false,Position = 0)]
    [Parameter(ParameterSetName = "RemoteSigning_Cancel",Mandatory = $false,Position = 0)]
    [uint32]$Nonce = [math]::Floor([decimal](Get-Date (Get-Date).ToUniversalTime() -UFormat "%s").Replace(',','.')),

    [Parameter(ParameterSetName = "SF_Schedule",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "SB_Schedule",Mandatory = $false,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning_Schedule",Mandatory = $false,Position = 1)]
    [switch]$Set,

    [Parameter(ParameterSetName = "SF_Cancel",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "SB_Cancel",Mandatory = $true,Position = 4)]
    [Parameter(ParameterSetName = "RemoteSigning_Cancel",Mandatory = $true,Position = 1)]
    [switch]$Cancel,

    [Parameter(ParameterSetName = "SF_Schedule",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "SB_Schedule",Mandatory = $false,Position = 6)]
    [Parameter(ParameterSetName = "RemoteSigning_Schedule",Mandatory = $false,Position = 2)]
    [ValidateRange(1,7)]
    [byte]$ForceAfterReboot = 1,

    [Parameter(ParameterSetName = "SF_Schedule",Mandatory = $false,Position = 7)]
    [Parameter(ParameterSetName = "SB_Schedule",Mandatory = $false,Position = 7)]
    [Parameter(ParameterSetName = "RemoteSigning_Schedule",Mandatory = $false,Position = 3)]
    [surerecover_prompt_policy]$PromptPolicy = "PromptBeforeRecovery,PromptOnError",

    [Parameter(ParameterSetName = "SF_Schedule",Mandatory = $false,Position = 8)]
    [Parameter(ParameterSetName = "SB_Schedule",Mandatory = $false,Position = 8)]
    [Parameter(ParameterSetName = "RemoteSigning_Schedule",Mandatory = $false,Position = 4)]
    [surerecover_erase_policy]$ErasePolicy = "None",

    [Parameter(ParameterSetName = "SF_Schedule",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "SB_Schedule",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "SF_Cancel",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "SB_Cancel",Mandatory = $false,Position = 9)]
    [Parameter(ParameterSetName = "RemoteSigning_Schedule",Mandatory = $false,Position = 5)]
    [Parameter(ParameterSetName = "RemoteSigning_Cancel",Mandatory = $false,Position = 2)]
    [System.IO.FileInfo]$OutputFile,

    [Parameter(ParameterSetName = "RemoteSigning_Schedule",Mandatory = $true,Position = 6)]
    [Parameter(ParameterSetName = "RemoteSigning_Cancel",Mandatory = $true,Position = 3)]
    [string]$RemoteSigningServiceKeyID,

    [Parameter(ParameterSetName = "RemoteSigning_Schedule",Mandatory = $true,Position = 7)]
    [Parameter(ParameterSetName = "RemoteSigning_Cancel",Mandatory = $true,Position = 4)]
    [string]$RemoteSigningServiceURL,

    [Parameter(ParameterSetName = "RemoteSigning_Schedule",Mandatory = $false,Position = 8)]
    [Parameter(ParameterSetName = "RemoteSigning_Cancel",Mandatory = $false,Position = 5)]
    [switch]$CacheAccessToken
  )

  $data = New-Object -TypeName surerecover_trigger_payload_t
  $data.arp_counter = $Nonce
  $data.bios_trigger_flags = 0

  $output = New-Object -TypeName PortableFileFormat

  if ($Cancel.IsPresent)
  {
    Write-Verbose "Creating payload to cancel trigger"
    $output.purpose = "hp:surerecover:trigger"
    $data.bios_trigger_flags = 0
    $data.re_trigger_flags = 0
  }
  else {
    Write-Verbose ("Creating payload to set trigger")
    $output.purpose = "hp:surerecover:trigger"
    $data.bios_trigger_flags = [uint32]$ForceAfterReboot
    $data.re_trigger_flags = [uint32]$PromptPolicy
    $data.re_trigger_flags = ([uint32]$ErasePolicy -shl 4) -bor $data.re_trigger_flags
  }

  $cmd = New-Object -TypeName surerecover_trigger_t
  $cmd.Data = $data

  [byte[]]$payload = (Convert-HPPrivateObjectToBytes -obj $data -Verbose:$VerbosePreference)[0]

  if ($PSCmdlet.ParameterSetName -eq "RemoteSigning_Schedule" -or $PSCmdlet.ParameterSetName -eq "RemoteSigning_Cancel") {
    $cmd.sig = Invoke-HPPrivateRemoteSignData -Data $payload -CertificateId $RemoteSigningServiceKeyID -KMSUri $RemoteSigningServiceURL -CacheAccessToken:$CacheAccessToken -Verbose:$VerbosePreference
  }
  elseif ($SigningKeyCertificate){
    $sk = Get-HPPrivateX509CertCoalesce -cert $SigningKeyCertificate -Verbose:$VerbosePreference
    $cmd.sig = Invoke-HPPrivateSignData -Data $payload -Certificate $sk.Full -Verbose:$VerbosePreference
  }
  else {
    $sk = Get-HPPrivateX509CertCoalesce -File $SigningKeyFile -password $SigningKeyPassword -Verbose:$VerbosePreference
    $cmd.sig = Invoke-HPPrivateSignData -Data $payload -Certificate $sk.Full -Verbose:$VerbosePreference
  }

  Write-Verbose "Building output document with nonce $([BitConverter]::GetBytes($nonce))"

  $output.Data = (Convert-HPPrivateObjectToBytes -obj $cmd -Verbose:$VerbosePreference)[0]
  Write-Verbose "Sending document of size $($output.data.length)"
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


<#
.SYNOPSIS
  Invokes the WMI command to trigger the BIOS to perform a service event on the next boot

.DESCRIPTION
  This command invokes the WMI command to trigger the BIOS to perform a service event on the next boot. If the hardware option is not present, this command will throw a NotSupportedException exception. 

  The BIOS will then compare SR_AED to HP_EAD and agent will compare SR_Image to HP_Image and update as necessary. The CloudRecovery.exe is the tool that performs the actual update.

.LINK 
  [Blog post: HP Secure Platform Management with the HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/hp-secure-platform-management-hp-client-management-script-library)

.LINK
  [Blog post: Provisioning and Configuring HP Sure Recover with HP Client Management Script Library](https://developers.hp.com/hp-client-management/blog/provisioning-and-configuring-hp-sure-recover-hp-client-management-script-library)
  
  
.NOTES
  - Requires HP BIOS with HP Sure Recover support
  - Requires Embedded Reimaging device hardware option

.EXAMPLE
  Invoke-HPSureRecoverTriggerUpdate
#>
function Invoke-HPSureRecoverTriggerUpdate
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Invoke-HPSureRecoverTriggerUpdate")]
  param()

  $mi_result = 0

  if((Test-OSBitness) -eq 32){
    $result = [DfmNativeSureRecover]::raise_surerecover_service_event_opaque32($null, $null, [ref]$mi_result)
  }
  else{
    $result = [DfmNativeSureRecover]::raise_surerecover_service_event_opaque64($null, $null, [ref]$mi_result)
  }

  Test-HPPrivateCustomResult -result $result -mi_result $mi_result -Category 0x05
}


# SIG # Begin signature block
