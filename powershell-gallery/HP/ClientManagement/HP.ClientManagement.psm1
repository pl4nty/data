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

using namespace HP.CMSLHelper

Add-Type -AssemblyName System.Web
Set-StrictMode -Version 3.0
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
  Retrieves an HP BIOS Setting object by name on the current device unless specified for another platform

.DESCRIPTION
  This command retrieves an HP BIOS Setting object by name on the current device unless specified for another platform.

.PARAMETER Name
  Specifies the name of the BIOS setting to retrieve. This parameter is mandatory and has no default value. 

.PARAMETER Format
  Specifies the format of the result. The value must be one of the following values: 

    - BCU: format as HP BIOS Config Utility input format
    - CSV: format as a comma-separated values list
    - XML: format as XML
    - JSON: format as JSON

  If not specified, the default PowerShell formatting is used.

.PARAMETER ComputerName
Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
  Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with

.NOTES
  HP BIOS is required.

.EXAMPLE
  Get-HPBIOSSetting -Name "Serial Number" -Format BCU
#>
function Get-HPBIOSSetting {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPBIOSSetting")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $true)]
    [Parameter(ParameterSetName = 'ReuseSession',Position = 0,Mandatory = $true)]
    $Name,
    [Parameter(ParameterSetName = 'NewSession',Position = 1,Mandatory = $false)]
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $false)]
    [ValidateSet('XML','JSON','BCU','CSV')]
    $Format,
    [Parameter(ParameterSetName = 'NewSession',Position = 2,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 3,Mandatory = $true)]
    [CimSession]$CimSession
  )

  $ns = getNamespace
  Write-Verbose "Reading HP BIOS Setting '$Name' from $ns on '$ComputerName'"
  $result = $null

  $params = @{
    Class = "HP_BIOSSetting"
    Namespace = $ns
    Filter = "Name='$name'"
  }

  if ($PSCmdlet.ParameterSetName -eq 'NewSession') {
    $params.CimSession = newCimSession -Target $ComputerName
  }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') {
    $params.CimSession = $CimSession
  }

  try {
    $result = Get-CimInstance @params -ErrorAction stop
  } catch [Microsoft.Management.Infrastructure.CimException]
  {
    if ($_.Exception.Message.trim() -eq "Access denied")
    {
      throw [System.UnauthorizedAccessException]"Access denied: Please ensure you have the rights to perform this operation."
    }
    throw [System.NotSupportedException]"$($_.Exception.Message): Please ensure this is a supported HP device."
  }


  if (-not $result) {
    $Err = "Setting not found: '" + $name + "'"
    throw [System.Management.Automation.ItemNotFoundException]$Err
  }
  Add-Member -InputObject $result -Force -NotePropertyName "Class" -NotePropertyValue $result.CimClass.CimClassName | Out-Null
  Write-Verbose "Retrieved HP BIOS Setting '$name' ok."

  switch ($format) {
    { $_ -eq 'CSV' } { return convertSettingToCSV ($result) }
    { $_ -eq 'XML' } { return convertSettingToXML ($result) }
    { $_ -eq 'BCU' } { return convertSettingToBCU ($result) }
    { $_ -eq 'JSON' } { return convertSettingToJSON ($result) }
    default { return $result }
  }
}


<#
 .SYNOPSIS
  Retrieves the device UUID via standard OS providers on the current device unless specified for another platform

.DESCRIPTION
  This command retrieves the system UUID via standard OS providers. The result should normally match the result from the Get-HPBIOSUUID command. 

.PARAMETER ComputerName
 Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
  Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with

.EXAMPLE
  Get-HPDeviceUUID
#>
function Get-HPDeviceUUID () {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPDeviceUUID")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $true)]
    [CimSession]$CimSession
  )
  $params = @{
    ClassName = 'Win32_ComputerSystemProduct'
    Namespace = 'root\cimv2'
  }
  if ($PSCmdlet.ParameterSetName -eq 'NewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') { $params.CimSession = $CimSession }
  $obj = Get-CimInstance @params -ErrorAction stop
  ([string](getWmiField $obj "UUID")).trim().ToUpper()
}


<#
 .SYNOPSIS
  Retrieves the BIOS UUID on the current device unless specified for another platform

.DESCRIPTION
  This command retrieves the system UUID from the BIOS. The result should normally match the result from the Get-HPDeviceUUID command. 

.PARAMETER ComputerName
Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
  Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.EXAMPLE
  Get-HPBIOSUUID
#>
function Get-HPBIOSUUID {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPBIOSUUID")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $true)]
    [CimSession]$CimSession
  )

  $params = @{ Name = 'Universally Unique Identifier (UUID)' }
  if ($PSCmdlet.ParameterSetName -eq 'NewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') { $params.CimSession = $CimSession }

  $obj = Get-HPBIOSSetting @params -ErrorAction stop
  if ($obj.Value -match '-') {
    return (getFormattedBiosSettingValue $obj)
  }
  else {
    $raw = ([guid]::new($obj.Value)).ToByteArray()
    $raw[0],$raw[3] = $raw[3],$raw[0]
    $raw[1],$raw[2] = $raw[2],$raw[1]
    $raw[4],$raw[5] = $raw[5],$raw[4]
    $raw[6],$raw[7] = $raw[7],$raw[6]
    return ([guid]::new($raw)).ToString().ToUpper().trim()
  }
}


<#
.SYNOPSIS
  Retrieves the current BIOS version on the current device unless specified for another platform

.DESCRIPTION
  This command retrieves the current BIOS version. If the BIOS family is available and the -includeFamily parameter is specified, the BIOS family is also included in the result. 

.PARAMETER IncludeFamily
  If specified, the BIOS family is included in the result. 

.PARAMETER ComputerName
 Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.

.PARAMETER CimSession
  Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.EXAMPLE
  Get-HPBIOSVersion
#>
function Get-HPBIOSVersion {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPBIOSVersion")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $false)]
    [Parameter(ParameterSetName = 'ReuseSession',Position = 0,Mandatory = $false)]
    [switch]$IncludeFamily,
    [Parameter(ParameterSetName = 'NewSession',Position = 1,Mandatory = $false)]
    [Parameter(Position = 1,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 2,Mandatory = $true)]
    [CimSession]$CimSession
  )

  $params = @{
    ClassName = 'Win32_BIOS'
    Namespace = 'root\cimv2'
  }
  if ($PSCmdlet.ParameterSetName -eq 'NewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') { $params.CimSession = $CimSession }
  $obj = Get-CimInstance @params -ErrorAction stop
  $verfield = getWmiField $obj "SMBIOSBIOSVersion"
  $ver = $null

  Write-Verbose "Received object with $verfield"
  try {
    $ver = extractBIOSVersion $verfield
  }
  catch { throw [System.InvalidOperationException]"The BIOS version on this system could not be parsed. This BIOS may not be supported." }
  if ($includeFamily.IsPresent) { $result = $ver + " " + $verfield.Split()[0] }
  else { $result = $ver }
  $result.TrimStart("0").trim()
}

<#
.SYNOPSIS
  Retrieves the current BIOS author (manufacturer) on the current device unless specified for another platform


.DESCRIPTION
  This command retrieves the BIOS manufacturer via the Win32_BIOS WMI class. In some cases, the BIOS manufacturer may be different from the device manufacturer.

.PARAMETER ComputerName
Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter. 

.PARAMETER CimSession
Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.EXAMPLE
  Get-HPBIOSAuthor
#>
function Get-HPBIOSAuthor {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPBIOSAuthor")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $true)]
    [CimSession]$CimSession
  )
  $params = @{
    ClassName = 'Win32_BIOS'
    Namespace = 'root\cimv2'
  }
  if ($PSCmdlet.ParameterSetName -eq 'NewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') { $params.CimSession = $CimSession }
  $obj = Get-CimInstance @params -ErrorAction stop
  ([string](getWmiField $obj "Manufacturer")).trim()

}

<#
.SYNOPSIS
  Retrieves the current device manufacturer on the current device unless specified for another platform 

.PARAMETER ComputerName
Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
  Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.DESCRIPTION
  This command retrieves the current device manufacturer on the current device unless specified for another platform via Windows Management Instrumentation (WMI). In some cases, the BIOS manufacturer may be different from the device manufacturer.

.EXAMPLE
  Get-HPDeviceManufacturer
#>
function Get-HPDeviceManufacturer {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPDeviceManufacturer")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $true)]
    [CimSession]$CimSession
  )
  $params = @{
    ClassName = 'Win32_ComputerSystem'
    Namespace = 'root\cimv2'
  }
  if ($PSCmdlet.ParameterSetName -eq 'NewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') { $params.CimSession = $CimSession }
  $obj = Get-CimInstance @params -ErrorAction stop
  ([string](getWmiField $obj "Manufacturer")).trim()
}

<#
.SYNOPSIS
  Retrieves the serial number on the current device unless specified for another platform

.DESCRIPTION
This command retrieves the serial number on the current device unless specified for another platform via Windows Management Instrumentation (WMI). This command is equivalent to reading the SerialNumber property from the Win32_BIOS WMI class. If no parameters are specified, this command will create its own one-time-use CIMSession object using the current device and default the CIMSession to use DCOM protocol.

.PARAMETER ComputerName
Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.EXAMPLE
  Get-HPDeviceSerialNumber
#>
function Get-HPDeviceSerialNumber {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPDeviceSerialNumber")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $true)]
    [CimSession]$CimSession
  )
  $params = @{
    ClassName = 'Win32_BIOS'
    Namespace = 'root\cimv2'
  }
  if ($PSCmdlet.ParameterSetName -eq 'NewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') { $params.CimSession = $CimSession }
  $obj = Get-CimInstance @params -ErrorAction stop

  ([string](getWmiField $obj "SerialNumber")).trim()
}

<#
.SYNOPSIS
  Retrieves the official marketing name of the current device unless specified for another platform

.DESCRIPTION
  This command retrieves the official marketing name of the current device unless specified for another platform. 

.PARAMETER ComputerName
Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.EXAMPLE
  Get-HPDeviceModel
#>
function Get-HPDeviceModel {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPDeviceModel")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $true)]
    [CimSession]$CimSession
  )
  $params = @{
    ClassName = 'Win32_ComputerSystem'
    Namespace = 'root\cimv2'
  }

  if ($PSCmdlet.ParameterSetName -eq 'NewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') { $params.CimSession = $CimSession }
  $obj = Get-CimInstance @params -ErrorAction stop

  ([string](getWmiField $obj "Model")).trim()
}




<#
.SYNOPSIS
  Retrieves the Part Number (or SKU) on the current device unless specified for another platform

.PARAMETER ComputerName
Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
 Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.DESCRIPTION
  This command retrieves the Part Number (or SKU) on the current device unless specified for another platform. This command is equivalent to reading the field SystemSKUNumber from the WMI class Win32_ComputerSystem.

.EXAMPLE
  Get-HPDevicePartNumber
#>
function Get-HPDevicePartNumber {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPDevicePartNumber")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $true)]
    [CimSession]$CimSession
  )
  $params = @{
    ClassName = 'Win32_ComputerSystem'
    Namespace = 'root\cimv2'
  }

  if ($PSCmdlet.ParameterSetName -eq 'NewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') { $params.CimSession = $CimSession }
  $obj = Get-CimInstance @params -ErrorAction stop

  ([string](getWmiField $obj "SystemSKUNumber")).trim().ToUpper()
}


<#
.SYNOPSIS
  Retrieves the product ID of the current device unless specified for another platform

.DESCRIPTION
  This command retrieves the product ID of the current device unless specified for another platform. The product ID (Platform ID) is a 4-character hexadecimal string. It corresponds to the Product field in the Win32_BaseBoard WMI class.

.PARAMETER ComputerName
Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
  Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.EXAMPLE
  Get-HPDeviceProductID
#>
function Get-HPDeviceProductID {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPDeviceProductID")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $true)]
    [CimSession]$CimSession
  )
  $params = @{
    ClassName = 'Win32_BaseBoard'
    Namespace = 'root\cimv2'
  }

  if ($PSCmdlet.ParameterSetName -eq 'NewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') { $params.CimSession = $CimSession }

  $obj = Get-CimInstance @params -ErrorAction stop
  ([string](getWmiField $obj "Product")).trim().ToUpper()
}


<#
.SYNOPSIS
  Retrieves the device asset tag of the current device unless specified for another platform

.DESCRIPTION
  This command retrieves the asset tag (also called the Asset Tracking Number) for a device. Some computers may have a blank asset tag or have the asset tag pre-populated with the serial number.

.PARAMETER ComputerName
 Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command.  The alias 'Target' can also be used for this parameter. 

.PARAMETER CimSession
  Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.EXAMPLE
  Get-HPDeviceAssetTag
#>
function Get-HPDeviceAssetTag {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPDeviceAssetTag")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $true)]
    [CimSession]$CimSession
  )

  $params = @{
    Name = 'Asset Tracking Number'
  }
  if ($PSCmdlet.ParameterSetName -eq 'NewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') { $params.CimSession = $CimSession }

  $obj = Get-HPBIOSSetting @params -ErrorAction stop
  getFormattedBiosSettingValue $obj
}


<#
.SYNOPSIS
  Retrieves the value of a BIOS setting on the current device unless specified for another platform

.DESCRIPTION
  This command retrieves the value of a BIOS setting on the current device unless specified for another platform. In comparison to the Get-HPBIOSSetting command that retrieves all fields for the BIOS setting, this command retrieves only the setting's value.

.NOTES
  HP BIOS is required. 

.PARAMETER name
  Specifies the name of the BIOS setting to retrieve

.PARAMETER ComputerName
 Specifies a target computer to execute this command. If not specified, this command is executed on the local computer. The alias 'Target' can also be used for this parameter. 

.PARAMETER CimSession
 Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.EXAMPLE
  Get-HPBIOSSettingValue -Name 'Asset Tracking Number'
#>
function Get-HPBIOSSettingValue {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPBIOSSettingValue")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $true)]
    [Parameter(ParameterSetName = 'ReuseSession',Position = 0,Mandatory = $true)]
    [string]$Name,
    [Parameter(ParameterSetName = 'NewSession',Position = 1,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 2,Mandatory = $false)]
    [CimSession]$CimSession
  )
  $params = @{
    Name = $Name
  }
  if ($PSCmdlet.ParameterSetName -eq 'NewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') { $params.CimSession = $CimSession }

  $obj = Get-HPBIOSSetting @params
  if ($obj) {
    getFormattedBiosSettingValue $obj
  }


}


<#
.SYNOPSIS
  Retrieves all BIOS settings on the current device unless specified for another platform

.DESCRIPTION
  This command retrieves all BIOS settings on the current device unless specified for another platform as native objects or in a specified format.

.PARAMETER ComputerName
 Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER Format
  Specifies the format of the result. The value must be one of the following values: 

    - BCU: format as HP BIOS Config Utility input format
    - CSV: format as a comma-separated values list
    - XML: format as XML
    - JSON: format as JSON
    - brief: (default) format as a list of names

  If not specified, the default PowerShell formatting is used.

.PARAMETER NoReadonly
  If specified, this command will not include read-only settings in the result.

