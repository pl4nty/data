<#
.SYNOPSIS
Enable or disable logging for the System Update Addin for Commercial Vantage

.DESCRIPTION
This cmdlet sets the appropriate registry key to cause the System Update Add-in
to perfrom logging during update sessions. 

.PARAMETER Enable
Enables logging

.PARAMETER Disable
Disables logging

.EXAMPLE
Add-LnvSULogging -Enable

.NOTES
If logging is enabled, log path is located at %ProgramData%\Lenovo\Vantage\Logs\LenovoSystemUpdateAddin

#>


function Add-LnvSULogging
{
    [CmdletBinding(DefaultParameterSetName = 'Enable')]
    param (
        [parameter(ParameterSetName = 'Enable')]
        [switch]$Enable,
        [parameter(ParameterSetName = 'Disable')]
        [switch]$Disable
    )

    # Check if Commercial Vantage is installed
    try {
        $cv = Get-AppxPackage -Name E046963F.LenovoSettingsforEnterprise -AllUsers
    }
    catch [UnauthorizedAccessException] {
        Write-Output "Access Denied. Please attempt again as an administrator"
        return
    }

    if ($null -eq $cv)
    {
        Write-Output "Commercial Vantage is not installed."
        return
    }

    # Define reg key variables
    $Path = "HKLM:\SOFTWARE\WOW6432Node\Lenovo\VantageService\FileLogger"
    $Name1 = "LenovoVantageShell"
    $Name2 = "AllLogs"

    $PathExists = Test-Path -Path $Path

    # Create the key if it doesn't exist
    if ($PathExists -eq $false)
    {
        try {
            New-Item -Path $Path -Force
        }
        catch {
            Write-Output "Unable to create the registry path: $Path"
            return
        }
    }

    if ($Disable.IsPresent)
    {
        try {
            Set-ItemProperty $Path $Name1 -Value $false -ErrorAction Stop
            Set-ItemProperty $Path $Name2 -Value $false -ErrorAction Stop
            Write-Output -InputObject "System Update logging disabled."
        }
        catch {
            Write-Output -InputObject "Unable to update $Name1 and/or $Name2 to false."
            return
        }    }
    elseif ($Enable.IsPresent)
    {
         try {
            Set-ItemProperty $Path $Name1 -Value "Trace" -ErrorAction Stop
            Set-ItemProperty $Path $Name2 -Value "Trace" -ErrorAction Stop
            Write-Output -InputObject "System Update logging enabled."
        }
        catch {
            Write-Output -InputObject "Unable to update $Name1 or $Name2 to Trace."
            return
        }
    }
}
# SIG # Begin signature block
