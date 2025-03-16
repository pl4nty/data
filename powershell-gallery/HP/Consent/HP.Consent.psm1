# 
#  Copyright 2018-2024 HP Development Company, L.P.
#  All Rights Reserved.
# 
# NOTICE:  All information contained herein is, and remains the property of HP Development Company, L.P.
# 
# The intellectual and technical concepts contained herein are proprietary to HP Development Company, L.P
# and may be covered by U.S. and Foreign Patents, patents in process, and are protected by 
# trade secret or copyright law. Dissemination of this information or reproduction of this material
# is strictly forbidden unless prior written permission is obtained from HP Development Company, L.P.


enum TelemetryManagedBy
{
  User = 0
  Organization = 1
}

enum TelemetryPurpose
{
  Marketing = 1
  Support = 2
  ProductEnhancement = 3

}


$ConsentPath = 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\HP\Consent'


<#
.SYNOPSIS
  Retrieves the current configured HP Analytics reporting configuration

.DESCRIPTION
    This command retrieves the configuration of the HP Analytics client. The returned object contains the following fields:
    
    - ManagedBy: 'User' (self-managed) or 'Organization' (IT managed)
    - AllowedCollectionPurposes: A collection of allowed purposes, one or more of:
        - Marketing: Analytics are allowed for Marketing purposes
        - Support: Analytics are allowed for Support purposes
        - ProductEnhancement: Analytics are allowed for Product Enhancement purposes
    - TenantID: An organization-configured tenant ID. This is an optional GUID defined by the IT Administrator. If not defined, the TenantID will default to 'Individual'.

.EXAMPLE
    PS C:\> Get-HPAnalyticsConsentConfiguration

    Name                           Value
    ----                           -----
    ManagedBy                      User
    AllowedCollectionPurposes      {Marketing}
    TenantID                       Individual


