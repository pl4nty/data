if($PSEdition -ne 'Desktop')
{
    Import-Module $('{0}\netcoreapp3.1\Microsoft.Teams.PowerShell.TeamsCmdlets.dll' -f $PSScriptRoot)
}
else
{
    Import-Module $('{0}\net472\Microsoft.Teams.PowerShell.TeamsCmdlets.dll' -f $PSScriptRoot)
}
# SIG # Begin signature block
