<#
Copyright 2024 Lenovo Ltd.
All Rights Reserved.

DISCLAIMER:
These sample scripts are not supported under any Lenovo standard support
program or service. The sample scripts are provided AS IS without warranty
of any kind. Lenovo further disclaims all implied warranties including,
without limitation, any implied warranties of merchantability or of fitness for
a particular purpose. The entire risk arising out of the use or performance of
the sample scripts and documentation remains with you. In no event shall
Lenovo, its authors, or anyone else involved in the creation, production, or
delivery of the scripts be liable for any damages whatsoever (including,
without limitation, damages for loss of business profits, business interruption,
loss of business information, or other pecuniary loss) arising out of the use
of or inability to use the sample scripts or documentation, even if Lenovo
has been advised of the possibility of such damages.

#>
<#
.SYNOPSIS
    Lenovo Client Scripting Module

.NOTES
    Author:      Lenovo Commercial Deployment Readiness Team
    Contact:     @joe_lenovo
    Website:     https://docs.lenovocdrt.com
    Blog:        https://blog.lenovocdrt.com
#>
[CmdletBinding()]
Param()
Process {
    # Locate all the public and private function specific files
    $PublicFunctions = Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath "Public") -Filter "*.ps1" -ErrorAction SilentlyContinue
    $PrivateFunctions = Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath "Private") -Filter "*.ps1" -ErrorAction SilentlyContinue

    # Dot source the function files
    foreach ($FunctionFile in @($PublicFunctions + $PrivateFunctions)) {
        try {
            . $FunctionFile.FullName -ErrorAction Stop
        }
        catch [System.Exception] {
            Write-Error -Message "Failed to import function '$($FunctionFile.FullName)' with error: $($_.Exception.Message)"
        }
    }

    Export-ModuleMember -Function $PublicFunctions.BaseName -Alias *
}

# SIG # Begin signature block
