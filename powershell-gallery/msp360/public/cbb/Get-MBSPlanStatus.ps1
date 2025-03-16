function Get-MBSPlanStatus {
    <#
    .SYNOPSIS
    Shows MBS plan status.
    
    .DESCRIPTION
    This cmdlet provides the last result of the MBS backup plan by its ID.
    
    .PARAMETER Plan
    Specify plan object. Use Get-MBSBackupPlan or Get-MBSRestorePlan cmdlet to list plans.
    
    .PARAMETER MasterPassword
    Specify Master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)
    
    .EXAMPLE
    Get-MBSBackupPlan | Get-MBSPlanStatus
    
    Get statuses for all backup plans.

    .EXAMPLE
    Get-MBSPlanStatus -Plan (Get-MBSBackupPlan | Where Name -eq "Backup Image Based")

    Get status for the "Backup Image Based" plan.

    .EXAMPLE
    Get-MBSPlanStatus -Plan (Get-MBSBackupPlan | Where Name -eq "Backup Image Based") -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)

    Get status for the "Backup Image Based" plan on the protected by master password.

    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
    Author: MSP360 Onboarding Team

    .LINK
    https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/get-mbsplanstatus

    #>
    [CmdletBinding()]
    param (
        # Parameter - Backup plan
        [Parameter(Mandatory=$true, ValueFromPipeline, HelpMessage="Specify plan object. Use Get-MBSBackupPlan or Get-MBSRestorePlan cmdlet to list plans.")]
        [PSCustomObject]
        $Plan,
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
        $Arguments = " status -id $($Plan.ID)"
        $Result = Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output json -MasterPassword $MasterPassword
        if ($Result.Result -ne "Fail") {
            Return $Result
        }
    }
    
    end {
        
    }
}
# SIG # Begin signature block
