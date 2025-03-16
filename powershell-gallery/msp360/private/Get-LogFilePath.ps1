function Get-LogFilePath {
    <#
    .SYNOPSIS
    Get full path to log file
    
    .DESCRIPTION
    Returns full path to log file for specified plan name or ID
    
    .PARAMETER PlanName
    Backup or restore plan name

    .PARAMETER PlanID
    Backup or restore plan ID
    
    .PARAMETER IncludeDeletedPlans
    If the plan doesn't exist in backup agent, returns the path to the log of the deleted plan, if it exists.
    Can be used only with PlanID parameter.

    .EXAMPLE
    Get-LogFilePath -PlanName "Backup Image Based"
    
    .EXAMPLE
    Get-LogFilePath -PlanID "15c470e4-e841-439a-b253-d23efbfdb2a4" -IncludeDeletedPlans

    .INPUTS
    None

    .OUTPUTS
    System.String

    .NOTES
    Author: MSP360 Onboarding Team
    
    .LINK

    #>

    [cmdletbinding()]
    param(
        [parameter(Mandatory=$false, ParameterSetName='ByPlanName')]
        [string]
        $PlanName,
        #
        [parameter(Mandatory=$false, ParameterSetName='ByPlanID')]
        [string]
        $PlanID,
        #
        [parameter(Mandatory=$false, ParameterSetName='ByPlanID')]
        [switch]
        $IncludeDeletedPlans
    )

    begin {
        if ((-Not $PlanName) -And (-Not $PlanID)) {
            Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): PlanName or PlanID not specified"
            Break
        }
    }

    process {
        if ($PlanID) {
            Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): PlanID specified. Ignoring PlanName parameter"
            $CheckIfExist = $(Get-MBSBackupPlan | Where-Object {$_.ID -eq "$PlanID"})
            if ($CheckIfExist) {
                $LogFileID = $PlanID
            } else {
                Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Specified Plan ID does not exist"
            }
        } else {
            $LogFileIDObject = $(Get-MBSBackupPlan | Where-Object {$_.Name -eq "$PlanName"} | Select-Object ID)
            if ($LogFileIDObject) {
                if ($LogFileIDObject.ID.Count -gt 1) {
                    $LogFileID = $LogFileIDObject.ID[0]
                } else {
                    $LogFIleID = $LogFileIDObject.ID
                }
            } else {
                Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Specified Plan Name does not exist"
            }
            
        }
        
        $PathToLogs = $(Get-MBSAgentSetting).LogFolder
        if ($LogFileID) {
            $FullPathToLog = $PathToLogs + "\" + $LogFileID + ".log"
        } elseif (($IncludeDeletedPlans) -And ($PlanID)) {
            $FullPathToLog = $PathToLogs + "\" + $PlanID + ".log"
        } else {
            $FullPathToLog = ""
        }

        if ($FullPathToLog) {
            if (Test-Path -Path $FullPathToLog -PathType Leaf) {
                Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Full path to log: $FullPathToLog"
            } else {
                Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Log file was not found"
                $FullPathToLog = ""
            }
        }
    }

    end {
        return $FullPathToLog
    }
}
# SIG # Begin signature block
