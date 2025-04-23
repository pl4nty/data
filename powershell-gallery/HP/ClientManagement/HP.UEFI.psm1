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
#
using namespace HP.CMSLHelper

Set-StrictMode -Version 3.0

# CMSL is normally installed in C:\Program Files\WindowsPowerShell\Modules
# but if installed via PSGallery and via PS7, it is installed in a different location
if (Test-Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll") {
  Add-Type -Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll"
}
else{
  Add-Type -Path "$PSScriptRoot\..\..\HP.Private\1.8.2\HP.CMSLHelper.dll"
}

[Flags()] enum UEFIVariableAttributes{
  VARIABLE_ATTRIBUTE_NON_VOLATILE = 0x00000001
  VARIABLE_ATTRIBUTE_BOOTSERVICE_ACCESS = 0x00000002
  VARIABLE_ATTRIBUTE_RUNTIME_ACCESS = 0x00000004
  VARIABLE_ATTRIBUTE_HARDWARE_ERROR_RECORD = 0x00000008
  VARIABLE_ATTRIBUTE_AUTHENTICATED_WRITE_ACCESS = 0x00000010
  VARIABLE_ATTRIBUTE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS = 0x00000020
  VARIABLE_ATTRIBUTE_APPEND_WRITE = 0x00000040
}


