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

Set-StrictMode -Version 3.0
#requires -Modules "HP.Private", "HP.Firmware"

# CMSL is normally installed in C:\Program Files\WindowsPowerShell\Modules
# but if installed via PSGallery and via PS7, it is installed in a different location
if (Test-Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll") {
  Add-Type -Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll"
}
else{
  Add-Type -Path "$PSScriptRoot\..\..\HP.Private\1.8.1\HP.CMSLHelper.dll"
}

enum RetailDockStatus{
  NotDocked = 0
  Docked = 1
  Jammed = 2
  Unknown = 0xff
}


enum RetailHubType{
  NotPresent = 0
  AdvancedConnectivityBase = 1
  BasicConnectivityBase = 2
  Unknown = 0xff
}


enum RetailDockMode{
  FastRelease = 0
  FastReleaseAndPIN = 1
  Privileged = 2
  PrivilegedAndPIN = 3
  Application = 4
  Unknown = 0xff
}


<#
.SYNOPSIS
  Retrieves information about an HP Retail system

.DESCRIPTION
  This command retrieves information about an HP Retail system such as the HP Engage system.


.PARAMETER ShowPin
  If specified, this command will show the PIN in the output. 


.EXAMPLE
  Get-HPRetailSmartDockConfiguration -ShowPin


.NOTES
  - This command requires elevated privileges.
  - This is a special purpose command that will only execute successfully in the presence of supported hardware.

#>
function Get-HPRetailSmartDockConfiguration {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPRetailSmartDockConfiguration")]
  param(
    [switch]$ShowPin
  )

  [RetailInformation]$c = Get-HPPrivateRetailConfiguration
  $configuration = [ordered]@{
    RetailSmartDockSupported = $false
  }
  if ($c.IsSupported) {

    Write-Verbose 'Firmware supports retail smart dock'
    $configuration.RetailSmartDockSupported = $true
    $configuration.Add("RetailSmartDockMode",[RetailDockMode]$c.Mode)
    $configuration.Add("RetailSmartDockTimeoutSeconds",$c.Timeout) # what is 'timeout' ?
    $configuration.Add("RetailSmartDockState",[RetailDockStatus]$c.DockState)
    $configuration.Add("RetailSmartDockHub",[RetailHubType]$c.HubState)
    $configuration.Add("RetailSmartDockDockCounter",$c.DockCounter)
    #$configuration.Add("RetailSmartDockUndockCounter",$c.UndockCounter)
    $configuration.Add("RetailSmartDockBaseLockoutSeconds",$c.BaseLockoutTimer)
    $configuration.Add("RetailSmartDockRelockSeconds",$c.RelockTimer)


    if ($c.PinSize) {
      $configuration.PinIsSet = $true

      if ($ShowPin.IsPresent) {
        $configuration.Add("ActivePIN",[System.Text.Encoding]::UTF8.GetString($c.Pin).trim())

      }
    }
    else {
      $configuration.PinIsSet = $false
    }

  }
  else {
    Write-Verbose 'Firmware does not support retail smart dock'
  }
  $configuration
}


<#
.SYNOPSIS
  Configures an HP Retail System

.DESCRIPTION
  This command configures the settings of an HP Retail system such as the HP Engage Go system. 

.PARAMETER Mode
  Specifies the mode to activate. The value must be one of the following values: 

    - FastRelease: Default mode where no authentication is required. Simply unlock the tablet with the touch of a button. Do not use the -PIN parameter. 
    - FastReleaseAndPIN: A PIN is required to unlock the tablet.
    - Privileged: Only privileged users (users with admin login) can unlock the tablet. Do not use PIN parameter. 
    - PrivilegedAndPIN: Only privileged users (users with admin login) with a PIN can unlock the tablet.
    - Application: Mode for applications. A PIN is required. 

.PARAMETER PIN
  Specifies the PIN to set. The PIN must be a numeric string between 4 and 10 characters. This parameter is mandatory for 'FastReleaseAndPIN', 'PrivilegedAndPIN', and 'Application'. This parameter must not be supplied for the other modes.

.PARAMETER PINData
  Specifies the SecureString PINData to use

.PARAMETER BaseLockoutTime
  Sets the base lockout time in seconds. This must be a value between 30 and 1800 seconds.

.PARAMETER RelockTime
  Sets the relock time in seconds. This must be a value between 10 and 300 seconds.


.EXAMPLE
  Set-HPRetailSmartDockConfiguration -Mode PrivilegedAndPIN -PIN 123456

.NOTES
 - This command requires elevated privileges.
 - This is a special purpose command that will only execute successfully in the presence of supported hardware.

#>

