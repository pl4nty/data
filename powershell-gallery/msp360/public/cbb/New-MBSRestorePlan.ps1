function New-MBSRestorePlan {
    <#
    .SYNOPSIS
    Creates new restore plan.
    
    .DESCRIPTION
    Creates File-Level, Image-Based, Hyper-V, or MS SQL restore plan.
    
    .PARAMETER Name
    Restore plan name
    
    .PARAMETER StorageAccount
    Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name "AWS S3")
    
    .PARAMETER MasterPassword
    Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .PARAMETER Schedule
    Specify schedule. Use New-MBSPlanSchedule to create an object
    
    .PARAMETER RestorePlanCommonOption
    Specify plan common options. Use New-MBSRestorePlanCommonOption to create an object
    
    .PARAMETER BackupPrefix
    Backup prefix
    
    .PARAMETER RestorePath
    Restore to a specific location. Omit for restore to the original location. 
    
    .PARAMETER RunOnce
    Run plan once (do not save)
    
    .PARAMETER Overwrite
    Overwrite existing files/database
    
    .PARAMETER RestoreFromGlacier
    Restore objects located in S3 Glacier or Deep Archive storage classes. Possible values: Expedited, Standard, Bulk)
    
    .PARAMETER RestorePoint
    Restore type. Specify DateTime value or omit to restore the latest version.
    
    .PARAMETER File
    Restore file
    
    .PARAMETER Folder
    Restore folder
    
    .PARAMETER RestoreDeletedFiles
    Restore deleted files
    
    .PARAMETER RestoreNewFile
    Restore only new files. Existing files will be overwritten only if modification date of backed up file is newer than existing
    
    .PARAMETER RestoreNTFSPermissions
    Restore NTFS permissions
    
    .PARAMETER HVHost
    Hyper-V host
    
    .PARAMETER VM
    Hyper-V VM name
    
    .PARAMETER NewVM
    New Hyper-V machine name

    .PARAMETER ImportVM 
    Import virtual machine after restore
    
    .PARAMETER Disk
    Backed up disk ID
    
    .PARAMETER Volume
    Restore volume by id
    
    .PARAMETER DestinationDisk
    Restore to phisical disk specified by Id
    
    .PARAMETER DestinationVolume
    Restore to volume specified by id
    
    .PARAMETER VirtualDiskType
    Restore to virtual disk
    
    .PARAMETER VirtualDiskName
    Set target virtual disk name
    
    .PARAMETER VirtualDiskFolder
    Set target virtual disk destination folder
    
    .PARAMETER VirtualDiskCapacity
    Set target virtual disk capacity (integer value with size specifier in KB, MB, GB, TB. It can be used for extend of the original disk capacity only. Shrinking volumes will not be performed if the value set is smaller than the original disk size.
    
    .PARAMETER InstanceName
    Destination MS SQL Server instance name
    
    .PARAMETER useSSL
    Use secure connection (SSL/TLS)
    
    .PARAMETER useWinauth
    Use Windows authentication
    
    .PARAMETER UserName
    MS SQL server user name
    
    .PARAMETER Password
    MS SQL server password
    
    .PARAMETER DataFileFolder
    Data file folder
    
    .PARAMETER LogFileFolder
    Log file folder
    
    .PARAMETER FileNameTemplate
    File name template. Possible values: You can use a %DATABASENAME% variable to automatically generate a file name as a 'restore as' database name
    
    .PARAMETER CloseExistingConnection
    Close existing connections to destination database
    
    .PARAMETER CheckPermissions
    Check if the specified account has necessary permissions to perform restore
    
    .PARAMETER SourceInstanceName
    Source MS SQL Server instance name
    
    .PARAMETER Database
    Source database name
    
    .PARAMETER NewDatabase
    New database name
    
    .EXAMPLE
    New-MBSRestorePlan -Name "Restore Image as VHD" -StorageAccount (Get-MBSStorageAccount | where {$_.DisplayName -eq "AWS S3"}) -RestorePlanCommonOption (New-MBSRestorePlanCommonOption) -Disk "00000000-0000-0000-0000-000000000002" -VirtualDiskType VHDdynamic -VirtualDiskName "MyDisk" -VirtualDiskFolder "E:\Restore"
    
    Restore Image-Based backup as VHD dynamic file.

    .EXAMPLE
    New-MBSRestorePlan -Name "Restore file" -StorageAccount (Get-MBSStorageAccount | where {$_.DisplayName -like "*AWS S3*"}) -RestorePlanCommonOption (New-MBSRestorePlanCommonOption) -File C:\temp\test.txt -Folder "C:\myFolder","c:\Users" -RestorePath "E:\Restore"
    
    Restore C:\temp\test.txt and C:\myFolder,c:\Users folders to E:\Restore

    .EXAMPLE
    New-MBSRestorePlan -Name "Restore disk" -StorageAccount (Get-MBSStorageAccount | where {$_.DisplayName -eq "AWS S3"}) -RestorePlanCommonOption (New-MBSRestorePlanCommonOption) -Disk "00000000-0000-0000-0000-000000000002" -DestinationDisk "00000000-0000-0000-0000-000000000001" | Start-MBSBackupPlan

    Create plan to restore disk with ID "00000000-0000-0000-0000-000000000002" to disk with ID "00000000-0000-0000-0000-000000000001" and start it.

    .EXAMPLE
    New-MBSRestorePlan -Name "Restore Hyper-V VM" -StorageAccount (Get-MBSStorageAccount | where {$_.DisplayName -eq "AWS S3"}) -RestorePlanCommonOption (New-MBSRestorePlanCommonOption) -Host "MyHost" -VM "Server" -NewVM "RestoredServer" -ImportVM $true | Start-MBSBackupPlan

    Create plan to restore Hyper-V VM with name Server as new VM with name RestoredServer and import to Hyper-V.

    .INPUTS
    None.

    .OUTPUTS
    System.Management.Automation.PSCustomObject
    String

    .NOTES
    Author: MSP360 Onboarding Team

    .LINK
    https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/new-mbsrestoreplan

    #>
    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$true, HelpMessage="Restore plan name.")]
        [string]
        $Name,
        # 
        [Parameter(Mandatory=$true, HelpMessage="Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")")]
        [MBS.Agent.StorageAccount]
        $StorageAccount,
        #
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        [SecureString]
        $MasterPassword,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify schedule. Use New-MBSPlanSchedule to create an object.")]
        [MBS.Agent.Plan.Schedule]
        $Schedule,
        #
        [Parameter(Mandatory=$true, HelpMessage="Specify plan common options. Use New-MBSRestorePlanCommonOption to create an object.")]
        [MBS.Agent.Plan.RestorePlanCommonOption]
        $RestorePlanCommonOption,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup prefix")]
        [string]
        $BackupPrefix,
        #
        [Parameter(Mandatory=$False, HelpMessage="Restore to a specific location. Omit for restore to the original location.", ParameterSetName='FileLevel')]
        [Parameter(Mandatory=$False, HelpMessage="Restore to a specific location. Omit for restore to the original location.", ParameterSetName='HyperV')]
        [string]
        $RestorePath,
        #
        [Parameter(Mandatory=$False, HelpMessage="Run plan once (do not save)", ParameterSetName='FileLevel')]
        [Parameter(Mandatory=$False, HelpMessage="Run plan once (do not save)", ParameterSetName='HyperV')]
        [Parameter(Mandatory=$False, HelpMessage="Run plan once (do not save)", ParameterSetName='ImageBasedDisk')]
        [Parameter(Mandatory=$False, HelpMessage="Run plan once (do not save)", ParameterSetName='ImageBasedVolume')]
        [Parameter(Mandatory=$False, HelpMessage="Run plan once (do not save)", ParameterSetName='ImageBasedVHD')]
        [Parameter(Mandatory=$False, HelpMessage="Run plan once (do not save)", ParameterSetName='MSSQL')]
        [bool]
        $RunOnce = $true,
        #
        [Parameter(Mandatory=$False, HelpMessage="Overwrite existing files/database", ParameterSetName='FileLevel')]
        [Parameter(Mandatory=$False, HelpMessage="Overwrite existing files/database", ParameterSetName='HyperV')]
        [Parameter(Mandatory=$False, HelpMessage="Overwrite existing files/database", ParameterSetName='MSSQL')]
        [switch]
        $Overwrite,
        #
        [Parameter(Mandatory=$false, HelpMessage="Restore objects located in S3 Glacier or Deep Archive storage classes. Possible values: Expedited, Standard, Bulk)", ParameterSetName='FileLevel')]
        [Parameter(Mandatory=$false, HelpMessage="Restore objects located in S3 Glacier or Deep Archive storage classes. Possible values: Expedited, Standard, Bulk)", ParameterSetName='HyperV')]
        [MBS.Agent.Plan.GlacierRestoreType]
        $RestoreFromGlacier,
        #
        [Parameter(Mandatory=$false, HelpMessage="Restore type. Specify DateTime value or omit to restore the latest version.", ParameterSetName='FileLevel')]
        [Parameter(Mandatory=$false, HelpMessage="Restore type. Specify DateTime value or omit to restore the latest version.", ParameterSetName='ImageBasedDisk')]
        [Parameter(Mandatory=$false, HelpMessage="Restore type. Specify DateTime value or omit to restore the latest version.", ParameterSetName='ImageBasedVolume')]
        [Parameter(Mandatory=$false, HelpMessage="Restore type. Specify DateTime value or omit to restore the latest version.", ParameterSetName='ImageBasedVHD')]
        [Parameter(Mandatory=$false, HelpMessage="Restore type. Specify DateTime value or omit to restore the latest version.", ParameterSetName='HyperV')]
        [Parameter(Mandatory=$false, HelpMessage="Restore type. Specify DateTime value or omit to restore the latest version.", ParameterSetName='MSSQL')]
        [datetime]
        $RestorePoint,
        #-------------------- File-Level ---------------
        [Parameter(Mandatory=$false, HelpMessage="Restore file", ParameterSetName='FileLevel')]
        [string[]]
        $File,
        #
        [Parameter(Mandatory=$false, HelpMessage="Restore folder", ParameterSetName='FileLevel')]
        [string[]]
        $Folder,
        #
        [Parameter(Mandatory=$false, HelpMessage="Restore deleted files", ParameterSetName='FileLevel')]
        [switch]
        $RestoreDeletedFiles,
        #
        [Parameter(Mandatory=$false, HelpMessage="Restore only new files. Existing files will be overwritten only if modification date of backed up file is newer than existing", ParameterSetName='FileLevel')]
        [switch]
        $RestoreNewFile,
        #
        [Parameter(Mandatory=$false, HelpMessage="Restore NTFS permissions", ParameterSetName='FileLevel')]
        [switch]
        $RestoreNTFSPermissions,
        #-------------------- Hyper-V ---------------
        [Parameter(Mandatory=$true, HelpMessage="Hyper-V host", ParameterSetName='HyperV')]
        [string]
        $HVHost,
        #
        [Parameter(Mandatory=$true, HelpMessage="Hyper-V VM name", ParameterSetName='HyperV')]
        [string]
        $VM,
        #
        [Parameter(Mandatory=$true, HelpMessage="New Hyper-V machine name", ParameterSetName='HyperV')]
        [string]
        $NewVM,
        #
        [Parameter(Mandatory=$true, HelpMessage="Import virtual machine after restore", ParameterSetName='HyperV')]
        [bool]
        $ImportVM=$true,
        #-------------------- Image-Based ---------------
        [Parameter(Mandatory=$true, HelpMessage="Backed up disk ID", ParameterSetName='ImageBasedDisk')]
        [Parameter(Mandatory=$False, HelpMessage="Backed up disk ID", ParameterSetName='ImageBasedVolume')]
        [Parameter(Mandatory=$False, HelpMessage="Backed up disk ID", ParameterSetName='ImageBasedVHD')]
        [string]
        $Disk,
        #
        [Parameter(Mandatory=$true, HelpMessage="Restore volume by id", ParameterSetName='ImageBasedVolume')]
        [Parameter(Mandatory=$False, HelpMessage="Restore volume by id", ParameterSetName='ImageBasedVHD')]
        [string]
        $Volume,
        #
        [Parameter(Mandatory=$true, HelpMessage="Restore to phisical disk specified by Id", ParameterSetName='ImageBasedDisk')]
        [Parameter(Mandatory=$False, HelpMessage="Restore to phisical disk specified by Id", ParameterSetName='ImageBasedVolume')]
        [string]
        $DestinationDisk,
        #
        [Parameter(Mandatory=$true, HelpMessage="Restore to volume specified by id.", ParameterSetName='ImageBasedVolume')]
        [string]
        $DestinationVolume,
        #
        [Parameter(Mandatory=$true, HelpMessage="Restore to virtual disk", ParameterSetName='ImageBasedVHD')]
        [MBS.Agent.Plan.VirtualDiskType]
        $VirtualDiskType,
        #
        [Parameter(Mandatory=$False, HelpMessage="Set target virtual disk name", ParameterSetName='ImageBasedVHD')]
        [string]
        $VirtualDiskName,
        #
        [Parameter(Mandatory=$False, HelpMessage="Set target virtual disk destination folder", ParameterSetName='ImageBasedVHD')]
        [string]
        $VirtualDiskFolder,
        #
        [Parameter(Mandatory=$False, HelpMessage="Set target virtual disk capacity (integer value with size specifier in KB, MB, GB, TB. It can be used for extend of the original disk capacity only. Shrinking volumes will not be performed if the value set is smaller than the original disk size.", ParameterSetName='ImageBasedVHD')]
        [ValidatePattern("^\d+(\s|)(KB|MB|GB|TB)$")]
        [string]
        $VirtualDiskCapacity,
        #-------------------- MS SQL ---------------
        [Parameter(Mandatory=$true, HelpMessage="Destination MS SQL Server instance name", ParameterSetName='MSSQL')]
        [string]
        $InstanceName,
        #
        [Parameter(Mandatory=$false, HelpMessage="Use secure connection (SSL/TLS)", ParameterSetName='MSSQL')]
        [bool]
        $useSSL,
        #
        [Parameter(Mandatory=$False, HelpMessage='Use Windows authentication.', ParameterSetName='MSSQL')]
        [Switch]
        $useWinauth,
        #
        [Parameter(Mandatory=$False, HelpMessage="MS SQL server user name", ParameterSetName='MSSQL')]
        [string]
        $UserName,
        #
        [Parameter(Mandatory=$False, HelpMessage="MS SQL server password", ParameterSetName='MSSQL')]
        [Securestring]
        $Password,
        #
        [Parameter(Mandatory=$False, HelpMessage="Data file folder", ParameterSetName='MSSQL')]
        [string]
        $DataFileFolder,
        #
        [Parameter(Mandatory=$False, HelpMessage="Log file folder", ParameterSetName='MSSQL')]
        [string]
        $LogFileFolder,
        #
        [Parameter(Mandatory=$False, HelpMessage="File name template. Possible values: You can use a %DATABASENAME% variable to automatically generate a file name as a 'restore as' database name", ParameterSetName='MSSQL')]
        [string]
        $FileNameTemplate,
        #
        [Parameter(Mandatory=$False, HelpMessage="Close existing connections to destination database.", ParameterSetName='MSSQL')]
        [switch]
        $CloseExistingConnection,
        #
        [Parameter(Mandatory=$False, HelpMessage="Check if the specified account has necessary permissions to perform restore.", ParameterSetName='MSSQL')]
        [bool]
        $CheckPermissions = $true,
        #
        [Parameter(Mandatory=$False, HelpMessage="Source MS SQL Server instance name", ParameterSetName='MSSQL')]
        [string]
        $SourceInstanceName,
        #
        [Parameter(Mandatory=$False, HelpMessage="Source database name", ParameterSetName='MSSQL')]
        [string]
        $Database,
        #
        [Parameter(Mandatory=$False, HelpMessage="New database name", ParameterSetName='MSSQL')]
        [string]
        $NewDatabase


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
        function Set-Schedule {
            param (
                [Parameter()]
                [psobject]
                $Schedule,
                [Parameter()]
                [string]
                $Prefix = ''
            )
            switch ($Schedule.Frequency) {
                Daily {$ScheduleCli += " -every$prefix day"}
                Weekly {$ScheduleCli += " -every$prefix week"}
                Monthly {$ScheduleCli += " -every$prefix month"}
                dayofmonth {$ScheduleCli += " -every$prefix dayofmonth"}
                Realtime {$ScheduleCli += " -every$prefix real-time"}
                Default {
                    #Write-Host "Schedule frequency is not specified."
                    #Break
                }
            }
            if ($Schedule.At){$ScheduleCli += " -at$prefix ""$($Schedule.At.ToString())"""}
            if ($Schedule.DayOfMonth){$ScheduleCli += " -day$prefix $($Schedule.DayOfMonth)"}
            if ($null -ne $Schedule.DayOfWeek){$ScheduleCli += " -weekday$prefix "+(($Schedule.DayOfWeek | foreach-object -Begin {$weekdaylocal = @()} -Process{$weekdaylocal += $_.ToString().Substring(0,2)} -End {return $weekdaylocal.ToLower()}) -join ",")}
            if ($Schedule.Weeknumber){$ScheduleCli += " -weeknumber$prefix $($Schedule.Weeknumber)"}
            if ($Schedule.OccursFrom){$ScheduleCli += " -dailyFrom$prefix $($Schedule.OccursFrom.ToString('hh\:mm'))"}
            if ($Schedule.OccursTo){$ScheduleCli += " -dailyTill$prefix $($Schedule.OccursTo.ToString('hh\:mm'))"}
            if ($Schedule.OccursEvery.TotalMinutes -ne 0){
                if ($Schedule.OccursEvery.TotalHours -gt 180){
                    $ScheduleCli += " -occurs$prefix hour -occurValue$prefix 180"
                }elseif($Schedule.OccursEvery.TotalHours -lt 180 -and $Schedule.OccursEvery.TotalHours -ge 1){
                    $ScheduleCli += " -occurs$prefix hour -occurValue$prefix $([Math]::Round($Schedule.OccursEvery.TotalHours))"
                }elseif($Schedule.OccursEvery.TotalHours -lt 1 -and $Schedule.OccursEvery.TotalMinutes -ge 1){
                    $ScheduleCli += " -occurs$prefix min -occurValue$prefix $([Math]::Round($Schedule.OccursEvery.TotalMinutes))"
                }else{
                    Write-host "Schedule 'OccursEvery' parameter cannot be less then 1 minute."
                }
            }
            if ($Schedule.RepeatInterval){$ScheduleCli += " -repeatEvery$prefix $($Schedule.RepeatInterval)"}
            if ($Schedule.RepeatStartDate){$ScheduleCli += " -repeatStartDate$prefix ""$($Schedule.RepeatStartDate.ToString())"""}   

            return $Schedulecli

        }

        switch -Wildcard ($PSCmdlet.ParameterSetName){
            'FileLevel' {$Argument += " addRestorePlan"}
            'ImageBased*' {$Argument += " addRestoreIBBPlan"}
            'HyperV' {$Argument += " addRestoreHVPlan"}
            'MSSQL' {$Argument += " addRestoreMSSQLPlan"}
            Default {}
        }

        if ($Name){$Argument += " -n ""$Name"""}
        $Argument += " -aid ""$($StorageAccount.ID)"""
        if($Schedule){$Argument += Set-Schedule -Schedule $Schedule}

        if($RestorePlanCommonOption.SyncRepositoryBeforeRun){$Argument += " -sync yes"}#else{$Argument += " -sync no"}
        if($RestorePlanCommonOption.EncryptionPassword){$Argument += " -ep """+([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($RestorePlanCommonOption.EncryptionPassword)))+""""}
        if($RestorePlanCommonOption.StopIfPlanRunsFor.TotalMinutes -gt 0){$Argument += " -stopAfter $( [math]::Round($RestorePlanCommonOption.StopIfPlanRunsFor.TotalHours)):$($RestorePlanCommonOption.StopIfPlanRunsFor.Minutes)"}
        if($PSCmdlet.ParameterSetName -ne "MSSQL"){
            if($RestorePlanCommonOption.PreActionCommand){$Argument += " -preAction $($RestorePlanCommonOption.PreActionCommand)"}
            if($Null -ne $RestorePlanCommonOption.PreActionContinueAnyway){
                if($RestorePlanCommonOption.PreActionContinueAnyway){
                    $Argument += " -pac yes"
                } else {
                    $Argument += " -pac no"
                }
            }
            if($RestorePlanCommonOption.PostActionCommand){$Argument += " -postAction $($RestorePlanCommonOption.PostActionCommand)"}
            if($Null -ne $RestorePlanCommonOption.PostActionRunAnyway){
                if($RestorePlanCommonOption.PostActionRunAnyway){
                    $Argument += " -paa yes"
                } else {
                    $Argument += " -paa no"
                }
            }
            if($Null -ne $RestorePlanCommonOption.ResultEmailNotification){$Argument += " -notification $($RestorePlanCommonOption.ResultEmailNotification)"}
            if($Null -ne $RestorePlanCommonOption.AddEventToWindowsLog){$Argument += " -winLog $($RestorePlanCommonOption.AddEventToWindowsLog)"}
        }
        if($BackupPrefix){$Argument += " -bp $BackupPrefix"}
        if($RunOnce){$Argument += " -runOnce yes"}else{$Argument += " -runOnce no"}
        if($RestoreFromGlacier){$Argument += " -glacier $RestoreFromGlacier"}
        if($RestorePoint){$Argument += " -rt ""$RestorePoint"""}
        
        switch -Wildcard ($PSCmdlet.ParameterSetName){
            'FileLevel' {
                # --------- File-Level ------------
                if ($RestorePath) {$Argument += " -rlocation ""$RestorePath"""}
                if ($Overwrite){$Argument += " -o"}
                if ($File){$Argument += " -f "+'"{0}"' -f ($File -join '" -f "')}
                if ($Folder){$Argument += " -d "+'"{0}"' -f ($Folder -join '" -d "')}
                if ($RestoreDeletedFiles){$Argument += " -deleted"}
                if ($RestoreNewFile){$Argument += " -rn"}
                if ($RestoreNTFSPermissions){$Argument += " -ntfs yes"}else{$Argument += " -ntfs no"}
            }
            'ImageBased*' {
                # ------------- Image-Based -------------
                if ($Disk) {$Argument += " -did ""$Disk"""}
                if ($Volume) {$Argument += " -v ""$Volume"""}
                if ($DestinationDisk) {$Argument += " -pd ""$DestinationDisk"""}
                if ($DestinationVolume) {$Argument += " -pv ""$DestinationVolume"""}
                if ($null -ne $VirtualDiskType) {
                    $VirtualDiskTypeHash = @{
                        VHDdynamic = "Hyper-V Virtual Disk (VHD-format) dynamic"
                        VHDfixed = "Hyper-V Virtual Disk (VHD-format) fixed"
                        VHDXdynamic = "Hyper-V Virtual Disk (VHDX-format) dynamic"
                        Raw = "RAW disk image raw"
                        Rawsparse = "RAW disk image rawsparse"
                        Tar = "RAW disk image tar"
                        Tgz = "RAW disk image tgz"
                        VDIdynamic = "VirtualBox Virtual Disk dynamic"
                        VDIfixed = "VirtualBox Virtual Disk fixed"
                        VMDKdynamic = "VMware Virtual Disk vmfsdynamic"
                        VMDKfixed = "VMware Virtual Disk vmfsfixed"
                    }
                    $Argument += " -vdt ""$($VirtualDiskTypeHash["$VirtualDiskType"])"""
                }
                if ($VirtualDiskName) {$Argument += " -vdn ""$VirtualDiskName"""}
                if ($VirtualDiskFolder) {$Argument += " -vdf ""$VirtualDiskFolder"""}
                if ($VirtualDiskCapacity) {$Argument += " -vdc ""$VirtualDiskCapacity"""}
            }
            'HyperV' { 
                # ------------- Hyper-V -------------
                if ($HVHost) {$Argument += " -host ""$HVHost"""}
                if ($VM) {$Argument += " -machine ""$VM"""}
                if ($NewVM) {$Argument += " -newMachine ""$NewVM"""}
                if ($ImportVM){$Argument += " -ImportVM yes"}else{$Argument += " -ImportVM no"}
            }
            'MSSQL' {
                # ------------- MS SQL -------------
                if ($InstanceName){$Argument += " -instancename $InstanceName"}
                if ($useSSL){$Argument += " -secure"}
                if ($useWinauth){$Argument += " -winauth yes"}
                if ($UserName){$Argument += " -username $UserName"}
                if ($Password){$Argument += " -password """+([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password)))+""""}
                if ($DataFileFolder){$Argument += " -dp $DataFileFolder"}
                if ($LogFileFolder){$Argument += " -lp $LogFileFolder"}
                if ($FileNameTemplate){$Argument += " -fm $FileNameTemplate"}
                if ($Overwrite){$Argument += " -ov yes"}else{$Argument += " -ov no"}
                if ($CloseExistingConnection){$Argument += " -cc yes"}else{$Argument += " -cc no"}
                if ($CheckPermissions){$Argument += " -cr yes"}else{$Argument += " -cr no"}
                if ($SourceInstanceName){$Argument += " -dbin $SourceInstanceName"}
                if ($Database){$Argument += " -dbn $Database"}
                if ($NewDatabase){$Argument += " -dbnn $NewDatabase"}                 
            }
        }

        switch  ($PSCmdlet.ParameterSetName){
            {$_ -in "ImageBasedDisk","ImageBasedVolume","ImageBasedVHD","HyperV"} {
                $result = Start-MBSProcess -cmdpath $CBB.CBBCLIPath -cmdarguments $Argument -output json -MasterPassword $MasterPassword
                if ($result.Result -eq "Success") {
                    Get-MBSRestorePlan | Where-Object{$_.ID -eq $result.Id}
                }
            }
            {$_ -in "FileLevel","MSSQL"} {
                (Start-MBSProcess -cmdpath $CBB.CBBCLIPath -cmdarguments $Argument -output short -MasterPassword $MasterPassword).result
            }
            Default {}
        }
    }
    
    end {

    }
}
# SIG # Begin signature block
