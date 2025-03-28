<#
.SYNOPSIS
Enable or disable logging for the System Update Addin for Commercial Vantage

.DESCRIPTION
This cmdlet sets the appropriate registry key to cause the System Update Add-in
to perfrom logging during update sessions. If neither the -Enable or -Disable
switches are specified, then logging will be ENABLED.

.PARAMETER Enable
Enables logging

.PARAMETER Disable
Disables logging

.EXAMPLE
Add-LnvSULogging -Enable

.NOTES
If logging is enabled, log path is located at %ProgramData%\Lenovo\Vantage\AddinData\LenovoSystemUpdateAddin\logs

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
    $Path = "HKLM:\SOFTWARE\WOW6432Node\Lenovo\SystemUpdateAddin\Logs"
    $Name = "EnableLogs"
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
            Set-ItemProperty $Path $Name -Value $false -ErrorAction Stop
            Write-Output -InputObject "System Update logging disabled."
        }
        catch {
            Write-Output -InputObject "Unable to update $Name to false."
            return
        }    }
    elseif ($Enable.IsPresent)
    {
         try {
            Set-ItemProperty $Path $Name -Value $true -ErrorAction Stop
            Write-Output -InputObject "System Update logging enabled."
        }
        catch {
            Write-Output -InputObject "Unable to update $Name to true."
            return
        }
    }
}


# SIG # Begin signature block
