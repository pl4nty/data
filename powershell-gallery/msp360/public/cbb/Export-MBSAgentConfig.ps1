function Export-MBSAgentConfig {
    <#
    .SYNOPSIS
    Export backup agent coniguration.
    
    .DESCRIPTION
    Export backup agent coniguration.
    
    .PARAMETER Path
    Specify path to configuration archive file.
    
    .PARAMETER RemoveEncryptionPassword
    Specify to remove encryption passwords. Should be specified during import via the Import Configuration dialog. Not supported in the Import-MBSAgentConfig command.
    
    .PARAMETER MasterPassword
    Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .EXAMPLE
    Export-MBSAgentConfig -Path "C:\Temp\Configuration_20201218132026.cbbconfiguration"

    Export configuration archive from the path "C:\Temp\Configuration_20201218132026.cbbconfiguration".
    
    .EXAMPLE
    Export-MBSAgentConfig -Path "C:\Temp\Configuration_20201218132026.cbbconfiguration" -RemoveEncryptionPassword

    Export configuration archive from the path "C:\Temp\Configuration_20201218132026.cbbconfiguration" and remove encryption password.

    .EXAMPLE
    Export-MBSAgentConfig -Path "C:\Temp\Configuration_20201218132026.cbbconfiguration" -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)

    Export configuration archive from the path "C:\Temp\Configuration_20201218132026.cbbconfiguration" from the backup agent protected with the master password.
    
    .INPUTS
        None
    .OUTPUTS
        String
        String[]
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/export-mbsagentconfig
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="Specify path to configuration archive file")]
        [String]
        $Path,
        [Parameter(Mandatory=$false, HelpMessage="Specify to remove encryption passwords. Should be specified during import via the Import Configuration dialog. Not supported in the Import-MBSAgentConfig command.")]
        [switch]
        $RemoveEncryptionPassword,
        [Parameter(Mandatory=$false, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        [SecureString]
        $MasterPassword
    )
    
    begin {
        if (-not($CBB = Get-MBSAgent)) {
            Break
        }
        if (-Not(Test-MBSAgentMasterPassword)) {
            $MasterPassword = $null
        } else {
            if (-Not(Test-MBSAgentMasterPassword -CheckMasterPassword -MasterPassword $MasterPassword)) {
                $MasterPassword = Read-Host -AsSecureString -Prompt "Master Password"
                if (-Not(Test-MBSAgentMasterPassword -CheckMasterPassword -MasterPassword $MasterPassword)) {
                    Write-Error "ERROR: Master password is not specified"
                    Break
                }
            }
        }
    }
    
    process {
        $Arguments = "exportConfig -f ""$($Path)"""
        if ($RemoveEncryptionPassword) {
            $Arguments += " -rp"
        }

        $Null = Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output Full -MasterPassword $MasterPassword
    }
    
    end {
        
    }
}
# SIG # Begin signature block
