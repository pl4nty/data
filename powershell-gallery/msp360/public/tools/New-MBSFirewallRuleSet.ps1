function New-MBSFirewallRuleSet {
    <#
    .SYNOPSIS
        Create Firewall rules in Windows for the backup agent
    .DESCRIPTION
        Checks and creates Firewall rules for backup agent executables to allow inbound and outbound internet connection to storages, MBS portal, etc.
    .EXAMPLE
        New-MBSFirewallRuleSet

        Creates 5 inbound and 5 outbound rules for MBS backup agent executables in Firewall with name prefix "Online Backup".
    .INPUTS
        None.
    .OUTPUTS
        None.
    .NOTES
        None.
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/tools/new-mbsfirewallruleset
    #>
    
[CmdletBinding()]
param (

)
    $RulesAddedResult = ProcessMBSFirewallRuleSet -Action "Add"
    If ($RulesAddedResult[0]) {
        $RulesPresent = $RulesAddedResult[2]
        $RulesAddedSuccessfully = $RulesAddedResult[1]
        If ($RulesPresent -ne 0) {
            Write-Host "Firewall rules present - $RulesPresent"
        }
        Write-Host $(If ($RulesAddedSuccessfully -ne 0) {"Firewall rules added successfully - $RulesAddedSuccessfully"} Else {"No new rules created."})
    }
    Else {
        Write-Error $RulesAddedResult[1]
        return
    }
}

Set-Alias nmfrs New-MBSFirewallRuleSet
# SIG # Begin signature block
