function Add-MBSAPIUserBackupDestination {
    <#
    .SYNOPSIS
    Add a backup destination to a user
    
    .DESCRIPTION
    Calls the POST api/Destinations API to add a backup destination to a user
    
    .PARAMETER UserID
    ID of the user to which a backup destination is being added. Use Get-MBSAPIUser to determine
    
    .PARAMETER AccountID
    The ID of the storage account  that is to be added. Use Get-MBSAPIStorageAccount to determine.
    
    .PARAMETER Destination
    ID of the destination to be added. Use Get-MBSAPIStorageAccountDestination to determine.
    
    .PARAMETER PackageID
    ID of the storage limit (package) that is to be applied.
    
    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Add-MBSAPIUserBackupDestination -ProfileName ao -accountid 27bb3fcb-dc04-4a29-ac57-4d679809a2ba -Destination 'test-mbsapi' -UserID  e472840f-e01f-40e0-95fc-b28882a28cfe -PackageID 64028
    
    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
        Author: MSP360 Onboarding Team
    
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/add-mbsapiuserbackupdestination
    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="User for thie destination", ValueFromPipelineByPropertyName)]
        [string]$UserID,   
        [Parameter(Mandatory=$true, HelpMessage="Storage Account ID", ValueFromPipelineByPropertyName)]
        [string]$AccountID,   
        [Parameter(Mandatory=$true, HelpMessage="Destination ID", ValueFromPipelineByPropertyName)]
        [string]$Destination,   
        [Parameter(Mandatory=$true, HelpMessage="Storage Limit Package ID", ValueFromPipelineByPropertyName)]
        [string]$PackageID,   
        [Parameter(Mandatory=$false, HelpMessage="The profile name")]
        [string]$ProfileName
    )
    begin {
        
    }
    process {
        $StorageDestinationPost = [ordered]@{
            UserID=$UserID
            AccountID=$AccountID
            Destination=$Destination
            PackageID=$PackageID
        }

        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Destinations))
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): PUT Request: " + ($StorageDestinationPost|ConvertTo-Json))
        
        $StorageDestinationID = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Destinations) -Method Post -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) -Body ($StorageDestinationPost | ConvertTo-Json) -ContentType 'application/json'
        return $StorageDestinationID
    }
}

# SIG # Begin signature block
