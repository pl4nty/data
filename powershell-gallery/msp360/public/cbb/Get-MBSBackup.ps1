function Get-MBSBackup {
    <#
    .SYNOPSIS
        List files/folders or versions backed up to a cloud storage
    
    .DESCRIPTION
        List files/folders or versions backed up to a cloud storage
    
    .PARAMETER StorageAccount
        Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name "AWS S3")
    
    .PARAMETER MasterPassword
        Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .PARAMETER File
        Array of file path to list
    
    .PARAMETER Folder
        Array of folder path to list
    
    .PARAMETER Prefix
        Perform listing using specified backup prefix
    
    .EXAMPLE
        PS C:\> Get-MBSBackup -StorageAccount (Get-MBSStorageAccount -Name "AWS S3") -Folder "C:\" 

        List files and folders backed up from C:\ to storage account with "AWS S3" name.

    .EXAMPLE
        PS C:\> Get-MBSBackup -StorageAccount (Get-MBSStorageAccount -Name "AWS S3") -File "C:\test\test.txt" 

        Get information about versions of "C:\test\test.txt" file which is backed up to storage account with "AWS S3" name.

    .EXAMPLE
        PS C:\> Get-MBSBackup -StorageAccount (Get-MBSStorageAccount -Name "AWS S3") -Folder "C:\" -Prefix "Server"

        List files and folders backed up from C:\ to storage account with "AWS S3" name from "Server" computer.

    .INPUTS
        None

    .OUTPUTS
        MBS.Agent.StorageAccountContent

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/get-mbsbackup

    #>

    [CmdletBinding(DefaultParameterSetName = "Root")]
    param (
        # 
        [Parameter(Mandatory=$true, HelpMessage="Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")")]
        [MBS.Agent.StorageAccount]
        $StorageAccount,
        #
        [Parameter(Mandatory=$false, HelpMessage="Backup file", ParameterSetName='BackupFile')]
        [string]
        $File,
        #
        [Parameter(Mandatory=$false, HelpMessage="Backup directory", ParameterSetName='BackupDirectory')]
        [string]
        $Folder,
        #
        [Parameter(Mandatory=$false, HelpMessage="Show backup root", ParameterSetName='Root')]
        [switch]
        $Root,
        #
        [Parameter(Mandatory=$False, HelpMessage="Perform listing using specified backup prefix")]
        [string]
        $Prefix,
        # Recurse mode can be unstable on many files and folders
        #[Parameter(Mandatory=$False, HelpMessage="Perform listing using specified backup prefix")]
        #[switch]
        #$Recurse,
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
        $Arguments = " list"
        $Arguments += " -a ""$($StorageAccount.DisplayName)"""
        switch ($PSCmdlet.ParameterSetName) {
            'Root' {$Arguments += " -r "}
            'BackupFile' {$Arguments += " -f "+'"{0}"' -f ($File -join '" -f "')}
            'BackupDirectory' {$Arguments += " -d "+'"{0}"' -f ($Folder -join '" -d "')}
            Default {}
        }

        $Result = Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output json -MasterPassword $MasterPassword
        

        if ($Result.Result -eq "Success") {
            $StorageAccountContent = @()

            if ([System.version](Get-MBSAgent).version -lt [System.version]"7.1.0.0") {
                if ($Result.Directories.Files){
                    $Result.Directories.Files | ForEach-Object {
                        $StorageAccountContent += [MBS.Agent.StorageAccountContent]@{ 
                            Type = "File"
                            Name = $_.Name
                            FullName = $Folder.Trimend('\')+'\'+$_.Name
                            Date = $_.Date
                            Size = $_.Size
                            IsCompressed = $_.IsCompressed
                            IsEncrypted = $_.IsEncrypted
                        }
                    }
                }

                if ($PSCmdlet.ParameterSetName -eq "Root") {
                    $Result.Directories.Folders | ForEach-Object {
                        if($_.Name){
                            $StorageAccountContent += [MBS.Agent.StorageAccountContent]@{ 
                                Type = "Disk"
                                Name = $_.Name
                                FullName = $_.Name
                                Date = $_.Date
                                Size = $_.Size
                                IsCompressed = $_.IsCompressed
                                IsEncrypted = $_.IsEncrypted
                            }
                            if($Recurse){
                                $StorageAccountContent += Get-MBSBackup -StorageAccount $StorageAccount -Folder $_.Name -Recurse
                            }
                        }
                    }
                }elseif ($Result.Directories.Folders){
                    $Result.Directories.Folders | ForEach-Object {
                        $StorageAccountContent += [MBS.Agent.StorageAccountContent]@{ 
                            Type = "Folder"
                            Name = $_.Name
                            FullName = $Folder.Trimend('\')+'\'+$_.Name
                            Date = $_.Date
                            Size = $_.Size
                            IsCompressed = $_.IsCompressed
                            IsEncrypted = $_.IsEncrypted
                        }
                        if($Recurse){
                            $StorageAccountContent += Get-MBSBackup -StorageAccount $StorageAccount -Folder ($Folder.Trimend('\')+'\'+$_.Name) -Recurse
                        }
                    }
                }

                if ($Result.FileVersions){
                    $Result.FileVersions | ForEach-Object {
                        $StorageAccountContent += [MBS.Agent.StorageAccountContent]@{
                        Type = "File"
                        Name = $_.Path
                        Date = $_.Date
                        Size = $_.Size
                        IsCompressed = $_.IsCompressed
                        IsEncrypted = $_.IsEncrypted
                        Versions = $($array = @(); $_.Versions | ForEach-Object {$ht= @{}; $array +=New-Object -TypeName MBS.Agent.FileVersions -property $($_.psobject.properties | ForEach-Object {$ht[$_.Name] = $_.Value}; $ht)};$array)
                        }
                    }
                }
            } else {
                # CBB 7.2
                if ($Result.Files){
                    $Result.Files | ForEach-Object {
                        $StorageAccountContent += [MBS.Agent.StorageAccountContent]@{ 
                            Type = "File"
                            Name = $_.Name
                            FullName = $Folder.Trimend('\')+'\'+$_.Name
                            Date = $_.Date
                            Size = $_.Size
                            IsCompressed = $_.IsCompressed
                            IsEncrypted = $_.IsEncrypted
                        }
                    }
                }

                if ($PSCmdlet.ParameterSetName -eq "Root") {
                    $Result.Folders | ForEach-Object {
                        if($_.Name){
                            $StorageAccountContent += [MBS.Agent.StorageAccountContent]@{ 
                                Type = "Disk"
                                Name = $_.Name
                                FullName = $_.Name
                                Date = $_.Date
                                Size = $_.Size
                                IsCompressed = $_.IsCompressed
                                IsEncrypted = $_.IsEncrypted
                            }
                            if($Recurse){
                                $StorageAccountContent += Get-MBSBackup -StorageAccount $StorageAccount -Folder $_.Name -Recurse
                            }
                        }
                    }
                }elseif ($Result.Folders){
                    $Result.Folders | ForEach-Object {
                        $StorageAccountContent += [MBS.Agent.StorageAccountContent]@{ 
                            Type = "Folder"
                            Name = $_.Name
                            FullName = $Folder.Trimend('\')+'\'+$_.Name
                            Date = $_.Date
                            Size = $_.Size
                            IsCompressed = $_.IsCompressed
                            IsEncrypted = $_.IsEncrypted
                        }
                        if($Recurse){
                            $StorageAccountContent += Get-MBSBackup -StorageAccount $StorageAccount -Folder ($Folder.Trimend('\')+'\'+$_.Name) -Recurse
                        }
                    }
                }

                if ($Result.Versions){
                    $StorageAccountContent += [MBS.Agent.StorageAccountContent]@{
                        Type = "File"
                        Name = $Result.Folder.Name.Trimend('\')+'\'+$Result.File.Name
                        Date = $Result.File.Date
                        Size = $Result.File.Size
                        IsCompressed = $Result.File.IsCompressed
                        IsEncrypted = $Result.File.IsEncrypted
                        Versions = $($array = @(); $Result.Versions | ForEach-Object {$ht= @{}; $array +=New-Object -TypeName MBS.Agent.FileVersions -property $($_.psobject.properties | ForEach-Object {$ht[$_.Name] = $_.Value}; $ht)};$array)
                    }
                }
            }

            return $StorageAccountContent

        }
    }
    
    end {
        
    }
}
# SIG # Begin signature block
