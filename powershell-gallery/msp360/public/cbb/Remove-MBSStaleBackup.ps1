function Remove-MBSStaleBackup {
    <#
    .SYNOPSIS
    Removes backed up folders and files which are excluded from the backup plan.
    
    .DESCRIPTION
    Compares already backed up folder and files with backup items in the backup plan. The cmdlet processes data uploaded with CBF (Legacy) file-level backup plans only.
    
    .PARAMETER StorageAccount
    Specify the storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name "AWS S3")
    
    .PARAMETER MasterPassword
    Master password. Should be specified if the configuration is protected by a master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .PARAMETER WhatIf
    Shows what would happen if the cmdlet runs. The changes are not applied.
    
    .EXAMPLE
    Remove-MBSStaleBackup -StorageAccount (Get-MBSStorageAccount -Name "AWS")

    Remove stale backups for storage account with the name "AWS".

    .EXAMPLE
    Remove-MBSStaleBackup -StorageAccount (Get-MBSStorageAccount -Name "AWS") -WhatIf

    Emulate removing stale backups for storage account with the name "AWS".
    
    .EXAMPLE
    Get-MBSStorageAccount | Remove-MBSStaleBackup

    Remove stale backups for all storage account.

    .EXAMPLE
    Get-MBSStorageAccount | Remove-MBSStaleBackup -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)

    Remove stale backups for all storage account if the backup agent is protected with the master password.

    .INPUTS
        MBS.Agent.StorageAccount

    .OUTPUTS
        String
        String[]

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/remove-mbsstalebackup
    #>

    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(ValueFromPipeline, Mandatory=$true, HelpMessage="Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")")]
        [MBS.Agent.StorageAccount]
        $StorageAccount,
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        [securestring]
        $MasterPassword,
        [Parameter(Mandatory=$False, HelpMessage="Shows what would happen if the cmdlet runs. The changes are not applied.")]
        [switch]
        $WhatIf
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
        
        function Remove-MBSStaleData {
            param (
                [MBS.Agent.StorageAccountContent[]]
                $StorageAccountContent,
                [String[]]
                $Item,
                [bool]
                $NetworkPath
            )
            if ($StorageAccountContent) {
                $StorageAccountContent | Foreach-Object -Process {
                    if($_.Type -eq "Disk"){$FullName = $_.FullName+'\'}else{$FullName = $_.FullName}
                    if($NetworkPath){$FullName = "\\"+$FullName}

                    if ($FullName -in $Item) {
                        Write-Host "Item ""$($_.FullName)"" is in the backup plan scope."
                    }elseif ($Item -like ($FullName+'*')) {
                        $NetworkPathInternal = $false
                        if(($_.Type -eq "Disk" -and $_.Name -like "\\*") -or $NetworkPath){
                            $NetworkPathInternal = $true
                            $StorageAccountContentNextLevel = Get-MBSBackup -StorageAccount $StorageAccount -Folder $_.FullName.TrimStart("\\") -MasterPassword $MasterPassword -ErrorAction Stop #-verbose 
                        }else {
                            $StorageAccountContentNextLevel = Get-MBSBackup -StorageAccount $StorageAccount -Folder $_.FullName -MasterPassword $MasterPassword -ErrorAction Stop #-verbose 
                        }
                        if ($StorageAccountContentNextLevel) {
                            Remove-MBSStaleData -StorageAccountContent $StorageAccountContentNextLevel -Item $Item -NetworkPath $NetworkPathInternal
                        }else {
                            Write-Host "Folder ""$($_.FullName)"" is partly backed up and will not be removed."
                        }
                    }else {
                        if ($WhatIf) {
                            Write-Host "What if: Performing the operation ""Remove MBS Backup"" on target $($_.FullName)."
                        }else {
                            Write-Host "Removing: $($_.FullName). Please wait..."
                            $Options = @{
                                StorageAccount = $StorageAccount
                                MasterPassword = $MasterPassword
                            }           
                            if(([IO.FileInfo]($_.FullName+'\')).Extension){
                                $Options.Add("File",$_.FullName)
                            }else {
                                $Options.Add("Folder",$_.FullName) 
                            }
                            Remove-MBSBackup @Options
                        }
                    }
                }
            }
        }

        function Test-MBSExclusions {
            param (
                [String]
                $ExcludedItem,
                [String]
                $OriginalExcludedItem
            )
            if((Split-Path -Path $ExcludedItem) -ne ''){
                Write-Verbose ("$($PSCmdlet.MyInvocation.MyCommand.Name): Checking excluded item: "+$ExcludedItem)
                $PlanWithoutExclusions | ForEach-Object -Process {
                    Write-Verbose ("$($PSCmdlet.MyInvocation.MyCommand.Name): Backup scope ($($_.Name)): "+$_.Items.PlanItem.Path)
                }
                if((Split-Path -Path $ExcludedItem) -notin $PlanWithoutExclusions.Items.PlanItem.Path){
                    Test-MBSExclusions -ExcludedItem (Split-Path -Path $ExcludedItem) -OriginalExcludedItem $OriginalExcludedItem
                }else{
                    Write-Host "Excluded item ""$($OriginalExcludedItem)"" is in the backup scope."
                }
            }else{
                Write-Host "Excluded item ""$($OriginalExcludedItem)"" is NOT in the backup scope."
                if ($WhatIf) {
                    Write-Host "What if: Performing the operation ""Remove MBS Backup"" on target $($OriginalExcludedItem)."
                }else {
                    Write-Host "Removing: $($OriginalExcludedItem). Please wait..."
                    $Options = @{
                        StorageAccount = $StorageAccount
                        MasterPassword = $MasterPassword
                    }           
                    if(([IO.FileInfo]$OriginalExcludedItem).Extension){
                        $Options.Add("File",$OriginalExcludedItem)
                    }else {
                        $Options.Add("Folder",$OriginalExcludedItem) 
                    }
                    Remove-MBSBackup @Options
                }
            }
        }
    }
    
    process {
        $Plans = Get-MBSBackupPlan -PlanType File-Level -PlanFormat CBF | Where-Object ConnectionID -EQ $StorageAccount.ID
        Write-Host "Checking backup scopes."
        $Backup = Get-MBSBackup -StorageAccount $StorageAccount -MasterPassword $MasterPassword
        Remove-MBSStaleData -StorageAccountContent $Backup -Item $Plans.Items.PlanItem.Path

        Write-Host "Checking excluded items."
        foreach ($Plan in $Plans) {
            $Plan.ExcludedItems.PlanItem.Path | ForEach-Object -Process {
                $Item = $_
                $Options = @{
                    StorageAccount = $StorageAccount
                    MasterPassword = $MasterPassword
                }           
                if(([IO.FileInfo]$Item).Extension){
                    $Options.Add("File",$Item)
                }else {
                    $Options.Add("Folder",$Item) 
                }
                
                if (Get-MBSBackup @Options -ErrorAction SilentlyContinue) {
                    $PlanWithoutExclusions = $Plans | Where-Object {$_.ExcludedItems.PlanItem.Path -notin $Item}
                    Test-MBSExclusions -ExcludedItem $Item -OriginalExcludedItem $Item
                }
            }
        }
    }
    
    end {
        
    }
}
# SIG # Begin signature block
