function Set-MSP360ModuleSettings {
    <#
    .SYNOPSIS
        Set global settings for MSP360 PS module custom parameters.

    .DESCRIPTION
        Saves provided settings to a global object of type MBS.PSModule.Settings for use in the MSP360 PS module to alter different options.

    .PARAMETER CBBPath
        Path to the Online Backup application folder. Used by Get-MBSAgent cmdlet to skip registry checks. Takes effect only if CBBProgramData is also specified.

    .PARAMETER CBBProgramData
        Path to Online Backup's configuration folder. Used by Get-MBSAgent cmdlet to skip registry checks. Takes effect only if CBBPath is also specified.

    .PARAMETER SkipEngineSettingsListCheck
        Skip check for "enginesettings.list" file and set the program data folder path with the default value or specified in the CBBProgramData parameter

    .PARAMETER SkipCompression
        Ignore compression option in New-MBSBackupPlan, Edit-MBSBackupPlan, New-MBSNBFFileBackupPlan, New-MBSNBFIBBBackupPlan cmdlets

    .PARAMETER SkipEncryption
        Ignore encryption options in New-MBSBackupPlan, Edit-MBSBackupPlan, New-MBSNBFFileBackupPlan, New-MBSNBFIBBBackupPlan cmdlets

    .PARAMETER SkipStorageClass
        Ignore storage class option in New-MBSBackupPlan, Edit-MBSBackupPlan, New-MBSNBFFileBackupPlan, New-MBSNBFIBBBackupPlan cmdlets. Relevant for storage accounts with several storage tiers (e.g. AWS S3, Azure)

    .PARAMETER SkipSSE
        Ignore SSE option in New-MBSBackupPlan, Edit-MBSBackupPlan, New-MBSNBFFileBackupPlan, New-MBSNBFIBBBackupPlan cmdlets. Relevant for AWS S3 storage only

    .PARAMETER SkipVSS
        Ignore VSS options in New-MBSBackupPlan, Edit-MBSBackupPlan, New-MBSNBFFileBackupPlan, New-MBSNBFIBBBackupPlan cmdlets

    .EXAMPLE
        PS C:\> Set-MSP360ModuleSettings -CBBPath "C:\Program Files\MSP360\Online Backup" -CBBProgramData "C:\ProgramData\Online Backup" -SkipSSE $true

    .INPUTS
        None

    .OUTPUTS
        None

    .NOTES
        Author: MSP360 Onboarding Team
    
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/tools/set-msp360modulesettings

    #>

    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$false, HelpMessage="Path to the Online Backup application folder")]
        [string]
        $CBBPath,
        #
        [Parameter(Mandatory=$false, HelpMessage="Path to Online Backup's configuration folder")]
        [string]
	    $CBBProgramData,
        #
        [Parameter(Mandatory=$false, HelpMessage="Skip check for ""enginesettings.list"" file and set the program data folder path with the default value or specified in the CBBProgramData parameter")]
        [boolean]
        $SkipEngineSettingsListCheck=$false,
        #
        [Parameter(Mandatory=$false, HelpMessage="Ignore compression option in New-MBSBackupPlan, Edit-MBSBackupPlan, New-MBSNBFFileBackupPlan, New-MBSNBFIBBBackupPlan cmdlets")]
        [boolean]
        $SkipCompression=$false,
        #
        [Parameter(Mandatory=$false, HelpMessage="Ignore encryption options in New-MBSBackupPlan, Edit-MBSBackupPlan, New-MBSNBFFileBackupPlan, New-MBSNBFIBBBackupPlan cmdlets")]
        [boolean]
        $SkipEncryption=$false,
        #
        [Parameter(Mandatory=$false, HelpMessage="Ignore storage class option in New-MBSBackupPlan, Edit-MBSBackupPlan, New-MBSNBFFileBackupPlan, New-MBSNBFIBBBackupPlan cmdlets")]
        [boolean]
        $SkipStorageClass=$false,
        #
        [Parameter(Mandatory=$false, HelpMessage="Ignore SSE option in New-MBSBackupPlan, Edit-MBSBackupPlan, New-MBSNBFFileBackupPlan, New-MBSNBFIBBBackupPlan cmdlets")]
        [boolean]
        $SkipSSE=$false,
        #
        [Parameter(Mandatory=$false, HelpMessage="Ignore VSS options in New-MBSBackupPlan, Edit-MBSBackupPlan, New-MBSNBFFileBackupPlan, New-MBSNBFIBBBackupPlan cmdlets")]
        [boolean]
        $SkipVSS=$false
    )
    
    begin {

    }
    
    process {
        $Global:MSP360ModuleSettings = New-Object -Typename MBS.PSModule.Settings
        $Global:MSP360ModuleSettings.CBBPath = $CBBPath
        $Global:MSP360ModuleSettings.CBBProgramData = $CBBProgramData
        $Global:MSP360ModuleSettings.SkipEngineSettingsListCheck = $SkipEngineSettingsListCheck
        $Global:MSP360ModuleSettings.SkipCompression = $SkipCompression
        $Global:MSP360ModuleSettings.SkipEncryption = $SkipEncryption
        $Global:MSP360ModuleSettings.SkipStorageClass = $SkipStorageClass
        $Global:MSP360ModuleSettings.SkipSSE = $SkipSSE
        $Global:MSP360ModuleSettings.SkipVSS = $SkipVSS
    }
    
    end {

    }
}
# SIG # Begin signature block
