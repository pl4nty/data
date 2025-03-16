function New-MBSRecoveryDisk {
    <#
    .SYNOPSIS
    Create recovery USB or iso image
    
    .DESCRIPTION
    Create recovery USB drive ot ISO image for bare-metal image-based restore. 
    
    .PARAMETER DestinationUSBDrive
    Specify destination USB drive
    
    .PARAMETER DestinationISOPath
    Specify destination iso-image path
    
    .PARAMETER Password
    Settings password. Use -Password (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .PARAMETER AddSystemDrivers
    Add drivers installed in system
    
    .PARAMETER AdditionalDriversPath
    Add drivers from specified folder
    
    .PARAMETER ScratchSpace
    Sets the available scratch space, in megabytes
    
    .PARAMETER RADirectory
    Remote access installation directory
    
    .PARAMETER NoPrompt
    Skip 'press any key to boot from cd/dvd' at startup
    
    .PARAMETER MasterPassword
    Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .EXAMPLE
    New-MBSRecoveryDisk -DestinationISOPath D:\iso\MSP360Restore.iso

    Create recovery ISO file with default settings.

    .EXAMPLE
    New-MBSRecoveryDisk -DestinationUSBDrive D

    Create recovery USB drive with default settings.

    .EXAMPLE
    New-MBSRecoveryDisk -DestinationUSBDrive D -Password (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force) -AddSystemDrivers -AdditionalDriversPath "c:\drivers" -NoPrompt

    Create recovery USB drive with password, system and additional drivers.
    
    .INPUTS
        None.
    .OUTPUTS
        None.
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/new-mbsrecoverydisk
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="Specify destination USB drive", ParameterSetName='USB')]
        [ValidatePattern("[A-Z]")]
        [String]
        $DestinationUSBDrive,
        [Parameter(Mandatory=$true, HelpMessage="Specify destination iso-image path", ParameterSetName='ISO')]
        [String]
        $DestinationISOPath,
        [Parameter(Mandatory=$false, HelpMessage="Settings password. Use -Password (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        [SecureString]
        $Password,
        [Parameter(Mandatory=$false, HelpMessage="Add drivers installed in system")]
        [Switch]
        $AddSystemDrivers,
        [Parameter(Mandatory=$false, HelpMessage="Add drivers from specified folder")]
        [String]
        $AdditionalDriversPath,
        [Parameter(Mandatory=$false, HelpMessage="Sets the available scratch space, in megabytes")]
        [ValidateSet("0", "256", "512")]
        [String]
        $ScratchSpace,
        [Parameter(Mandatory=$false, HelpMessage="Remote access installation directory")]
        [String]
        $RADirectory,
        [Parameter(Mandatory=$false, HelpMessage="Skip 'press any key to boot from cd/dvd' at startup")]
        [Switch]
        $NoPrompt,
        [Parameter(Mandatory=$false, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
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
            if ($DestinationUSBDrive){$Argument += " -d $DestinationUSBDrive"+":\"}
            if ($DestinationISOPath){$Argument += " -d ""$DestinationISOPath"" -iso"}
            if ($Password){$Argument += " -p """+([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password)))+""""}
            if ($AddSystemDrivers){$Argument += " -id"}
            if ($AdditionalDriversPath){$Argument += " -iad ""$AdditionalDriversPath"""}
            if ($ScratchSpace){$Argument += " -ss $ScratchSpace"}
            if ($RADirectory){$Argument += " -d ""$RADirectory"""}
            if ($NoPrompt){$Argument += " -no-prompt"}
                
            return $Argument
        }

        $Arguments = 'createrecovery'
        $Arguments += Set-Argument

        Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): $($PSCmdlet.ParameterSetName)"
        (Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output short -MasterPassword $MasterPassword).result
    }
    
    end {
        
    }
}
# SIG # Begin signature block