.LINK
  [Set-HPAnalyticsConsentTenantID](https://developers.hp.com/hp-client-management/doc/Set-HPAnalyticsConsentTenantID)

.LINK
    [Set-HPAnalyticsConsentAllowedPurposes](https://developers.hp.com/hp-client-management/doc/Set-HPAnalyticsConsentAllowedPurposes)

.LINK
  [Set-HPAnalyticsConsentDeviceOwnership](https://developers.hp.com/hp-client-management/doc/Set-HPAnalyticsConsentDeviceOwnership)

.LINK
  For a discussion of these settings, see [https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/ManagingConsentforHPAnalytics.pdf](https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/ManagingConsentforHPAnalytics.pdf) 

#>
function Get-HPAnalyticsConsentConfiguration
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPAnalyticsConsentConfiguration")]
  param()

  $obj = [ordered]@{
    ManagedBy = [TelemetryManagedBy]"User"
    AllowedCollectionPurposes = [TelemetryPurpose[]]@()
    TenantID = "Individual"
  }

  if (Test-Path $ConsentPath)
  {
    $key = Get-ItemProperty $ConsentPath
    if ($key) {
      if ($key.Managed -eq "True") { $obj.ManagedBy = "Organization" }

      [TelemetryPurpose[]]$purpose = @()
      if ($key.AllowMarketing -eq "Accepted") { $purpose += "Marketing" }
      if ($key.AllowSupport -eq "Accepted") { $purpose += "Support" }
      if ($key.AllowProductEnhancement -eq "Accepted") { $purpose += "ProductEnhancement" }

      ([TelemetryPurpose[]]$obj.AllowedCollectionPurposes) = $purpose
      if ($key.TenantID) {
        $obj.TenantID = $key.TenantID
      }

    }


  }
  else {
    Write-Verbose 'Consent registry key does not exist.'
  }
  $obj
}

<#
.SYNOPSIS
    Sets the ManagedBy (ownership) of a device for the purpose of HP Analytics reporting
 
.DESCRIPTION
    This command configures HP Analytics ownership value to either 'User' or 'Organization'.

    - User: This device is managed by the end user
    - Organization: This device is managed by an organization's IT administrator

.PARAMETER Owner
  Specifies User or Organization as the owner of the device

.EXAMPLE
    # Sets the device to be owned by a User
    PS C:\> Set-HPAnalyticsConsentDeviceOwnership -Owner User

.EXAMPLE
    # Sets the device to be owned by an Organization
    PS C:\> Set-HPAnalyticsConsentDeviceOwnership -Owner Organization


.LINK
  [Get-HPAnalyticsConsentConfiguration](https://developers.hp.com/hp-client-management/doc/Get-HPAnalyticsConsentConfiguration)

.LINK
  [Set-HPAnalyticsConsentTenantID](https://developers.hp.com/hp-client-management/doc/Set-HPAnalyticsConsentTenantID)

.LINK
    [Set-HPAnalyticsConsentAllowedPurposes](https://developers.hp.com/hp-client-management/doc/Set-HPAnalyticsConsentAllowedPurposes)


.LINK
  For a discussion of these settings, see [https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/ManagingConsentforHPAnalytics.pdf](https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/ManagingConsentforHPAnalytics.pdf) 

.NOTES
  This command requires elevated privileges.

#>
function Set-HPAnalyticsConsentDeviceOwnership
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Set-HPAnalyticsConsentDeviceOwnership")]
  param(
    [Parameter(Mandatory = $true,Position = 0)]
    [TelemetryManagedBy]$Owner
  )

  $Managed = ($Owner -eq "Organization")
  New-ItemProperty -Path $ConsentPath -Name "Managed" -Value $Managed -Force | Out-Null

}


<#
.SYNOPSIS
  Sets the Tenant ID of a device for the purpose of HP Analytics reporting

.DESCRIPTION
  This command configures HP Analytics Tenant ID. The Tenant ID is optional and defined by the organization.

  If the Tenant ID is not set, the default value is 'Individual'.

.PARAMETER UUID
  Sets the UUID to the specified GUID. If the TenantID is already configured, the operation will fail unless the -Force parameter is also specified.

.PARAMETER NewUUID
  Sets the UUID to an auto-generated UUID. If the TenantID is already configured, the operation will fail unless the -Force parameter is also specified.

.PARAMETER None
  If specified, this command will remove the TenantID if TenantID is set. TenantID will be set to 'Individual'.

.PARAMETER Force
  If specified, this command will force the Tenant ID to be set even if the Tenant ID is already set. 

.EXAMPLE
  # Sets the tenant ID to a specific UUID
  PS C:\> Set-HPAnalyticsConsentTenantID -UUID 'd34da70b-9d64-47e3-8b3f-9c561df32b98'

.EXAMPLE
  # Sets the tenant ID to an auto-generated UUID
  PS C:\> Set-HPAnalyticsConsentTenantID -NewUUID

.EXAMPLE
  # Removes a configured UUID
  PS C:\> Set-HPAnalyticsConsentTenantID -None

.EXAMPLE
  # Sets (and overwrites) an existing UUID with a new one
  PS C:\> Set-HPAnalyticsConsentTenantID -NewUUID -Force

.LINK
  [Get-HPAnalyticsConsentConfiguration](https://developers.hp.com/hp-client-management/doc/Get-HPAnalyticsConsentConfiguration)

.LINK
  [Set-HPAnalyticsConsentAllowedPurposes](https://developers.hp.com/hp-client-management/doc/Set-HPAnalyticsConsentAllowedPurposes)

.LINK
  [Set-HPAnalyticsConsentDeviceOwnership](https://developers.hp.com/hp-client-management/doc/Set-HPAnalyticsConsentDeviceOwnership)

.LINK
  For a discussion of these settings, see [https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/ManagingConsentforHPAnalytics.pdf](https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/ManagingConsentforHPAnalytics.pdf) 

.NOTES
  This command requires elevated privileges.

#>
function Set-HPAnalyticsConsentTenantID
{
  [CmdletBinding(DefaultParameterSetName = "SpecificUUID",HelpUri = "https://developers.hp.com/hp-client-management/doc/Set-HPAnalyticsConsentTenantID")]
  param(
    [Parameter(ParameterSetName = 'SpecificUUID',Mandatory = $true,Position = 0)]
    [guid]$UUID,
    [Parameter(ParameterSetName = 'NewUUID',Mandatory = $true,Position = 0)]
    [switch]$NewUUID,
    [Parameter(ParameterSetName = 'None',Mandatory = $true,Position = 0)]
    [switch]$None,
    [Parameter(ParameterSetName = 'SpecificUUID',Mandatory = $false,Position = 1)]
    [Parameter(ParameterSetName = 'NewUUID',Mandatory = $false,Position = 1)]
    [switch]$Force
  )

  if ($NewUUID.IsPresent)
  {
    $uid = [guid]::NewGuid()
  }
  elseif ($None.IsPresent) {
    $uid = "Individual"
  }
  else {
    $uid = $UUID
  }

  if ((-not $Force.IsPresent) -and (-not $None.IsPresent))
  {

    $config = Get-HPAnalyticsConsentConfiguration -Verbose:$VerbosePreference
    if ($config.TenantID -and $config.TenantID -ne "Individual" -and $config.TenantID -ne $uid)
    {

      Write-Verbose "Tenant ID $($config.TenantID) is already configured"
      throw [ArgumentException]"A Tenant ID is already configured for this device. Use -Force to overwrite it."
    }
  }
  New-ItemProperty -Path $ConsentPath -Name "TenantID" -Value $uid -Force | Out-Null
}



<#
.SYNOPSIS
  Sets the allowed reporting purposes for HP Analytics
 
.DESCRIPTION
    This command configures how HP may use the data reported. The allowed purposes are: 

    - Marketing: The data may be used for marketing purposes.
    - Support: The data may be used for support purposes.
    - ProductEnhancement: The data may be used for product enhancement purposes.

    Note that you may supply any combination of the above purpose in a single command. Any of the purposes not included
    in the list will be explicitly rejected.


.PARAMETER AllowedPurposes
    Specifies a list of allowed purposes for the reported data. The value must be one (or more) of the following values: 
    - Marketing
    - Support
    - ProductEnhancement

    The purposes included in this list will be explicitly accepted. The purposes not included in this list will be explicitly rejected.

.PARAMETER None
    If specified, this command rejects all purposes. 


.EXAMPLE
    # Accepts all purposes
    PS C:\> Set-HPAnalyticsConsentAllowedPurposes  -AllowedPurposes Marketing,Support,ProductEnhancement

.EXAMPLE
    # Sets ProductEnhancement, rejects everything else
    PS C:\> Set-HPAnalyticsConsentAllowedPurposes  -AllowedPurposes ProductEnhancement

.EXAMPLE
    # Rejects all purposes
    PS C:\> Set-HPAnalyticsConsentAllowedPurposes  -None
    

.LINK
  [Get-HPAnalyticsConsentConfiguration](https://developers.hp.com/hp-client-management/doc/Get-HPAnalyticsConsentConfiguration)

.LINK
  [Set-HPAnalyticsConsentTenantID](https://developers.hp.com/hp-client-management/doc/Set-HPAnalyticsConsentTenantID)

.LINK
  [Set-HPAnalyticsConsentDeviceOwnership](https://developers.hp.com/hp-client-management/doc/Set-HPAnalyticsConsentDeviceOwnership)

.LINK
  For a discussion of these settings, see [https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/ManagingConsentforHPAnalytics.pdf](https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/ManagingConsentforHPAnalytics.pdf) 

.NOTES
  This command requires elevated privileges.

#>
function Set-HPAnalyticsConsentAllowedPurposes
{
  [CmdletBinding(DefaultParameterSetName = "SpecificPurposes",HelpUri = "https://developers.hp.com/hp-client-management/doc/Set-HPAnalyticsConsentAllowedPurposes")]
  param(
    [Parameter(ParameterSetName = 'SpecificPurposes',Mandatory = $true,Position = 0)]
    [TelemetryPurpose[]]$AllowedPurposes,
    [Parameter(ParameterSetName = 'NoPurpose',Mandatory = $true,Position = 0)]
    [switch]$None
  )

  if ($None.IsPresent)
  {
    Write-Verbose "Clearing all opt-in telemetry purposes"
    New-ItemProperty -Path $ConsentPath -Name "AllowMarketing" -Value "Rejected" -Force | Out-Null
    New-ItemProperty -Path $ConsentPath -Name "AllowSupport" -Value "Rejected" -Force | Out-Null
    New-ItemProperty -Path $ConsentPath -Name "AllowProductEnhancement" -Value "Rejected" -Force | Out-Null

  }
  else {
    $allowed = $AllowedPurposes | ForEach-Object {
      New-ItemProperty -Path $ConsentPath -Name "Allow$_" -Value 'Accepted' -Force | Out-Null
      $_
    }

    if ($allowed -notcontains 'Marketing') {
      New-ItemProperty -Path $ConsentPath -Name "AllowMarketing" -Value "Rejected" -Force | Out-Null
    }
    if ($allowed -notcontains 'Support') {
      New-ItemProperty -Path $ConsentPath -Name "AllowSupport" -Value "Rejected" -Force | Out-Null
    }
    if ($allowed -notcontains 'ProductEnhancement') {
      New-ItemProperty -Path $ConsentPath -Name "AllowProductEnhancement" -Value "Rejected" -Force | Out-Null
    }

  }

}


# SIG # Begin signature block
