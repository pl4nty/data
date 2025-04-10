function Get-MBSPlanHistory {
    
    <#
    .SYNOPSIS
    Retrive backup/restore plan history from local repository.
    
    .DESCRIPTION
    Get information on the plan runs. Using -Detailed parameter may slow down output in case of a large number of processed items.
    
    .PARAMETER PlanID
    Backup plan ID.
    
    .PARAMETER Detailed
    Item history for backup session includes if the switch parameter is specified. 
    
    .EXAMPLE
    PS C:\> Get-MBSPlanHistory 
    Get plan history for all backup plan.

    .EXAMPLE
    PS C:\> Get-MBSPlanHistory -PlanID 6d014515-27f6-477c-a13f-c274a4675d44
    Get plan history for the specific backup plan.

    .EXAMPLE
    PS C:\> Get-MBSPlanHistory -PlanID 6d014515-27f6-477c-a13f-c274a4675d44 -Detailed
    Get plan and item history for the specific backup plan.
    
    .INPUTS
        System.String[]

    .OUTPUTS
        System.Management.Automation.PSCustomObject

    .NOTES
    Author: MSP360 Onboarding Team

    .LINK
    https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/get-mbsplanhistory
    
    #>
    
    [CmdletBinding()]
    param (
        # Backup plan ID
        [Parameter(ValueFromPipelineByPropertyName)]
        [Alias("ID")]
        [string]
        $PlanID,
        # Switch to include items history
        [Parameter()]
        [switch]
        $Detailed
    )
    
    begin {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        Try{$PSSQLiteModule = Get-Package -Name "PSSQLite" -ErrorAction SilentlyContinue}catch{$PSSQLiteModule = $false}
        if (-not($PSSQLiteModule)){
            Try{Install-Package -Name PSSQLite -Force}catch{Write-Host $_.Exception.Message}
            Try{Install-Module -Name PSSQLite -Force}catch{Write-Host $_.Exception.Message}
            Try{Import-Module -Name PSSQLite -Force}catch{Write-Host $_.Exception.Message}
        }else{
            Try{Import-Module -Name PSSQLite -Force}catch{Write-Host $_.Exception.Message}
        }

        $ItemStatus = @{
            [long]0 = "Success";
            [long]1 = "Failure";
            [long]2 = "Warning";
            [long]3 = "Information"
        }

        $planStatus = @{
            [long]0 = "Starting";
            [long]1 = "UpdatedFileSearch";
            [long]2 = "Running";
            [long]3 = "PurgingFiles";
            [long]4 = "Pausing";
            [long]5 = "Paused";
            [long]6 = "Success";
            [long]7 = "Warning";
            [long]8 = "Failed";
            [long]9 = "InterruptedByUser";
            [long]10 = "InterruptedBySchedule";
            [long]11 = "UpdatingRepository";
            [long]12 = "Stopping";
            [long]13 = "CreatingVSSSnapshot";
            [long]14 = "CalculatingMD5";
            [long]15 = "InstantBackup";
            [long]16 = "InterruptedForUpdate";
            [long]17 = "RunningPreBackupAction";
            [long]18 = "RunningPostBackupAction";
            [long]19 = "Preparing";
            [long]20 = "Downloading";
            [long]21 = "RunningWindowsBackup";
            [long]22 = "Resuming";
            [long]23 = "RunningForPause";
            [long]24 = "RunningRestoreDatabase";
            [long]25 = "Skipped";
            [long]26 = "Information";
            [long]27 = "CreatingWmiSnapshot";
            [long]28 = "RestoreVirtualMachine";
            [long]29 = "TerminatedAbnormally";
            [long]30 = "TerminatedByUser"
        } 

        if((Get-MBSAgentSetting).DatabaseFilePath){
            $DatabaseFilePath = (Get-MBSAgentSetting).DatabaseFilePath + "\cbbackup.db"
        }else{
            $DatabaseFilePath = (Get-MBSAgent).CBBProgramData + "\data\cbbackup.db"
        }
    }
    
    process {
        
        $QuerySessionHistory = "SELECT id,
                    destination_id,
                    plan_id,
                    date_start_utc,
                    duration,
                    result,
                    uploaded_count,
                    uploaded_size,
                    scanned_count,
                    scanned_size,
                    purged_count,
                    total_count,
                    total_size,
                    failed_count,
                    error_message,
                    processor_time,
                    peak_memory_usage,
                    plan_name
                FROM session_history"
        
        if ($PlanID) {
            $QuerySessionHistory += " WHERE plan_id = ""$PlanID"";"    
        }else{
            $QuerySessionHistory += ";"
        }

        Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): $QuerySessionHistory"

        $PlanSessionHistory = Invoke-SqliteQuery -Query $QuerySessionHistory -DataSource $DatabaseFilePath | select id, 
                                destination_id, 
                                plan_id, 
                                plan_name, 
                                @{Name = 'start_date_time'; Expression = {[datetime]::ParseExact(($_.date_start_utc).ToString(), "yyyyMMddHHmmss", $null)}}, 
                                duration, 
                                @{Name = 'result'; Expression = {$planStatus[$_.result]}}, 
                                @{Name = 'error_message'; Expression = {(Convert-XMLtoPSObject -XML ([xml]$_.error_message).BaseError).Message}},
                                uploaded_count,
                                uploaded_size,
                                scanned_count,
                                scanned_size,
                                purged_count,
                                total_count,
                                total_size,
                                failed_count,
                                processor_time,
                                peak_memory_usage
         
        
        if ($Detailed) {
            $PlanSessionHistory | ForEach-Object -Process {
                $QueryHistory = "SELECT id,
                                        destination_id,
                                        plan_id,
                                        local_path,
                                        operation,
                                        duration,
                                        date_finished_utc,
                                        date_modified_utc,
                                        size,
                                        message,
                                        session_id,
                                        attempts,
                                        result,
                                        thumbnail_archive
                                    FROM history
                                    WHERE session_id=$($_.id);"

                $PlanHistory = Invoke-SqliteQuery -Query $QueryHistory -DataSource $DatabaseFilePath | select id,
                                    destination_id,
                                    plan_id,
                                    local_path,
                                    operation,
                                    duration,
                                    @{Name = 'date_finished_utc'; Expression = {[datetime]::ParseExact(($_.date_finished_utc).ToString(), "yyyyMMddHHmmss", $null)}},
                                    @{Name = 'date_modified_utc'; Expression = {[datetime]::ParseExact(($_.date_modified_utc).ToString(), "yyyyMMddHHmmss", $null)}},
                                    size,
                                    message,
                                    session_id,
                                    attempts,
                                    @{Name = 'result'; Expression = {$ItemStatus[$_.result]}}, 
                                    thumbnail_archive
                Add-Member -InputObject $_ -MemberType NoteProperty -Name "Items" -Value $PlanHistory
            }
        }

        return $PlanSessionHistory

    }

    end {
        
    }
}

# SIG # Begin signature block
