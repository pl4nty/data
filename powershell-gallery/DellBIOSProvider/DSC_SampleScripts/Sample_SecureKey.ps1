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

# IMPORTANT: Store the AES key on a separate, ACL-restricted share that only the DSC service account can read.
# Do NOT place the key file and the encrypted password file on the same share or with broad read permissions.
# Replace the placeholder paths below with your actual secured paths.
$KeyFile = "<ACL-RESTRICTED-KEY-PATH>\AES.key"           # e.g. \\KeyServer\RestrictedShare$\AES.key
$Key = New-Object Byte[] 16   # You can use 16, 24, or 32 for AES
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($Key)
$Key | Out-File $KeyFile

$PasswordFile = "<SECURE-PASSWORD-PATH>\Password.txt"     # e.g. \\ConfigServer\DSCSecrets$\Password.txt
$Key_file = Get-Content $KeyFile

# NOTE: Replace <BIOS-ADMIN-PASSWORD> with the actual BIOS admin password.
# Do NOT hardcode passwords in production scripts; use secure credential stores (e.g., Windows Credential Manager, Azure Key Vault).
$Password = "<BIOS-ADMIN-PASSWORD>" | ConvertTo-SecureString -AsPlainText -Force
$Password | ConvertFrom-SecureString -Key $Key_file | Out-File $PasswordFile

$secure_pwd = Get-Content $PasswordFile

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
          PathToKey = "<ACL-RESTRICTED-KEY-PATH>\AES.key"
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
          PathToKey = "<ACL-RESTRICTED-KEY-PATH>\AES.key"
        }

    }
}

# Call the configuration. 
# It will create a folder with the same name as configuration name (\POSTBehaviorConfiguration)and will contain mof output file.

# NOTE: Replace <TARGET-NODE-FQDN> with the fully qualified domain name or IP of the target node.
MultipleCatConfiguration -ComputerName "<TARGET-NODE-FQDN>"


#Push Mof
Start-DscConfiguration -Path .\MultipleCatConfiguration\ -wait -verbose -debug -force


# SIG # Begin signature block
