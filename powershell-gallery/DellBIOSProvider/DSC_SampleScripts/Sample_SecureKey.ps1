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

$KeyFile = "\\Machine1\MySecurePath\AES.key"
$Key = New-Object Byte[] 16   # You can use 16, 24, or 32 for AES
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($Key)
$Key | out-file $KeyFile

$PasswordFile = "\\Machine1\SharedPath\Password.txt"
$Key_file = Get-Content $KeyFile
$Password = "P@ssword1" | ConvertTo-SecureString -AsPlainText -Force
$Password | ConvertFrom-SecureString -key $Key_file | Out-File $PasswordFile

$secure_pwd=Get-Content $PasswordFile

Configuration MultipleCatConfiguration
{
  param 
    ( 
        [string]$ComputerName
    ) 

    Import-DscResource -ModuleName DellBIOSProvider

 
 
    Node $ComputerName {
        POSTBehavior POSTBehaviorSettings    #resource name
        {
          Category = "POSTBehavior"
          Keypad = "EnabledByNumlock"
          PowerWarn = "Disabled"
          Numlock = "Disabled"
          SecurePassword=$secure_pwd.ToString()
          PathToKey = "\\Machine1\MySecurePath\AES.key"
        }

        PowerManagement PowerManagementSettings    #resource name
        {
          Category = "PowerManagement"
          BlockDefinition="1"
          AutoOnHr=15
          AutoOnMn=42
          AdvancedBatteryChargeConfiguration = "Tuesday"
          BeginningOfDay = "10:30"
          WorkPeriod = "15:45"
          PeakShiftDayConfiguration = "Saturday"
          StartTime = "10:30"
          EndTime = "12:30"
          ChargeStartTime = "13:30"          
          SecurePassword=$secure_pwd.ToString()
          PathToKey = "\\Machine1\MySecurePath\AES.key"
        }

    }
}

# Call the configuration. 
# It will create a folder with the same name as configuration name (\POSTBehaviorConfiguration)and will contain mof output file.

MultipleCatConfiguration -ComputerName 10.194.23.66


#Push Mof
Start-DscConfiguration -Path .\MultipleCatConfiguration\ -wait -verbose -debug -force


# SIG # Begin signature block
