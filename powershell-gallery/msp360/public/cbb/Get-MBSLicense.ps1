function Get-MBSLicense {
    <#
    .SYNOPSIS
    Shows the license information.
    
    .DESCRIPTION
    This cmdlet provides the information about the license used by current MBS user.
    
    .PARAMETER MasterPassword
    Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .EXAMPLE
    PS C:\> Get-MBSLicense

    Show the license ID and the user using that license.

    .INPUTS
    None.

    .OUTPUTS
    MBS.Agent.License

    .NOTES
    Author: MSP360 Onboarding Team

    .LINK
    https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/get-mbslicense
    #>

    [CmdletBinding()]
    param (
        # Parameter - Master password
        [Parameter(Mandatory=$false, HelpMessage="Specify Master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
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
        $Arguments = " showLicense"
        $Result = Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output json -MasterPassword $MasterPassword
        if ($result.Result -eq "Success") {
            Return [MBS.Agent.License]@{
                User = $Result.User
                ID = $Result.ID
            } 
        }
    }
    
    end {
        
    }
}
# SIG # Begin signature block
