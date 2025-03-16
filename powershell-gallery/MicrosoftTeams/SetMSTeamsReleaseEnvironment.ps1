#This file is setting HostingEnvironment environment variable using which we can decide in nested modules, that which cmdlets it has to export.

# We don't have access to the module at load time, since loading occurs last
# Instead we set up a one-time event to set the OnRemove scriptblock once the module has been loaded
$null = Register-EngineEvent -SourceIdentifier PowerShell.OnIdle -MaxTriggerCount 1 -Action {
    $m = Get-Module MicrosoftTeams
    $m.OnRemove = {
        Write-Verbose "Removing MSTeamsReleaseEnvironment"
        $env:MSTeamsReleaseEnvironment = $null
        Disconnect-MicrosoftTeams
    }
}

$env:MSTeamsReleaseEnvironment = 'TeamsGA'

#The below line will be uncommented by build process if its preview module

#preview $env:MSTeamsReleaseEnvironment = 'TeamsPreview'

# SIG # Begin signature block
