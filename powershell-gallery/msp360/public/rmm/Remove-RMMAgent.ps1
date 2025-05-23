function Remove-RMMAgent {
    <#
    .SYNOPSIS
        Removes RMM agent from a local machine.

    .DESCRIPTION
        Cmdlet silently removes RMM agent on a local machine.

    .EXAMPLE
        PS C:\> Remove-RMMAgent

        Show a confirmation prompt and uninstall the RMM agent.

    .EXAMPLE
        PS C:\> Remove-RMMAgent -Force          

        Uninstall the RMM agent without corfirmation.

    .INPUTS
        None

    .OUTPUTS
        None

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/rmm-agent/remove-rmmagent
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false, HelpMessage="Force to uninstall RMM agent. Confirmation message will be skipped.")]
        [switch]$Force 
    )
    
    begin {
        
    }
    
    process {
        if ($RMM = Get-RMMAgent -ErrorAction SilentlyContinue)
        {   
            $Arguments = "/S"
            if ($Force){
                (Start-MBSProcess -CMDPath $RMM.UninstallString -CMDArguments $Arguments).stdout
                return "The RMM agent has been uninstalled."            
            }else{
                if (Confirm-MBSAction -Operation "Remove-RMMAgent" -Target "RMM agent"){
                    (Start-MBSProcess -CMDPath $RMM.UninstallString -CMDArguments $Arguments).stdout
                    return "The RMM agent has been uninstalled."
                }
            }
        }else{
            return "Cannot find the RMM agent."
        }
    }
    
    end {
        
    }
}

Set-Alias Uninstall-RMMAgent Remove-RMMAgent
# SIG # Begin signature block
