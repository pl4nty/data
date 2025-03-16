##########################################################################
# DELL PROPRIETARY INFORMATION
#
# This software is confidential.  Dell Inc., or one of its subsidiaries, has supplied this
# software to you under the terms of a license agreement,nondisclosure agreement or both.
# You may not copy, disclose, or use this software except in accordance with those terms.
#
# Copyright 2020 Dell Inc. or its subsidiaries.  All Rights Reserved.
#
# DELL INC. MAKES NO REPRESENTATIONS OR WARRANTIES ABOUT THE SUITABILITY OF THE SOFTWARE,
# EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT.
# DELL SHALL NOT BE LIABLE FOR ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING,
# MODIFYING OR DISTRIBUTING THIS SOFTWARE OR ITS DERIVATIVES.
#
#
#
##########################################################################

<#
This is a Resource designer script which generates a mof schema for DCPP_POSTBehavior resource in DellBIOSProvider module.


#>

$category = New-xDscResourceProperty -name Category -Type String -Attribute Key
$keypad = New-xDscResourceProperty -name Keypad -Type String -Attribute Write -ValidateSet @("EnabledByFnKey", "EnabledByNumlock")
$numlock = New-xDscResourceProperty -Name Numlock -Type string -Attribute Write -ValidateSet @("Enabled", "Disabled") -Description "Numlock"
$posthotkeys = New-xDscResourceProperty -Name PostMebxKey -Type string -Attribute Write -ValidateSet @("Enabled", "Disabled")
$Fastboot = New-xDscResourceProperty -Name Fastboot -Type string -Attribute Write -ValidateSet @("Minimal", "Thorough", "Automatic") -Description "Fastboot"
$fnlock = New-xDscResourceProperty -name FnLock -Type String -Attribute Write  -ValidateSet @("Enabled", "Disabled")
$fnlockmode = New-xDscResourceProperty -name FnLockMode -Type String -Attribute Write  -ValidateSet @("Secondary", "Standard")
$Password = New-xDscResourceProperty -Name Password -Type string -Attribute Write -Description "Password"
$SecurePassword = New-xDscResourceProperty -Name SecurePassword -Type string -Attribute Write -Description "SecurePassword"
$PathToKey = New-xDscResourceProperty -Name PathToKey -Type string -Attribute Write
$warnAndErr = New-xDscResourceProperty -Name WarningsAndErr -Type string -Attribute Write -ValidateSet @("PromptWrnErr", "ContWrn", "ContWrnErr") -Description "WarningsAndErr"
$powerWarn = New-xDscResourceProperty -Name PowerWarn -Type string -Attribute Write -ValidateSet @("Enabled", "Disabled") -Description "PowerWarn"
$pntDevice = New-xDscResourceProperty -Name PntDevice -Type string -Attribute Write -ValidateSet @("SerialMouse", "Ps2Mouse","Touchpad","SwitchToExternalPS2") -Description "PowerWarn"
$externalHotKey = New-xDscResourceProperty -Name ExternalHotKey -Type string -Attribute Write -ValidateSet @("Enabled", "Disabled") -Description "PowerWarn"
$postF2Key = New-xDscResourceProperty -Name PostF2Key -Type string -Attribute Write -ValidateSet @("Enabled", "Disabled") -Description "PowerWarn"
$postF12Key = New-xDscResourceProperty -Name PostF12Key -Type string -Attribute Write -ValidateSet @("Enabled", "Disabled") -Description "PowerWarn"
$rptKeyErr = New-xDscResourceProperty -Name RptKeyErr -Type string -Attribute Write -ValidateSet @("Enabled", "Disabled") -Description "PowerWarn"
$extPostTime = New-xDscResourceProperty -Name ExtPostTime -Type string -Attribute Write -ValidateSet @("0s", "5s","10s") -Description "PowerWarn"
$signoflife = New-xDscResourceProperty -Name SignOfLifeIndication -Type string -Attribute Write -ValidateSet @("Enabled", "Disabled") -Description "PowerWarn"
$wyseP25 = New-xDscResourceProperty -Name WyseP25Access -Type string -Attribute Write -ValidateSet @("Enabled", "Disabled") -Description "PowerWarn"

$properties = @($category, $keypad, $numlock, $posthotkeys, $Fastboot,$fnlock,$fnlockmode, $Password,$SecurePassword,$PathToKey,$warnAndErr,$powerWarn,$pntDevice,$externalHotKey,$postF2Key,$postF12Key,$rptKeyErr,$extPostTime,$signoflife,$wyseP25)

New-xDscResource -ModuleName DellBIOSProviderX86 -Name DCPP_POSTBehavior -Property $properties -Path 'C:\Program Files\WindowsPowerShell\Modules' -FriendlyName "POSTBehavior" -Force -Verbose

# SIG # Begin signature block
