Set-StrictMode -Version 3.0
#requires -Modules "HP.Private","HP.ClientManagement"

<#
.SYNOPSIS
  Sets Smart Experiences as managed or unmanaged 

.DESCRIPTION
  If Smart Experiences\Policy is not found on the registry, this command sets the 'Privacy Alert' and 'Auto Screen Dimming' features to the default values. 

  The default values for both 'Privacy Alert' and 'Auto Screen Dimming' are:
    - AllowEdit: $true
    - Default: Off
    - Enabled: $false
   
  Use the Set-HPeAISettingValue command to configure the values of the eAI features.

.PARAMETER Enabled
  If set to $true, this command will configure eAi as managed. If set to $false, this command will configure eAI as unmanaged. 

.EXAMPLE
  Set-HPeAIManaged -Enabled $true

.NOTES
  Admin privilege is required.

.LINK
  [Get-HPeAISettingValue](https://developers.hp.com/hp-client-management/doc/Get-HPeAISettingValue)

.LINK
  [Set-HPeAISettingValue](https://developers.hp.com/hp-client-management/doc/Set-HPeAISettingValue)
#>
function Set-HPeAIManaged {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Set-HPeAIManaged")]
  param(
    [Parameter(Mandatory = $true,Position = 0,ValueFromPipeline = $true)]
    [bool]$Enabled
  )
  $eAIRegPath = 'HKLM:\Software\Policies\HP\SmartExperiences'

  if ((Test-HPSmartExperiencesIsSupported) -eq $false) {
    throw [System.NotSupportedException]"HP Smart Experiences is currently not supported on this platform."
  }

  if (-not (Test-IsHPElevatedAdmin)) {
    throw [System.Security.AccessControl.PrivilegeNotHeldException]"elevated administrator"
  }

  $reg = Get-Item -Path $eAIRegPath -ErrorAction SilentlyContinue
  if ($null -eq $reg) {
    Write-Verbose "Creating registry entry $eAIRegPath"
    New-Item -Path $eAIRegPath -Force | Out-Null
  }

  if ($true -eq $Enabled) {
    $managed = 1

    # Check if eAI attributes exist, if not, set the defaults
    Write-Verbose "Reading registry path $eAIRegPath\Policy"
    $reg = Get-ItemProperty -Path $eAIRegPath -ErrorAction SilentlyContinue -Name Policy
    if ($reg) {
      Write-Verbose "$eAIRegPath\Policy attributes found"
      try {
        Write-Verbose "Data read: $($reg.Policy)"
        $current = $reg.Policy | ConvertFrom-Json
      }
      catch {
        throw [System.FormatException]"$($_.Exception.Message): Please ensure Policy property contains a valid JSON."
      }
    }
    else {
      $current = [ordered]@{
        attentionDim = [ordered]@{
          allowEdit = $true
          default = 0
          isEnabled = $false
        }
        shoulderSurf = [ordered]@{
          allowEdit = $true
          default = 0
          isEnabled = $false
        }
      }

      $value = $current | ConvertTo-Json -Compress
      Write-Verbose "Setting $eAIRegPath\Policy to defaults $value"
    
      if ($reg) {
        Set-ItemProperty -Path $eAIRegPath -Value $value -Name Policy -Force | Out-Null
      }
      else {
        New-ItemProperty -Path $eAIRegPath -Value $value -Name Policy -Force | Out-Null
      }
    }
  }
  else {
    $managed = 0
  }

  Write-Verbose "Setting $eAIRegPath\Managed to $managed"
  $reg = Get-ItemProperty -Path $eAIRegPath -ErrorAction SilentlyContinue -Name Managed
  if ($reg) {
    Set-ItemProperty -Path $eAIRegPath -Value $managed -Name Managed -Force | Out-Null
  }
  else {
    New-ItemProperty -Path $eAIRegPath -Value $managed -Name Managed -Force | Out-Null
  }
}

<#
.SYNOPSIS
  Checks if eAI is managed on the current device
.DESCRIPTION
  If eAI is managed, this command returns true. Otherwise, this command returns false. If 'SmartExperiences' entry is not found in the registry, false is returned by default.

.EXAMPLE
  Get-HPeAIManaged

.NOTES
  Admin privilege is required.

.LINK
  [Set-HPeAIManaged](https://developers.hp.com/hp-client-management/doc/Set-HPeAIManaged)
#>
function Get-HPeAIManaged {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPeAIManaged")]
  param()
  $eAIRegPath = 'HKLM:\Software\Policies\HP\SmartExperiences'

  if ((Test-HPSmartExperiencesIsSupported) -eq $false) {
    throw [System.NotSupportedException]"HP Smart Experiences is currently not supported on this platform."
  }

  if (-not (Test-IsHPElevatedAdmin)) {
    throw [System.Security.AccessControl.PrivilegeNotHeldException]"elevated administrator"
  }

  Write-Verbose "Reading $eAIRegPath\Managed"
  $reg = Get-ItemProperty -Path $eAIRegPath -ErrorAction SilentlyContinue -Name Managed

  if ($reg) {
    return ($reg.Managed -eq 1)
  }

  return $false
}

<#
.SYNOPSIS
  Configures HP eAI features on the current device

.DESCRIPTION
  Configures HP eAI features on the current device. At this time, only the 'Privacy Alert' feature and the 'Auto Screen Dimming' feature are available to be configured. 

.PARAMETER Name
  Specifies the eAI feature name to configure. The value must be one of the following values:
  - Privacy Alert
  - Auto Screen Dimming

.PARAMETER Enabled
  If set to $true, this command will enable the feature specified in the Name parameter. If set to $false, this command will disable the feature specified in the -Name parameter. 

.PARAMETER AllowEdit
  If set to $true, editing is allowed for the feature specified in the Name parameter. If set to $false, editing is not allowed for the feature specified in the -Name parameter.

.PARAMETER Default
  Sets default value of the feature specified in the -Name parameter. The value must be one of the following values:
  - On
  - Off

.EXAMPLE
  Set-HPeAISettingValue -Name 'Privacy Alert' -Enabled $true -Default 'On' -AllowEdit $false

.EXAMPLE
  Set-HPeAISettingValue -Name 'Privacy Alert' -Enabled $true

.EXAMPLE
  Set-HPeAISettingValue -Name 'Auto Screen Dimming' -Default 'On'

.EXAMPLE
  Set-HPeAISettingValue -Name 'Auto Screen Dimming' -AllowEdit $false

.NOTES
  Admin privilege is required.

.LINK
  [Set-HPeAIManaged](https://developers.hp.com/hp-client-management/doc/Set-HPeAIManaged)

.LINK
  [Get-HPeAISettingValue](https://developers.hp.com/hp-client-management/doc/Get-HPeAISettingValue)
#>
function Set-HPeAISettingValue {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Set-HPeAISettingValue")]
  param(
    [Parameter(Mandatory = $true,Position = 0,ParameterSetName = 'Enabled')]
    [Parameter(Mandatory = $true,Position = 0,ParameterSetName = 'AllowEdit')]
    [Parameter(Mandatory = $true,Position = 0,ParameterSetName = 'Default')]
    [ValidateSet('Privacy Alert','Auto Screen Dimming')]
    [string]$Name,

    [Parameter(Mandatory = $true,Position = 1,ParameterSetName = 'Enabled')]
    [bool]$Enabled,

    [Parameter(Mandatory = $false,Position = 2,ParameterSetName = 'Enabled')]
    [Parameter(Mandatory = $true,Position = 1,ParameterSetName = 'AllowEdit')]
    [bool]$AllowEdit,

    [Parameter(Mandatory = $false,Position = 3,ParameterSetName = 'Enabled')]
    [Parameter(Mandatory = $false,Position = 2,ParameterSetName = 'AllowEdit')]
    [Parameter(Mandatory = $true,Position = 1,ParameterSetName = 'Default')]
    [ValidateSet('On','Off')]
    [string]$Default
  )
  $eAIFeatures = @{
    'Privacy Alert' = 'shoulderSurf'
    'Auto Screen Dimming' = 'attentionDim'
  }
  $eAIRegPath = 'HKLM:\Software\Policies\HP\SmartExperiences'

  if ((Test-HPSmartExperiencesIsSupported) -eq $false) {
    throw [System.NotSupportedException]"HP Smart Experiences is currently not supported on this platform."
  }

  if (-not (Test-IsHPElevatedAdmin)) {
    throw [System.Security.AccessControl.PrivilegeNotHeldException]"elevated administrator"
  }

  Write-Verbose "Reading registry path $eAIRegPath\Policy"
  $reg = Get-ItemProperty -Path $eAIRegPath -ErrorAction SilentlyContinue -Name Policy
  if ($reg) {
    try {
      Write-Verbose "Data read: $($reg.Policy)"
      $current = $reg.Policy | ConvertFrom-Json
    }
    catch {
      throw [System.FormatException]"$($_.Exception.Message): Please ensure Policy property contains a valid JSON."
    }
  }
  else {
    $current = [ordered]@{
      attentionDim = [ordered]@{
        allowEdit = $true
        default = 0
        isEnabled = $false
      }
      shoulderSurf = [ordered]@{
        allowEdit = $true
        default = 0
        isEnabled = $false
      }
    }
    Write-Verbose "Creating registry entry with the default values to $eAIRegPath"
    New-Item -Path $eAIRegPath -Force | Out-Null
  }

  Write-Verbose "$($eAIFeatures[$Name]) selected"
  $config = $current.$($eAIFeatures[$Name])
  if ($PSBoundParameters.Keys.Contains('Enabled')) {
    $config.isEnabled = $Enabled
  }
  if ($PSBoundParameters.Keys.Contains('AllowEdit')) {
    $config.allowEdit = $AllowEdit
  }
  if ($PSBoundParameters.Keys.Contains('Default')) {
    $config.default = if ($Default -eq 'On') { 1 } else { 0 }
  }

  $value = $current | ConvertTo-Json -Compress
  Write-Verbose "Setting $eAIRegPath\Policy to $value"

  if ($reg) {
    Set-ItemProperty -Path $eAIRegPath -Value $value -Name Policy -Force | Out-Null
  }
  else {
    New-ItemProperty -Path $eAIRegPath -Value $value -Name Policy -Force | Out-Null
  }

  $reg = Get-ItemProperty -Path $eAIRegPath -ErrorAction SilentlyContinue -Name Managed
  if ($reg) {
    $managed = $reg.Managed
  }
  else {
    $managed = 0
    Write-Verbose "Creating registry entry $eAIRegPath\Managed with default value $managed"
    New-ItemProperty -Path $eAIRegPath -Value $managed -Name Managed -Force | Out-Null
  }
  if ($managed -eq 0) {
    Write-Warning "eAI managed attribute has not been set. Refer to Set-HPeAIManaged function documentation on how to set it."
  }
}

<#
.SYNOPSIS
  Checks if Smart Experiences is supported on the current device

.DESCRIPTION
  This command checks if the BIOS setting "HP Smart Experiences" exists to determine if Smart Experiences is supported on the current device.

.EXAMPLE
  Test-HPSmartExperiencesIsSupported

.LINK
  [Get-HPeAISettingValue](https://developers.hp.com/hp-client-management/doc/Get-HPeAISettingValue)

.LINK
  [Set-HPeAISettingValue](https://developers.hp.com/hp-client-management/doc/Set-HPeAISettingValue)

.LINK
  [Set-HPeAIManaged](https://developers.hp.com/hp-client-management/doc/Set-HPeAIManaged)
#>
function Test-HPSmartExperiencesIsSupported {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Test-HPSmartExperiencesIsSupported")]
  param()

  [boolean]$status = $false
  try {
    $mode = (Get-HPBIOSSettingValue -Name "HP Smart Experiences")
    $status = $true
  }
  catch {}

  return $status
}

<#
.SYNOPSIS
  Retrieves the values of the specified HP eAI feature from the current device

.DESCRIPTION
  This command retrieves the values of the specified HP eAI feature where the feature must be from the current device. The feature must be either 'Privacy Alert' or 'Auto Screen Dimming'.

.PARAMETER Name
  Specifies the eAI feature to read. The value must be one of the following values:
  - Privacy Alert
  - Auto Screen Dimming

.EXAMPLE
  Get-HPeAISettingValue -Name 'Privacy Alert'

.EXAMPLE
  Get-HPeAISettingValue -Name 'Auto Screen Dimming'

.NOTES
  Admin privilege is required.

.LINK
  [Set-HPeAISettingValue](https://developers.hp.com/hp-client-management/doc/Set-HPeAISettingValue)

.LINK
  [Set-HPeAIManaged](https://developers.hp.com/hp-client-management/doc/Set-HPeAIManaged)
#>
function Get-HPeAISettingValue {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPeAISettingValue")]
  param(
    [Parameter(Mandatory = $true,Position = 0)]
    [ValidateSet('Privacy Alert','Auto Screen Dimming')]
    [string]$Name
  )
  $eAIFeatures = @{
    'Privacy Alert' = 'shoulderSurf'
    'Auto Screen Dimming' = 'attentionDim'
  }
  $eAIRegPath = 'HKLM:\Software\Policies\HP\SmartExperiences'

  if ((Test-HPSmartExperiencesIsSupported) -eq $false) {
    throw [System.NotSupportedException]"HP Smart Experiences is currently not supported on this platform."
  }

  Write-Verbose "Reading registry path $eAIRegPath\Policy"
  $reg = Get-ItemProperty -Path $eAIRegPath -ErrorAction SilentlyContinue -Name Policy
  if (-not $reg) {
    throw [System.InvalidOperationException]'HP eAI is not currently configured on your device.'
  }
  else {
    try {
      Write-Verbose "Data read: $($reg.Policy)"
      $current = $reg.Policy | ConvertFrom-Json
    }
    catch {
      throw [System.FormatException]"$($_.Exception.Message): Please ensure Policy property contains a valid JSON."
    }
    Write-Verbose "$($eAIFeatures[$Name]) selected"
    $config = $current.$($eAIFeatures[$Name])

    $reg = Get-ItemProperty -Path $eAIRegPath -ErrorAction SilentlyContinue -Name Managed
    if ($reg) {
      $managed = $reg.Managed
    }
    else {
      $managed = $false
    }
    Write-Verbose "Managed: $managed"

    return [ordered]@{
      Enabled = [bool]$config.isEnabled
      Default = if ($config.default -eq 1) { 'On' } else { 'Off' }
      AllowEdit = [bool]$config.allowEdit
    }
  }
}
# SIG # Begin signature block
