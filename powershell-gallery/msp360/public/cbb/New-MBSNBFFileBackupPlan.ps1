function New-MBSNBFFileBackupPlan {
    <#
    .SYNOPSIS
    Creates new file-level backup plan.
    
    .DESCRIPTION
    Creates File-Level backup plan.
    
    .PARAMETER Name
    Backup plan name.
    
    .PARAMETER StorageAccount
    Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name "AWS S3")
    
    .PARAMETER MasterPassword
    Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .PARAMETER Schedule
    Specify schedule. Use New-MBSNBFPlanSchedule to create an object.
    
    .PARAMETER FullSchedule
    Specify force full schedule. Use New-MBSNBFPlanSchedule to create an object.
    
    .PARAMETER BackupPlanCommonOption
    Specify plan common options. Use New-MBSNBFBackupPlanCommonOption to create an object.
    
    .PARAMETER FastNTFSScan
    Enables you to speed up backup processing by using a low-level API to access NTFS structures when you need to back up a considerably large number of files that are stored on an NTFS-formatted device. Using this option automatically enables ForceUsingVSS option

    .PARAMETER BackupNTFSPermissions
    Backup NTFS permissions
    
    .PARAMETER ForceUsingVSS
    Force using VSS (Volume Shadow Copy Service)
    
    .PARAMETER UseShareReadWriteModeOnError
    Use share read/write mode on errors. Can help if file is open in share read/write mode
    
    .PARAMETER BackupEmptyFolders
    Backup empty folders
    
    .PARAMETER BackupOnlyAfter
    Backup files only after specific date. Example: "06/09/19 7:43 AM"
    
    .PARAMETER ExcludeSystemHiddenFiles
    Exclude system and hidden files from backup plan.
    
    .PARAMETER SkipFolder
    Skip folders. Example: -skipfolder ""bin,*temp*,My*""
    
    .PARAMETER IncludeFilesMask
    Include files mask. Example: -IncludeFilesMask ""*.doc,*.xls""
    
    .PARAMETER ExcludeFilesMask
    Exclude files mask. Example: -ExcludeFilesMask ""*.bak,*.tmp""
    
    .PARAMETER IgnoreErrorPathNotFound
    Ignore errors path not found

    .PARAMETER BackupItem
    Backup file or directory. Example: "c:\temp\test.txt","c:\Work"

    .PARAMETER ExcludeItem
    Exclude file or directory. Example: "c:\temp\test.ps1","c:\Users"
    
    .PARAMETER GenerateDetailedReport
    Specify to generate detailed report

    .EXAMPLE
    New-MBSNBFFileBackupPlan -Name "File-level Plan" -StorageAccount (Get-MBSStorageAccount -ID aa3230dc-c20f-4ff3-83be-1cf6820de46b) -BackupItem "c:\temp\test.txt","c:\Work" -Schedule $schedule -BackupPlanCommonOption $commonOptions

    Create File-Level backup plan.

    .INPUTS
        None.

    .OUTPUTS
        None.

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/new-mbsnbffilebackupplan
    #>

    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$true, HelpMessage="Backup plan name.")]
        [string]
        $Name,
        # 
        [Parameter(Mandatory=$true, HelpMessage="Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")", ParameterSetName='FileLevel')]
        [MBS.Agent.StorageAccount]
        $StorageAccount,
        #
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)", ParameterSetName='FileLevel')]
        [SecureString]
        $MasterPassword,
        
        # ------------------------- Schedule -----------------------------
        [Parameter(Mandatory=$False, HelpMessage="Specify schedule. Use New-MBSNBFPlanSchedule to create an object.", ParameterSetName='FileLevel')]
        [MBS.Agent.Plan.NBFIncrementalSchedule]
        $Schedule,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify force full schedule. Use New-MBSNBFPlanSchedule to create an object.", ParameterSetName='FileLevel')]
        [MBS.Agent.Plan.NBFFullSchedule]
        $FullSchedule,

        # ------------------------- BackupPlanCommonOption -----------------------------
        [Parameter(Mandatory=$true, HelpMessage="Specify plan common options. Use New-MBSNBFBackupPlanCommonOption to create an object.", ParameterSetName='FileLevel')]
        [MBS.Agent.Plan.NBFBackupPlanCommonOption]
        $BackupPlanCommonOption,
        
        # --------------------------- File Backup settings ------------
        #
        [Parameter(Mandatory=$False, HelpMessage='Enables you to speed up backup processing by using a low-level API to access NTFS structures when you need to back up a considerably large number of files that are stored on an NTFS-formatted device. Using this option automatically enables ForceUsingVSS option', ParameterSetName='FileLevel')]
        [Switch]
        $FastNTFSScan,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup NTFS permissions", ParameterSetName='FileLevel')]
        [Switch]
        $BackupNTFSPermissions,
        #
        [Parameter(Mandatory=$False, HelpMessage='Force using VSS (Volume Shadow Copy Service).', ParameterSetName='FileLevel')]
        [Switch]
        $ForceUsingVSS,
        #
        [Parameter(Mandatory=$False, HelpMessage='Back up EFS files as encrypted.', ParameterSetName='FileLevel')]
        [Switch]
        $KeepEFSEncryption,
        #
        [Parameter(Mandatory=$False, HelpMessage='Use share read/write mode on errors. Can help if file is open in share read/write mode.', ParameterSetName='FileLevel')]
        [Switch]
        $UseShareReadWriteModeOnError,
        #
        [Parameter(Mandatory=$False, HelpMessage='Backup empty folders.', ParameterSetName='FileLevel')]
        [Switch]
        $BackupEmptyFolders,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup files only after specific date. Example: ""06/09/19 7:43 AM""", ParameterSetName='FileLevel')]
        [datetime]
        $BackupOnlyAfter,
        #
        [Parameter(Mandatory=$False, HelpMessage='Exclude system and hidden files.', ParameterSetName='FileLevel')]
        [bool]
        $ExcludeSystemHiddenFiles=$true,
        #
        [Parameter(Mandatory=$False, HelpMessage="Skip folders. Example: -skipfolder ""bin,*temp*,My*""", ParameterSetName='FileLevel')]
        [string[]]
        $SkipFolder,
        #
        [Parameter(Mandatory=$False, HelpMessage="Include files mask. Example: -IncludeFilesMask ""*.doc,*.xls""", ParameterSetName='FileLevel')]
        [string[]]
        $IncludeFilesMask,
        #
        [Parameter(Mandatory=$False, HelpMessage="Exclude files mask. Example: -ExcludeFilesMask ""*.bak,*.tmp""", ParameterSetName='FileLevel')]
        [string[]]
        $ExcludeFilesMask,
        #
        [Parameter(Mandatory=$False, HelpMessage='Ignore errors path not found.', ParameterSetName='FileLevel')]
        [Switch]
        $IgnoreErrorPathNotFound,
        #
        #[Parameter(Mandatory=$False, HelpMessage="Backup file", ParameterSetName='FileLevel')]
        #[string[]]
        #$BackupFile,
        ##
        #[Parameter(Mandatory=$False, HelpMessage="Backup directory", ParameterSetName='FileLevel')]
        #[string[]]
        #$BackupDirectory,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup file or directory", ParameterSetName='FileLevel')]
        [System.Collections.Generic.List[string]]
        $BackupItem,
        #
        [Parameter(Mandatory=$False, HelpMessage="Exclude file or directory", ParameterSetName='FileLevel')]
        [System.Collections.Generic.List[string]]
        $ExcludeItem,
        #
        [Parameter(Mandatory=$False, HelpMessage='Specify to generate detailed report', ParameterSetName='FileLevel')]
        [Switch]
        $GenerateDetailedReport
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
        $BackupPlan = New-Object -Type MBS.Agent.Plan.NBFFileLevelBackupPlan -Property @{
            Name = $Name 
            StorageAccount = $StorageAccount
            BackupPlanCommonOption = $BackupPlanCommonOption
            Schedule = $Schedule
            ForceFullSchedule = $FullSchedule
            BackupNTFSPermissions = $BackupNTFSPermissions
            FastNTFSScan = $FastNTFSScan
            ForceUsingVSS = $ForceUsingVSS
            KeepEFSEncryption = $KeepEFSEncryption
            UseShareReadWriteModeOnError = $UseShareReadWriteModeOnError
            BackupEmptyFolders = $BackupEmptyFolders
            BackupOnlyAfter = $BackupOnlyAfter
            ExcludeSystemHiddenFiles = $ExcludeSystemHiddenFiles
            SkipFolder = $SkipFolder
            IncludeFilesMask = $IncludeFilesMask
            ExcludeFilesMask = $ExcludeFilesMask
            IgnoreErrorPathNotFound = $IgnoreErrorPathNotFound
            BackupItem = $BackupItem
            ExcludeItem = $ExcludeItem
            GenerateDetailedReport = $GenerateDetailedReport
        }

        $BackupPlan.ID = New-MBSNBFBackupPlan -NBFFileLevelBackupPlan $BackupPlan -MasterPassword $MasterPassword
        
        return $BackupPlan
    }
    
    end {
        
    }
}
# SIG # Begin signature block
