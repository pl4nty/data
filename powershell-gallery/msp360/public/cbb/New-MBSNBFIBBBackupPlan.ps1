function New-MBSNBFIBBBackupPlan {
    <#
    .SYNOPSIS
    Creates new Image-Based backup plan.
    
    .DESCRIPTION
    Creates new Image-Based backup plan.
    
    .PARAMETER Name
    Backup plan name.
    
    .PARAMETER StorageAccount
    Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name "AWS S3")
    
    .PARAMETER MasterPassword
    Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .PARAMETER Schedule
    Specify schedule. Use New-MBSNBFPlanSchedule -Incremental to create an object.
    
    .PARAMETER FullSchedule
    Specify force full schedule. Use New-MBSNBFPlanSchedule -Full to create an object.
    
    .PARAMETER BackupVolumes
    Backup Volumes type. 
    
    .PARAMETER Volumes
    Backup selected volumes. Use (Get-MBSDiskVolume).volumes to get volumes. Use ((Get-MBSDiskVolume).volumes | Where-Object MountPoints -in "D:\","C:\") if you want to backup only D: and C: drive.
    
    .PARAMETER RestoreVerificationMode
    Run restore verification mode.

    .PARAMETER DisableVSS
    Disable VSS, use direct access to NTFS volume
    
    .PARAMETER IgnoreBadSectors
    Ignore bad sectors
    
    .PARAMETER UseSystemVSS
    Use system VSS provider
    
    .PARAMETER PrefetchBlockCount
    Prefetch block count (0 - 100, 0 without prefetch)
    
    .PARAMETER BlockSize
    Block size. Possible values: 128, 256, 512, 1024

    .PARAMETER ExcludeItem
    Exclude files/folders from Image-Based backup plan. Example: "C:\bin","C:\Users","\\?\\Volume{2b7ea38e-0854-44a9-90f8-259fe8d52d20}\Recovery"

    .PARAMETER KeepBitLocker
    Enable KeepBitLocker option for all partitions

    .PARAMETER KeepBitLockerEnableForVolume
    Enable KeepBitLocker option for volumes with specified ids. Example: "cc9eb5c7-f956-415c-b23e-e6a563f9a20e","c4f8f0d6-7a2a-4627-9c89-cc84dbe3bf79"

    .PARAMETER KeepBitLockerDisableForVolume
    Disable KeepBitLocker option for volumes with specified ids. Example: "01bc714b-b611-448e-8fff-2e0e4a0d9004","a44e3efd-17ef-4f2c-bd66-5cbda5f23939"

    .EXAMPLE
    New-MBSNBFIBBBackupPlan -Name "IBB Plan all volumes" -StorageAccount (Get-MBSStorageAccount -ID aa3230dc-c20f-4ff3-83be-1cf6820de46b) -BackupVolumes AllVolumes -Schedule $schedule -BackupPlanCommonOption $commonOptions
    
    Create Image-Based backup plan for all volumes.

    .EXAMPLE
    New-MBSNBFIBBBackupPlan -Name "IBB Plan system required volumes" -StorageAccount (Get-MBSStorageAccount -ID aa3230dc-c20f-4ff3-83be-1cf6820de46b) -BackupVolumes SystemRequired -Schedule $schedule -BackupPlanCommonOption $commonOptions
    
    Create Image-Based backup plan for system required volumes only.

    .EXAMPLE
    New-MBSNBFIBBBackupPlan -Name "IBB Plan C and D volumes" -StorageAccount (Get-MBSStorageAccount -ID aa3230dc-c20f-4ff3-83be-1cf6820de46b) -BackupVolumes SelectedVolumes -Volumes ((Get-MBSDiskVolume).volumes | Where-Object MountPoints -in "D:\") -Schedule $schedule -BackupPlanCommonOption $commonOptions
    
    Create Image-Based backup plan for C:\ and D:\ volumes only.

    .INPUTS
        None.

    .OUTPUTS
        MBS.Agent.Plan.NBFImageBasedBackupPlan

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/new-mbsnbfibbbackupplan
    #>

    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$true, HelpMessage="Backup plan name.")]
        [string]
        $Name,
        # 
        [Parameter(Mandatory=$true, HelpMessage="Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")", ParameterSetName='ImageBased')]
        [MBS.Agent.StorageAccount]
        $StorageAccount,
        #
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)", ParameterSetName='ImageBased')]
        [SecureString]
        $MasterPassword,
        
        # ------------------------- Schedule -----------------------------
        [Parameter(Mandatory=$False, HelpMessage="Specify schedule. Use New-MBSNBFPlanSchedule to create an object.", ParameterSetName='ImageBased')]
        [MBS.Agent.Plan.NBFIncrementalSchedule]
        $Schedule,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify force full schedule. Use New-MBSNBFPlanSchedule to create an object.", ParameterSetName='ImageBased')]
        [MBS.Agent.Plan.NBFFullSchedule]
        $FullSchedule,

        # ------------------------- BackupPlanCommonOption -----------------------------
        [Parameter(Mandatory=$true, HelpMessage="Specify plan common options. Use New-MBSNBFBackupPlanCommonOption to create an object.", ParameterSetName='ImageBased')]
        [MBS.Agent.Plan.NBFBackupPlanCommonOption]
        $BackupPlanCommonOption,
        
        # ------------------------- Image-Based --------------------------------------
        [Parameter(Mandatory=$true, HelpMessage="Backup Volumes type", ParameterSetName='ImageBased')]
        [MBS.Agent.Plan.BackupVolumeType]
        $BackupVolumes,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup selected volumes.", ParameterSetName='ImageBased')]
        [MBS.Agent.IBBVolume[]]
        $Volumes,
        #
        [Parameter(Mandatory=$False, HelpMessage='Run restore verification mode.', ParameterSetName='ImageBased')]
        [MBS.Agent.Plan.RestoreVerificationMode]
        $RestoreVerificationMode = "DoNotRun",
        #
        [Parameter(Mandatory=$False, HelpMessage='Disable VSS, use direct access to NTFS volume.', ParameterSetName='ImageBased')]
        [Switch]
        $DisableVSS,
        #
        [Parameter(Mandatory=$False, HelpMessage='Ignore bad sectors.', ParameterSetName='ImageBased')]
        [bool]
        $IgnoreBadSectors=$true,
        #
        [Parameter(Mandatory=$False, HelpMessage='Use system VSS provider.', ParameterSetName='ImageBased')]
        [Switch]
        $UseSystemVSS,
        #
        #[Parameter(Mandatory=$False, HelpMessage='Disable Synthetic Full backup.', ParameterSetName='ImageBased')]
        #[Switch]
        #$DisableSyntheticFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Prefetch block count (0 - 100, 0 without prefetch)", ParameterSetName='ImageBased')]
        [Int32][ValidateRange(0,100)]
        $PrefetchBlockCount = 100,
        #
        [Parameter(Mandatory=$False, HelpMessage="Block size. Possible values: 128, 256, 512, 1024", ParameterSetName='ImageBased')]
        [ValidateSet("128", "256", "512", "1024")]
        [string]
        $BlockSize = 1024,
        #
        [Parameter(Mandatory=$False, HelpMessage="Exclude files/folders from Image-Based backup plan", ParameterSetName='ImageBased')]
        [System.Collections.Generic.List[string]]
        $ExcludeItem,
        #
        [Parameter(Mandatory=$False, HelpMessage='Enable KeepBitLocker option for all partitions', ParameterSetName='ImageBased')]
        [Switch]
        $KeepBitLocker,
        #
        [Parameter(Mandatory=$False, HelpMessage="Enable KeepBitLocker option for volumes with specified ids", ParameterSetName='ImageBased')]
        [System.Collections.Generic.List[string]]
        $KeepBitLockerEnableForVolume,
        #
        [Parameter(Mandatory=$False, HelpMessage="Disable KeepBitLocker option for volumes with specified ids", ParameterSetName='ImageBased')]
        [System.Collections.Generic.List[string]]
        $KeepBitLockerDisableForVolume
    )
    
    begin {
        if (-not($CBB = Get-MBSAgent)) {
            Break
        }

        if ([System.version](Get-MBSAgent).version -lt [System.version]"7.1.0.0") {
            Write-Error "Version $($CBB.version) is not supported. Please upgrade to the minimum supported version 7.1"
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
        $BackupPlan = New-Object -Type MBS.Agent.Plan.NBFImageBasedBackupPlan -Property @{
            Name = $Name 
            StorageAccount = $StorageAccount
            BackupPlanCommonOption = $BackupPlanCommonOption
            Schedule = $Schedule
            ForceFullSchedule = $FullSchedule
            BackupVolumes = $BackupVolumes
            Volumes = $Volumes
            DisableVSS = $DisableVSS
            IgnoreBadSectors = $IgnoreBadSectors
            UseSystemVSS = $UseSystemVSS
            PrefetchBlockCount = $PrefetchBlockCount
            BlockSize = $BlockSize
            ExcludeItem = $ExcludeItem
            KeepBitLocker = $KeepBitLocker
            KeepBitLockerEnableForVolume = $KeepBitLockerEnableForVolume
            KeepBitLockerDisableForVolume = $KeepBitLockerDisableForVolume
            RestoreVerificationMode = $RestoreVerificationMode
        }

        $BackupPlan.ID = New-MBSNBFBackupPlan -NBFImageBasedBackupPlan $BackupPlan -MasterPassword $MasterPassword
        
        return $BackupPlan
    }
    
    end {
        
    }
}
# SIG # Begin signature block
