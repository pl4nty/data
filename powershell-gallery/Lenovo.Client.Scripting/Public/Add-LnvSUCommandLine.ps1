<#
  .SYNOPSIS
  Configure System Update AdminCommandLine

  .DESCRIPTION
  Run Script to set Admin command line Windows Registry settings for Lenovo System Update

  .PARAMETER Search
  Mandatory: True
  Data type: String
  Must be one of the following values [C, R, A]

  .PARAMETER Action
  Mandatory: True
  Data type: String
  Must be one of the following values [DOWNLOAD, INSTALL, LIST]

  .PARAMETER IncludereBootPackages
  Mandatory : False
  Data type: String
  Must be one of the following values [1, 3, 4, 5], or multiple values separated with a comma.
  1 = Update itself will force a reboot
  3 = Requires a reboot
  4 = Update itself will shut down the system after install
  5 = Within a 5 minute delay after installing one or more of these updates, will force a reboot

  .PARAMETER PackageTypes
  Mandatory : False
  Data type: String
  Must be one of the following values [0, 1, 2, 3, 4], or multiple values separated with a comma
  0 = Other
  1 = Application
  2 = Driver
  3 = BIOS
  4 = Firmware

  .PARAMETER NoReboot
  Mandatory : False
  Data type: Switch
  In normal operation, if System Update installs one or more Reboot Type 3 (Requires reboot)
  updates, it will initiate a reboot after the last installation completes. To suppress this
  reboot simply specify this parameter. This parameter only has an effect for Reboot Type 3
  packages. For Reboot Type 1 and 4, the reboot or shutdown is orchestrated by the update
  itself and is not under the control of System Update. For Reboot Type 5 packages a reboot
  must be executed immediately after the update and is forced by System Update.

  .PARAMETER NoIcon
  Mandatory : False
  Data type: Switch
  Suppresses the balloon tooltip from the notification area of the system tray.

  .PARAMETER RebootPrompt
  Mandatory : False
  Data type: Switch
  Forces the display of the reboot prompt dialog after installing updates
  that will require a restart. This parameter is only applicable when the -noicon
  parameter is used and the -noreboot parameter is NOT used. In this scenario,
  if the -rebootprompt parameter were not used, the system could be rebooted without
  any warning to the user.

  .PARAMETER Repository
  Mandatory : False
  Data type: String
  Must be a local folder path, a UNC file share path, or a URL to a web-hosted repository.
  If not specified, System Update will use the Lenovo Support servers.

  .PARAMETER ExportToWmi
  Mandatory : False
  Data type: Switch
  Causes System Update to store update history data in a WMI table:
  Root\Lenovo\Lenovo_Updates\


  .INPUTS

  .OUTPUTS

  .NOTES
  Read messages to determine the result of the script working.
