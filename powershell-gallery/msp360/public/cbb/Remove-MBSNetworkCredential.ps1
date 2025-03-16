function Remove-MBSNetworkCredential {
    <#
    .SYNOPSIS
    Removes network credentials specified in the MBS backup agent.
    
    .DESCRIPTION
    This cdmlet allows to remove network credentials from the MBS backup agent. This could be done either by specifying the network path or a share username as parameters.
    
    .PARAMETER AllNetworkCredentials
    Removes all network credentials specified in the MBS backup agent.
    
    .PARAMETER Path
    Removes all network credentials with specific share path. 
    
    .PARAMETER Login
    Removes all network credentials with specified share username.
    
    .PARAMETER MasterPassword
    Backup agent master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .EXAMPLE
    Remove-MBSNetworkCredential -AllNetworkCredentials

    Removes all network credentials.
    
    .EXAMPLE
    Remove-MBSNetworkCredential -Path \\MyShare

    Removes all network credentials that has "\\MyShare" as a path.
    
    .EXAMPLE
    Remove-MBSNetworkCredential -Login UserName

    Removes all network credentials that has "UserName" as a share login.

    .INPUTS
    None.

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
    Author: MSP360 Onboarding Team

    .LINK
    https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/remove-mbsnetworkcredential
    #>

    [CmdletBinding()]
    param (
        # Parameter - All existing network credentials
        [Parameter(Mandatory=$false, HelpMessage="Delete all existing network credentials", ParameterSetName='AllNetworkCredentials')]
        [switch]
        $AllNetworkCredentials,
        # Parameter - Network share path
        [Parameter(Mandatory=$false, HelpMessage="Delete network credentials by path", ParameterSetName='Path')]
        #[Parameter(Mandatory=$true, HelpMessage="Delete network credentials by path", ParameterSetName='PathLogin')]
        [string]
        $Path,
        # Parameter - Login username
        [Parameter(Mandatory=$false, HelpMessage="Delete network credentials by share login", ParameterSetName='Login')]
        #[Parameter(Mandatory=$true, HelpMessage="Delete network credentials by share login", ParameterSetName='PathLogin')]
        [string]
        $Login,
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
        $Arguments = " nwcDelete"
        if ($AllNetworkCredentials) {
            $Arguments += " -a"
        }
        if ($PsCmdlet.ParameterSetName -eq 'PathLogin') {
            $Arguments += " -nl ""$Path"" ""$Login"""
        } else {
            if ($Path) {
                $Arguments += " -n ""$Path"""
            }
            if ($Login) {
                $Arguments += " -l ""$Login"""
            }
        }
        (Start-MBSProcess -cmdpath $CBB.CBBCLIPath -cmdarguments $Arguments -output short -MasterPassword $MasterPassword).result
    }
    
    end {
        
    }
}
# SIG # Begin signature block
