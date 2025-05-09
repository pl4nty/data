function Stop-MBSPlan {
    <#
    .SYNOPSIS
        Stop running backup and restore plans.
    .DESCRIPTION
        The Stop-MBSPlan cmdlet stops a backup or restore plan with specified ID or Name.
    .EXAMPLE
        PS C:\> Stop-MBSPlan -Name "Backup VMware"
        Stop running plan by name.
    .EXAMPLE
        PS C:\> Stop-MBSPlan -ID ed2e0d37-5ec2-49e1-a381-d2246b3108ec
        Stop running plan by the plan ID.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -StorageType Local -PlanType VMware | Stop-MBSPlan
        Stop running VMware backup plans with local backup storages type.
    .EXAMPLE
        PS C:\> Get-MBSRestorePlan -StorageType All -PlanType VMware | Stop-MBSPlan
        Stop running VMware restore plans with all backup storages type.
    .INPUTS
        System.String[]
        System.String
    .OUTPUTS
        System.String[]
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/stop-mbsplan
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
        $Force,
        #
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        [SecureString]
        $MasterPassword
    )
    
    begin {
        if (-not($CBB = Get-MBSAgent)) {
            Break
        }
        $CBBVersion = [version]$CBB.version
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
        $Arguments = "plan"
        if ($Force){
            if ($CBBVersion -ge [version]"7.8.2") {
                $Arguments += " -fs"
            }else{
                Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Backup agent version is $CBBVersion. Using double stop method for ""Force"" option"
                $Arguments += " -s"
            }
        }else{
            $Arguments += " -s"
        }
        if ($ID){
            $Arguments += " $ID"
        }else{
            $Arguments += " ""$Name"""
        }
        
        $Result = Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output short -MasterPassword $MasterPassword
        if (($Force) -and ($CBBVersion -lt [version]"7.8.2")){
            $Result = Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output short -MasterPassword $MasterPassword
        }
    }
    
    end {
    }
}

Set-Alias -Name Stop-MBSBackupPlan -Value Stop-MBSPlan
Set-Alias -Name Stop-MBSRestorePlan -Value Stop-MBSPlan
# SIG # Begin signature block
