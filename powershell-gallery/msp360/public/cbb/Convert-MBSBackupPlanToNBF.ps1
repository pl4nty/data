function Convert-MBSBackupPlanToNBF {
    <#
    .SYNOPSIS
    Converts the Legacy plan to the New Backup Format (NBF).
    
    .DESCRIPTION
    Converts the Legacy backup format plan to the New Backup Format (NBF). The minimum supported version of the MBS backup agent is 7.8.3.

    .PARAMETER Name
    Specify Plan Name. 

    .PARAMETER ID
    Specify Plan ID.

    .PARAMETER Force
    Convert forcefully, ignoring warnings.
    
    .PARAMETER MasterPassword
    Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .PARAMETER PurgeLegacy
    Allows to enable/disable purging of legacy data for converted plan. Possible values: $true/$false

    .EXAMPLE
    Get-MBSBackupPlan -StorageType All -PlanFormat CBF -PlanType File-Level | Convert-MBSBackupPlanToNBF -PurgeLegacy
    
    Convert all Legacy file backup plans to New Backup Format.

    .EXAMPLE
    Convert-MBSBackupPlanToNBF -Name test -Whatif

    Test conversion to New Backup Format of a backup plan named "test". If the command outputs warnings, the convertion should be performed with the -Force switch to ignore them.
 
    .NOTES
    Author: MSP360 Onboarding Team

    .LINK
    https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/convert-mbsbackupplantonbf

  #>

    [CmdletBinding()]
    param (
        #
        [Parameter(ValueFromPipelineByPropertyName, HelpMessage='Plan ID')]
        [string]
        $ID,
        #
        [Parameter(ValueFromPipelineByPropertyName, HelpMessage='Plan name')]
        [string]
        $Name,
        #
        [Parameter(Mandatory=$False, HelpMessage='Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)')]
        [SecureString]
        $MasterPassword,
        #
        [Parameter(Mandatory=$False, HelpMessage='Allows to enable/disable purging of legacy data for converted plan. Possible values: $true/$false')]
        [boolean]
        $PurgeLegacy=$true,
        #
        [Parameter(Mandatory=$False, HelpMessage='Test conversion, no changes will be made')]
        [switch]
        $Whatif,
        #
        [Parameter(Mandatory=$False, HelpMessage='Perform conversion forcibly, ignore any warnings')]
        [switch]
        $Force,
        #
        [Parameter(Mandatory=$False, HelpMessage='Returns an object representing the resulting plan object. By default, this cmdlet does not generate any output.')]
        [switch]
        $PassThru
    )

    begin {
        if (-not($CBB = Get-MBSAgent)) {
            Break
        }
        if ([System.version](Get-MBSAgent).version -lt [System.version]"7.8.3.0") {
            Write-Error "Version $($CBB.version) is not supported. Please upgrade to the minimum supported version 7.8.3"
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
    
        function Set-Argument{
            if ($ID){
                $Argument += " -id $ID"
            }else{
                $Argument += " -n ""$Name"""
            }
            if ($Whatif){
                Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): -WhatIf parameter specified. Plan will not be converted"
                $Argument += " -whatif"
            }else{
                if ($PurgeLegacy){
                    $Argument += " -purgelegacy yes"
                }else{
                    $Argument += " -purgelegacy no"
                }
            }
            if($Force){
                $Argument += " -force"
            }
            Return $Argument
        }
        
        $Arguments = " convertToNBF"
        $Arguments += Set-Argument
     
        $result = Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output json -MasterPassword $MasterPassword

        if (($PassThru) -And (-Not ($Whatif))) {
            $PlanResult = (Get-MBSBackupPlan -PlanFormat NBF | Where-Object {$_.ID -eq $ID})
            return $PlanResult
        }
    }
    
    end {
        
    }
}
# SIG # Begin signature block