.PARAMETER CimSession
 Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.EXAMPLE
  Get-HPBIOSSettingsList -Format BCU

.NOTES
  - Although this command supports HP BIOS Config Utility (BCU), note that redirecting the command's output to a file will not be usable by BCU, because PowerShell will insert a unicode BOM in the file. To obtain a compatible file, either remove the BOM manually or use bios-cli.ps1.
  - BIOS settings of type 'password' are not outputted when using XML, JSON, BCU, or CSV formats.
  - By convention, when representing multiple values in an enumeration as a single string, the value with an asterisk in front is the currently active value. For example, given the string "One,*Two,Three" representing three possible enumeration choices, the current active value is "Two".
  - Requires HP BIOS.
#>
function Get-HPBIOSSettingsList {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPBIOSSettingsList")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $false)]
    [Parameter(ParameterSetName = 'ReuseSession',Position = 0,Mandatory = $false)]
    [Parameter(Position = 0,Mandatory = $false)]
    [ValidateSet('XML','JSON','BCU','CSV','brief')]
    [string]$Format,
    [Parameter(ParameterSetName = 'NewSession',Position = 1,Mandatory = $false)]
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $false)]
    [Parameter(Position = 1,Mandatory = $false)] [switch]$NoReadonly,
    [Parameter(ParameterSetName = 'NewSession',Position = 2,Mandatory = $false)]
    [Alias('Target')]
    [Parameter(Position = 2,Mandatory = $false)] [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 3,Mandatory = $false)]
    [Parameter(Position = 3,Mandatory = $false)] [CimSession]$CimSession
  )
  $ns = getNamespace

  Write-Verbose "Getting all BIOS settings from '$ComputerName'"
  $params = @{
    ClassName = 'HP_BIOSSetting'
    Namespace = $ns
  }

  if ($PSCmdlet.ParameterSetName -eq 'NewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') { $params.CimSession = $CimSession }

  try {
    $cs = Get-CimInstance @params -ErrorAction stop
  }
  catch [Microsoft.Management.Infrastructure.CimException]{
    if ($_.Exception.Message.trim() -eq "Access denied")
    {
      throw [System.UnauthorizedAccessException]"Access denied: Please ensure you have the rights to perform this operation."
    }
    throw [System.NotSupportedException]"$($_.Exception.Message): Please ensure this is a supported HP device."
  }

  switch ($format) {
    { $_ -eq 'BCU' } {
      # to BCU format
      $now = Get-Date
      Write-Output "BIOSConfig 1.0"
      Write-Output ";"
      Write-Output ";     Created by CMSL function Get-HPBIOSSettingsList"
      Write-Output ";     Date=$now"
      Write-Output ";"
      Write-Output ";     Found $($cs.count) settings"
      Write-Output ";"
      foreach ($c in $cs) {
        if ($c.CimClass.CimClassName -ne "HPBIOS_BIOSPassword") {
          if ((-not $noreadonly.IsPresent) -or ($c.IsReadOnly -eq 0)) {
            convertSettingToBCU ($c)
          }
        }
      }
      return
    }

    { $_ -eq 'XML' } {
      # to IA format
      Write-Output "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes"" ?>"
      Write-Output "<ImagePal>"
      Write-Output "  <BIOSSettings>"

      foreach ($c in $cs) {
        if ($c.CimClass.CimClassName -ne "HPBIOS_BIOSPassword") {
          if ((-not $noreadonly.IsPresent) -or ($c.IsReadOnly -eq 0)) {
            convertSettingToXML ($c)
          }
        }
      }
      Write-Output "  </BIOSSettings>"
      Write-Output "</ImagePal>"
      return
    }

    { $_ -eq 'JSON' } {
      # to JSON format
      $first = $true
      "[" | Write-Output


      foreach ($c in $cs) {
        Add-Member -InputObject $c -Force -NotePropertyName "Class" -NotePropertyValue $c.CimClass.CimClassName | Out-Null

        if ($c.CimClass.CimClassName -ne "HPBIOS_BIOSPassword") {
          if ((-not $noreadonly.IsPresent) -or ($c.IsReadOnly -eq 0)) {
            if ($first -ne $true) {
              Write-Output ","
            }
            convertSettingToJSON ($c)
            $first = $false
          }
        }

      }
      "]" | Write-Output

    }

    { $_ -eq 'CSV' } {
      # to CSV format
      Write-Output ("NAME,CURRENT_VALUE,READONLY,TYPE,PHYSICAL_PRESENCE_REQUIRED,MIN,MAX,");
      foreach ($c in $cs) {
        if ($c.CimClass.CimClassName -ne "HPBIOS_BIOSPassword") {
          if ((-not $noreadonly.IsPresent) -or ($c.IsReadOnly -eq 0)) {
            convertSettingToCSV ($c)
          }
        }
      }
      return
    }
    { $_ -eq 'brief' } {
      foreach ($c in $cs) {
        if ((-not $noreadonly.IsPresent) -or ($c.IsReadOnly -eq 0)) {
          Write-Output $c.Name
        }
      }
      return
    }
    default {
      if (-not $noreadonly.IsPresent) {
        return $cs
      }
      else {
        return $cs | Where-Object IsReadOnly -EQ 0
      }
    }
  }
}


<#
.SYNOPSIS
  This is a private function for internal use only

.DESCRIPTION
  This is a private function for internal use only

.EXAMPLE

.NOTES
  - This is a private function for internal use only
#>
function Set-HPPrivateBIOSSettingValuePayload {
  param(
    [Parameter(ParameterSetName = 'Payload',Position = 0,Mandatory = $true,ValueFromPipeline = $true)]
    [string]$Payload
  )

  $portable = $Payload | ConvertFrom-Json

  if ($portable.purpose -ne "hp:sureadmin:biossetting") {
    throw "The payload should be generated by New-HPSureAdminBIOSSettingValuePayload function"
  }

  [SureAdminSetting]$setting = [System.Text.Encoding]::UTF8.GetString($portable.Data) | ConvertFrom-Json

  Set-HPPrivateBIOSSetting -Setting $setting
}

<#
.SYNOPSIS
  Sets the value of a BIOS setting on the current device unless specified for another platform

.DESCRIPTION
  This command sets the value of a BIOS setting on the current device unless specified for another platform. Note that some BIOS settings may have various constraints restricting the input that can be provided.

.PARAMETER Name
  Specifies the name of a BIOS setting to set. Note that the setting name is usually case sensitive.

.PARAMETER Value
  Specifies the new value for the BIOS setting specified in the -Name parameter 

.PARAMETER ComputerName
Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER Password
  Specifies the setup password, if any

.PARAMETER CimSession
  Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.PARAMETER SkipPrecheck
  If specified, this command skips reading the setting value from the BIOS before applying the new value. This parameter is used for optimization purposes when the setting is guaranteed to exist on the system, or when preparing an HP Sure Admin platform for a remote platform which may contain settings not present on the local platform.

.NOTES
  - Requires HP BIOS.
  - Use single quotes around the password to prevent PowerShell from interpreting special characters in the string.
  - By convention, when representing multiple values in an enumeration as a single string, the value with an asterisk in front is the currently active value. For example, given the string "One,*Two,Three" representing three possible enumeration choices, the current active value is "Two".

.EXAMPLE
  Set-HPBIOSSettingValue -Name "Asset Tracking Number" -Value "Hello World" -password 's3cr3t'
#>
function Set-HPBIOSSettingValue {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Set-HPBIOSSettingValue")]
  param(
    [Parameter(ParameterSetName = "NewSession",Position = 0,Mandatory = $false)]
    [Parameter(ParameterSetName = "ReuseSession",Position = 0,Mandatory = $false)]
    [AllowEmptyString()]
    [string]$Password,

    [Parameter(ParameterSetName = "NewSession",Position = 1,Mandatory = $true)]
    [Parameter(ParameterSetName = "ReuseSession",Position = 1,Mandatory = $true)]
    [string]$Name,

    [Parameter(ParameterSetName = "NewSession",Position = 2,Mandatory = $true)]
    [Parameter(ParameterSetName = "ReuseSession",Position = 2,Mandatory = $true)]
    [AllowEmptyString()]
    [string]$Value,

    [Parameter(ParameterSetName = "NewSession",Position = 3,Mandatory = $false)]
    [Parameter(ParameterSetName = "ReuseSession",Position = 3,Mandatory = $false)]
    [switch]$SkipPrecheck,

    [Parameter(ParameterSetName = 'NewSession',Position = 4,Mandatory = $false)]
    [Alias('Target')]
    $ComputerName = ".",

    [Parameter(ParameterSetName = 'ReuseSession',Position = 4,Mandatory = $true)]
    [CimSession]$CimSession
  )

  [SureAdminSetting]$setting = New-Object -TypeName SureAdminSetting
  $setting.Name = $Name
  $setting.Value = $Value

  $params = @{
    Setting = $setting
    Password = $Password
    CimSession = $CimSession
    ComputerName = $ComputerName
    SkipPrecheck = $SkipPrecheck
  }
  Set-HPPrivateBIOSSetting @params
}

<#
.SYNOPSIS
  Checks if the BIOS Setup password is set on the current device unless specified for another platform

.DESCRIPTION
  This command returns $true if a BIOS password is currently active, or $false otherwise.

.PARAMETER ComputerName
 Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
  Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.NOTES
  Requires HP BIOS.

.EXAMPLE
  Get-HPBIOSSetupPasswordIsSet

