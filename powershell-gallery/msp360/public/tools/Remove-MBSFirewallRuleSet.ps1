function Remove-MBSFirewallRuleSet {
    <#
    .SYNOPSIS
        Removes Firewall rules in Windows for the backup agent
    .DESCRIPTION
        Removes previously created (by script or manually) Firewall rules for backup agent executables.
    .EXAMPLE
        Remove-MBSFirewallRuleSet

        Removes inbound and outbound rules in Firewall that point to MBS backup agent executables.
    .INPUTS
        None.
    .OUTPUTS
        None.
    .NOTES
        None.
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/tools/remove-mbsfirewallruleset
    #>
    
[CmdletBinding()]
param (

)
    $RulesRemovedResult = ProcessMBSFirewallRuleSet -Action "Remove"
    If ($RulesRemovedResult[0]) {
        $RulesDeletedSuccessfully = $RulesRemovedResult[1]
        Write-Host $(If ($RulesDeletedSuccessfully -ne 0) {"Firewall rules removed successfully - $RulesDeletedSuccessfully"} Else {"No rules to delete."})
    }
    Else {
        Write-Error $RulesRemovedResult[1]
        return
    }
}

Set-Alias rmfrs Remove-MBSFirewallRuleSet

# SIG # Begin signature block
