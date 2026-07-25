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

Configuration LCMForRef
{
param
(
[string]$ComputerName
)


Node $ComputerName
{
LocalConfigurationManager
{
ConfigurationMode = "ApplyAndAutoCorrect"
}
}


}

# NOTE: Replace <TARGET-NODE-FQDN> with the fully qualified domain name or IP of the target node.
LCMForRef -ComputerName "<TARGET-NODE-FQDN>"

# NOTE: Replace <ADMIN-USERNAME> and <ADMIN-PASSWORD> with the actual credentials.
# Do NOT hardcode passwords in production scripts; use secure credential stores (e.g., Windows Credential Manager, Azure Key Vault).
$username = "<ADMIN-USERNAME>"
$password = "<ADMIN-PASSWORD>"
$secpwd = ConvertTo-SecureString $password -AsPlainText -Force
$mycred = New-Object System.Management.Automation.PSCredential($username, $secpwd)

Set-DscLocalConfigurationManager -Path .\LCMForRef -Credential $mycred -Force



####
#
#For user's info: commands to immediately apply config without waiting for freq
# Invoke-CimMethod  -Namespace root/Microsoft/Windows/DesiredStateConfiguration -class MSFT_DSCLocalConfigurationManager -MethodName PerformRequiredConfigurationChecks -Arguments @{flags=[uint32]1}
# OR
# Invoke-CimMethod -ComputerName "<TARGET-NODE-FQDN>" -Namespace root/Microsoft/Windows/DesiredStateConfiguration -class MSFT_DSCLocalConfigurationManager -MethodName PerformRequiredConfigurationChecks -Arguments @{flags=[uint32]1}
####

# SIG # Begin signature block
