function Get-RMMAgent {
    <#
    .SYNOPSIS
        Get RMM agent parameters
    .DESCRIPTION
        Gets the information about RMM agent settings, paths, etc. By default, the function pulls the registry values of the installed RMM agent and parses additional values.
        The properties from registry path UninstallKeyRMMAgent are fetched dynamically. If the software will add new keys, they can be listed by the function.
    .EXAMPLE
        Get-RMMAgent

        Lists all of the parameters on the system into an object
    .INPUTS
        None.
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/rmm-agent/get-rmmagent
    #>
    
    [CmdletBinding()]
    param (

    )

    if ($null -eq ((Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{07BCB989-197A-4E3D-852D-DE8363860401}" -Name "UninstallKeyRMMAgent" -ErrorAction SilentlyContinue).'UninstallKeyRMMAgent')) {
        Write-Error "ERROR: RMM agent is not installed on this machine."
        return $false
    }
    #$UninstallPathRMMAgent = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{07BCB989-197A-4E3D-852D-DE8363860401}" 
    $UninstallKeyRMMAgent = (Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{07BCB989-197A-4E3D-852D-DE8363860401}" -Name "UninstallKeyRMMAgent")."UninstallKeyRMMAgent"
    $ProviderID = (Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{07BCB989-197A-4E3D-852D-DE8363860401}" -Name "ProviderID")."ProviderID"
    $FullPathRMMAgent = (Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\$UninstallKeyRMMAgent" -Name "(default)")."(default)"
    $RegistryEntriesRMMAgent = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\$UninstallKeyRMMAgent"
     
    $RMMAgent = New-Object -TypeName psobject
    $RMMAgent | Add-Member -MemberType NoteProperty -Name UninstallKeyRMMAgent -Value $UninstallKeyRMMAgent
    $RMMAgent | Add-Member -MemberType NoteProperty -Name ProviderID -Value $ProviderID
    $RMMAgent | Add-Member -MemberType NoteProperty -Name FullPathRMMAgent -Value $FullPathRMMAgent
    $RegistryEntriesRMMAgent | Get-Member -MemberType NoteProperty | ForEach-Object {
        if (($_.Name -ne "(default)") -And ($_.Name -ne "PSChildName") -And ($_.Name -ne "PSParentPath") -And ($_.Name -ne "PSPath") -And ($_.Name -ne "PSProvider")) {
            $PropertyName = $_.Name
            $RMMAgent | Add-Member -MemberType NoteProperty -Name $PropertyName -Value $RegistryEntriesRMMAgent.$PropertyName
        }
    }

    return $RMMAgent
}

Set-Alias gra Get-RMMAgent
# SIG # Begin signature block
