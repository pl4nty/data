function Compress-MBSDatabase {
    <#
    .SYNOPSIS
        Compress backup agent database
    
    .DESCRIPTION
        Compress backup agent database
    
    .PARAMETER MasterPassword
        Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .EXAMPLE
        PS C:\> Compress-MBSDatabase

        Compress backup agent database
    
    .INPUTS
        None.

    .OUTPUTS
        System.String[]

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/compress-mbsdatabase
    #>
    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
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
        $Arguments = "database -shrink"
        $Result = (Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output full -MasterPassword $MasterPassword).result
        ($Result.replace("Shrink","Compression")).replace("shrink","compression")
    }
    
    end {
        
    }
}
# SIG # Begin signature block
