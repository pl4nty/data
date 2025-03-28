function Get-CONAgent {
    <#
    .SYNOPSIS
        Get Connect agent parameters
    .DESCRIPTION
        Gets the information about Connect agent settings, paths, etc. By default, the function pulls the registry values of the installed Connect agent and parses additional values.
        The properties from registry path UninstallKeyRD are fetched dynamically. If the software will add new keys, they can be listed by the function.
    .EXAMPLE
        Get-CONAgent

        Lists all of the parameters on the system into an object
    .INPUTS
        None.
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/connect-agent/get-conagent
    #>
    
    [CmdletBinding()]
    param (
    
    )

    if ($null -eq ((Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{07BCB989-197A-4E3D-852D-DE8363860401}" -Name "UninstallKeyRD" -ErrorAction SilentlyContinue).'UninstallKeyRD')) {
        Write-Error "ERROR: Connect agent is not installed on this machine."
        return $false
    }
    #$UninstallPathRD = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{07BCB989-197A-4E3D-852D-DE8363860401}"
    $UninstallKeyRD = (Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{07BCB989-197A-4E3D-852D-DE8363860401}" -Name "UninstallKeyRD")."UninstallKeyRD"
    $ProviderID = (Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{07BCB989-197A-4E3D-852D-DE8363860401}" -Name "ProviderID")."ProviderID"
    $FullPathRD = (Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\$UninstallKeyRD" -Name "(default)")."(default)"
    $RegistryEntriesRD = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\$UninstallKeyRD"
        
    $CONAgent = New-Object -TypeName psobject
    $CONAgent | Add-Member -MemberType NoteProperty -Name UninstallKeyRD -Value $UninstallKeyRD
    $CONAgent | Add-Member -MemberType NoteProperty -Name ProviderID -Value $ProviderID
    $CONAgent | Add-Member -MemberType NoteProperty -Name FullPathRD -Value $FullPathRD
    $RegistryEntriesRD | Get-Member -MemberType NoteProperty | ForEach-Object {
        if (($_.Name -ne "(default)") -And ($_.Name -ne "PSChildName") -And ($_.Name -ne "PSParentPath") -And ($_.Name -ne "PSPath") -And ($_.Name -ne "PSProvider")) {
            $PropertyName = $_.Name
            $CONAgent | Add-Member -MemberType NoteProperty -Name $PropertyName -Value $RegistryEntriesRD.$PropertyName
        }
    }
    
    return $CONAgent
}

Set-Alias gca Get-CONAgent
# SIG # Begin signature block
