function Edit-MBSAPIUserBackupDestination {
    <#
    .SYNOPSIS
    Edit a backup destination of a user.
    
    .DESCRIPTION
    Calls the PUT api/Destinations API to edit a backup destination of a user.

    .PARAMETER UserID
    ID of the user whose backup destination will be edited. Use Get-MBSAPIUser to determine.
    
    .PARAMETER AccountID
    The ID of the storage account that is to be edited. Use Get-MBSAPIUserBackupDestination or Get-MBSAPIStorageAccount to determine.
    
    .PARAMETER ID
    ID of the destination to be edited. Use Get-MBSAPIUserBackupDestination to determine.

    .PARAMETER Destination
    Name of the destination
    
    .PARAMETER PackageID
    ID of the storage limit (package) that is to be applied.
    
    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    PS C:\> $MBSUser = Get-MBSAPIUser -profilename ao | Where-Object {$_.email -eq 'test@test.com'}
    PS C:\> $Destination1 = (Get-MBSAPIUserBackupDestination -profilename ao -useremail test@test.com)[0]
    PS C:\> $Destination2 = (Get-MBSAPIUserBackupDestination -profilename ao -useremail test@test.com)[1]
    PS C:\> $Destination2.PackageID = $destination1.PackageID
    PS C:\> $Destination2 | Edit-MBSAPIUserBackupDestination -profilename ao -userid $MBSUser.ID

    Change package of the attached backup destination.
    
    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/edit-mbsapiuserbackupdestination
    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="User for thie destination", ValueFromPipelineByPropertyName)]
        [string]$UserID,   
        [Parameter(Mandatory=$true, HelpMessage="Storage Account ID",ValueFromPipelineByPropertyName)]
        [string]$AccountID,   
        [Parameter(Mandatory=$true, HelpMessage="Destination ID",ValueFromPipelineByPropertyName)]
        [string]$ID,   
        [Parameter(Mandatory=$true, HelpMessage="Destination", ValueFromPipelineByPropertyName)]
        [string]$Destination,   
        [Parameter(Mandatory=$true, HelpMessage="Storage Limit Package ID", ValueFromPipelineByPropertyName)]
        [string]$PackageID,   
        [Parameter(Mandatory=$false, HelpMessage="The profile name")]
        [string]$ProfileName
    )
    begin {
        
    }
    process {
        $StorageDestinationPut = @{
            UserID=$UserID
            AccountID=$AccountID
            Destination=$Destination
            PackageID=$PackageID
            ID=$ID
        }
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + (Get-MBSApiUrl).Destinations)
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): PUT Request: " + ($StorageDestinationPut|ConvertTo-Json))
        $StorageDestinationID = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Destinations) -Method Put -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) -Body ($StorageDestinationPut | ConvertTo-Json) -ContentType 'application/json'
        return $StorageDestinationID
    }    
}

# SIG # Begin signature block
