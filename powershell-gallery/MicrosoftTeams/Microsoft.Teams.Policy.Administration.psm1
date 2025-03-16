# Define which modules to load based on the environment
# These environment variables are set in TPM

if ($env:MSTeamsContextInternal -eq "IsOCEModule") {
    $mpaModule = 'Microsoft.Teams.Policy.Administration.Cmdlets.Core.oce.psd1'
}
elseif ($env:MSTeamsReleaseEnvironment -eq 'TeamsPreview') {
    $mpaModule = 'Microsoft.Teams.Policy.Administration.Cmdlets.Core.preview.psd1'
}
else {
    $mpaModule = 'Microsoft.Teams.Policy.Administration.Cmdlets.Core.psd1'
}

$path = (Join-Path $PSScriptRoot $mpaModule)

if (test-path $path)
{
    $null = Import-Module -Name $path
}
else
{
    if ($PSEdition -ne 'Desktop')
    {
        $null = Import-Module -Name (Join-Path $PSScriptRoot "netcoreapp3.1\$mpaModule")
    }
    else
    {
        $null = Import-Module -Name (Join-Path $PSScriptRoot "net472\$mpaModule")
    }
}
# SIG # Begin signature block
