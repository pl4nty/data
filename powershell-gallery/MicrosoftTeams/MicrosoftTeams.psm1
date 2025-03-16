#Check for the source module - Common Denominator
$moduleInfo = Get-Module -name "CommonDenominator"
#Check for the cmdlet
if($moduleInfo -ne $null) {
$dmsIdentifier = Get-command "Get-ClientType" -module "CommonDenominator" -ErrorAction SilentlyContinue
}
if($dmsIdentifier -ne $null) {
$isDms = & Get-ClientType

if($isDms -eq "DMS") {
  $env:MSTeamsContextInternal = "IsOCEModule"
}

}
if($PSEdition -ne 'Desktop')
{
    Import-Module $('{0}\netcoreapp3.1\Microsoft.TeamsCmdlets.PowerShell.Connect.dll' -f $PSScriptRoot)
    if ($env:MSTeamsContextInternal -ne "IsOCEModule") {
        Import-Module $('{0}\Microsoft.Teams.PowerShell.TeamsCmdlets.psd1' -f $PSScriptRoot)
    }
    else
    {
        Import-Module $('{0}\net472\Microsoft.Teams.Policy.Administration.Cmdlets.OCE.dll' -f $PSScriptRoot)
    }
    Import-Module $('{0}\netcoreapp3.1\Microsoft.Teams.PowerShell.Module.dll' -f $PSScriptRoot)

}
else
{
    Import-Module $('{0}\net472\Microsoft.TeamsCmdlets.PowerShell.Connect.dll' -f $PSScriptRoot)
    [Reflection.Assembly]::Loadfrom($('{0}\net472\Newtonsoft.Json.dll' -f $PSScriptRoot))
    if ($env:MSTeamsContextInternal -ne "IsOCEModule") {
        Import-Module $('{0}\Microsoft.Teams.PowerShell.TeamsCmdlets.psd1' -f $PSScriptRoot)
    }
    else 
    {
        Import-Module $('{0}\net472\Microsoft.Teams.Policy.Administration.Cmdlets.OCE.dll' -f $PSScriptRoot)
    }
    Import-Module $('{0}\net472\Microsoft.Teams.PowerShell.Module.dll' -f $PSScriptRoot)
}
Import-Module $('{0}\Microsoft.Teams.Policy.Administration.psd1' -f $PSScriptRoot)
Import-Module $('{0}\Microsoft.Teams.ConfigAPI.Cmdlets.psd1' -f $PSScriptRoot)
# SIG # Begin signature block
