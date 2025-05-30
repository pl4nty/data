function Remove-MBSAgent {
    <#
    .SYNOPSIS
        Removes MBS backup agent from a local machine.

    .DESCRIPTION
        Cmdlet silently removes MBS backup agent on a local machine.

    .EXAMPLE
        PS C:\> Remove-MBSAgent

        Show a confirmation prompt and uninstall the backup agent.

    .EXAMPLE
        PS C:\> Remove-MBSAgent -Force          

        Uninstall the backup agent without corfirmation.

    .EXAMPLE
        PS C:\> Remove-MBSAgent -RemoveSettings -Force          

        Uninstall the backup agent and remove the settings.

    .INPUTS
        None

    .OUTPUTS
        None

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/remove-mbsagent
    #>

    [CmdletBinding()]
    param (
        #
       [Parameter(Mandatory=$false, HelpMessage="Removes backup agent settings.")]
       [switch]$RemoveSettings,
       #
       [Parameter(Mandatory=$false, HelpMessage="Force to uninstall MBS backup agent. Confirmation message will be skipped.")]
       [switch]$Force 
    )
    
    begin {
        
    }
    
    process {
        if ($CBB = Get-MBSAgent -ErrorAction SilentlyContinue)
        {   
            $Arguments = "/S"
            if ($RemoveSettings){
                $Arguments += " /removesettings"
            }
            if ($Force){
                (Start-MBSProcess -CMDPath $CBB.UninstallString -CMDArguments $Arguments).stdout
                return "The backup agent has been uninstalled."            
            }else{
                if (Confirm-MBSAction -Operation "Remove-MBSAgent" -Target "MBS backup agent"){
                    (Start-MBSProcess -CMDPath $CBB.UninstallString -CMDArguments $Arguments).stdout
                    return "The backup agent has been uninstalled."
                }
            }
        }else{
            return "Cannot find the backup agent."
        }
    }
    
    end {
        
    }
}

Set-Alias Uninstall-MBSAgent Remove-MBSAgent
# SIG # Begin signature block
