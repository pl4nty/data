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
$integratedNIC = New-xDscResourceProperty -name IntegratedNIC -Type String -Attribute Write -ValidateSet @("Enabled", "Enabled with PXE", "Enabled with ImageServer", "Enabled with RPL Boot", "Enabled with ISCSI Boot")
$uefiNetworkStack = New-xDscResourceProperty -name UEFINetworkStack -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$parallelPort = New-xDscResourceProperty -name ParallelPort -Type String -Attribute Write -ValidateSet @("Disabled", "AT", "PS2", "ECP")
$serialPort1 = New-xDscResourceProperty -name SerialPort1 -Type String -Attribute Write -ValidateSet @("Disabled", "COM1", "COM2", "COM3", "COM4", "Auto")
$sataOperation = New-xDscResourceProperty -name SATAOperation -Type String -Attribute Write -ValidateSet @("Disabled", "ATA", "AHCI", "RAID On")
$sata0 = New-xDscResourceProperty -name SATA0 -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$sata1 = New-xDscResourceProperty -name SATA1 -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$sata2 = New-xDscResourceProperty -name SATA2 -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$sata3 = New-xDscResourceProperty -name SATA3 -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$smartReporting = New-xDscResourceProperty -name SMARTReporting -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$usbPowerShare = New-xDscResourceProperty -name USBPowerShare -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$audio = New-xDscResourceProperty -name Audio -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$keyboardIllumination = New-xDscResourceProperty -name KeyboardIllumination -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$keyboardBacklightwithAC = New-xDscResourceProperty -name KeyboardBacklightWithAC -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$Password = New-xDscResourceProperty -Name Password -Type string -Attribute Write -Description "Password"
$SecurePassword = New-xDscResourceProperty -Name SecurePassword -Type string -Attribute Write -Description "SecurePassword"
$PathToKey = New-xDscResourceProperty -Name PathToKey -Type string -Attribute Write



$properties = @($category, $integratedNIC, $uefiNetworkStack, $parallelPort, $serialPort1, $sataOperation, $sata0, $sata1, $sata2, $sata3, $smartReporting, $usbPowerShare, $audio, $keyboardIllumination, $keyboardBacklightwithAC,$Password,$SecurePassword,$PathToKey)

New-xDscResource -ModuleName DellBIOSProviderX86 -Name DCPP_SystemConfiguration -Property $properties -Path 'C:\Program Files\WindowsPowerShell\Modules' -FriendlyName "SystemConfiguration" -Force -Verbose

# SIG # Begin signature block
