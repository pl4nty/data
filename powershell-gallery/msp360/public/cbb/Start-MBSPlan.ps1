function Start-MBSPlan {
    <#
    .SYNOPSIS
        Run backup and restore plans.
    .DESCRIPTION
        Run backup and restore plans.
    .EXAMPLE
        PS C:\> Start-MBSPlan -Name "Backup VMware"
        Start plan by name.
    .EXAMPLE
        PS C:\> Start-MBSPlan -ID ed2e0d37-5ec2-49e1-a381-d2246b3108ec
        Start plan by the plan ID.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -StorageType Local -PlanType VMware | Start-MBSPlan
        Start VMware backup plans with local backup storages type.
    .EXAMPLE
        PS C:\> Get-MBSRestorePlan -StorageType All -PlanType VMware | Start-MBSPlan
        Start VMware restore plans with all backup storages type.
    .EXAMPLE
        PS C:\>Start-MBSPlan -ID 3a2fde55-9ecd-4940-a75c-d1499b43abda -ForceFull -ForceFullDayOfWeek Friday, Monday
        Run force full on specific day of the week.
    .INPUTS
        System.String[]
        System.String
    .OUTPUTS
        System.String[]
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/start-mbsplan
    #>

    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $ID,
        #
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $Name,
        #
        [switch]
        $ForceFull,
        #
        [ValidateSet("Monday", "Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")]
        [string[]]
        $ForceFullDayOfWeek,
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
        if ($ID){
            $Arguments += "plan -r $ID"
        }else{
            $Arguments += "plan -r ""$Name"""
        }
        
        if($ForceFull){
            if ($ForceFullDayOfWeek){
                if((get-date).DayOfWeek -in $ForceFullDayOfWeek){
                    $Arguments += " -ForceFull"
                }
            }else {
                $Arguments += " -ForceFull"
            }
        }
        $Result = Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output short -MasterPassword $MasterPassword
    }
    
    end {
    }
}

Set-Alias -Name Start-MBSBackupPlan -Value Start-MBSPlan
Set-Alias -Name Start-MBSRestorePlan -Value Start-MBSPlan
# SIG # Begin signature block
