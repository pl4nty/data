function Restore-MBSFile {
    <#
    .SYNOPSIS
    Restore files/folders from cloud storage.

    .DESCRIPTION
    Restore files/folders from cloud storage. The action does not allow schedule, pre/post actions or notifications.

    .PARAMETER StorageAccount
    Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name "AWS S3")

    .PARAMETER RestorePoint
    Restore type. Specify DateTime value or omit to restore the latest version.

    .PARAMETER BackupPrefix
    Backup prefix

    .PARAMETER RestorePath
    Restore to specific location. Omit for restore to the original location.

    .PARAMETER RestoreFile
    Restore file path. Example: "c:\temp\test.txt","c:\temp\test.ps1"

    .PARAMETER RestoreDirectory
    Restore directory path. Example: "c:\Work","c:\Users"

    .PARAMETER RestoreDeletedFiles
    Restore deleted files

    .PARAMETER Overwrite
    Overwrite existing files/directories

    .PARAMETER RestoreNewFile
    Restore only new files. Existing files will be overwritten only if the modification date of backed up file is newer than existing
    
    .PARAMETER RestoreNTFSPermissions
    Restore NTFS permissions

    .PARAMETER RestoreFromGlacier
    Restore files located in Glacier (expedited or standard or bulk)

    .PARAMETER EncryptionPassword
    Encryption password. Use -EncryptionPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)

    .PARAMETER MasterPassword
    Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)

    .EXAMPLE
    Restore-MBSFile -StorageAccount (Get-MBSStorageAccount -ID 7ce9c81a-b305-49cf-814e-8d9c6c7333ab) -RestoreDirectory 'C:\MyFolder' -RestoreFile 'C:\MyFolder2\Document1.txt','C:\MyFolder2\Document2.txt' 

    Restore specified folders and files with default settings.

    .INPUTS
    None.

    .OUTPUTS
    System.String[]

    .NOTES
    Author: MSP360 Onboarding Team

    .LINK
    https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/restore-mbsfile
    #>

    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$true, HelpMessage="Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")")]
        [MBS.Agent.StorageAccount]
        $StorageAccount,
        #
        [Parameter(Mandatory=$false, HelpMessage="Restore type. Specify DateTime value or omit to restore the latest version.")]
        [datetime]
        $RestorePoint,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup prefix")]
        [string]
        $BackupPrefix,
        #
        [Parameter(Mandatory=$False, HelpMessage="Restore to specific location. Omit for restore to the original location.")]
        [string]
        $RestorePath,
        #
        [Parameter(Mandatory=$False, HelpMessage="Restore file")]
        [string[]]
        $RestoreFile,
        #
        [Parameter(Mandatory=$False, HelpMessage="Restore directory")]
        [string[]]
        $RestoreDirectory,
        #
        [Parameter(Mandatory=$false, HelpMessage="Restore deleted files")]
        [switch]
        $RestoreDeletedFiles,
        #
        [Parameter(Mandatory=$False, HelpMessage="Overwrite existing files/directories")]
        [switch]
        $Overwrite,
        #
        [Parameter(Mandatory=$false, HelpMessage="Restore only new files. Existing files will be overwritten only if the modification date of backed up file is newer than existing")]
        [switch]
        $RestoreNewFile,
        #
        [Parameter(Mandatory=$false, HelpMessage="Restore NTFS permissions")]
        [switch]
        $RestoreNTFSPermissions,
        #
        [Parameter(Mandatory=$false, HelpMessage="Restore files located in Glacier (expedited or standard or bulk)")]
        [MBS.Agent.Plan.GlacierRestoreType]
        $RestoreFromGlacier,
        #
        [Parameter(Mandatory=$False, HelpMessage="Encryption password. Use -EncryptionPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        [SecureString]
        $EncryptionPassword,
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
        function Set-Argument {
            $Argument = " restore -aid ""$($StorageAccount.ID)"""
            if($RestorePoint){$Argument += " -rt ""$RestorePoint"""}
            if($BackupPrefix){$Argument += " -bp $BackupPrefix"}
            if($RestorePath){$Argument += " -rlocation ""$RestorePath"""}
            if($RestoreFile){$Argument += " -f "+'"{0}"' -f ($RestoreFile -join '" -f "')}
            if($RestoreDirectory){$Argument += " -d "+'"{0}"' -f ($RestoreDirectory -join '" -d "')}
            if($RestoreDeletedFiles){$Argument += " -deleted"}
            if($Overwrite){$Argument += " -o"}
            if($RestoreNewFile){$Argument += " -rn"}
            if($RestoreNTFSPermissions){$Argument += " -ntfs yes"}else{$Argument += " -ntfs no"}
            if($RestoreFromGlacier){$Argument += " -glacier $RestoreFromGlacier"}
            if($EncryptionPassword){$Argument += " -ep """+([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($EncryptionPassword)))+""""}

            return $Argument
        }

        $Arguments += Set-Argument
        (Start-MBSProcess -cmdpath $CBB.CBBCLIPath -cmdarguments $Arguments -output full -MasterPassword $MasterPassword).result
    }

    end {

    }
}
# SIG # Begin signature block