.LINK
  [Set-HPBIOSSetupPassword](https://developers.hp.com/hp-client-management/doc/Set-HPBIOSSetupPassword)

.LINK
  [Get-HPBIOSSetupPasswordIsSet](https://developers.hp.com/hp-client-management/doc/Get-HPBIOSSetupPasswordIsSet)
#>
function Get-HPBIOSSetupPasswordIsSet () {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPBIOSSetupPasswordIsSet")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $true)]
    [CimSession]$CimSession

  )
  $params = @{ Name = "Setup Password" }
  if ($PSCmdlet.ParameterSetName -eq 'NewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') { $params.CimSession = $CimSession }

  $obj = Get-HPBIOSSetting @params
  return [boolean]$obj.IsSet
}

<#
.SYNOPSIS
  Sets the BIOS Setup password on the current device unless specified for another platform

.DESCRIPTION
  This command sets the BIOS Setup password to a new password. The password must comply with the current active security policy.

.PARAMETER NewPassword
  Specifies the new password. To clear the password, use the Clear-HPBIOSSetupPassword command instead. 

.PARAMETER Password
  Specifies the existing setup password, if any. If there is a password set, this parameter is required. If there is no password set, providing a value to this parameter has no effect on the outcome. Use the Get-HPBIOSSetupPasswordIsSet command to determine if a password is currently set.

.PARAMETER ComputerName
Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
  Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.EXAMPLE
  Set-HPBIOSSetupPassword -NewPassword 'newpassword' -Password 'oldpassword'

.LINK
  [Clear-HPBIOSSetupPassword](https://developers.hp.com/hp-client-management/doc/Clear-HPBIOSSetupPassword)

.LINK
  [Get-HPBIOSSetupPasswordIsSet](https://developers.hp.com/hp-client-management/doc/Get-HPBIOSSetupPasswordIsSet)

.NOTES
  - Requires HP BIOS.
  - Use single quotes around the password to prevent PowerShell from interpreting special characters in the string.
  - Multiple attempts to change the password with an incorrect existing password may trigger BIOS lockout mode, which can be cleared by rebooting the system.
#>
function Set-HPBIOSSetupPassword {
  [CmdletBinding(DefaultParameterSetName = 'NoPassthruNewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/set-HPBIOSSetupPassword")]
  param(
    [Parameter(ParameterSetName = 'NoPassthruNewSession',Position = 0,Mandatory = $true)]
    [Parameter(ParameterSetName = 'NoPassthruReuseSession',Position = 0,Mandatory = $true)]
    [string]$NewPassword,

    [Parameter(ParameterSetName = 'NoPassthruNewSession',Position = 1,Mandatory = $false)]
    [Parameter(ParameterSetName = 'NoPassthruReuseSession',Position = 1,Mandatory = $false)]
    [string]$Password,


    [Parameter(ParameterSetName = 'NoPassthruNewSession',Position = 2,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",

    [Parameter(ParameterSetName = 'NoPassthruReuseSession',Position = 3,Mandatory = $true)]
    [CimSession]$CimSession
  )
  $params = @{}
  $settingName = 'Setup Password'

  # if password is set but no Password parameter is provided, throw an error
  if ((Get-HPBIOSSetupPasswordIsSet) -and (-not $Password)) {
    throw [System.ArgumentException]'There is a BIOS Setup password currently set. Please provide it via the -Password parameter to set a new password.'
  }

  if ($PSCmdlet.ParameterSetName -eq 'NoPassthruNewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'NoPassthruReuseSession') { $params.CimSession = $CimSession }

  $iface = getBiosSettingInterface @params

  $r = $iface | Invoke-CimMethod -ErrorAction Stop -MethodName 'SetBIOSSetting' -Arguments @{
    Name = $settingName
    Password = '<utf-16/>' + $Password
    Value = '<utf-16/>' + $newPassword
  }

  if ($r.Return -ne 0) {
    $Err = "$(biosErrorCodesToString($r.Return))"
    throw [System.InvalidOperationException]$Err
  }
}

<#
.SYNOPSIS
  Clears the BIOS Setup password on the current device unless specified for another platform

.DESCRIPTION
  This command clears the BIOS setup password on the current device unless specified for another platform. To set the password, use the Set-HPBIOSSetupPassword command. 

.PARAMETER Password
  Specifies the existing setup password. Use the Get-HPBIOSSetupPasswordIsSet command to determine if a password is currently set.

.PARAMETER ComputerName
Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.EXAMPLE
  Clear-HPBIOSSetupPassword  -Password 'currentpassword'

.NOTES
  - Requires HP BIOS.
  - Use single quotes around the password to prevent PowerShell from interpreting special characters in the string.
  - Multiple attempts to change the password with an incorrect existing password may trigger BIOS lockout mode. BIOS lockout mode can be cleared by rebooting the system.

.LINK
  [Set-HPBIOSSetupPassword](https://developers.hp.com/hp-client-management/doc/Set-HPBIOSSetupPassword)

.LINK
  [Get-HPBIOSSetupPasswordIsSet](https://developers.hp.com/hp-client-management/doc/Get-HPBIOSSetupPasswordIsSet)
#>
function Clear-HPBIOSSetupPassword {
  [CmdletBinding(DefaultParameterSetName = 'NoPassthruNewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Clear-HPBIOSSetupPassword")]
  param(
    [Parameter(ParameterSetName = 'NoPassthruNewSession',Position = 0,Mandatory = $true)]
    [Parameter(ParameterSetName = 'NoPassthruReuseSession',Position = 0,Mandatory = $true)]
    [string]$Password,

    [Parameter(ParameterSetName = 'NoPassthruNewSession',Position = 1,Mandatory = $false)]
    [Alias('Target')]
    $ComputerName = ".",
    [Parameter(ParameterSetName = 'NoPassthruReuseSession',Position = 2,Mandatory = $true)]
    [CimSession]$CimSession
  )
  $settingName = 'Setup Password'


  $params = @{}
  if ($PSCmdlet.ParameterSetName -eq 'NoPassthruNewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'NoPassthruReuseSession') { $params.CimSession = $CimSession }

  $iface = getBiosSettingInterface @params
  $r = $iface | Invoke-CimMethod -MethodName SetBiosSetting -Arguments @{ Name = "Setup Password"; Value = "<utf-16/>"; Password = "<utf-16/>" + $Password; }
  if ($r.Return -ne 0) {
    $Err = "$(biosErrorCodesToString($r.Return))"
    throw [System.InvalidOperationException]$Err
  }
}


<#
.SYNOPSIS
  Checks if the BIOS Power-On password is set on the current device unless specified for another platform

.DESCRIPTION
  This command returns $true if a BIOS power-on password is currently active, or $false otherwise.

.PARAMETER ComputerName
Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
  Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.NOTES
  Changes in the state of the BIOS Power-On Password may not be visible until the system is rebooted and the POST prompt regarding the BIOS Power-On password is accepted. 

.EXAMPLE
  Get-HPBIOSPowerOnPasswordIsSet

.LINK
  [Set-HPBIOSPowerOnPassword](https://developers.hp.com/hp-client-management/doc/Set-HPBIOSPowerOnPassword)

.LINK
  [Clear-HPBIOSPowerOnPassword](https://developers.hp.com/hp-client-management/doc/Clear-HPBIOSPowerOnPassword)
#>
function Get-HPBIOSPowerOnPasswordIsSet () {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPBIOSPowerOnPasswordIsSet")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $true)]
    [CimSession]$CimSession

  )
  $params = @{ Name = "Power-On Password" }
  if ($PSCmdlet.ParameterSetName -eq 'NewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') { $params.CimSession = $CimSession }

  $obj = Get-HPBIOSSetting @params
  return [boolean]$obj.IsSet
}

<#
.SYNOPSIS
  Sets the BIOS Power-On password on the current device unless specified for another platform

.DESCRIPTION
  This command sets the BIOS Power-On password on the current device unless specified for another platform. The password must comply with password complexity requirements active on the system.

.PARAMETER NewPassword
  Specifies a new password for the BIOS Power-On password. To clear the password, use the Clear-HPBIOSPowerOnPassword command instead. 

.PARAMETER Password
  Specifies the existing BIOS Setup password (not Power-On password), if any. If there is no BIOS Setup password set, this parameter may be omitted. Use the Get-HPBIOSSetupPasswordIsSet command to determine if a setup password is currently set.

.PARAMETER ComputerName
Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
  Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with

.EXAMPLE
  Set-HPBIOSPowerOnPassword -NewPassword 'newpassword' -Password 'setuppassword'

.LINK
  [Clear-HPBIOSPowerOnPassword](https://developers.hp.com/hp-client-management/doc/Clear-HPBIOSPowerOnPassword)

.LINK
  [Get-HPBIOSPowerOnPasswordIsSet](https://developers.hp.com/hp-client-management/doc/Get-HPBIOSPowerOnPasswordIsSet)

.NOTES
  - Requires HP BIOS.
  - Use single quotes around the password to prevent PowerShell from interpreting special characters in the string.
  - On many platform families, changing the Power-On password requires that a BIOS password is active.
  - Changes in the state of the BIOS Power-On Password may not be visible until the system is rebooted and the POST prompt regarding the BIOS Power-On password is accepted. 

#>
function Set-HPBIOSPowerOnPassword {
  [CmdletBinding(DefaultParameterSetName = 'NoPassthruNewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Set-HPBIOSPowerOnPassword")]
  param(
    [Parameter(ParameterSetName = 'NoPassthruNewSession',Position = 0,Mandatory = $true)]
    [Parameter(ParameterSetName = 'NoPassthruReuseSession',Position = 0,Mandatory = $true)]
    [string]$NewPassword,
    [Parameter(ParameterSetName = 'NoPassthruNewSession',Position = 1,Mandatory = $false)]
    [Parameter(ParameterSetName = 'NoPassthruReuseSession',Position = 1,Mandatory = $false)]
    [string]$Password,

    [Parameter(ParameterSetName = 'NoPassthruNewSession',Position = 3,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'NoPassthruReuseSession',Position = 4,Mandatory = $true)]
    [CimSession]$CimSession
  )
  $settingName = 'Power-On Password'

  $params = @{}
  if ($PSCmdlet.ParameterSetName -eq 'NoPassthruNewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'NoPassthruReuseSession') { $params.CimSession = $CimSession }

  $iface = getBiosSettingInterface @params
  $r = $iface | Invoke-CimMethod -MethodName SetBiosSetting -Arguments @{ Name = $settingName; Value = "<utf-16/>" + $newPassword; Password = "<utf-16/>" + $Password; }
  if ($r.Return -ne 0) {
    $Err = "$(biosErrorCodesToString($r.Return))"
    throw $Err
  }
}

<#
.SYNOPSIS
  Clears the BIOS Power-On password on the current device unless specified for another platform

.DESCRIPTION
  This command clears any active power-on password on the current device unless specified for another platform.

.PARAMETER Password
  Specifies the existing setup (not power-on) password. Use the Get-HPBIOSSetupPasswordIsSet command to determine if a password is currently set. See important note regarding the BIOS Setup Password prerequisite below.

.PARAMETER ComputerName
  Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
  Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.EXAMPLE
  Clear-HPBIOSPowerOnPassword -Password 's3cr3tpassword'

.LINK
  [Set-HPBIOSPowerOnPassword](https://developers.hp.com/hp-client-management/doc/Set-HPBIOSPowerOnPassword)

.LINK
  [Get-HPBIOSPowerOnPasswordIsSet](https://developers.hp.com/hp-client-management/doc/Get-HPBIOSPowerOnPasswordIsSet)

.LINK
  [Get-HPBIOSSetupPasswordIsSet](https://developers.hp.com/hp-client-management/doc/Get-HPBIOSSetupPasswordIsSet)

.NOTES
  - Requires HP BIOS.
  - Use single quotes around the password to prevent PowerShell from interpreting special characters in the string.
  - For many platform families, an active BIOS password is required to change the Power-On password. If BIOS Setup password is not set, set the BIOS Setup password before using this command. 

#>
function Clear-HPBIOSPowerOnPassword {
  [CmdletBinding(DefaultParameterSetName = 'NoPassthruNewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Clear-HPBIOSPowerOnPassword")]
  param(
    [Parameter(ParameterSetName = 'NoPassthruNewSession',Position = 0,Mandatory = $false)]
    [Parameter(ParameterSetName = 'NoPassthruReuseSession',Position = 0,Mandatory = $false)]
    [string]$Password,


    [Parameter(ParameterSetName = 'NoPassthruNewSession',Position = 1,Mandatory = $false)]
    [Alias('Target')]
    $ComputerName = ".",
    [Parameter(ParameterSetName = 'NoPassthruReuseSession',Position = 2,Mandatory = $true)]
    [CimSession]$CimSession
  )

  $settingName = 'Power-On Password'


  $params = @{}
  if ($PSCmdlet.ParameterSetName -eq 'NoPassthruNewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'NoPassthruReuseSession') { $params.CimSession = $CimSession }

  $iface = getBiosSettingInterface @params
  $r = $iface | Invoke-CimMethod -MethodName SetBiosSetting -Arguments @{
    Name = "Power-On Password"
    Value = "<utf-16/>"
    Password = ("<utf-16/>" + $Password)
  }
  if ($r.Return -ne 0) {
    $Err = "$(biosErrorCodesToString($r.Return))"
    throw [System.InvalidOperationException]$Err
  }
}

<#
.SYNOPSIS
  Sets one or more BIOS settings from a file on the current device unless specified for another platform

.DESCRIPTION
  This command sets multiple BIOS settings from a file on the current device unless specified for another platform. The file format may be specified via the -Format parameter; however, this command will try to infer the format from the file extension.

.PARAMETER File
  Specifies the file to process. This parameter can take in both a relative path and an absolute path. Note that BIOS passwords are not encrypted in this file. Protect the file contents until applied to the target system.

.PARAMETER Format
  Specifies the format of the input file in the File parameter. The value must be one of the following values: 
    - BCU
    - CSV
    - XML
    - JSON

  If not specified, this command will attempt to deduce the format from the file extension and parse accordingly. 

.PARAMETER Password
  Specifies the current BIOS setup password, if any.

.PARAMETER NoSummary
  If specified, this command suppresses the one line summary at the end of the import.

.PARAMETER ErrorHandling
  Specifies the type of error handling this command will use. The value must be one of the following values: 
    0 - operate normally
    1 - raise exceptions as warnings
    2 - no warnings or exceptions, fail silently

.PARAMETER ComputerName
Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
  Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.EXAMPLE
  Set-HPBIOSSettingValuesFromFile -File .\file.bcu -NoSummary

.NOTES
  - Requires HP BIOS.
  - Use single quotes around the password to prevent PowerShell from interpreting special characters in the string.
#>
function Set-HPBIOSSettingValuesFromFile {
  [CmdletBinding(DefaultParameterSetName = "NotPassThruNewSession",
    HelpUri = "https://developers.hp.com/hp-client-management/doc/Set-HPBIOSSettingValuesFromFile")]
  param(
    [Parameter(ParameterSetName = "NotPassThruNewSession",Position = 0,Mandatory = $true)]
    [Parameter(ParameterSetName = "NotPassThruReuseSession",Position = 0,Mandatory = $true)]
    [System.IO.FileInfo]$File,

    [Parameter(ParameterSetName = "NotPassThruNewSession",Position = 1,Mandatory = $false)]
    [Parameter(ParameterSetName = "NotPassThruReuseSession",Position = 1,Mandatory = $false)]
    [ValidateSet('XML','JSON','BCU','CSV')]
    [string]$Format = $null,

    [Parameter(ParameterSetName = "NotPassThruNewSession",Position = 2,Mandatory = $false)]
    [Parameter(ParameterSetName = "NotPassThruReuseSession",Position = 2,Mandatory = $false)]
    [string]$Password,

    [Parameter(ParameterSetName = "NotPassThruNewSession",Position = 3,Mandatory = $false)]
    [Parameter(ParameterSetName = "NotPassThruReuseSession",Position = 3,Mandatory = $false)]
    [switch]$NoSummary,

    [Parameter(ParameterSetName = "NotPassThruNewSession",Position = 4,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",

    [Parameter(ParameterSetName = "NotPassThruNewSession",Position = 5,Mandatory = $false)]
    [Parameter(ParameterSetName = "NotPassThruReuseSession",Position = 5,Mandatory = $false)]
    $ErrorHandling = 2,

    [Parameter(ParameterSetName = "NotPassThruReuseSession",Position = 6,Mandatory = $true)]
    [CimSession]$CimSession
  )

  if (-not $Format) {
    $Format = (Split-Path -Path $File -Leaf).Split(".")[1].ToLower()
    Write-Verbose "Format from file extension: $Format"
  }

  Write-Verbose "Format specified: '$Format'. Reading file..."
  [System.Collections.Generic.List[SureAdminSetting]]$settingsList = Get-HPPrivateSettingsFromFile -FileName $File -Format $Format

  $params = @{
    SettingsList = $settingsList
    ErrorHandling = $ErrorHandling
    ComputerName = $ComputerName
    CimSession = $CimSession
    Password = $Password
    NoSummary = $NoSummary
  }
  Set-HPPrivateBIOSSettingsList @params -Verbose:$VerbosePreference
}

<#
.SYNOPSIS
  Resets the BIOS settings to shipping defaults on the current device unless specified for another platform

.DESCRIPTION
  This command resets the BIOS settings to shipping defaults on the current device unless specified for another platform. Please note that the default values are platform-specific.

.PARAMETER Password
  Specifies the current BIOS setup password, if any.

.PARAMETER ComputerName
  Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
 Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.EXAMPLE
  Set-HPBIOSSettingDefaults -Password 's3cr3t'

.NOTES
  - HP BIOS is required. 
  - Use single quotes around the password to prevent PowerShell from interpreting special characters in the string.

#>
function Set-HPBIOSSettingDefaults {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Set-HPBIOSSettingDefaults")]
  param(
    [Parameter(ParameterSetName = "NewSession",Position = 0,Mandatory = $false)]
    [Parameter(ParameterSetName = "ReuseSession",Position = 0,Mandatory = $false)]
    [AllowEmptyString()]
    [string]$Password,

    [Parameter(ParameterSetName = 'NewSession',Position = 1,Mandatory = $false)]
    [Alias('Target')]
    $ComputerName = ".",

    [Parameter(ParameterSetName = 'ReuseSession',Position = 2,Mandatory = $true)]
    [CimSession]$CimSession
  )

  $authorization = "<utf-16/>" + $Password
  Set-HPPrivateBIOSSettingDefaultsAuthorization -ComputerName $ComputerName -CimSession $CimSession -Authorization $authorization -Verbose:$VerbosePreference
}

function Set-HPPrivateBIOSSettingDefaultsAuthorization {
  param(
    [string]$Authorization,
    [string]$ComputerName,
    [CimSession]$CimSession
  )

  Write-Verbose "Calling SetSystemDefaults() on $ComputerName"
  $params = @{}
  if ($CimSession) {
    $params.CimSession = $CimSession
  }
  else {
    $params.CimSession = newCimSession -Target $ComputerName
  }
  $iface = getBiosSettingInterface @params
  $r = $iface | Invoke-CimMethod -MethodName SetSystemDefaults -Arguments @{ Password = $Authorization; }

  if ($r.Return -ne 0) {
    $Err = "$(biosErrorCodesToString($r.Return))"
    throw $Err
  }
}


<#
.SYNOPSIS
  Sets the BIOS Settings defaults payload 

.DESCRIPTION
  This is a private command for internal use only. 

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Set-HPPrivateBIOSSettingDefaultsPayload {
  param(
    [Parameter(ParameterSetName = 'Payload',Position = 0,Mandatory = $true,ValueFromPipeline = $true)]
    [string]$Payload
  )

  $portable = $Payload | ConvertFrom-Json

  if ($portable.purpose -ne "hp:sureadmin:resetsettings") {
    throw "The payload should be generated by New-HPSureAdminSettingDefaultsPayload function"
  }

  [SureAdminSetting]$setting = [System.Text.Encoding]::UTF8.GetString($portable.Data) | ConvertFrom-Json

  Set-HPPrivateBIOSSettingDefaultsAuthorization -Authorization $setting.AuthString
}

<#
.SYNOPSIS
  Retrieves the system boot time and uptime of the current device unless specified for another platform

.DESCRIPTION
  This command retrieves the system boot time and uptime of the current device unless specified for another platform.

.PARAMETER ComputerName
  Specifies a target computer for this command to create its own one-time-use CIMSession object using with. If not specified, this command will use the current device as the target computer for this command. The alias 'Target' can also be used for this parameter.  

.PARAMETER CimSession
  Specifies a pre-established CIMSession object (as created by the [New-CIMSession](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/new-cimsessionoption?view=powershell-5.1) command) or a ComputerName in string format for this command to create a one-time-use CIMSession object with


.EXAMPLE
  (Get-HPDeviceUptime).BootTime

#>
function Get-HPDeviceUptime {
  [CmdletBinding(DefaultParameterSetName = 'NewSession',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPDeviceUptime")]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $true)]
    [CimSession]$CimSession
  )
  $params = @{
    ClassName = 'Win32_OperatingSystem'
    Namespace = 'root\cimv2'
  }
  if ($PSCmdlet.ParameterSetName -eq 'NewSession') { $params.CimSession = newCimSession -Target $ComputerName }
  if ($PSCmdlet.ParameterSetName -eq 'ReuseSession') { $params.CimSession = $CimSession }

  $result = Get-CimInstance @params -ErrorAction stop
  $resultobject = @{}
  $resultobject.BootTime = $result.LastBootUpTime

  $span = (Get-Date) - ($resultobject.BootTime)
  $resultobject.Uptime = "$($span.days) days, $($span.hours) hours, $($span.minutes) minutes, $($span.seconds) seconds"
  $resultobject
}



<#
.SYNOPSIS
  Retrieves the current boot mode and uptime on the current device 

.DESCRIPTION
  This command returns an object containing the system uptime, last boot time, whether secure boot is enabled, and whether the system was booted in UEFI or Legacy mode.


.EXAMPLE
    $IsUefi = (Get-HPDeviceBootInformation).Mode -eq "UEFI"

#>
function Get-HPDeviceBootInformation {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPDeviceBootInformation")]
  param()

  $mode = @{}

  try {
    $sb = Confirm-SecureBootUEFI
    $mode.Mode = "UEFI"
    $mode.SecureBoot = $sb
  }
  catch {
    $mode.Mode = "Legacy"
    $mode.SecureBoot = $false
  }

  try {
    $uptime = Get-HPDeviceUptime
    $mode.Uptime = $uptime.Uptime
    $mode.BootTime = $uptime.BootTime
  }
  catch {
    $mode.Uptime = "N/A"
    $mode.BootTime = "N/A"
  }

  $mode
}



<#
.SYNOPSIS
  Retrieves available BIOS updates (or downgrades)

.DESCRIPTION
  This command uses an internet service to retrieve the list of BIOS updates available for a platform, and optionally checks it against the current system.

  The result is a series of records, with the following definition:

    - Ver: the BIOS update version
    - Date: the BIOS release date
    - Bin: the BIOS update binary file

  Online Mode uses Seamless Firmware Update Service that can update the BIOS in the background while the operating system is running (no authentication needed). 2022 and newer HP computers with Intel processors support Seamless Firmware Update Service.
  Offline Mode then finishes updating the BIOS after reboot and requires authentication (password or payload).

.PARAMETER Platform
  Specifies the Platform ID to check. This parameter can be obtained via the Get-HPDeviceProductID command. The Platform ID cannot be specified for a flash operation. If not specified, the current Platform ID is used.

.PARAMETER Target
  Specifies the target computer to execute this command. If not specified, the command is executed on the local computer.

.PARAMETER Format
  Specifies the format of the result. The value must be one of the following values: 

    - list: format as a list 
    - CSV: format as a comma-separated values list
    - XML: format as XML
    - JSON: format as JSON

  If not specified, the default PowerShell formatting is used.

.PARAMETER Latest
  If specified, this command returns or downloads the latest available BIOS version between remote and local. If the -Platform parameter is specified, the BIOS on the current device will not be read and the latest BIOS version available remotely will be returned.

.PARAMETER Check
  If specified, this command returns true if the latest version corresponds to the installed version or installed version is higher and returns false otherwise. Please note that this parameter is only valid for use when comparing against current platform.

.PARAMETER All
  If specified, this command includes all known BIOS update information. This may include additional data such as dependencies, rollback support, and criticality.

.PARAMETER Download
  If specified, this command will download the BIOS file to the current directory or a path specified by the -SaveAs parameter. 

.PARAMETER Flash
  If specified, the BIOS update will be flashed onto the current system.

.PARAMETER Password
  Specifies the BIOS password, if any. This parameter is only necessary when the -Flash parameter is specified. Use single quotes around the password to prevent PowerShell from interpreting special characters in the string.

.PARAMETER Version
  Specifies the BIOS version to download and/or flash. If not specified, the latest version will be used. This parameter must be specified with the -Download parameter and/or -Flash parameter.

.PARAMETER SaveAs
  Specifies the file name for the downloaded BIOS file. If not specified, the remote file name will be used.

.PARAMETER Quiet
  If specified, this command will not display a progress bar during the BIOS file download.

.PARAMETER Overwrite
  If specified, this command will force overwrite any existing file with the same name during BIOS file download. This command is only necessary when the -Download parameter is used.

.PARAMETER Yes
  If specified, this command will show an 'Are you sure you want to flash' prompt. This parameter prevents users from accidentally flashing the BIOS. 

.PARAMETER Force
  If specified, this command forces the BIOS update even if the target BIOS is already installed.

.PARAMETER BitLocker
  Specifies the behavior to the BitLocker check prompt (if any). The value must be one of the following values:
  - stop: (default option) stops execution if BitLocker is detected but not suspended, and prompts
  - ignore: skips the BitLocker check
  - suspend: suspend sBitLocker if active and continues with execution 

.PARAMETER Url
  Specifies an alternate Url source for the platform's BIOS update catalog (xml). This URL must be HTTPS. 

.PARAMETER Offline
  If specified, this command uses the offline mode to flash the BIOS instead of the default online mode. In offline mode, the actual flash will occur after reboot at pre-OS environment. Please note that offline mode is selected by default when downgrading the BIOS version and requires authentication so either a Password or a PayloadFile should be specified.

.PARAMETER NoWait
  If specified, the script does not wait for the online flash background task to finish. If the user reboots the PC during the online flash, the BIOS update will complete only after reboot.

.NOTES
  - Flash is only supported on Windows 10 1709 (Fall Creators Updated) and later.
  - UEFI boot mode is required for flashing; legacy mode is not supported.
  - The flash operation requires 64-bit PowerShell (not supported under 32-bit PowerShell).

  **WinPE notes**

  - Use '-BitLocker ignore' when using this command in WinPE because BitLocker checks are not applicable in Windows PE.
  - Requires that the WinPE image is built with the WinPE-SecureBootCmdlets.cab component.

.EXAMPLE
  Get-HPBIOSUpdates

.EXAMPLE 
  Get-HPBIOSUpdates -Platform "87ED"

.EXAMPLE
  Get-HPBIOSUpdates -Download -Version "01.26.00"

.EXAMPLE
  Get-HPBIOSUpdates -Flash -Version "01.26.00"
#>
function Get-HPBIOSUpdates {

  [CmdletBinding(DefaultParameterSetName = "ViewSet",
    HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPBIOSUpdates")]
  param(
    [Parameter(ParameterSetName = "DownloadSet",Position = 0,Mandatory = $false)]
    [Parameter(ParameterSetName = "ViewSet",Position = 0,Mandatory = $false)]
    [Parameter(Position = 0,Mandatory = $false)]
    [ValidatePattern("^[a-fA-F0-9]{4}$")]
    [string]$Platform,

    [ValidateSet('XML','JSON','CSV','List')]
    [Parameter(ParameterSetName = "ViewSet",Position = 1,Mandatory = $false)]
    [string]$Format,

    [Parameter(ParameterSetName = "ViewSet",Position = 2,Mandatory = $false)]
    [switch]$Latest,

    [Parameter(ParameterSetName = "CheckSet",Position = 3,Mandatory = $false)]
    [switch]$Check,

    [Parameter(ParameterSetName = "FlashSetPassword",Position = 4,Mandatory = $false)]
    [Parameter(ParameterSetName = "DownloadSet",Position = 4,Mandatory = $false)]
    [Parameter(ParameterSetName = "ViewSet",Position = 4,Mandatory = $false)]
    [string]$Target = ".",

    [Parameter(ParameterSetName = "ViewSet",Position = 5,Mandatory = $false)]
    [switch]$All,

    [Parameter(ParameterSetName = "DownloadSet",Position = 6,Mandatory = $true)]
    [switch]$Download,

    [Parameter(ParameterSetName = "FlashSetPassword",Position = 7,Mandatory = $true)]
    [switch]$Flash,

    [Parameter(ParameterSetName = 'FlashSetPassword',Position = 8,Mandatory = $false)]
    [string]$Password,

    [Parameter(ParameterSetName = "FlashSetPassword",Position = 9,Mandatory = $false)]
    [Parameter(ParameterSetName = "DownloadSet",Position = 9,Mandatory = $false)]
    [string]$Version,

    [Parameter(ParameterSetName = "FlashSetPassword",Position = 10,Mandatory = $false)]
    [Parameter(ParameterSetName = "DownloadSet",Position = 10,Mandatory = $false)]
    [string]$SaveAs,

    [Parameter(ParameterSetName = "FlashSetPassword",Position = 11,Mandatory = $false)]
    [Parameter(ParameterSetName = "DownloadSet",Position = 11,Mandatory = $false)]
    [switch]$Quiet,

    [Parameter(ParameterSetName = "FlashSetPassword",Position = 12,Mandatory = $false)]
    [Parameter(ParameterSetName = "DownloadSet",Position = 12,Mandatory = $false)]
    [switch]$Overwrite,

    [Parameter(ParameterSetName = 'FlashSetPassword',Position = 13,Mandatory = $false)]
    [switch]$Yes,

    [Parameter(ParameterSetName = 'FlashSetPassword',Position = 14,Mandatory = $false)]
    [ValidateSet('Stop','Ignore','Suspend')]
    [string]$BitLocker = 'Stop',

    [Parameter(ParameterSetName = 'FlashSetPassword',Position = 15,Mandatory = $false)]
    [switch]$Force,

    [Parameter(ParameterSetName = 'FlashSetPassword',Position = 16,Mandatory = $false)]
    [string]$Url = "https://ftp.hp.com/pub/pcbios",

    [Parameter(ParameterSetName = 'FlashSetPassword',Position = 17,Mandatory = $false)]
    [switch]$Offline,

    [Parameter(ParameterSetName = 'FlashSetPassword',Position = 18,Mandatory = $false)]
    [switch]$NoWait
  )

  if($PSCmdlet.ParameterSetName -eq "FlashSetPassword"){
    # check for elevated admin now, check for Sure Admin later
    Test-HPFirmwareFlashSupported -CheckPlatform
  }

  # only allow https or file paths with or without file:// URL prefix
  if ($Url -and -not ($Url.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($Url) -or $Url.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if (-not $platform) {
    # if platform is not provided, $platform is current platform
    $platform = Get-HPDeviceProductID -Target $target
  }

  $platform = $platform.ToUpper()
  Write-Verbose "Using platform ID $platform"

  $uri = [string]"$Url/{0}/{0}.xml" -f $platform.ToUpper()
  Write-Verbose "Retrieving catalog file $uri"
  $ua = Get-HPPrivateUserAgent

  # access xml file 
  try {
    [System.Net.ServicePointManager]::SecurityProtocol = Get-HPPrivateAllowedHttpsProtocols
    $data = Invoke-WebRequest -Uri $uri -UserAgent $ua -UseBasicParsing -ErrorAction Stop
  }
  catch {
    # checking 404 based on exception message 
    # bc PS5 throws WebException while PS7 throws httpResponseException 
    # bc PS5 is based on WebRequest while PS7 is based on HttpClient
    if ($_.Exception.Message.contains("(404) Not Found") -or $_.Exception.Message.contains("404 (Not Found)")){
      throw [System.Management.Automation.ItemNotFoundException]"Unable to retrieve BIOS data for a platform with ID $platform (data file not found)."
    }

    throw $_.Exception
  }

  # read xml file 
  try {
    [xml]$doc = [System.IO.StreamReader]::new($data.RawContentStream).ReadToEnd()
  }
  catch {
    throw [System.FormatException]"Unable to read data: $($_.Exception.Message)"
  }

  # in the case that the xml file is empty, or the xml file is not in the expected format i.e. no Rel entries, we will catch it here
  if ((-not $doc) -or (-not (Get-Member -InputObject $doc -Type Property -Name "BIOS")) -or (-not (Get-Member -InputObject $doc.bios -Type Property -Name "Rel")))
  {
    throw [System.FormatException]"There are currently no BIOS updates available for your platform."
  }

  # reach to Rel nodes to find Bin entries in xml
  # ignore any entry not ending in *.bin e.g. *.tgz, *.cab
  $unwanted_nodes = $doc.SelectNodes("//BIOS/Rel") | Where-Object { -not ($_.Bin -like "*.bin") }
  $unwanted_nodes | Where-Object {
    $ignore = $_.ParentNode.RemoveChild($_)
  }

  # trim the 0 from the start of the version and then sort on the version value
  $refined_doc = $doc.SelectNodes("//BIOS/Rel") | Select-Object -Property @{ Name = 'Ver'; expr = { $_.Ver.TrimStart("0") } },'Date','Bin','RB','L','DP' `
     | Sort-Object -Property Ver -Descending

  # latest version
  $latestVer = $refined_doc[0]

  if (($PSCmdlet.ParameterSetName -eq "ViewSet") -or ($PSCmdlet.ParameterSetName -eq "CheckSet")) {
    Write-Verbose "Proceeding with parameter set => view"
    if ($check.IsPresent -eq $true) {
      [string]$haveVer = Get-HPBIOSVersion -Target $target
      # check should return true if local BIOS is same or newer than the latest available remote BIOS.
      return ([string]$haveVer.TrimStart("0") -ge [string]$latestVer[0].Ver)
    }

    $args = @{}
    if ($all.IsPresent) {
      $args.Property = (@{ Name = 'Ver'; expr = { $_.Ver.TrimStart("0") } },"Date","Bin",`
           (@{ Name = 'RollbackAllowed'; expr = { [bool][int]$_.RB.trim() } }),`
           (@{ Name = 'Importance'; expr = { [Enum]::ToObject([BiosUpdateCriticality],[int]$_.L.trim()) } }),`
           (@{ Name = 'Dependency'; expr = { [string]$_.DP.trim() } }))
    }
    else {
      $args.Property = (@{ Name = 'Ver'; expr = { $_.Ver.TrimStart("0") } },"Date","Bin")
    }

    # for current platform: latest should return whichever is latest, between local and remote.
    # for any other platform specified: latest should return latest entry from SystemID.XML since we don't know local BIOSVersion
    if ($latest)
    {
      if ($PSBoundParameters.ContainsKey('Platform'))
      {
        # platform specified, do not read information from local system and return latest platform published
        $args.First = 1
      }
      else {
        $retrieved = 0
        # determine the local BIOS version
        [string]$haveVer = Get-HPBIOSVersion -Target $target
        # latest should return whichever is latest, between local and remote for current system.
        if ([string]$haveVer -ge [string]$latestVer[0].Ver)
        {
          # local is the latest. So, retrieve attributes other than BIOSVersion to print for latest
          for ($i = 0; $i -lt $refined_doc.Length; $i++) {
            if ($refined_doc[$i].Ver -eq $haveVer) {
              $haveVerFromDoc = $refined_doc[$i]
              $pso = [pscustomobject]@{
                Ver = $haveVerFromDoc.Ver
                Date = $haveVerFromDoc.Date
                Bin = $haveVerFromDoc.Bin
              }
              if ($all) {
                $pso | Add-Member -MemberType ScriptProperty -Name RollbackAllowed -Value { [bool][int]$haveVerFromDoc.RB.trim() }
                $pso | Add-Member -MemberType ScriptProperty -Name Importance -Value { [Enum]::ToObject([BiosUpdateCriticality],[int]$haveVerFromDoc.L.trim()) }
                $pso | Add-Member -MemberType ScriptProperty -Name Dependency -Value { [string]$haveVerFromDoc.DP.trim }
              }
              $retrieved = 1
              if ($pso) {
                formatBiosVersionsOutputList ($pso)
                return
              }
            }
          }
          if ($retrieved -eq 0) {
            Write-Verbose "Retrieving entry from XML failed, get the information from CIM class."
            # calculating date from Win32_BIOS
            $year = (Get-CimInstance Win32_BIOS).ReleaseDate.Year
            $month = (Get-CimInstance Win32_BIOS).ReleaseDate.Month
            $day = (Get-CimInstance Win32_BIOS).ReleaseDate.Day
            $date = $year.ToString() + '-' + $month.ToString() + '-' + $day.ToString()
            Write-Verbose "Date calculated from CIM Class is: $date"

            $currentVer = Get-HPBIOSVersion
            $pso = [pscustomobject]@{
              Ver = $currentVer
              Date = $date
              Bin = $null
            }
            if ($all) {
              $pso | Add-Member -MemberType ScriptProperty -Name RollbackAllowed -Value { $null }
              $pso | Add-Member -MemberType ScriptProperty -Name Importance -Value { $null }
              $pso | Add-Member -MemberType ScriptProperty -Name Dependency -Value { $null }
            }
            if ($pso) {
              $retrieved = 1
              formatBiosVersionsOutputList ($pso)
              return
            }
          }
        }
        else {
          # remote is the latest
          $args.First = 1
        }
      }
    }
    formatBiosVersionsOutputList ($refined_doc | Sort-Object -Property ver -Descending | Select-Object @args)
  }
  else {
    $download_params = @{}

    if ($version) {
      $version = $version.TrimStart('0')
      $latestVer = $refined_doc `
         | Where-Object { $_.Ver.TrimStart("0") -eq $version } `
         | Select-Object -Property Ver,Bin -First 1
    }

    if (-not $latestVer) { throw [System.ArgumentOutOfRangeException]"Version $version was not found." }

    if (($flash.IsPresent) -and (-not $saveAs)) {
      $saveAs = Get-HPPrivateTemporaryFileName -FileName $latestVer.Bin
      $download_params.NoClobber = "yes"
      Write-Verbose "Temporary file name for download is $saveAs"
    }
    else { $download_params.NoClobber = if ($overwrite.IsPresent) { "yes" } else { "no" } }

    Write-Verbose "Proceeding with parameter set => download, overwrite=$($download_params.NoClobber)"

    $remote_file = $latestVer.Bin
    $local_file = $latestVer.Bin
    $remote_ver = $latestVer.Ver

    if ($PSCmdlet.ParameterSetName -eq "FlashSetPassword") {
      $running = Get-HPBIOSVersion
      $offlineMode = $false

      Test-HPFirmwareFlashSupported -CheckPlatform

      # Check the BIOS Update Credential Policy setting
      $credentialPolicyValue = $null
      try{
        $credentialPolicyValue = Get-HPBIOSSettingValue -Name "BIOS Update Credential Policy" -Verbose:$VerbosePreference
      }
      catch {
        Write-Verbose "Exception caught retrieving BIOS Update Credential Policy. Will continue with normal process: $($_.Exception.Message)"
      }

      # When Sure Admin is enabled, password is no longer accepted 
      if ((Get-HPPrivateIsSureAdminEnabled) -eq $true) {
        if($credentialPolicyValue -eq "Always Require Credentials"){
          throw "Sure Admin is enabled, and BIOS Update Credential Policy is set to 'Always Require Credentials'. You must use Update-HPFirmware with a payload instead of a password"
        }
        elseif ($credentialPolicyValue -eq "Require Credentials on Downgrade Only"){
          if ([Version]$running.trim() -gt [Version]$remote_ver.trim()) {
            throw "Downgrade Detected, Sure Admin is enabled, and BIOS Update Credential Policy is set to 'Require Credentials on Downgrade Only'. You must use Update-HPFirmware with a payload instead of a password"
          }     
        }
        elseif($null -eq $credentialPolicyValue){
          # BIOS Update Credential Policy setting does not exist, throw original error  
          throw "Sure Admin is enabled, you must use Update-HPFirmware with a payload instead of a password"
        }
        # elseif ($credentialPolicyValue -eq "Never Require Credentials"){ # no error, continue with the process
      }
      elseif((Get-HPBIOSSetupPasswordIsSet) -and -not $Password){
        if($credentialPolicyValue -eq "Always Require Credentials"){
          throw "Setup Password is set, and BIOS Update Credential Policy is set to 'Always Require Credentials'. Please provide a password to continue with the update."
        }
        elseif ($credentialPolicyValue -eq "Require Credentials on Downgrade Only"){
          if ([Version]$running.trim() -gt [Version]$remote_ver.trim()) {
            throw "Downgrade Detected, Setup Password is set, and BIOS Update Credential Policy is set to 'Require Credentials on Downgrade Only'. Please provide a password to continue with the downgrade."
          }     
        }
      }

      if ([Version]$running.trim() -ge [Version]$remote_ver.trim()) {
        if ($Force.IsPresent) {
          $offlineMode = $true
          Write-Verbose "Offline mode selected to downgrade BIOS"
        }
        else {
          Write-Host "This system is already running BIOS version $($remote_ver.TrimStart(`"0`").Trim()) or newer."
          Write-Host -ForegroundColor Cyan "You can specify -Force on the command line to proceed anyway."
          return
        }
      }
      if (-not $offlineMode -and $Offline.IsPresent) {
        $offlineMode = $true
        Write-Verbose "Offline mode selected"
      }
    }

    if ($saveAs) {
      $local_file = $saveAs
    }

    [Environment]::CurrentDirectory = $pwd
    #if (-not [System.IO.Path]::IsPathRooted($to)) { $to = ".\$to" }

    $download_params.url = [string]"$Url/{0}/{1}" -f $platform,$remote_file
    $download_params.Target = [IO.Path]::GetFullPath($local_file)
    $download_params.progress = ($quiet.IsPresent -eq $false)
    Invoke-HPPrivateDownloadFile @download_params -panic

    if ($PSCmdlet.ParameterSetName -eq "FlashSetPassword") {
      if (-not $yes) {
        Write-Host -ForegroundColor Cyan "Are you sure you want to flash this system with version '$remote_ver'?"
        Write-Host -ForegroundColor Cyan "Current BIOS version is $(Get-HPBIOSVersion)."
        Write-Host -ForegroundColor Cyan "A reboot will be required for the operation to complete."
        $response = Read-Host -Prompt "Type 'Y' to continue and anything else to abort. Or specify -Yes on the command line to skip this prompt"
        if ($response -ne "Y") {
          Write-Verbose "User did not confirm and did not disable confirmation - aborting."
          return
        }
      }

      Write-Verbose "Passing to flash process with file $($download_params.target)"

      $update_params = @{
        file = $download_params.Target
        bitlocker = $bitlocker
        Force = $Force
        Password = $password
      }

      Update-HPFirmware @update_params -Verbose:$VerbosePreference -Offline:$offlineMode -NoWait:$NoWait
    }
  }

}

function Get-HPPrivateBIOSFamilyNameAndVersion {
  [CmdletBinding()]
  param(
  )

  $params = @{
    ClassName = 'Win32_BIOS'
    Namespace = 'root\cimv2'
  }
  $params.CimSession = newCimSession -Target "."
  $obj = Get-CimInstance @params -ErrorAction stop
  $verfield = (getWmiField $obj "SMBIOSBIOSVersion").Split()

  return $verfield[0],$verfield[2]
}


<#
.SYNOPSIS
  Retrieves the available BIOS updates using Windows Update packages

.DESCRIPTION
  This command retrieves the available BIOS updates using Windows Update package by using an internet service to retrieve the list of BIOS capsule updates available for a platform family, and optionally install the update in the current system. The versions available through this command may differ from the Get-HPBIOSUpdate command since this command relies on the Microsoft capsules availability. The availability of the updates can be delayed due to the Windows Update in-flight processes.

.PARAMETER Family
  Specifies the platform family to retrieve. If not specified, this command retrieves and applies the current platform family.

.PARAMETER Severity
  If specified, this command returns the available BIOS for the specified severity: 'Latest' or 'LatestCritical'.

.PARAMETER Download
  If specified, this command downloads the BIOS file to the current directory or a path specified by the -SaveAs parameter.

.PARAMETER Flash
  If specified, this command checks and applies the BIOS update to the current system.

.PARAMETER Version
  Specifies the BIOS version to download. If not specified, the latest version available will be downloaded.

.PARAMETER SaveAs
  Specifies the file name for the downloaded BIOS file. If not specified, the remote file name will be used.
  In order to use the downloaded file with the Add-HPBIOSWindowsUpdateScripts command, the file name must follow the standard: platform family (3 digit) + underscore + BIOS version (6 digits) + .cab, for instance: R70_011200.cab

.PARAMETER Yes
  If specified, this command will show an 'Are you sure you want to flash' prompt. This parameter prevents users from accidentally flashing the BIOS. 

.PARAMETER Force
  If specified, this command forces the BIOS to update even if the target BIOS is already installed.

.PARAMETER Url
  Specifies an alternate Url source for the platform's BIOS update catalog (xml). This URL must be HTTPS. 

.PARAMETER Quiet
  If specified, this command will not display a progress bar during the BIOS file download.

.PARAMETER List
  If specified, this command will display a list with all the BIOS versions available for the specified platform.

.NOTES
  - Requires Windows group policy support

.EXAMPLE
  Get-HPBIOSWindowsUpdate

.EXAMPLE
  Get-HPBIOSWindowsUpdate -List -Family R70

.EXAMPLE
  Get-HPBIOSWindowsUpdate -Flash -Severity Latest

.EXAMPLE
  Get-HPBIOSWindowsUpdate -Flash -Severity LatestCritical

.EXAMPLE
  Get-HPBIOSWindowsUpdate -Flash -Severity LatestCritical -Family R70

#>
function Get-HPBIOSWindowsUpdate {
  [CmdletBinding(DefaultParameterSetName = "Severity",HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPBIOSWindowsUpdate")]
  param(
    [Parameter(Mandatory = $false,Position = 0,ParameterSetName = "Severity")]
    [ValidateSet('Latest','LatestCritical')]
    [string]$Severity = 'Latest',

    [Parameter(Mandatory = $true,Position = 0,ParameterSetName = "Specific")]
    [string]$Version,

    [Parameter(Mandatory = $false,Position = 1,ParameterSetName = "Severity")]
    [Parameter(Mandatory = $false,Position = 1,ParameterSetName = "Specific")]
    [Parameter(Mandatory = $false,Position = 0,ParameterSetName = "List")]
    [string]$Family,

    [Parameter(Mandatory = $false,Position = 2,ParameterSetName = "Severity")]
    [Parameter(Mandatory = $false,Position = 2,ParameterSetName = "Specific")]
    [Parameter(Mandatory = $false,Position = 1,ParameterSetName = "List")]
    [string]$Url = "https://hpia.hpcloud.hp.com/downloads/capsule",

    [Parameter(Mandatory = $false,Position = 3,ParameterSetName = "Severity")]
    [Parameter(Mandatory = $false,Position = 3,ParameterSetName = "Specific")]
    [switch]$Quiet,

    [Parameter(Mandatory = $false,Position = 4,ParameterSetName = "Severity")]
    [Parameter(Mandatory = $false,Position = 4,ParameterSetName = "Specific")]
    [string]$SaveAs,

    [Parameter(Mandatory = $false,Position = 5,ParameterSetName = "Severity")]
    [Parameter(Mandatory = $false,Position = 5,ParameterSetName = "Specific")]
    [switch]$Download,

    [Parameter(Mandatory = $false,Position = 6,ParameterSetName = "Severity")]
    [Parameter(Mandatory = $false,Position = 6,ParameterSetName = "Specific")]
    [switch]$Flash,

    [Parameter(Mandatory = $false,Position = 7,ParameterSetName = "Severity")]
    [Parameter(Mandatory = $false,Position = 7,ParameterSetName = "Specific")]
    [switch]$Yes,

    [Parameter(Mandatory = $false,Position = 8,ParameterSetName = "Severity")]
    [Parameter(Mandatory = $false,Position = 8,ParameterSetName = "Specific")]
    [switch]$Force,

    [Parameter(Mandatory = $true,Position = 2,ParameterSetName = "List")]
    [switch]$List
  )

   # only allow https or file paths with or without file:// URL prefix
  if ($Url -and -not ($Url.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($Url) -or $Url.StartsWith("file://",$true,$null))) {
  throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  if ($Family -and -not $Version) {
    $_,$biosVersion = Get-HPPrivateBIOSFamilyNameAndVersion
    $biosFamily = $Family
  }
  elseif (-not $Family -and $Version) {
    $biosFamily,$_ = Get-HPPrivateBIOSFamilyNameAndVersion
    $biosVersion = $Version
  }
  elseif (-not $Version -and -not $Family) {
    $biosFamily,$biosVersion = Get-HPPrivateBIOSFamilyNameAndVersion
  } else {
    $biosFamily = $Family
    $biosVersion = $Version
  }

  [string]$uri = [string]"$Url/{0}/{0}.json" -f $biosFamily.ToUpper()
  Write-Verbose "Retrieving $biosFamily catalog $uri"
  Write-Verbose "BIOS Version: $biosVersion"

  $ua = Get-HPPrivateUserAgent
  [System.Net.ServicePointManager]::SecurityProtocol = Get-HPPrivateAllowedHttpsProtocols
  try {
    $data = Invoke-WebRequest -Uri $uri -UserAgent $ua -UseBasicParsing -ErrorAction Stop
  }
  catch {
    Write-Verbose $_.Exception
    throw [System.Management.Automation.ItemNotFoundException]"Platform family $biosFamily is not currently supported. Unable to retrieve the $biosFamily BIOS update catalog. For list of supported platforms, please visit https://ftp.ext.hp.com/pub/caps-softpaq/cmit/imagepal/ref/platformList.html"
  }

  $doc = [System.IO.StreamReader]::new($data.RawContentStream).ReadToEnd() | ConvertFrom-Json

  if ($List.IsPresent) {
    $data = $doc | Sort-Object -Property biosVersion -Descending
    return $data | Format-Table -Property biosFamily,biosVersion,severity,isLatest,IsLatestCritical
  }

  if ($PSCmdlet.ParameterSetName -eq "Specific") {
    $filter = $doc | Where-Object { $_.BiosVersion -eq $biosVersion } # specific
    Write-Verbose "Locating a specific version"
    if ($null -eq $filter) {
      throw "The version specified is not available on the $biosFamily catalog"
    }
  }
  elseif ($Severity -eq "LatestCritical") {
    $filter = $doc | Where-Object { $_.isLatestCritical -eq $true } # latest critical
    Write-Verbose "Locating the latest critical version available"
  }
  else {
    $filter = $doc | Where-Object { $_.isLatest -eq $true } # latest
    Write-Verbose "Locating the latest version available"
  }

  $sort = $filter | Sort-Object -Property biosVersion -Descending
  @{
    Family = $sort[0].biosFamily
    Version = $sort[0].BiosVersion
  }

  if ($Flash.IsPresent) {
    $running = Get-HPBIOSVersion

    # downgrade is not supported for Windows Updates, so regardless of value of BIOS Update Credential Policy, 
    # we will throw an error 
    if([Version]$running.trim() -gt [Version]$sort[0].BiosVersion.trim()) { # downgrade
      throw "Will not continue with update. Downgrade detected. Downgrade is not supported for Windows Updates."
    }

    $credentialPolicyValue = $null
    try{
      # at this point, it is an upgrade or update to same version 
      $credentialPolicyValue = Get-HPBIOSSettingValue -Name "BIOS Update Credential Policy" -Verbose:$VerbosePreference
    }
    catch{
      Write-Verbose "Exception caught retrieving BIOS Update Credential Policy. Will continue with normal process: $($_.Exception.Message)"
    }

    if($credentialPolicyValue -eq "Always Require Credentials") {
      throw "Will not continue with update. BIOS Update Credential Policy is set to 'Always Require Credentials'."
    }
    elseif($credentialPolicyValue -eq "Require Credentials on Downgrade Only"){
      Write-Verbose "Continue to apply update. Upgrade or update to same version found, and BIOS Update Credential Policy is set to 'Require Credentials on Downgrade Only'."   
    }
    else{ # Never Require Credentials or does not exist 
      Write-Verbose "Continue to apply update. BIOS Update Credential Policy is set to 'Never Require Credentials' or does not exist."
    }

    if (-not $Yes.IsPresent) {
      Write-Host -ForegroundColor Cyan "Are you sure you want to flash this system with version '$($sort[0].biosVersion)'?"
      Write-Host -ForegroundColor Cyan "Current BIOS version is $running."
      Write-Host -ForegroundColor Cyan "A reboot will be required for the operation to complete."
      $response = Read-Host -Prompt "Type 'Y' to continue and anything else to abort. Or specify -Yes on the command line to skip this prompt"
      if ($response -ne "Y") {
        Write-Verbose "User did not confirm and did not disable confirmation - aborting."
        return
      }
    }
    if ((-not $Force.IsPresent) -and $running.TrimStart("0").trim() -ge $sort[0].BiosVersion.TrimStart("0").trim()) {
      Write-Host "This system is already running BIOS version $($sort[0].biosVersion) or newer."
      Write-Host -ForegroundColor Cyan "You can specify -Force on the command line to proceed anyway."
      return
    }
  }

  if ($Download.IsPresent -or $Flash.IsPresent) {
    Write-Verbose "Download from $($sort[0].url)"
    if ($SaveAs) {
      $localFile = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($SaveAs)
    } else {
      $extension = ($sort[0].url -split '\.')[-1]
      $SaveAs = Get-HPPrivateTemporaryFileName -FileName "$($sort[0].biosFamily)_$($sort[0].biosVersion -Replace '\.').$extension"
      $localFile = [IO.Path]::GetFullPath($SaveAs)
    }
    Write-Verbose "LocalFile: $localFile"

    $download_params = @{
      NoClobber = "yes"
      url = $sort[0].url 
      Target = $localFile
      progress = ($Quiet.IsPresent -eq $false)
    }

    try {
      Invoke-HPPrivateDownloadFile @download_params -Verbose:$VerbosePreference
    }
    catch {
      throw [System.Management.Automation.ItemNotFoundException]"Unable to download the BIOS update archive from $($download_params.url): $($_.Exception)"
    }
    Write-Host "Saved as $localFile"

    $hash = (Get-FileHash $localFile -Algorithm SHA1).Hash
    $bytes = [byte[]] -split ($hash -replace '..','0x$& ')
    $base64 = [System.Convert]::ToBase64String($bytes)
    if ($base64 -eq $sort[0].digest) {
      Write-Verbose "Integrity check passed"
    }
    else {
      throw "Cab file integrity check failed"
    }
  }

  if ($Flash.IsPresent) {
    Add-HPBIOSWindowsUpdateScripts -WindowsUpdateFile $localFile
  }
}

function Get-HPPrivatePSScriptsEntries {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $false,Position = 0)]
    [string]$Path = "${env:SystemRoot}\System32\GroupPolicy\Machine\Scripts\psscripts.ini"
  )

  $types = '[Logon]','[Logoff]','[Startup]','[Shutdown]'
  $cmdLinesSet = @{}
  $parametersSet = @{}

  if ([System.IO.File]::Exists($Path)) {
    $contents = Get-Content $Path
    if ($contents) {
      for ($i = 0; $i -lt $contents.Length; $i++) {
        if ($types.contains($contents[$i])) {
          $t = $contents[$i]
          $cmdLinesSet[$t] = [System.Collections.ArrayList]@()
          $parametersSet[$t] = [System.Collections.ArrayList]@()
          continue
        }
        if ($contents[$i].Length -gt 0) {
          $cmdLinesSet[$t].Add($contents[$i].substring(1)) | Out-Null
          $parametersSet[$t].Add($contents[$i + 1].substring(1)) | Out-Null
          $i++
        }
      }
    }
  }

  $cmdLinesSet,$parametersSet
}

function Set-HPPrivatePSScriptsEntries {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true,Position = 0)]
    $CmdLines,

    [Parameter(Mandatory = $true,Position = 1)]
    $Parameters,

    [Parameter(Mandatory = $false,Position = 2)]
    [string]$Path = "${env:SystemRoot}\System32\GroupPolicy\Machine\Scripts\psscripts.ini"
  )

  $types = '[Logon]','[Logoff]','[Startup]','[Shutdown]'
  $contents = ""
  foreach ($type in $types) {
    if ($CmdLines.contains($type)) {
      for ($i = 0; $i -lt $CmdLines[$type].Count; $i++) {
        if ($i -eq 0) {
          $contents += "$type`n"
        }
        $contents += "$($i)$($CmdLines[$type][$i])`n"
        $contents += "$($i)$($Parameters[$type][$i])`n"
      }
      $contents += "`n"
    }
  }

  if (-not [System.IO.File]::Exists($Path)) {
    New-Item -Force -Path $Path -Type File
  }
  $contents | Set-Content -Path $Path -Force
}

<#
.SYNOPSIS
  Adds a PowerShell script to run at Startup or Shutdown

.DESCRIPTION
  This command adds a PowerShell script to the group policy that runs at Startup or Shutdown. This command is invoked by the Add-HPBIOSWindowsUpdateScripts command.

.PARAMETER Type
  Specifies the type of script should run at Startup or Shutdown. The value of this parameter must be either 'Startup' or 'Shutdown'.

.PARAMETER CmdLine
  Specifies a command line for a PowerShell script

.PARAMETER Parameters
  Specifies the parameters to be passed to the script at its execution time

.PARAMETER Path
  If specified, a custom path can be used.

.EXAMPLE
  Add-PSScriptsEntry -Type 'Shutdown' -CmdLine 'myscript.ps1'

.EXAMPLE
  Add-PSScriptsEntry -Type 'Startup' -CmdLine 'myscript.ps1'

.EXAMPLE
  Add-PSScriptsEntry -Type 'Startup' -CmdLine 'myscript.ps1' -Parameters 'myparam'
#>
function Add-PSScriptsEntry
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Add-PSScriptsEntry")]
  param(
    [ValidateSet('Startup','Shutdown')]
    [Parameter(Mandatory = $true,Position = 0)]
    [string]$Type,

    [Parameter(Mandatory = $true,Position = 1)]
    [string]$CmdLine,

    [Parameter(Mandatory = $false,Position = 2)]
    [string]$Parameters,

    [Parameter(Mandatory = $false,Position = 3)]
    [string]$Path = "${env:SystemRoot}\System32\GroupPolicy\Machine\Scripts\psscripts.ini"
  )

  $cmdLinesSet,$parametersSet = Get-HPPrivatePSScriptsEntries -Path $Path

  if (-not $cmdLinesSet.ContainsKey("[$Type]")) {
    $cmdLinesSet["[$Type]"] = [System.Collections.ArrayList]@()
  }
  if (-not $parametersSet.ContainsKey("[$Type]")) {
    $parametersSet["[$Type]"] = [System.Collections.ArrayList]@()
  }

  if (-not $cmdLinesSet["[$Type]"].contains("CmdLine=$CmdLine")) {
    $cmdLinesSet["[$Type]"].Add("CmdLine=$CmdLine") | Out-Null
    $parametersSet["[$Type]"].Add("Parameters=$Parameters") | Out-Null
  }

  Set-HPPrivatePSScriptsEntries -CmdLines $cmdLinesSet -Parameters $parametersSet -Path $Path
}

<#
.SYNOPSIS
  Retrieves the HP-CMSL environment configuration

.DESCRIPTION
  This command returns environment information to help debug issues. 

.EXAMPLE
  Get-HPCMSLEnvironment > MyEnvironment.txt
#>
function Get-HPCMSLEnvironment {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPCMSLEnvironment")]
  param()

  Get-ComputerInfo
  $psVersionTable
  try {
    $psISE
  }
  catch {
    'Not running on Windows PowerShell ISE'
  }

  $modules = @(
    'HP.Consent',
    'HP.Private',
    'HP.Utility',
    'HP.ClientManagement',
    'HP.Firmware',
    'HP.Notifications',
    'HP.Sinks',
    'HP.Retail',
    'HP.Softpaq',
    'HP.Repo',
    'HP.SmartExperiences',
    'HP.Displays',
    'HP.Security'
  )

  $modulesFullVersion = @{}
  foreach ($module in $modules) {
    $m = Get-Module -Name $module
    if ($null -eq $m) {
      $m = Get-Module -Name $module -ListAvailable
    }

    if($null -eq $m) { # if not imported or installed, just continue to next module
      $modulesFullVersion[$module] = $null
      continue
    }

    $path = "$($m.ModuleBase)\$module.psd1"
    $line = Select-String -Path $path -Pattern "FullModuleVersion = '(.+)'"

    if ($null -eq $line -or $line.PSobject.Properties.name -notcontains 'Matches') {
      $modulesFullVersion[$module] = $null
      continue
    }
    $lineMatch = $line.Matches.Value
    $lineMatch -match "'(.+)'" | Out-Null
    $fullModuleVersion = $Matches[1]
    $modulesFullVersion[$module] = $fullModuleVersion
  }
  $modulesFullVersion
  @{
    SystemID = Get-HPDeviceProductID
    Os = Get-HPPrivateCurrentOs
    OsVer = Get-HPPrivateCurrentDisplayOSVer
    Bitness = Get-HPPrivateCurrentOsBitness
  }
}

<#
.SYNOPSIS
  Removes a PowerShell script from the group policy

.DESCRIPTION
  This command removes a PowerShell script from the group policy that runs at Startup or Shutdown. This command returns true if any entry was removed. This command is invoked by the Add-HPBIOSWindowsUpdateScripts command. 

.PARAMETER Type
  Specifies the type of script that should run at Startup or Shutdown. The value of this parameter must be either 'Startup' or 'Shutdown'.

.PARAMETER CmdLine
  Specifies a command line for a PowerShell script

.PARAMETER Parameters
  Specifies the parameters to be passed to the script at its execution time

.PARAMETER Path
  If specified, a custom path can be used.

.EXAMPLE
  Remove-PSScriptsEntry -Type 'Shutdown' -CmdLine 'myscript.ps1'

.EXAMPLE
  Remove-PSScriptsEntry -Type 'Startup' -CmdLine 'myscript.ps1'

.EXAMPLE
  Remove-PSScriptsEntry -Type 'Startup' -CmdLine 'myscript.ps1' -Parameters 'myparam'
#>
function Remove-PSScriptsEntry {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Remove-PSScriptsEntry")]
  param(
    [ValidateSet('Startup','Shutdown')]
    [Parameter(Mandatory = $true,Position = 0)]
    [string]$Type,

    [Parameter(Mandatory = $true,Position = 1)]
    [string]$CmdLine,

    [Parameter(Mandatory = $false,Position = 2)]
    [string]$Parameters,

    [Parameter(Mandatory = $false,Position = 3)]
    [string]$Path = "${env:SystemRoot}\System32\GroupPolicy\Machine\Scripts\psscripts.ini"
  )

  $cmdLinesSet,$parametersSet = Get-HPPrivatePSScriptsEntries -Path $Path

  if (-not $cmdLinesSet.ContainsKey("[$Type]") -and -not $parametersSet.ContainsKey("[$Type]")) {
    # File doesn't contain the type specified. There is nothing to be removed
    return
  }

  $removed = $false
  # If a parameter is specified we remove only the scripts with the specified parameter from the file
  while ($cmdLinesSet["[$Type]"].contains("CmdLine=$CmdLine") -and
    (-not $Parameters -or $parametersSet["[$Type]"].item($cmdLinesSet["[$Type]"].IndexOf("CmdLine=$CmdLine")) -eq "Parameters=$Parameters")
  ) {
    $index = $cmdLinesSet["[$Type]"].IndexOf("CmdLine=$CmdLine")
    $cmdLinesSet["[$Type]"].RemoveAt($index) | Out-Null
    $parametersSet["[$Type]"].RemoveAt($index) | Out-Null
    $removed = $true
  }

  Set-HPPrivatePSScriptsEntries -CmdLines $cmdLinesSet -Parameters $parametersSet -Path $Path
  return $removed
}

<#
.SYNOPSIS
  Applies BIOS updates using a Windows Update package

.DESCRIPTION
  This command extracts the Windows Update file and prepares the system to receive a BIOS update. This command is invoked by the Get-HPBIOSWindowsUpdate command.

.PARAMETER WindowsUpdateFile
  Specifies the absolute path to the compressed CAB file downloaded with the Get-HPBIOSWindowsUpdate command. 
  The file name must follow the standard: platform family (3 digit) + underscore + BIOS version (6 digits) + .cab, for instance: R70_011200.cab

.NOTES
  Requires Windows group policy support

.EXAMPLE
  Add-HPBIOSWindowsUpdateScripts -WindowsUpdateFile C:\R70_011200.cab
#>
function Add-HPBIOSWindowsUpdateScripts {
  [CmdletBinding(DefaultParameterSetName = "Default",HelpUri = "https://developers.hp.com/hp-client-management/doc/Add-HPBIOSWindowsUpdateScripts")]
  param(
    [ValidatePattern('^[A-Za-z]:\\(?:[^\\/:*?"<>|\r\n]+\\)*[A-Za-z0-9]{3}_[0-9]{6}\.(cab|CAB)$')]
    [Parameter(Mandatory = $true,Position = 0,ParameterSetName = "Default")]
    [string]$WindowsUpdateFile
  )

  $gpt = "${env:SystemRoot}\System32\GroupPolicy\gpt.ini"
  $scripts = "${env:SystemRoot}\System32\GroupPolicy\Machine"

  New-Item -ItemType Directory -Force -Path "$scripts\Scripts" | Out-Null
  New-Item -ItemType Directory -Force -Path "$scripts\Scripts\Startup" | Out-Null
  New-Item -ItemType Directory -Force -Path "$scripts\Scripts\Shutdown" | Out-Null

  Invoke-HPPrivateExpandCAB -cab $WindowsUpdateFile -Verbose:$VerbosePreference

  $fileName = ($WindowsUpdateFile -split '\\')[-1]
  $directory = $WindowsUpdateFile -replace $fileName,''

  $fileName = $fileName.substring(0,$fileName.Length - 4)

  # Directory name comes from WindowsUpdateFile parameter, no need to check if version has 4 or 6 digits 
  $expectedDir = "$directory$fileName.cab.dir"

  # File name is expected to include a 6 digit version but will find all inf files 
  # that match the version regardless of trailing zeroes
  # in case inf file includes a 4 digit version instead. 
  # Using first inf file if mulitple inf files are found.
  $inf = (, $(Get-ChildItem -Path $expectedDir -File -Filter "$($fileName.TrimEnd("0"))*.inf" -Name))[0]

  if (-not $inf) {
    # inf file with 4 digits or 6 digits not found in expanded cab file 
    Remove-Item $expectedDir -Force -Recurse
    throw "Invalid cab file, did not find .inf in contents"
  }

  $infFileName = $inf.substring(0,$inf.Length - 4)
  $binFileLength = (Get-Item "$expectedDir\$infFileName.bin").Length

  # Remove cab file
  Remove-Item $WindowsUpdateFile -Force

  # Remove previously extracted files in shutdown script directory
  Remove-Item -Recurse -Force "$scripts\Scripts\Shutdown\wu_image" -ErrorAction Ignore

  # Move cab.dir and its contents to the shutdown script directory
  Move-Item $expectedDir "$scripts\Scripts\Shutdown\wu_image" -Force
  $log = ".\wu_bios_update.log"

  # CMSL modules should be included at startup to use Remove-PSScriptsEntry function
  $clientManagementModulePath = (Get-Module -Name HP.ClientManagement).Path
  $privateModulePath = (Get-Module -Name HP.Private).Path

  # Move DeviceInstall service to be notified after the Group Policy shutdown script
  $preshutdownOrder = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "PreshutdownOrder").PreshutdownOrder | Where-Object { $_ -ne "DeviceInstall" }
  $preshutdownOrder += "DeviceInstall"
  Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "PreshutdownOrder" -Value $preshutdownOrder -Force -ErrorAction SilentlyContinue | Out-Null

  # Clean EFI partition to better predict free space remaining at the time of reboot
  # There is still a risk that there will not be enough space when pnputil script is executed at reboot if EFI partition is modified 
  # between now and reboot time, but this check will at least avoid the case where there is not enough space now.
  # We will notify users of insufficient space now rather than trying to figure out after reboot why bios update failed. 
  $volumes = Get-Partition  | Select-Object `
  @{ Name = "Path"; Expression = { (Get-Volume -Partition $_).Path } },`
  @{ Name = "Mount"; Expression = {(Get-Volume -Partition $_).DriveType } },`
  @{ Name = "Type"; Expression = { $_.Type } },`
  @{ Name = "Disk"; Expression = { $_.DiskNumber } },`
  @{ Name = "UniqueId"; Expression = { $_.UniqueId } }
  $volumes = $volumes | Where-Object Mount -EQ "Fixed"
  [array]$efi = $volumes | Where-Object { $_.type -eq "System" }
  [array]$efi = $efi | Where-Object { (Get-Disk -Number $_.Disk).OperationalStatus -eq "Online" }
  [array]$efi = $efi | Where-Object { (Get-Disk -Number $_.Disk).IsBoot -eq $true }
  Remove-Item "$($efi[0].Path)EFI\HP\DEVFW\*" -Recurse -Force -ErrorAction Ignore 

  # Check if there is enough space on EFI partition to apply BIOS update with buffer of 3MB to be conservative 
  $freeSpace = Get-Volume -FilePath $efi.Path | Select-Object SizeRemaining
  if ($freeSpace.SizeRemaining -lt ($binFileLength + 3000000)) {
    throw "Not enough space on EFI partition to apply BIOS update. Free space is $($freeSpace.SizeRemaining) bytes, and the update requires $($binFileLength) bytes plus a buffer of 3MB."
  }

  # Startup script
  '$driver = Get-WmiObject Win32_PnPSignedDriver | ? DeviceClass -eq "Firmware" | Where Manufacturer -eq "HP Inc."
$infName = $driver.InfName
if ($infName) {
  Write-Host "INF name: $infName" *>> ' + $log + '
  ' + ${env:SystemRoot} + '\System32\pnputil.exe  /delete-driver $infName /uninstall /force *>> ' + $log + '
} else {
  Write-Host "No device to clean up" *>> ' + $log + '
}

Write-Host "Clean EFI partition" *>> ' + $log + '
$volumes = Get-Partition  | Select-Object `
  @{ Name = "Path"; Expression = { (Get-Volume -Partition $_).Path } },`
  @{ Name = "Mount"; Expression = {(Get-Volume -Partition $_).DriveType } },`
  @{ Name = "Type"; Expression = { $_.Type } },`
  @{ Name = "Disk"; Expression = { $_.DiskNumber } }
$volumes = $volumes | Where-Object Mount -EQ "Fixed"
[array]$efi = $volumes | Where-Object { $_.type -eq "System" }
[array]$efi = $efi | Where-Object { (Get-Disk -Number $_.Disk).OperationalStatus -eq "Online" }
[array]$efi = $efi | Where-Object { (Get-Disk -Number $_.Disk).IsBoot -eq $true }
Remove-Item "$($efi[0].Path)EFI\HP\DEVFW\*" -Recurse -Force -ErrorAction Ignore *>> ' + $log + '

$freeSpace = Get-Volume -FilePath $efi.Path | Select-Object SizeRemaining
Write-Host "Free space on EFI partition: $($freeSpace.SizeRemaining)" *>> ' + $log + '

Remove-Item -Force ' + ${env:SystemRoot} + '\System32\GroupPolicy\Machine\Scripts\Startup\wu_startup.ps1 *>> ' + $log + '
Remove-Item -Force ' + ${env:SystemRoot} + '\System32\GroupPolicy\Machine\Scripts\Shutdown\wu_shutdown.ps1 *>> ' + $log + '
Remove-Item -Recurse -Force ' + ${env:SystemRoot} + '\System32\GroupPolicy\Machine\Scripts\Shutdown\wu_image *>> ' + $log + '

if (Get-Module -Name HP.Private) {remove-module -force HP.Private }
if (Get-Module -Name HP.ClientManagement) {remove-module -force HP.ClientManagement }
Import-Module -Force ' + $privateModulePath + ' *>> ' + $log + '
Import-Module -Force ' + $clientManagementModulePath + ' -Function Remove-PSScriptsEntry *>> ' + $log + '
Remove-PSScriptsEntry -Type "Startup" -CmdLine wu_startup.ps1 *>> ' + $log + '
Remove-PSScriptsEntry -Type "Shutdown" -CmdLine wu_shutdown.ps1 *>> ' + $log + '
gpupdate /wait:0 /force /target:computer *>> ' + $log + '
' | Out-File "$scripts\Scripts\Startup\wu_startup.ps1"

  # Shutdown script
  'param($wu_inf_name)

net start DeviceInstall *>> ' + $log + '
$driver = Get-WmiObject Win32_PnPSignedDriver | ? DeviceClass -eq "Firmware" | Where Manufacturer -eq "HP Inc."
$infName = $driver.InfName
if ($infName) {
  Write-Host "INF name: $infName" *>> ' + $log + '
  ' + ${env:SystemRoot} + '\System32\pnputil.exe  /delete-driver $infName /uninstall /force *>> ' + $log + '
} else {
  Write-Host "No device to clean up" *>> ' + $log + '
}

Write-Host "Clean EFI partition" *>> ' + $log + '
$volumes = Get-Partition  | Select-Object `
  @{ Name = "Path"; Expression = { (Get-Volume -Partition $_).Path } },`
  @{ Name = "Mount"; Expression = {(Get-Volume -Partition $_).DriveType } },`
  @{ Name = "Type"; Expression = { $_.Type } },`
  @{ Name = "Disk"; Expression = { $_.DiskNumber } }
$volumes = $volumes | Where-Object Mount -EQ "Fixed"
[array]$efi = $volumes | Where-Object { $_.type -eq "System" }
[array]$efi = $efi | Where-Object { (Get-Disk -Number $_.Disk).OperationalStatus -eq "Online" }
[array]$efi = $efi | Where-Object { (Get-Disk -Number $_.Disk).IsBoot -eq $true }
Remove-Item "$($efi[0].Path)EFI\HP\DEVFW\*" -Recurse -Force -ErrorAction Ignore *>> ' + $log + '

$freeSpace = Get-Volume -FilePath $efi.Path | Select-Object SizeRemaining
Write-Host "Free space on EFI partition: $($freeSpace.SizeRemaining)" *>> ' + $log + '

$volume = Get-BitLockerVolume | Where-Object VolumeType -EQ "OperatingSystem"
if ($volume.ProtectionStatus -ne "Off") {
  Suspend-BitLocker -MountPoint $volume.MountPoint -RebootCount 1 *>> ' + $log + '
}

Write-Host "Invoke PnPUtil to update the BIOS" *>> ' + $log + '
' + ${env:SystemRoot} + '\System32\pnputil.exe /add-driver ' + ${env:SystemRoot} + '\System32\GroupPolicy\Machine\Scripts\Shutdown\wu_image\$wu_inf_name.inf /install *>> ' + $log + '
Write-Host "WU driver installed" *>> ' + $log + '

$volume = Get-BitLockerVolume | Where-Object VolumeType -EQ "OperatingSystem"
if ($volume.ProtectionStatus -ne "Off") {
  Suspend-BitLocker -MountPoint $volume.MountPoint -RebootCount 1 *>> ' + $log + '
}
' | Out-File "$scripts\Scripts\Shutdown\wu_shutdown.ps1"

  "[General]`ngPCMachineExtensionNames=[{42B5FAAE-6536-11D2-AE5A-0000F87571E3}{40B6664F-4972-11D1-A7CA-0000F87571E3}]`nVersion=65537" | Set-Content -Path $gpt -Force

  Remove-PSScriptsEntry -Type "Startup" -CmdLine "wu_startup.ps1" | Out-Null
  Remove-PSScriptsEntry -Type "Shutdown" -CmdLine "wu_shutdown.ps1" | Out-Null
  Add-PSScriptsEntry -Type "Startup" -CmdLine "wu_startup.ps1"
  Add-PSScriptsEntry -Type "Shutdown" -CmdLine "wu_shutdown.ps1" -Parameters "$infFileName"
  gpupdate /wait:0 /force /target:computer
  Write-Host -ForegroundColor Cyan "Firmware image has been deployed. The process will continue after reboot."
}

<#
 .SYNOPSIS
  Retrieves the platform name, system ID, or operating system support using either the platform name or its system ID

.DESCRIPTION
  This command retrieves information about the platform, given a platform name or system ID. This command can be used to convert between platform name and system IDs. Note that a platform may have multiple system IDs, or a system ID may map to multiple platforms.

  This command returns the following information:

  - SystemID: the system ID for this platform
  - FamilyID: the platform family ID
  - Name: the name of the platform
  - DriverPackSupport: this platform supports driver packs

  Note that this command is not supported in WinPE.

.PARAMETER Platform
  Specifies a platform id (a 4-digit hexadecimal number) for the command to query with 

.PARAMETER Name
  Specifies a platform name for the command to query with. The name must match the platform name exactly, unless the -Match/-Like parameter is also specified.

.PARAMETER Like
  Allows the query to return outputs based on a substring match rather than an exact match. If the platform contains the substring defined by the -Name parameter, it will be included in the output. This parameter can also be specified as -Match, for backwards compatibility.

  However, this parameter is now obsolete and may be removed at a future time. You can simply pass wildcards in the name field instead of using the like parameter.
  For example, "Get-HPDeviceDetails -name '\*EliteBook\*'" and "Get-HPDeviceDetails -like -name 'EliteBook'" are identical. 

.PARAMETER OSList
  If specified, this command returns the list of supported operating systems for the specified platform.

.PARAMETER Url
  Specifies an alternate location for the HP Image Assistant (HPIA) platform list XML. This URL must be HTTPS. If not specified, https://hpia.hpcloud.hp.com/ref is used by default.

.EXAMPLE
  Get-HPDeviceDetails -Platform 8100

.EXAMPLE
  Get-HPDeviceDetails -Name 'HP ProOne 400 G3 20-inch Touch All-in-One PC'

.EXAMPLE
  Get-HPDeviceDetails -Like -Name '840 G5'

#>
function Get-HPDeviceDetails {
  [CmdletBinding(
    DefaultParameterSetName = "FromID",
    HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPDeviceDetails")
  ]
  param(
    [ValidatePattern("^[a-fA-F0-9]{4}$")]
    [Parameter(Mandatory = $false,Position = 0,ParameterSetName = "FromID")]
    [string]$Platform,

    [Parameter(Mandatory = $true,Position = 1,ParameterSetName = "FromName")]
    [string]$Name,

    [Parameter(Mandatory = $false,Position = 2,ParameterSetName = "FromName")]
    [Alias('Match')]
    [switch]$Like,

    [Parameter(Mandatory = $false,ParameterSetName = "FromName")]
    [Parameter(Mandatory = $false,ParameterSetName = "FromID")]
    [switch]$OSList,

    [Parameter(Mandatory = $false,Position = 3,ParameterSetName = "FromName")]
    [Parameter(Mandatory = $false,Position = 1,ParameterSetName = "FromID")]
    [string]$Url = "https://hpia.hpcloud.hp.com/ref"
  )

  if (Test-WinPE -Verbose:$VerbosePreference) { throw "Getting HP Device details is not supported in WinPE" }

    # only allow https or file paths with or without file:// URL prefix
  if ($Url -and -not ($Url.StartsWith("https://",$true,$null) -or [System.IO.Directory]::Exists($Url) -or $Url.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing directory paths are supported."
  }

  $filename = "platformList.cab"
  $Url = "$Url/$filename"
  $try_on_ftp = $false

  try {
    $file = Get-HPPrivateOfflineCacheFiles -url $Url -FileName $filename -Expand -Verbose:$VerbosePreference
  }
  catch {
    # platformList is not reachable on AWS, try to get it from FTP
    $try_on_ftp = $true
  }

  if ($try_on_ftp)
  {
    try {
      $url = "https://ftp.hp.com/pub/caps-softpaq/cmit/imagepal/ref/platformList.cab"
      $file = Get-HPPrivateOfflineCacheFiles -url $url -FileName $filename -Expand -Verbose:$VerbosePreference
    }
    catch {
      Write-Host -ForegroundColor Magenta "platformList is not available on AWS or FTP."
      throw [System.Net.WebException]"Could not find platformList."
    }
  }

  if (-not $platform -and -not $Name) {
    try { $platform = Get-HPDeviceProductID -Verbose:$VerbosePreference }
    catch { Write-Verbose "No platform found." }
  }
  if ($platform) {
    $platform = $platform.ToLower()
  }
  if ($PSCmdlet.ParameterSetName -eq "FromID") {
    $data = Select-Xml -Path "$file" -XPath "/ImagePal/Platform/SystemID[normalize-space(.)=`"$platform`"]/parent::*"
  }
  else {
    $data = Select-Xml -Path "$file" -XPath "/ImagePal/Platform/ProductName[translate(substring(`"$($name.ToLower())`",0), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')]/parent::*"
  }

  if (-not $data) { return }

  $searchName = $Name
  if ($Like.IsPresent)
  {
    if (-not ($searchName).StartsWith('*')) { $searchName = ("*$searchName") }
    if (-not ($searchName).EndsWith('*')) { $searchName = ("$searchName*") }
  }

  $data.Node | ForEach-Object {
    $__ = $_
    $pn = $_.ProductName. "#text"

    if ($oslist.IsPresent) {
      [array]$r = ($__.OS | ForEach-Object {
        if (($PSCmdlet.ParameterSetName -eq "FromID") -or ($pn -like $searchName)) {
          $rid = $Null
          if ("OSReleaseId" -in $_.PSObject.Properties.Name) { $rid = $_.OSReleaseId }

          [string]$osv = $_.OSVersion
          if ("OSReleaseIdDisplay" -in $_.PSObject.Properties.Name -and $_.OSReleaseIdDisplay -ne '20H2') {
            $rid = $_.OSReleaseIdDisplay
          }

          $obj = New-Object -TypeName PSCustomObject -Property @{
            SystemID = $__.SystemID.ToUpper()
            OperatingSystem = $_.OSDescription
            OperatingSystemVersion = $osv
            Architecture = $_.OSArchitecture
          }
          if ($rid) {
            $obj | Add-Member -NotePropertyName OperatingSystemRelease -NotePropertyValue $rid
          }
          if ("OSBuildId" -in $_.PSObject.Properties.Name) {
            $obj | Add-Member -NotePropertyName BuildNumber -NotePropertyValue $_.OSBuildId
          }
          $obj
        }
      })
    }
    else {

      [array]$r = ($__.ProductName | ForEach-Object {
        if (($PSCmdlet.ParameterSetName -eq "FromID") -or ($_. "#text" -like $searchName)) {
          New-Object -TypeName PSCustomObject -Property @{
            SystemID = $__.SystemID.ToUpper()
            Name = $_. "#text"
            DriverPackSupport = [System.Convert]::ToBoolean($_.DPBCompliant)
            UWPDriverPackSupport = [System.Convert]::ToBoolean($_.UDPCompliant)
          }
        }
      })
    }
    return $r
  }
}



function getFormattedBiosSettingValue {
  [CmdletBinding()]
  param($obj)
  switch ($obj.CimClass.CimClassName) {
    { $_ -eq 'HPBIOS_BIOSString' } {
      $result = $obj.Value

    }
    { $_ -eq 'HPBIOS_BIOSInteger' } {
      $result = $obj.Value
    }
    { $_ -eq 'HPBIOS_BIOSEnumeration' } {
      $result = $obj.CurrentValue
    }
    { $_ -eq 'HPBIOS_BIOSPassword' } {
      throw [System.InvalidOperationException]"Password values cannot be retrieved, it will always result in an empty string"
    }
    { $_ -eq 'HPBIOS_BIOSOrderedList' } {
      $result = $obj.Value
    }
  }
  return $result
}

function getWmiField ($obj,$fn) { $obj.$fn }


# format a setting using BCU (custom) format
function convertSettingToBCU ($setting) {
  #if ($setting.DisplayInUI -eq 0) { return }
  switch ($setting.CimClass.CimClassName) {
    { $_ -eq 'HPBIOS_BIOSString' } {
      Write-Output $setting.Name

      if ($setting.Value.contains("`n")) {
        $setting.Value.Split("`n") | ForEach-Object {
          $c = $_.trim()
          Write-Output "`t$c" }
      }
      else {
        Write-Output "`t$($setting.Value)"
      }

    }
    { $_ -eq 'HPBIOS_BIOSInteger' } {
      Write-Output $setting.Name
      Write-Output "`t$($setting.Value)"
    }
    { $_ -eq 'HPBIOS_BIOSPassword' } {
      Write-Output $setting.Name
      Write-Output ""
    }
    { $_ -eq 'HPBIOS_BIOSEnumeration' } {
      Write-Output $setting.Name
      $fields = $setting.Value.Split(",")
      foreach ($f in $fields) {
        Write-Output "`t$f"
      }
    }
    { $_ -eq 'HPBIOS_BIOSOrderedList' } {
      Write-Output $setting.Name
      if ($null -ne $setting.Value) {
        $fields = $setting.Value.Split(",")
        foreach ($f in $fields) {
          Write-Output "`t$f"
        }
      }
      else {
        Write-Output "`t$($setting.Value)"
      }
    }
  }
}

function formatBiosVersionsOutputList ($doc) {
  switch ($format) {
    "json" { return $doc | ConvertTo-Json }
    "xml" {
      Write-Output "<bios id=`"$platform`">"
      if ($all)
      {
        $doc | ForEach-Object { Write-Output "<item><ver>$($_.Ver)</ver><bin>$($_.bin)</bin><date>$($_.date)</date><rollback_allowed>$($_.RollbackAllowed)</rollback_allowed><importance>$($_.Importance)</importance></item>" }
      }
      else {
        $doc | ForEach-Object { Write-Output "<item><ver>$($_.Ver)</ver><bin>$($_.bin)</bin><date>$($_.date)</date></item>" }
      }
      Write-Output "</bios>"
      return
    }
    "csv" {
      return $doc | ConvertTo-Csv -NoTypeInformation
    }
    "list" { $doc | ForEach-Object { Write-Output "$($_.Bin) version $($_.Ver.TrimStart("0")), released $($_.Date)" } }
    default { return $doc }
  }
}


# format a setting using HPIA (xml) format
function convertSettingToXML ($setting) {
  #if ($setting.DIsplayInUI -eq 0) { return }
  Write-Output "     <BIOSSetting>"
  Write-Output "        <Name>$([System.Web.HttpUtility]::HtmlEncode($setting.Name))</Name>"
  Write-Output "        <Class>$($setting.CimClass.CimClassName)</Class>"
  Write-Output "        <DisplayInUI>$($setting.DisplayInUI)</DisplayInUI>"
  Write-Output "        <IsReadOnly>$($setting.IsReadOnly)</IsReadOnly>"
  Write-Output "        <RequiresPhysicalPresence>$($setting.RequiresPhysicalPresence)</RequiresPhysicalPresence>"
  Write-Output "        <Sequence>$($setting.Sequence)</Sequence>"

  switch ($setting.CimClass.CimClassName) {
    { $_ -eq 'HPBIOS_BIOSPassword' } {
      Write-Output "        <Value></Value>"
      Write-Output "        <Min>$($setting.MinLength)</Min>"
      Write-Output "        <Max>$($setting.MaxLength)</Max>"

      Write-Output "        <SupportedEncodings Count=""$($setting.SupportedEncoding.Count)"">"
      foreach ($e in $setting.SupportedEncoding) {
        Write-Output "          <Encoding>$e</Encoding>"
      }
      Write-Output "        </SupportedEncodings>"
    }

    { $_ -eq 'HPBIOS_BIOSString' } {
      Write-Output "        <Value>$([System.Web.HttpUtility]::HtmlEncode($setting.Value))</Value>"
      Write-Output "        <Min>$($setting.MinLength)</Min>"
      Write-Output "        <Max>$($setting.MaxLength)</Max>"
    }

    { $_ -eq 'HPBIOS_BIOSInteger' } {
      Write-Output "        <Value>$($setting.Value)</Value>"
      #Write-Output "        <DisplayInUI>$($setting.DisplayInUI)</DisplayInUI>"
      Write-Output "        <Min>$($setting.LowerBound)</Min>"
      Write-Output "        <Max>$($setting.UpperBound)</Max>"
    }

    { $_ -eq 'HPBIOS_BIOSEnumeration' } {
      Write-Output "        <Value>$([System.Web.HttpUtility]::HtmlEncode($setting.CurrentValue))</Value>"
      Write-Output "        <ValueList Count=""$($setting.Size)"">"
      foreach ($e in $setting.PossibleValues) {
        Write-Output "          <Value>$([System.Web.HttpUtility]::HtmlEncode($e))</Value>"
      }
      Write-Output "        </ValueList>"
    }

    { $_ -eq 'HPBIOS_BIOSOrderedList' } {
      Write-Output "        <Value>$([System.Web.HttpUtility]::HtmlEncode($setting.Value))</Value>"
      Write-Output "        <ValueList Count=""$($setting.Size)"">"
      foreach ($e in $setting.Elements) {
        Write-Output "          <Value>$([System.Web.HttpUtility]::HtmlEncode($e))</Value>"
      }
      Write-Output "        </ValueList>"
    }
  }
  Write-Output "     </BIOSSetting>"
}

function convertSettingToJSON ($original_setting) {

  $setting = $original_setting | Select-Object *

  if ($setting.CimClass.CimClassName -eq "HPBIOS_BIOSInteger") {
    $min = $setting.LowerBound
    $max = $setting.UpperBound
    Add-Member -InputObject $setting -Name "Min" -Value $min -MemberType NoteProperty
    Add-Member -InputObject $setting -Name "Max" -Value $max -MemberType NoteProperty

    $d = $setting | Select-Object -Property Class,DisplayInUI,InstanceName,IsReadOnly,Min,Max,Name,Path,Prerequisites,PrerequisiteSize,RequiresPhysicalPresence,SecurityLevel,Sequence,Value
  }

  if (($setting.CimClass.CimClassName -eq "HPBIOS_BIOSString") -or ($setting.CimClass.CimClassName -eq "HPBIOS_BIOSPassword")) {
    $min = $setting.MinLength
    $max = $setting.MaxLength
    Add-Member -InputObject $setting -Name "Min" -Value $min -MemberType NoteProperty -Force
    Add-Member -InputObject $setting -Name "Max" -Value $max -MemberType NoteProperty -Force
    $d = $setting | Select-Object -Property Class,DisplayInUI,InstanceName,IsReadOnly,Min,Max,Name,Path,Prerequisites,PrerequisiteSize,RequiresPhysicalPresence,SecurityLevel,Sequence,Value
  }

  if ($setting.CimClass.CimClassName -eq "HPBIOS_BIOSEnumeration") {
    $min = $setting.Size
    $max = $setting.Size
    #Add-Member -InputObject $setting -Name "Min" -Value $min -MemberType NoteProperty
    #Add-Member -InputObject $setting -Name "Max" -Value $max -MemberType NoteProperty
    $setting.Value = $setting.CurrentValue
    $d = $setting | Select-Object -Property Class,DisplayInUI,InstanceName,IsReadOnly,Min,Max,Name,Path,Prerequisites,PrerequisiteSize,RequiresPhysicalPresence,SecurityLevel,Sequence,Value,PossibleValues
  }

  if ($setting.CimClass.CimClassName -eq "HPBIOS_BIOSOrderedList") {
    #if Elements is null, initialize it as an empty array else select the first object
    $Elements = $setting.Elements,@() | Select-Object -First 1
    $min = $Elements.Count
    $max = $Elements.Count
    Add-Member -InputObject $setting -Name "Min" -Value $min -MemberType NoteProperty
    Add-Member -InputObject $setting -Name "Max" -Value $max -MemberType NoteProperty
    Add-Member -InputObject $setting -Name "PossibleValues" -Value $Elements -MemberType NoteProperty
    $d = $setting | Select-Object -Property Class,DisplayInUI,InstanceName,IsReadOnly,Min,Max,Name,Path,Prerequisites,PrerequisiteSize,RequiresPhysicalPresence,SecurityLevel,Sequence,Value,Elements
  }



  $d | ConvertTo-Json -Depth 5 | Write-Output
}

# format a setting as a CSV entry
function convertSettingToCSV ($setting) {
  switch ($setting.CimClass.CimClassName) {
    { $_ -eq 'HPBIOS_BIOSEnumeration' } {
      Write-Output "`"$($setting.Name)`",`"$($setting.value)`",$($setting.IsReadOnly),`"picklist`",$($setting.RequiresPhysicalPresence),$($setting.Size),$($setting.Size)"
    }
    { $_ -eq 'HPBIOS_BIOSString' } {
      Write-Output "`"$($setting.Name)`",`"$($setting.value)`",$($setting.IsReadOnly),`"string`",$($setting.RequiresPhysicalPresence),$($setting.MinLength),$($setting.MaxLength)"
    }
    { $_ -eq 'HPBIOS_BIOSPassword' } {
      Write-Output "`"$($setting.Name)`",`"`",$($setting.IsReadOnly),`"password`",$($setting.RequiresPhysicalPresence),$($setting.MinLength),$($setting.MaxLength)"
    }
    { $_ -eq 'HPBIOS_BIOSInteger' } {
      Write-Output "`"$($setting.Name)`",`"$($setting.value)`",$($setting.IsReadOnly),`"integer`",$($setting.RequiresPhysicalPresence),$($setting.LowerBound),$($setting.UpperBound)"
    }
    { $_ -eq 'HPBIOS_BIOSOrderedList' } {
      Write-Output "`"$($setting.Name)`",`"$($setting.value)`",$($setting.IsReadOnly),`"orderedlist`",$($setting.RequiresPhysicalPresence),$($setting.Size),$($setting.Size)"
    }
  }
}

function extractBIOSVersion {
  [CmdletBinding()]
  param
  (
    [Parameter(Position = 0,Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$BIOSVersion

  )
  [string]$ver = $null

  # Does the BIOS version string contains x.xx[.xx]?
  [bool]$found = $BIOSVersion -match '(\d+(\.\d+){1,2})'
  if ($found) {
    $ver = $matches[1]
    Write-Verbose "BIOS version extracted=[$ver]"
  }

  $ver
}




# SIG # Begin signature block
