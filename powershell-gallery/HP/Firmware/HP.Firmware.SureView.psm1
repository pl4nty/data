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
$ErrorActionPreference = "Stop"
#requires -Modules "HP.Private" 

# CMSL is normally installed in C:\Program Files\WindowsPowerShell\Modules
# but if installed via PSGallery and via PS7, it is installed in a different location
if (Test-Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll") {
  Add-Type -Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll"
}
else{
  Add-Type -Path "$PSScriptRoot\..\..\HP.Private\1.8.5\HP.CMSLHelper.dll"
}

<#
.SYNOPSIS
  Retrieves the state of the HP Sure View electronic privacy filter if available

.DESCRIPTION
  This command retrieves the state of HP Sure View electronic privacy filter if available on the system.
.NOTES
  - Requires HP BIOS.
  - This command requires elevated privileges.

.EXAMPLE
    Get-HPSureViewState

.LINK
  [Set-HPSureViewState](https://developers.hp.com/hp-client-management/doc/Set-HPSureViewState)

.LINK
  [Test-HPSureViewIsSupported](https://developers.hp.com/hp-client-management/doc/Test-HPSureViewIsSupported)

.NOTES
  Information about HP Sure View forced state is available via the public WMI property 'Force Enable HP Sure View"'
#>
function Get-HPSureViewState
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPSureViewState")]
  param()
  $mi_result = 0

  $data = New-Object -TypeName sureview_state_t
  switch (Test-HPOSBitness) {
    32 { $result = [DfmNativeSureView]::get_sureview_state32([ref]$data,[ref]$mi_result) }
    64 { $result = [DfmNativeSureView]::get_sureview_state64([ref]$data,[ref]$mi_result) }
  }

  Test-HPPrivateCustomResult -result $result -mi_result $mi_result -Category 0x02

  if (($data.Status -eq [sureview_status_t]::sureview_unknown) -or
    ($data.Status -eq [sureview_status_t]::sureview_unsupported)
  )
  {
    Write-Verbose ("HP Sure View is not supported on this system.")
    throw [NotSupportedException]"This platform does not support HP Sure View"
  }

  New-Object -TypeName PSObject -Property @{
    State = $data.Status
    VisibilityPercentage = $data.visibility
    Capabilities = $data.Capabilities
  }
}

<#
.SYNOPSIS
  Checks if HP Sure View is supported

.DESCRIPTION
  This command returns $true if HP Sure View is supported by the current platform and returns $false otherwise.

.NOTES
  - Requires HP BIOS.
  - This command requires elevated privileges.

.EXAMPLE
    Test-HPSureViewIsSupported

.LINK
  [Get-HPSureViewState](https://developers.hp.com/hp-client-management/doc/Get-HPSureViewState)

.LINK
  [Set-HPSureViewState](https://developers.hp.com/hp-client-management/doc/Set-HPSureViewState)

#>
function Test-HPSureViewIsSupported
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Test-HPSureViewIsSupported")]
  param()
  $mi_result = 0
  $data = New-Object -TypeName sureview_state_t
  switch (Test-HPOSBitness) {
    32 { $result = [DfmNativeSureView]::get_sureview_state32([ref]$data,[ref]$mi_result) }
    64 { $result = [DfmNativeSureView]::get_sureview_state64([ref]$data,[ref]$mi_result) }
  }
  Test-HPPrivateCustomResult -result $result -mi_result $mi_result -Category 0x02

  if (($data.Status -eq [sureview_status_t]::sureview_unknown) -or
    ($data.Status -eq [sureview_status_t]::sureview_unsupported)
  )
  {
    $false
  }
  else
  {
    $true
  }
}



<#
.SYNOPSIS
  Sets HP Sure View state

.DESCRIPTION
  This command turns HP Sure View on and off and controls settings associated with HP Sure View.

.NOTES
  - Requires HP BIOS.
  - This command requires elevated privileges.

.EXAMPLE
  Set-HPSureViewState -on -level 80

.EXAMPLE
  Set-HPSureViewState -off

.PARAMETER on
  If specified, this command turns HP Sure View on.

.PARAMETER off
  If specified, this command turns HP Sure View off.

.PARAMETER level
  Specifies the privacy level, as an integer between 0 and 100, if turning HP Sure View on. A privacy level of 100 will provide the most privacy, but it would also reduce the screen brightness the most.
  If this parameter is not specified, turning HP Sure View on will default the privacy level to the maximum privacy level.

.LINK
  [Test-HPSureViewIsSupported](https://developers.hp.com/hp-client-management/doc/Test-HPSureViewIsSupported)

.LINK
  [Get-HPSureViewState](https://developers.hp.com/hp-client-management/doc/Get-HPSureViewState)

.NOTES
  To force HP Sure View on or off, you can set the public WMI setting 'Force Enable HP Sure View' to Enable or Disable, as needed.
#>
function Set-HPSureViewState
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Set-HPSureViewState")]
  param(
    [Parameter(ParameterSetName = 'turnOn',Position = 0,Mandatory = $true)]
    [switch]$On,

    [Parameter(ParameterSetName = 'turnOff',Position = 0,Mandatory = $true)]
    [switch]$Off,

    [ValidateRange(-1,100)]
    [Parameter(ParameterSetName = 'turnOn',Position = 1,Mandatory = $false)]
    [int]$Level = -1
  )

  if ((Test-HPSureViewIsSupported) -eq $false)
  {
    throw [NotSupportedException]"This platform does not support HP Sure View"
  }

  if ($level -ne -1) { $level = (100 - $level) }

  if ($on.IsPresent -and ($level -ne -1)) {
    Write-Verbose ("Setting Sure View on to privacy level $level")
    $wanted = [sureview_desired_state_t]::sureview_desired_on
  }
  elseif ($on.IsPresent) {
    Write-Verbose ("Setting Sure View on to maximum privacy")
    $wanted = [sureview_desired_state_t]::sureview_desired_on_max
    $level = 0
  }
  else {
    Write-Verbose ("Setting Sure View off")
    $wanted = [sureview_desired_state_t]::sureview_desired_off
    $level = 0
  }

  $mi_result = 0
  switch (Test-HPOSBitness) {
    32 { $result = [DfmNativeSureView]::set_sureview_state32($wanted,$level,[ref]$mi_result) }
    64 { $result = [DfmNativeSureView]::set_sureview_state64($wanted,$level,[ref]$mi_result) }
  }
  Test-HPPrivateCustomResult -result $result -mi_result $mi_result -Category 0x02
}



# SIG # Begin signature block
