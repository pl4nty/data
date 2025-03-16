<#
.SYNOPSIS
Backup files/folders to cloud storage.

.DESCRIPTION
Backup files/folders to cloud storage. The action does not allow schedule, pre/post actions or notifications.

.PARAMETER StorageAccount
Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name "AWS S3")

.PARAMETER MasterPassword
Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password -AsPlainText -Force)

.PARAMETER UseFastNTFSScan
Use fast scan on NTFS file systems when possible

.PARAMETER ForceUsingVSS
Force using VSS (Volume Shadow Copy Service).

.PARAMETER UseShareReadWriteModeOnError
Use share read/write mode on errors. Can help if file is open in share read/write mode.

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

.PARAMETER BackupFile
Backup file path. Example: "c:\temp\test.txt","c:\temp\test.ps1"

.PARAMETER BackupDirectory
Backup directory path. Example: "c:\Work","c:\Users"

.PARAMETER UseServerSideEncryption
Use server side encryption (valid only for Amazon S3).

.PARAMETER EncryptionAlgorithm
Encryption algorithm. Possible values: AES128-256

.PARAMETER EncryptionPassword
Encryption password. Use -EncryptionPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)

.PARAMETER UseCompression
Use compression for backup

.PARAMETER StorageClass
Storage Class (valid only for Amazon S3)

.EXAMPLE
Backup-MBSFile -StorageAccount (Get-MBSStorageAccount -ID 7ce9c81a-b305-49cf-814e-8d9c6c7333ab) -BackupDirectory C:\MyFolder -BackupFile 'C:\MyFolder2\Document1.txt', 'C:\MyFolder2\Document2.txt' 

Backup specified folders and files with default settings.

.INPUTS
None.

.OUTPUTS
System.String[]

.NOTES
Author: MSP360 Onboarding Team

.LINK
https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/backup-mbsfile
#>

