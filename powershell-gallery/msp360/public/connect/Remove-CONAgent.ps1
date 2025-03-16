function Remove-CONAgent {
    <#
    .SYNOPSIS
        Removes Connect agent from a local machine.

    .DESCRIPTION
        Cmdlet silently removes Connect agent on a local machine.

    .EXAMPLE
        PS C:\> Remove-CONAgent

        Show a confirmation prompt and uninstall the Connect agent.

    .EXAMPLE
        PS C:\> Remove-CONAgent -Force          

        Uninstall the Connect agent without corfirmation.

    .INPUTS
        None

    .OUTPUTS
        None

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/connect-agent/remove-conagent
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false, HelpMessage="Force to uninstall Connect agent. Confirmation message will be skipped.")]
        [switch]$Force 
    )
    
    begin {
        
    }
    
    process {
        if ($CONN = Get-CONAgent -ErrorAction SilentlyContinue)
        {   
            $Arguments = "/S"
            if ($Force){
                (Start-MBSProcess -CMDPath $CONN.UninstallString -CMDArguments $Arguments).stdout
                return "The Connect agent has been uninstalled."            
            }else{
                if (Confirm-MBSAction -Operation "Remove-CONAgent" -Target "Connect agent"){
                    (Start-MBSProcess -CMDPath $CONN.UninstallString -CMDArguments $Arguments).stdout
                    return "The Connect agent has been uninstalled."
                }
            }
        }else{
            return "Cannot find the Connect agent."
        }
    }
    
    end {
        
    }
}

Set-Alias Uninstall-CONAgent Remove-CONAgent
# SIG # Begin signature block
