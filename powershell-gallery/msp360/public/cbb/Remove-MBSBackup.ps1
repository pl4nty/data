function Remove-MBSBackup {
    <#
    .SYNOPSIS
    Removes a single file or a folder from the backup.
    
    .DESCRIPTION
    This cmdlet silently removes a specified file or a folder from the MBS backup.
    
    .PARAMETER StorageAccount
    Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")")
    
    .PARAMETER File
    Removes specified file from the backup
    
    .PARAMETER Folder
    Removes specified folder from the backup
    
    .PARAMETER MasterPassword
    Backup agent master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .EXAMPLE
    Remove-MBSBackup -StorageAccount (Get-MBSStorageAccount | where DisplayName -eq "FSS") -File "C:\TestFolder\test.txt"
    
    Removes file "test.txt" from the backup on the storage account "FSS"

    .EXAMPLE
    Remove-MBSBackup -StorageAccount (Get-MBSStorageAccount | where DisplayName -eq "FSS") -Folder "C:\TestFolder\Backup"
    
    Removes folder "backup" from the backup on the storage account "FSS"

    .EXAMPLE
    Remove-MBSBackup -StorageAccount (Get-MBSStorageAccount | where DisplayName -eq "FSS") -File "C:\TestFolder\test.txt" -Folder "C:\TestFolder\Backup"
    
    Removes file "test.txt" and folder "backup" from the backup on the storage account "FSS"

    .INPUTS
    None

    .OUTPUTS
    String

    .NOTES
    Author: MSP360 Onboarding Team

    .LINK
    https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/remove-mbsbackup
    #>

    [CmdletBinding()]
    param (
        # Parameter - Storage Account
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName, HelpMessage="Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")")]
        [MBS.Agent.StorageAccount]
        $StorageAccount,
        # Parameter - File
        [Parameter(Mandatory=$true, HelpMessage="Removes specified file from the backup", ParameterSetName='File')]
        [string]
        $File,
        # Parameter - Directory
        [Parameter(Mandatory=$true, HelpMessage="Removes specified folder from the backup", ParameterSetName='Folder')]
        [string]
        $Folder, 
        # Parameter - BackupPrefix
        [Parameter(Mandatory=$false, HelpMessage="Backup prefix", ParameterSetName='Image-Based')]
        [string]
        $BackupPrefix, 
        # Parameter - Login
        [Parameter(Mandatory=$false, HelpMessage="Network credentials login", ParameterSetName='Image-Based')]
        [string]
        $Login, 
        # Parameter - Password
        [Parameter(Mandatory=$false, HelpMessage="Specify a Password to log in to the network share. Use -Password (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)", ParameterSetName='Image-Based')]
        [SecureString]
        $Password, 
        # Parameter - BackupDate
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName, HelpMessage="Disk image backup date", ParameterSetName='Image-Based')]
        [Alias("DateUTC")]
        [datetime]
        $BackupDate, 
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
        if ($PsCmdlet.ParameterSetName -eq 'Image-Based') {
            $Arguments = " deleteIBB"
        }else {
            $Arguments = " delete"
        }
        $Arguments += " -a ""$($StorageAccount.DisplayName)"""
        if ($File) {
            $Arguments += " -f ""$File"""
        }
        if ($Folder) {
            $Arguments += " -d ""$Folder"""
        }
        if ($BackupPrefix) {
            $Arguments += " -bp ""$BackupPrefix"""
        }
        if ($Login) {
            $Arguments += " -ln ""$Login"""
        }
        if ($Password) {
            $Arguments += " -pw ""$Password"""
        }
        if ($BackupDate) {
            $Arguments += " -date ""$BackupDate"""
        }
        $Result = Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output json -MasterPassword $MasterPassword
    }
        
    end {
        
    }
}
# SIG # Begin signature block
