function Get-MBSIBBackup {
    <#
    .SYNOPSIS
        Get image-based backups
    
    .DESCRIPTION
        Get image-based backups from the specified storage account with disks and volumes. 
    
    .PARAMETER StorageAccount
        Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name "AWS S3")
    
    .PARAMETER RestorePoint
        Specify the date and time to get particular restore point. To get all available restore points, skip this parameter.
    
    .PARAMETER BackupPrefix
        Get image-based backups for particular computer name. 
    
    .PARAMETER DiskID
        List volumes for specified disk id.
    
    .PARAMETER ListVolumes
        List volumes for each disk.
    
    .PARAMETER SystemRequired
       Only system required volumes will be listed.
    
    .PARAMETER MasterPassword
        Backup agent master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .EXAMPLE
        Get-MBSIBBackup -StorageAccount (Get-MBSStorageAccount -Name "AWS S3") | Select-Object -First 1
    
        Get the latest image-based backup from the storage account with name "AWS S3".

    .EXAMPLE
        Get-MBSIBBackup -StorageAccount (Get-MBSStorageAccount -Name "AWS S3") -DiskID 3708e400-2aa4-4991-bdd8-23bf9eec6529

        Get the image-based backups from the storage account with name "AWS S3" for the disk with GUID "3708e400-2aa4-4991-bdd8-23bf9eec6529".

    .EXAMPLE
        Get-MBSIBBackup -StorageAccount (Get-MBSStorageAccount -Name "AWS S3") -BackupPrefix PC-Name

        Get the image-based backups from the storage account with name "AWS S3" for computer with the name "PC-Name".

    .EXAMPLE
        Get-MBSIBBackup -StorageAccount (Get-MBSStorageAccount -Name "AWS S3") -RestorePoint 2019-10-31T16:00:04Z

        Get the nearest backup before the specified restore point time "2019-10-31T16:00:04Z" from the storage account with name "AWS S3".

    .EXAMPLE
        Get-MBSIBBackup -StorageAccount (Get-MBSStorageAccount -Name "AWS S3")

        Get all the image-based backups from the storage account with name "AWS S3"

    .INPUTS
        None.

    .OUTPUTS
        MBS.Agent.IBBBackup[]

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/get-mbsibbackup
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")")]
        [MBS.Agent.StorageAccount]
        $StorageAccount,
        # Parameter - Restore point
        [Parameter(Mandatory=$false, HelpMessage="Restore point")]
        [datetime]
        $RestorePoint,
        # Parameter - Backup prefix
        [Parameter(Mandatory=$false, HelpMessage="Backup prefix")]
        [string]
        $BackupPrefix,
        # Parameter - Disk ID
        [Parameter(Mandatory=$false, HelpMessage="Specify diskId (Guid) that volumes will be listed")]
        [guid]
        $DiskID,
        # Parameter - List volumes for each disk
        [Parameter(Mandatory=$false, HelpMessage="List volumes for each disk")]
        [switch]
        $ListVolumes,
        # Parameter - List only system required volumes
        [Parameter(Mandatory=$false, HelpMessage="System required volumes")]
        [switch]
        $SystemRequired,
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
        $Arguments = " listIBB -aid ""$($StorageAccount.ID)"""
        if ($null -ne $RestorePoint) {
            $Arguments += " -rt PointInTime -rpt ""$RestorePoint"""
        } 
        if ($BackupPrefix) {
            $Arguments += " -bp $BackupPrefix"
        }
        if ($ListVolumes) {
            $Arguments += " -listVolumes"
        }  
        if ($null -ne $DiskID) {
            $Arguments += " -d $DiskID"
        } 
        if ($SystemRequired) {
            $Arguments += " -r"
        }
        $result = Start-MBSProcess -cmdpath $CBB.CBBCLIPath -cmdarguments $Arguments -output json -MasterPassword $MasterPassword
        if ($result.Result -eq "Success") {
            return [MBS.Agent.IBBBackup[]]$result.Backups | Convert-PSObjectToHash | Select-Object @{Name="StorageAccount"; Expression={$StorageAccount}},*
        }
    }
    
    end {
        
    }
}
# SIG # Begin signature block