function Backup-MBSFile {
    [CmdletBinding()]
    param (
        # 
        [Parameter(Mandatory=$true, HelpMessage="Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")")]
        [MBS.Agent.StorageAccount]
        $StorageAccount,
        #
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        [SecureString]
        $MasterPassword,
        #
        [Parameter(Mandatory=$False, HelpMessage='Use fast scan on NTFS file systems when possible')]
        [Switch]
        $UseFastNTFSScan,
        #
        [Parameter(Mandatory=$False, HelpMessage='Force using VSS (Volume Shadow Copy Service).')]
        [Switch]
        $ForceUsingVSS,
        #
        [Parameter(Mandatory=$False, HelpMessage='Use share read/write mode on errors. Can help if file is open in share read/write mode.')]
        [Switch]
        $UseShareReadWriteModeOnError,
        #
        [Parameter(Mandatory=$False, HelpMessage='Backup empty folders.')]
        [Switch]
        $BackupEmptyFolders,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup files only after specific date. Example: ""06/09/19 7:43 AM""")]
        [datetime]
        $BackupOnlyAfter,
        #
        [Parameter(Mandatory=$False, HelpMessage='Exclude system and hidden files.')]
        [bool]
        $ExcludeSystemHiddenFiles=$true,
        #
        [Parameter(Mandatory=$False, HelpMessage="Skip folders. Example: -skipfolder ""bin,*temp*,My*""")]
        [string[]]
        $SkipFolder,
        #
        [Parameter(Mandatory=$False, HelpMessage="Include files mask. Example: -IncludeFilesMask ""*.doc,*.xls""")]
        [string[]]
        $IncludeFilesMask,
        #
        [Parameter(Mandatory=$False, HelpMessage="Exclude files mask. Example: -ExcludeFilesMask ""*.bak,*.tmp""")]
        [string[]]
        $ExcludeFilesMask,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup file")]
        [string[]]
        $BackupFile,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup directory")]
        [string[]]
        $BackupDirectory,
        #
        [Parameter(Mandatory=$False, HelpMessage="Use server side encryption (valid only for Amazon S3)")]
        [boolean]
        $UseServerSideEncryption=$False,
        #
        [Parameter(Mandatory=$False, HelpMessage="Encryption algorithm. Possible values: AES128-256")]
        [MBS.Agent.Plan.EncryptionAlgorithm]
        $EncryptionAlgorithm='AES256',
        #
        [Parameter(Mandatory=$False, HelpMessage="Encryption password. Use -EncryptionPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        [SecureString]
        $EncryptionPassword,
        #
        [Parameter(Mandatory=$False, HelpMessage="Use compression for backup")]
        [boolean]
        $UseCompression=$true,
        #
        [Parameter(Mandatory=$False, HelpMessage="Storage Class (valid only for Amazon S3)")]
        [MBS.Agent.Plan.StorageClass]
        $StorageClass='Standard'
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
        function Set-Argument {
            $Argument = " backup"
            if(($StorageClass -ne 'Standard') -And (-Not ($Global:MSP360ModuleSettings.SkipStorageClass))){
                if (($StorageClass -eq 'GlacierInstantRetrieval') -And ($CBBVersion -lt [version]"7.3.1")){
                    Write-Warning "Backup agent version is $CBBVersion. GlacierInstantRetrieval storage class is supported in version 7.3.1 or higher. Ignoring StorageClass option"
                    $Argument += " -aid ""$($StorageAccount.ID)"""
                }else{
                    $Argument += " -a ""$($StorageAccount.DisplayName)"" -sc ""$($StorageClass)"""
                }
            }else{
                if($Global:MSP360ModuleSettings.SkipStorageClass){
                    Write-Warning "MSP360ModuleSettings.SkipStorageClass is set. Ignoring StorageClass option"
                }
                $Argument += " -aid ""$($StorageAccount.ID)"""
            }
            if(-Not ($Global:MSP360ModuleSettings.SkipSSE)) {
                if($UseServerSideEncryption){$Argument += " -sse yes"}
            } else {
                Write-Warning "MSP360ModuleSettings.SkipSSE is set. Ignoring UseServerSideEncryption option"
            }
            if(-Not ($Global:MSP360ModuleSettings.SkipEncryption)) {
                if($Null -ne $EncryptionPassword){$Argument += " -ea $($EncryptionAlgorithm)"}
                if($EncryptionPassword){$Argument += " -ep """+([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($EncryptionPassword)))+""""}
            } else {
                Write-Warning "MSP360ModuleSettings.SkipEncryption is set. Ignoring EncryptionPassword and EncryptionAlgorithm options"
            }
            if(-Not ($Global:MSP360ModuleSettings.SkipCompression)) {
                if($UseCompression){$Argument += " -c yes"}
            } else {
                Write-Warning "MSP360ModuleSettings.SkipCompression is set. Ignoring UseCompression option"
            }

            if ($UseFastNTFSScan) {$Argument += " -fastntfs yes"}
            if(-Not ($Global:MSP360ModuleSettings.SkipVSS)) {
                if ($ForceUsingVSS) {
                    if((New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){
                        $Argument += " -vss yes"
                    }else{
                        $Argument += " -vss no"
                        if($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent){
                            $ReturnArray += "WARNING: Run cmdlet with admin permissions to use the ForceUsingVSS parameter. The parameter is skipped."
                        }else{
                            Write-host "WARNING: Run cmdlet with admin permissions to use the ForceUsingVSS parameter. The parameter is skipped." -ForegroundColor DarkYellow
                        }
                    }
                }
            } else {
                Write-Warning "MSP360ModuleSettings.SkipVSS is set. Ignoring ForceUsingVSS option"
            }
            if ($UseShareReadWriteModeOnError) {$Argument += " -sharerw yes"}
            if ($BackupEmptyFolders) {$Argument += " -bef yes"}
            if ($BackupOnlyAfter){$Argument += " -oa $($BackupOnlyAfter.ToString('MM/dd/yyyy HH:mm tt'))"}
            if ($ExcludeSystemHiddenFiles) {
                $Argument += " -es yes"
            }else{
                $Argument += " -es no"
            }
            if ($SkipFolders){$Argument += " -skipf $($SkipFolders -join ',')"}
            if ($IncludeFilesMask){$Argument += " -ifm $($IncludeFilesMask -join ',')"}
            if ($ExcludeFilesMask){$Argument += " -efm $($ExcludeFilesMask -join ',')"}
            if ($BackupFile){$Argument += " -f "+'"{0}"' -f ($BackupFile -join '" -f "')}
            if ($BackupDirectory){$Argument += " -d "+'"{0}"' -f ($BackupDirectory -join '" -d "')}
            
            return $Argument
        }
        $ReturnArray = @()
        $Arguments += Set-Argument
        (Start-MBSProcess -cmdpath $CBB.CBBCLIPath -cmdarguments $Arguments -output full -MasterPassword $MasterPassword).result | ForEach-Object -Process { $ReturnArray += $_ }
        return $ReturnArray
    }
    
    end {
        
    }
}
# SIG # Begin signature block
