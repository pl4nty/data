function New-MBSRestorePlanCommonOption {
    <#
    .SYNOPSIS
        Returns MBS.Agent.Plan.RestorePlanCommonOption type object with common restore plan options.
    
    .DESCRIPTION
        Create RestorePlanCommonOption type object with common restore plan options. Used with New-MBSRestorePlan cmdlet.
    
    .PARAMETER SyncRepositoryBeforeRun
        Synchronize local repository before running restore plan
    
    .PARAMETER StopIfPlanRunsFor
        Specify time in HH:MM to stop the plan if it runs for HH hours MM minutes. Example -StopIfPlanRunsFor "20:30" or -StopIfPlanRunsFor "100:00" etc.
    
    .PARAMETER EncryptionPassword
        Encryption password. Use -EncryptionPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .PARAMETER PreActionCommand
        Specify command or scipt to be executed before the restore plan runs.
    
    .PARAMETER PreActionContinueAnyway
        Specify to continue restore plan if a pre-restore action fails.
    
    .PARAMETER PostActionCommand
        Specify command or script to be executed after restore is completed.
    
    .PARAMETER PostActionRunAnyway
        Execute a post-restore action in any case (regardless of the restore plan result).
    
    .PARAMETER ResultEmailNotification
        Specify to send restore plan result notification email when restore fails (errorOnly) or in all cases (on). Prior to turn on the notification settings must be configured.
    
    .PARAMETER AddEventToWindowsLog
        Specify to add entry to Windows Event Log when restore fails (errorOnly) or in all cases (on).
    
    .EXAMPLE
        $CommonOptions = New-MBSRestorePlanCommonOption -SyncRepositoryBeforeRun $true -StopIfPlanRunsFor "10:00" -EncryptionPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force) -PreActionCommand "cmd.exe" -PreActionContinueAnyway $true -PostActionCommand "ps.exe" -PostActionRunAnyway $false -ResultEmailNotification errorOnly -AddEventToWindowsLog off
    
        Create restore plan common options object.
    
    .INPUTS
        None.

    .OUTPUTS
        MBS.Agent.Plan.RestorePlanCommonOption

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/new-mbsrestoreplancommonoption
    #>

    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$False, HelpMessage="Sync before run.")]
        [boolean]
        $SyncRepositoryBeforeRun=$False,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify time in HH:MM to stop the plan if it runs for HH hours MM minutes. Example -StopIfPlanRunsFor ""20:30"" or -StopIfPlanRunsFor ""100:00"" etc.")]
        [ValidatePattern("^([01]?[0-9]|2[0-3]):[0-5][0-9]:[0][0]$")]
        [timespan]
        $StopIfPlanRunsFor='00:00',
        #
        [Parameter(Mandatory=$False, HelpMessage="Encryption password. Use -EncryptionPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        [SecureString]
        $EncryptionPassword,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify command or scipt to be executed before the restore plan runs.")]
        [string]
        $PreActionCommand,
        #
        [Parameter(Mandatory=$False, HelpMessage='Specify to continue restore plan if a pre-restore action fails. Possible values: $true/$false')]
        [Alias("pac")]
        [Nullable[boolean]]
        $PreActionContinueAnyway,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify command or script to be executed after restore is completed.")]
        [string]
        $PostActionCommand,
        #
        [Parameter(Mandatory=$False, HelpMessage='Execute a post-restore action in any case (regardless of the restore plan result). Possible values: $true/$false')]
        [Alias("paa")]
        [Nullable[boolean]]
        $PostActionRunAnyway,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify to send restore plan result notification email when restore fails (errorOnly) or in all cases (on). Prior to turn on the notification settings must be configured. Possible values: errorOnly, on, off")]
        [MBS.Agent.Plan.Notification]
        $ResultEmailNotification = 'off',
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify to add entry to Windows Event Log when restore fails (errorOnly) or in all cases (on). Possible values: errorOnly, on, off")]
        [MBS.Agent.Plan.Notification]
        $AddEventToWindowsLog = 'off'
    )
    
    begin {
        
    }
    
    process {
        $BackupPlanOption = New-Object -TypeName MBS.Agent.Plan.RestorePlanCommonOption
        $BackupPlanOption.SyncRepositoryBeforeRun = $SyncRepositoryBeforeRun
        $BackupPlanOption.EncryptionPassword = $EncryptionPassword
        $BackupPlanOption.StopIfPlanRunsFor = $StopIfPlanRunsFor
        $BackupPlanOption.PreActionCommand = $PreActionCommand
        $BackupPlanOption.PreActionContinueAnyway = $PreActionContinueAnyway
        $BackupPlanOption.PostActionCommand = $PostActionCommand
        $BackupPlanOption.PostActionRunAnyway = $PostActionRunAnyway
        $BackupPlanOption.ResultEmailNotification = $ResultEmailNotification
        $BackupPlanOption.AddEventToWindowsLog = $AddEventToWindowsLog
        return $BackupPlanOption
    }
    
    end {
        
    }
}
# SIG # Begin signature block
