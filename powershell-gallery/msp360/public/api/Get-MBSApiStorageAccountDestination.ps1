function Get-MBSAPIStorageAccountDestination {
    <#
    .SYNOPSIS
    Gets available destinations for a specified storage account
    
    .DESCRIPTION
    Calls the GET api/Accounts/{id} API to get a list of destinations in a specified storage account
    
    .PARAMETER AccountID
    The ID of the storage account in question. Use Get-MBSAPIStorageAccount to find this ID.    
    
    .PARAMETER ProfileName
    Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)n
    
    .EXAMPLE
    Get-MBSApiStorageAccountDestination -ProfileName ao -AccountID 27bb3fcb-dc04-4a29-ac57-4d679809a2ba

    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
        Author: MSP360 Onboarding Team
    
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/get-mbsapistorageaccountdestination
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="Storage Account ID", ValueFromPipelineByPropertyName)]
        [string]$AccountID,
        [Parameter(Mandatory=$false, HelpMessage="The profile name")]
        [string]$ProfileName
    )
    begin {

    }   
    process {
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Accounts + '/' + $AccountID))
        Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): GET Request"
        [MBS.API.StorageAccountDestination[]]$Destinations = (Invoke-RestMethod -uri ((Get-MBSApiUrl).Accounts + '/' + $AccountID) -headers (Get-MBSAPIHeader -ProfileName $ProfileName) -method Get).Destinations  | Convert-PSObjectToHash
        return $Destinations
    }   
    end{

    }  
}

# SIG # Begin signature block