function Set-HPRetailSmartDockConfiguration {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Set-HPRetailSmartDockConfiguration")]
  param(
    [Parameter(ParameterSetName = 'Mode',Position = 0,Mandatory = $true)]
    [Parameter(ParameterSetName = 'ModePin',Position = 0,Mandatory = $true)]
    [Parameter(ParameterSetName = 'ModeSPin',Position = 0,Mandatory = $true)]
    [ValidateSet('FastRelease','FastReleaseAndPIN','Privileged','PrivilegedAndPIN','Application')]
    [RetailDockMode]$Mode = 'Unknown',


    [Parameter(ParameterSetName = 'ModePin',Position = 1,Mandatory = $true)]
    [ValidatePattern("^\d*$")]
    [ValidateLength(4,10)]
    [string]$PIN,

    [Parameter(ParameterSetName = 'ModeSPin',Position = 1,Mandatory = $true)]
    [securestring]$PINData,


    [Parameter(ParameterSetName = 'All',Position = 2,Mandatory = $false)]
    [Parameter(ParameterSetName = 'Mode',Position = 2,Mandatory = $false)]
    [Parameter(ParameterSetName = 'ModePin',Position = 2,Mandatory = $false)]
    [Parameter(ParameterSetName = 'ModeSPin',Position = 2,Mandatory = $false)]
    [ValidatePattern("^\d*$")]
    [ValidateRange(30,1800)]
    [int]$BaseLockoutTime = 0,

    [Parameter(ParameterSetName = 'All',Position = 3,Mandatory = $false)]
    [Parameter(ParameterSetName = 'Mode',Position = 3,Mandatory = $false)]
    [Parameter(ParameterSetName = 'ModePin',Position = 3,Mandatory = $false)]
    [Parameter(ParameterSetName = 'ModeSPin',Position = 3,Mandatory = $false)]
    [ValidatePattern("^\d*$")]
    [ValidateRange(10,300)]
    [int]$RelockTime = 0

  )
  if (($Mode -eq "Unknown") -and (-not $BaseLockoutTime) -and (-not $RelockTime)) {

    Write-Verbose "Nothing to do."
    return
  }
  [RetailInformation]$r = Get-HPPrivateRetailConfiguration -Verbose:$VerbosePreference

  if ($r -and $r.IsSupported) {
    if ($Mode -eq "FastRelease" -or $Mode -eq "Privileged") {
      Write-Verbose "Handling docking mode $Mode (this mode doesn't require a PIN)"
      if ($Pin -or $PINData) {
        Write-Verbose "PIN Specified for mode '$Mode' which does not accept a PIN"
        throw [ArgumentException]"PIN or PINData is not valid for this mode."
      }
      $r.PinSize = 0
      $r.Pin = @(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
    }


    if ($mode -eq "FastReleaseAndPIN" -or $mode -eq "PrivilegedAndPIN" -or $mode -eq "Application") {
      Write-Verbose "Handling docking mode $Mode (this mode requires a PIN)"
      if (-not $Pin -and -not $PinData) {
        Write-Verbose "PIN not specified for mode '$Mode' which requires a PIN"
        throw [ArgumentException]"PIN or PINData may not be null for this mode."
      }
      if ($PinData) {
        Write-Verbose 'Using SecureString PIN'
        $pin = (New-Object System.Net.NetworkCredential -ArgumentList "",$PinData).Password
        if (($pin.Length -lt 4) -or ($pin.Length -gt 10)) {
          throw [ArgumentException]("PIN must be between 4 and 10 characters in length.")

        }
        if (-not $pin -match "^\d*$") {
          throw [ArgumentException]("PIN can only contain characters 0 through 9")
        }
      }
      else {
        Write-Verbose 'Using plain test PIN'
      }

      if ($Pin -or $PinData) {
        $pinbytes = ([System.Text.Encoding]::UTF8.GetBytes($Pin) | ForEach-Object { $_ - 0x30 })
        $padding = New-Object byte[] (16 - $pinbytes.Length)
        $r.Pin = $pinbytes + $padding
        $r.PinSize = $Pin.Length
      }
    }

    $r.Mode = $Mode
    if (-not $pin -and -not $pindata) {
      $r.Pin = $r.Pin | ForEach-Object { if ($_ -ge 0x30) { $_ - 0x30 } else { $_ } }
    }
    if ($BaseLockoutTime) {
      Write-Verbose "Setting BaseLockoutTimer to $BaseLockoutTime seconds"
      $r.BaseLockoutTimer = $BaseLockoutTime
    }

    if ($RelockTime) {
      Write-Verbose "Setting RelockTimer to $RelockTime seconds"
      $r.RelockTimer = $RelockTime
    }

    Set-HPPrivateRetailConfiguration -configuration $r
  }
  else {
    throw [NotSupportedException]"This platform does not support HP Retail Smart Dock"
  }
}



# SIG # Begin signature block
