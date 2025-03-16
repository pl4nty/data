$path = Join-Path $PSScriptRoot 'Microsoft.Teams.Policy.Administration.Cmdlets.Core.dll'

if (test-path $path)
{
    $null = Import-Module -Name $path
}
else
{
    if ($PSEdition -ne 'Desktop')
    {
        $null = Import-Module -Name (Join-Path $PSScriptRoot 'netcoreapp3.1\Microsoft.Teams.Policy.Administration.Cmdlets.Core.dll')
    }
    else
    {
        $null = Import-Module -Name (Join-Path $PSScriptRoot 'net472\Microsoft.Teams.Policy.Administration.Cmdlets.Core.dll')
    }
}

gci (Join-Path $PSScriptRoot 'Microsoft.Teams.Policy.Administration.Cmdlets.Core.*.ps1xml') | % {Update-FormatData -PrependPath $_ }

# SIG # Begin signature block