<#
    .SYNOPSIS
    Retrieves a UEFI variable value

    .DESCRIPTION
    This command retrieves the value of a UEFI variable. 

    .PARAMETER Name
    Specifies the name of the UEFI variable to read

    .PARAMETER Namespace
    Specifies a custom namespace. The namespace must be in the format of a UUID, surrounded by curly brackets.

    .PARAMETER AsString
    If specified, this command will return the value as a string rather than a byte array. Note that the commands in this library support UTF-8 compatible strings. Other applications may store strings that are not compatible with this translation, in which
    case the caller should retrieve the value as an array (default) and post-process it as needed.

    .EXAMPLE
    PS>  Get-HPUEFIVariable -GlobalNamespace -Name MyVariable

    .EXAMPLE
    PS>  Get-HPUEFIVariable -Namespace "{21969aa8-681f-46be-90f0-6019ce9b0ee7}"  -Name MyVariable

    .NOTES
    - The process calling these commands must be able to acquire 'SeSystemEnvironmentPrivilege' privileges for the operation to succeed. For more information, refer to "Modify firmware environment values" in the linked documentation below.
    - This command is not supported on legacy mode, only on UEFI mode.
    - This command requires elevated privileges.

    .OUTPUTS
    This command returns a custom object that contains the variable value and its attributes.

    .LINK
    [UEFI Specification 2.3.1 Section 7.2](https://www.uefi.org/specifications)

    .LINK
    [Modify firmware environment values](https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/modify-firmware-environment-values)
#>
function Get-HPUEFIVariable
{
  [CmdletBinding(DefaultParameterSetName = 'NsCustom',HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPUEFIVariable")]
  [Alias("Get-UEFIVariable")]
  param(
    [Parameter(Position = 0,Mandatory = $true,ParameterSetName = "NsCustom")]
    [string]$Name,

    [Parameter(Position = 1,Mandatory = $true,ParameterSetName = "NsCustom")]
    [string]$Namespace,

    [Parameter(Position = 2,Mandatory = $false,ParameterSetName = "NsCustom")]
    [switch]$AsString
  )

  if (-not (Test-IsElevatedAdmin)) {
    throw [System.Security.AccessControl.PrivilegeNotHeldException]"elevated administrator"
  }

  $PreviousState = [PrivilegeState]::Enabled;
  Set-HPPrivateEnablePrivilege -ProcessId $PID -PreviousState ([ref]$PreviousState) -State ([PrivilegeState]::Enabled)

  $size = 1024 # fixed max size
  $result = New-Object Byte[] (1024)
  [uint32]$attr = 0

  Write-Verbose "Querying UEFI variable $Namespace/$Name"
  Get-HPPrivateFirmwareEnvironmentVariableExW -Name $Name -Namespace $Namespace -Result $result -Size $size -Attributes ([ref]$attr)

  $r = [pscustomobject]@{
    Value = ''
    Attributes = [UEFIVariableAttributes]$attr
  }
  if ($asString.IsPresent) {
    $enc = [System.Text.Encoding]::UTF8
    $r.Value = $enc.GetString($result)
  }
  else {
    $r.Value = [array]$result
  }

  if ($PreviousState -eq [PrivilegeState]::Disabled) {
    Set-HPPrivateEnablePrivilege -ProcessId $PID -PreviousState ([ref]$PreviousState) -State ([PrivilegeState]::Disabled)
  }
  $r
}

<#
    .SYNOPSIS
    Sets a UEFI variable value

    .DESCRIPTION
    This command sets the value of a UEFI variable. If the variable does not exist, this command will create the variable. 

    .PARAMETER Name
    Specifies the name of the UEFI variable to update or create

    .PARAMETER Namespace
    Specifies a custom namespace. The namespace must be in the format of a UUID, surrounded by curly brackets.

    .PARAMETER Value
    Specifies the new value for the UEFI variable. Note that a NULL value will delete the variable.

    The value may be a byte array (type byte[],  recommended), or a string which will be converted to UTF8 and stored as a byte array.

    .PARAMETER Attributes
    Specifies the attributes for the UEFI variable. For more information, see the UEFI specification linked below.

    Attributes may be:

    - VARIABLE_ATTRIBUTE_NON_VOLATILE: The firmware environment variable is stored in non-volatile memory (e.g. NVRAM). 
    - VARIABLE_ATTRIBUTE_BOOTSERVICE_ACCESS: The firmware environment variable can be accessed during boot service. 
    - VARIABLE_ATTRIBUTE_RUNTIME_ACCESS:  The firmware environment variable can be accessed at runtime. Note  Variables with this attribute set, must also have VARIABLE_ATTRIBUTE_BOOTSERVICE_ACCESS set. 
    - VARIABLE_ATTRIBUTE_HARDWARE_ERROR_RECORD:  Indicates hardware related errors encountered at runtime. 
    - VARIABLE_ATTRIBUTE_AUTHENTICATED_WRITE_ACCESS: Indicates an authentication requirement that must be met before writing to this firmware environment variable. 
    - VARIABLE_ATTRIBUTE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS: Indicates authentication and time stamp requirements that must be met before writing to this firmware environment variable. When this attribute is set, the buffer, represented by pValue, will begin with an instance of a complete (and serialized) EFI_VARIABLE_AUTHENTICATION_2 descriptor. 
    - VARIABLE_ATTRIBUTE_APPEND_WRITE: Append an existing environment variable with the value of pValue. If the firmware does not support the operation, then SetFirmwareEnvironmentVariableEx will return ERROR_INVALID_FUNCTION.

    .EXAMPLE
    PS>  Set-HPUEFIVariable -Namespace "{21969aa8-681f-46be-90f0-6019ce9b0ee7}" -Name MyVariable -Value 1,2,3

    .EXAMPLE
    PS>  Set-HPUEFIVariable -Namespace "{21969aa8-681f-46be-90f0-6019ce9b0ee7}" -Name MyVariable -Value "ABC"

    .NOTES
    - It is not recommended that the attributes of an existing variable are updated. If new attributes are required, the value should be deleted and re-created.
    - The process calling these commands must be able to acquire 'SeSystemEnvironmentPrivilege' privileges for the operation to succeed. For more information, refer to "Modify firmware environment values" in the linked documentation below.
    - This command is not supported on legacy BIOS mode, only on UEFI mode.
    - This command requires elevated privileges.

    .LINK
    [UEFI Specification 2.3.1 Section 7.2](https://www.uefi.org/specifications)

    .LINK
    [Modify firmware environment values](https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/modify-firmware-environment-values)
#>

function Set-HPUEFIVariable
{
  [CmdletBinding(DefaultParameterSetName = 'NsCustom',HelpUri = "https://developers.hp.com/hp-client-management/doc/Set-HPUEFIVariable")]
  [Alias("Set-UEFIVariable")]
  param(
    [Parameter(Position = 0,Mandatory = $true,ParameterSetName = "NsCustom")]
    [string]$Name,

    [Parameter(Position = 1,Mandatory = $true,ParameterSetName = "NsCustom")]
    $Value,

    [Parameter(Position = 2,Mandatory = $true,ParameterSetName = "NsCustom")]
    [string]$Namespace,

    [Parameter(Position = 3,Mandatory = $false,ParameterSetName = "NsCustom")]
    [UEFIVariableAttributes]$Attributes = 7
  )

  if (-not (Test-IsElevatedAdmin)) {
    throw [System.Security.AccessControl.PrivilegeNotHeldException]"elevated administrator"
  }

  $err = "The Value must be derived from base types 'String' or 'Byte[]' or Byte"

  [byte[]]$rawvalue = switch ($Value.GetType().Name) {
    "String" {
      $enc = [System.Text.Encoding]::UTF8
      $v = @($enc.GetBytes($Value))
      Write-Verbose "String value representation is $v"
      [byte[]]$v
    }
    "Int32" {
      $v = [byte[]]$Value
      Write-Verbose "Byte value representation is $v"
      [byte[]]$v
    }
    "Object[]" {
      try {
        $v = [byte[]]$Value
        Write-Verbose "Byte array value representation is $v"
        [byte[]]$v
      }
      catch {
        throw $err
      }
    }
    default {
      throw "Value type $($Value.GetType().Name): $err" 
    }
  }


  $PreviousState = [PrivilegeState]::Enabled
  Set-HPPrivateEnablePrivilege -ProcessId $PID -PreviousState ([ref]$PreviousState) -State ([PrivilegeState]::Enabled)

  $len = 0
  if ($rawvalue) { $len = $rawvalue.Length }

  if (-not $len -and -not ($Attributes -band [UEFIVariableAttributes]::VARIABLE_ATTRIBUTE_AUTHENTICATED_WRITE_ACCESS -or
      $Attributes -band [UEFIVariableAttributes]::VARIABLE_ATTRIBUTE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS -or
      $Attributes -band [UEFIVariableAttributes]::VARIABLE_ATTRIBUTE_APPEND_WRITE)) {
    # Any attribute different from 0x40, 0x10 and 0x20 combined with a value size of zero removes the UEFI variable.
    # Note that zero is not a valid attribute, see [UEFIVariableAttributes] enum
    Write-Verbose "Deleting UEFI variable $Namespace/$Name"
  }
  else {
    Write-Verbose "Setting UEFI variable $Namespace/$Name to value $rawvalue (length = $len), Attributes $([UEFIVariableAttributes]$Attributes)"
  }

  Set-HPPrivateFirmwareEnvironmentVariableExW -Name $Name -Namespace $Namespace -RawValue $rawvalue -Len $len -Attributes $Attributes

  if ($PreviousState -eq [PrivilegeState]::Disabled) {
    Set-HPPrivateEnablePrivilege -ProcessId $PID -PreviousState ([ref]$PreviousState) -State ([PrivilegeState]::Disabled)
  }
}

function Set-HPPrivateEnablePrivilege
{
  [CmdletBinding()]
  param(
    $ProcessId,
    [ref]$PreviousState,
    $State
  )

  try {
    $enablePrivilege = [Native]::EnablePrivilege($PID,"SeSystemEnvironmentPrivilege",$PreviousState,$State)
  }
  catch {
    $enablePrivilege = -1 # non-zero means error
    Write-Verbose "SeSystemEnvironmentPrivilege failed: $($_.Exception.Message)"
  }

  if ($enablePrivilege -ne 0) {
    $err = [System.ComponentModel.Win32Exception][Runtime.InteropServices.Marshal]::GetLastWin32Error()
    throw [UnauthorizedAccessException]"Current user cannot acquire UEFI variable access permissions: $err ($enablePrivilege)"
  }
  else {
    $newStateStr = if ($State -eq [PrivilegeState]::Enabled) { "Enabling" } else { "Disabling" }
    $prevStateStr = if ($PreviousState.Value -eq [PrivilegeState]::Enabled) { "enabled" } else { "disabled" }
    Write-Verbose "$newStateStr application privilege; it was $prevStateStr before"
  }
}

function Set-HPPrivateFirmwareEnvironmentVariableExW
{
  [CmdletBinding()]
  param(
    $Name,
    $Namespace,
    $RawValue,
    $Len,
    $Attributes
  )

  try {
    $setVariable = [Native]::SetFirmwareEnvironmentVariableExW($Name,$Namespace,$RawValue,$Len,$Attributes)
  }
  catch {
    $setVariable = 0 # zero means error
    Write-Verbose "SetFirmwareEnvironmentVariableExW failed: $($_.Exception.Message)"
  }

  if ($setVariable -eq 0) {
    $err = [System.ComponentModel.Win32Exception][Runtime.InteropServices.Marshal]::GetLastWin32Error();
    throw "Could not write UEFI variable: $err. This function is not supported on legacy BIOS mode, only on UEFI mode.";
  }
}

function Get-HPPrivateFirmwareEnvironmentVariableExW
{
  [CmdletBinding()]
  param(
    $Name,
    $Namespace,
    $Result,
    $Size,
    [ref]$Attributes
  )

  try {
    $getVariable = [Native]::GetFirmwareEnvironmentVariableExW($Name,$Namespace,$Result,$Size,$Attributes)
  }
  catch {
    $getVariable = 0 # zero means error
    Write-Verbose "GetFirmwareEnvironmentVariableExW failed: $($_.Exception.Message)"
  }

  if ($getVariable -eq 0)
  {
    $err = [System.ComponentModel.Win32Exception][Runtime.InteropServices.Marshal]::GetLastWin32Error();
    throw "Could not read UEFI variable: $err. This function is not supported on legacy BIOS mode, only on UEFI mode.";
  }
}

<#
    .SYNOPSIS
    Removes a UEFI variable

    .DESCRIPTION
    This command removes a UEFI variable from a well-known or user-supplied namespace. 

    .PARAMETER Name
    Specifies the name of the UEFI variable to remove

    .PARAMETER Namespace
    Specifies a custom namespace. The namespace must be in the format of a UUID, surrounded by curly brackets.
    
    .EXAMPLE
    PS>  Remove-HPUEFIVariable -Namespace "{21969aa8-681f-46be-90f0-6019ce9b0ee7}" -Name MyVariable

    .NOTES
    - The process calling these commands must be able to acquire 'SeSystemEnvironmentPrivilege' privileges for the operation to succeed. For more information, refer to "Modify firmware environment values" in the linked documentation below.
    - This command is not supported on legacy mode, only on UEFI mode.
    - This command requires elevated privileges.

    .LINK
    [Modify firmware environment values](https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/modify-firmware-environment-values)

#>
function Remove-HPUEFIVariable
{
  [CmdletBinding(DefaultParameterSetName = 'NsCustom',HelpUri = "https://developers.hp.com/hp-client-management/doc/Remove-HPUEFIVariable")]
  [Alias("Remove-UEFIVariable")]
  param(
    [Parameter(Position = 0,Mandatory = $true,ParameterSetName = "NsCustom")]
    [string]$Name,

    [Parameter(Position = 1,Mandatory = $true,ParameterSetName = "NsCustom")]
    [string]$Namespace
  )
  Set-HPUEFIVariable @PSBoundParameters -Value "" -Attributes 7
}

# SIG # Begin signature block
