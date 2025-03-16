function Remove-MBSPlan {
    <#
    .SYNOPSIS
    Removes existing backup and restore plans
    
    .DESCRIPTION
    Removes MBS backup and restore plans either by it's Name or ID. 
    
    .PARAMETER Name
    Backup or restore plan name
    
    .PARAMETER ID
    Backup or restore plan ID
    
    .PARAMETER MasterPassword
    Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .EXAMPLE
    Remove-MBSPlan -Name "File backup plan"
    
    Removes plan with name "File backup plan"

    .EXAMPLE
    Remove-MBSPlan -id d39325ee-d54a-41e2-95d5-9bc476c7881d

    Removes plan with ID d39325ee-d54a-41e2-95d5-9bc476c7881d

    .INPUTS
        System.Management.Automation.PSCustomObject

    .OUTPUTS
        None

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/remove-mbsplan

    #>

    [CmdletBinding()]
    param (
        # Parameter - backup plan name
        [Parameter(Mandatory=$true, HelpMessage="Specify Backup plan name", ParameterSetName='Name')]
        [String]
        $Name,
        # Parameter - backup plan ID
        [Parameter(Mandatory=$true, HelpMessage="Specify Backup plan ID", ParameterSetName='ID', ValueFromPipelineByPropertyName)]
        [String]
        $ID,
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
        if ($Name) {
            $Arguments = "deleteBackupPlan -n $Name"
        } else {
            $Arguments = "deleteBackupPlan -ID $ID"
        }

        (Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output short -MasterPassword $MasterPassword).result
    }
    
    end {
        
    }
}

Set-Alias -Name Remove-MBSBackupPlan -Value Remove-MBSPlan
Set-Alias -Name Remove-MBSRestorePlan -Value Remove-MBSPlan
# SIG # Begin signature block