#>
function Add-LnvSUCommandLine {
  param (
    [Parameter(Mandatory = $True)]
    [ValidateSet("C","R","A")]
    [string]$Search,

    [Parameter(Mandatory = $True)]
    [ValidateSet("DOWNLOAD","INSTALL","LIST")]
    [string]$Action,

    [Parameter(Mandatory = $False)]
    [string]$IncludeRebootPackages,

    [Parameter(Mandatory = $False)]
    [string]$PackageTypes,

    [Parameter(Mandatory = $False)]
    [switch]$NoReboot,

    [Parameter(Mandatory = $False)]
    [switch]$NoIcon,

    [Parameter(Mandatory = $False)]
    [switch]$RebootPrompt,

    [Parameter(Mandatory = $False)]
    [string]$Repository,

    [Parameter(Mandatory = $False)]
    [switch]$ExportToWmi
  )

  #region Common script block

  class RegistryEntry {
    [string]$Key
    [string]$Name
    [string]$ValueType
    [SimpleValue[]]$Value

    RegistryEntry(
      [string]$key,
      [string]$name,
      [string]$valueType,
      [SimpleValue[]]$value
    ) {
      $this.Key = $key
      $this.Name = $name
      $this.ValueType = $valueType
      $this.Value = $value
    }

    [String] ToString() {
      return $this.Key + " " + $this.Name
    }
  }

  class SimpleValue {
    [string]$Value

    SimpleValue(
      [string]$value
    ) {
      $this.Value = $value
    }

    [String] ToString() {
      return $this.Value
    }
  }

  class ParameterValue:SimpleValue {
    [string]$ParameterName

    ParameterValue(
      [string]$value,
      [string]$parameterName
    ):base($value) {
      $this.ParameterName = $parameterName
    }

    [String] ToString() {
      if ($this.Value) {
        return $this.ParameterName + " " + $this.Value
      }
      else {
        return $null
      }
    }
  }

  #endregion

  #region Parameters validation
  function Confirm-ParameterStringSet {
    [CmdletBinding()]
    param(
      [Parameter(Mandatory = $True)]
      [string[]]$AllowedValues,
      [Parameter(Mandatory = $True)]
      [AllowEmptyString()]
      [string]$Value,
      [Parameter(Mandatory = $True)]
      [string]$ErrorMessage
    )

    if ($Value) {
      $result = $AllowedValues.Contains($Value)

      if ($result -ne $True) {
        Write-LogError $ErrorMessage

        return
      }
    }
  }

  function Confirm-ParameterPattern {
    [CmdletBinding()]
    param(
      [Parameter(Mandatory = $True)]
      [string]$RegEx,
      [Parameter(Mandatory = $False)]
      [AllowEmptyString()]
      [string]$Value,
      [Parameter(Mandatory = $False)]
      [string]$ErrorMessage
    )

    if ($Value) {
      $result = $Value -match $RegEx

      if ($result -ne $True) {
        Write-LogError $ErrorMessage

        return
      }
    }
  }
  #endregion

  #region Registry
  function Add-RegistryEntry {
    [CmdletBinding()]
    param(
      [Parameter(Mandatory = $True)]
      [RegistryEntry]$RegistryEntry
    )

    $resultValues = @()

    foreach ($registryValue in $RegistryEntry.Value) {
      $tempValue = $registryValue.ToString()
      if ($tempValue) {
        $resultValues += $tempValue
      }
    }

    $valueString = $resultValues -join " "

    try {
      $keyExists = Confirm-RegistryKey -Key $RegistryEntry.Key
      if ($keyExists -ne $True) {
        New-Item $RegistryEntry.Key -Force -ErrorAction Stop | New-ItemProperty -Name $RegistryEntry.Name -Value $valueString -PropertyType $RegistryEntry.ValueType -Force -ErrorAction Stop | Out-Null
      }
      else {
        $registryKey = Get-Item $RegistryEntry.Key -ErrorAction Stop
        $registryKey | New-ItemProperty -Name $RegistryEntry.Name -Value $valueString -PropertyType $RegistryEntry.ValueType -Force -ErrorAction Stop | Out-Null
      }
    }
    catch {
      Write-LogError "An error occured while adding the $($RegistryEntry.Name) registryEntry:`n $_"
      return
    }
  }

  function Confirm-RegistryKey {
    [CmdletBinding()]
    param(
      [Parameter(Mandatory = $True)]
      [string]$Key
    )
    if (Get-Item $Key  -ErrorAction SilentlyContinue ) {
      return $True
    }
    else {
      return $False
    }
  }
  #endregion

  #region Messages
  function Write-LogError {
    Param(
      [Parameter(Mandatory = $True)]
      [string]$Message
    )

    Write-Output -InputObject ("[LDMM_ERROR_$((Get-Date).ToString("yyyy-MM-ddTHH:mm:ss"))]: $Message")
  }

  function Write-LogInformation {
    Param(
      [Parameter(Mandatory = $True)]
      [string]$Message
    )

    Write-Output -InputObject ("[LDMM_INFORMATION_$((Get-Date).ToString("yyyy-MM-ddTHH:mm:ss"))]: $Message")
  }
  #endregion

  function Test-ApplicationPath {
    [CmdletBinding()]
    param(
      [Parameter(Mandatory = $True)]
      [string]$Appx64Path,

      [Parameter(Mandatory = $True)]
      [string]$Appx86Path
    )

    $x64AppExists = Test-Path -Path $Appx64Path
    $x86AppExists = Test-Path -Path $Appx86Path

    if ($x64AppExists -ne $True -and $x86AppExists -ne $True) {
      return $False
    }

    return $True;
  }
  #endregion

  #region Custom script block
  function Confirm-Parameter{
    Confirm-ParameterStringSet -AllowedValues @('C', 'R', 'A') -Value $Search -ErrorMessage " Search param must be one of the following values [C, R, A]"
    Confirm-ParameterStringSet -AllowedValues @('DOWNLOAD', 'LIST', 'INSTALL') -Value $Action -ErrorMessage "Action param must be one of the following values [DOWNLOAD, LIST, INSTALL]"
    Confirm-ParameterPattern   -RegEx '^(1|3|4|5)?(?: *, *(1|3|4|5))*$' -Value $IncludeRebootPackages -ErrorMessage "IncludereBootPackages param must be one of the following values [1, 3, 4, 5], or multiple values separated with a comma"
    Confirm-ParameterPattern -RegEx '^[1-4](,[1-4])*$' -Value $PackageTypes -ErrorMessage "PackageTypes param must be one of the following values [0, 1, 2, 3, 4], or multiple values separated with a comma"
    Confirm-ParameterPattern -RegEx "^((?:~?\/)|(?:(?:\\\\\?\\)?[a-zA-Z]+\:))(?:\/?(.*))?$|\\\\[a-zA-Z0-9\.\-_]{1,}(\\[a-zA-Z0-9\-_]{1,}){1,}[\$]{0,1}|(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$" -Value $Repository -ErrorMessage "Repository param must be a local folder path, a UNC file share path, or a URL to a web-hosted repository"
  }

  Write-LogInformation "Script execution started."

  try {
    Confirm-Parameter

    $x64AppPath = Join-Path -Path $Env:Programfiles -ChildPath "Lenovo\System Update\tvsu.exe"
    $x86AppPath = Join-Path -Path ${Env:Programfiles(x86)} -ChildPath "Lenovo\System Update\tvsu.exe"

    $appPath = Test-ApplicationPath -Appx64Path $x64AppPath -Appx86Path $x86AppPath

    if (!$appPath) {
      Write-LogError "Lenovo System Update was not found at the default installation path."

      return
    }

    $startValue = [SimpleValue]::new('/CM')
    $searchValue = [ParameterValue]::new( $Search, '-search')
    $actionValue = [ParameterValue]::new( $Action, '-action')
    $IncludeRebootPackagesValue = [ParameterValue]::new( $IncludeRebootPackages, '-includerebootpackages')
    $packageTypesValue = [ParameterValue]::new( $PackageTypes, '-packagetypes')
    $noRebootValue = ''
    if ($NoReboot) {
      $noRebootValue = "-noreboot"
    }
    $noIconValue = ''
    if ($NoIcon) {
      $noIconValue = "-noicon"
    }

    $noLicenseValue = "-nolicense"

    $rebootPromtValue = ''
    if ($RebootPrompt) {
      $rebootPromtValue = "-rebootprompt"
    }

    $repositoryValue = [ParameterValue]::new( $Repository, '-repository')

    $exportToWmiValue = ''
    if ($ExportToWmi) {
      $exportToWmiValue = "-exporttowmi"
    }

    $registryEntry = [RegistryEntry]::new(
      'HKLM:\SOFTWARE\Policies\Lenovo\System Update\UserSettings\General',
      'AdminCommandLine',
      'String',
      @($startValue,
        $searchValue,
        $actionValue,
        $IncludeRebootPackagesValue,
        $packageTypesValue,
        $noRebootValue,
        $noIconValue,
        $noLicenseValue,
        $rebootPromtValue,
        $repositoryValue,
        $exportToWmiValue))

    Add-RegistryEntry $registryEntry

    Write-LogInformation "Script execution finished."
  }
  catch {
    Write-LogError "Unexpected error occurred:`n $_"

    return
  }
}
#endregion
# SIG # Begin signature block
