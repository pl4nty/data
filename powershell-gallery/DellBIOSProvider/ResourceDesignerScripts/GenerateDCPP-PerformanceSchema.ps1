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
$multiCoreSupport = New-xDscResourceProperty -name MultiCoreSupport -Type String -Attribute Write -ValidateSet @("1", "2", "4", "6", "8", "10", "12", "14", "16", "All")
$intelSpeedStep = New-xDscResourceProperty -name IntelSpeedStep -Type String -Attribute Write -ValidateSet @("Disabled", "Automatic", "Maximum Performance", "Maximum Battery")
$cstates = New-xDscResourceProperty -name CStates -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$intelTurboBoost = New-xDscResourceProperty -name IntelTurboBoost -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$hyperThreadControl = New-xDscResourceProperty -name HyperThreadControl -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$Password = New-xDscResourceProperty -Name Password -Type string -Attribute Write -Description "Password"
$SecurePassword = New-xDscResourceProperty -Name SecurePassword -Type string -Attribute Write -Description "SecurePassword"
$PathToKey = New-xDscResourceProperty -Name PathToKey -Type string -Attribute Write


$properties = @($category, $multiCoreSupport, $intelSpeedStep, $cstates, $intelTurboBoost, $hyperThreadControl,$Password,$SecurePassword,$PathToKey)

New-xDscResource -ModuleName DellBIOSProviderX86 -Name DCPP_Performance -Property $properties -Path 'C:\Program Files\WindowsPowerShell\Modules' -FriendlyName "Performance" -Force -Verbose

# SIG # Begin signature block
