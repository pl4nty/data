function Remove-MBSAPIUserBackupDestination {
    <#
    .SYNOPSIS
    Unassign a backup destination from a user.
    
    .DESCRIPTION
    Calls the api/Destinations/{id}?userId={userId} DELETE API to remove a backup user destination
    
    .PARAMETER UserID
    ID of the user whose backup destination will be deleted. Use Get-MBSAPIUser to determine
    
    .PARAMETER ID
    ID of the destination to be deleted. Use Get-MBSAPIStorageAccountDestination to determine.
    
    .PARAMETER Force
    Bypass confirmation prompt for removal operation

    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)

    .EXAMPLE
    PS C:\> Remove-MBSAPIUserBackupDestination -ProfileName ao -userID e472840f-e01f-40e0-95fc-b28882a28cfe -DestinationID 33a0dfd1-c072-4d92-8b89-f055d3e114c7
    
    Unassign a backup destination from a user.

    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    String

    .NOTES
    Author: MSP360 Onboarding Team

    .LINK
    https://mspbackups.com/AP/Help/powershell/cmdlets/api/remove-mbsapiuserbackupdestination
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="ID of the destination to delete")]
        [string]$DestinationID,
        [Parameter(Mandatory=$true, HelpMessage="ID of the user")]
        [string]$UserID,
        [Parameter(Mandatory=$false, HelpMessage="Force delete")]
        [switch]$Force,
        [Parameter(Mandatory=$false, HelpMessage="The profile name")]
        [string]$ProfileName
        
    )
    begin {

    }
    process {
        $DeleteAccountPost = @{
            id=$DestinationID
            userId=$userID
        }
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Destinations + "/" + $DestinationID + '?userId=' + $userID))
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): DELETE Request: " + ($DeleteAccountPost | ConvertTo-Json))
        if ($Force){
            Invoke-RestMethod -Uri ((Get-MBSApiUrl).Destinations + "/" + $DestinationID + '?userId=' + $userID) -Method Delete -Headers (Get-MBSAPIHeader -ProfileName $ProfileName)
        }else{
            if (Confirm-MBSAction -Operation "Remove-MBSAPIUserBackupDestination" -Target "Remove destination $DestinationID from user with ID $UserID"){
                Invoke-RestMethod -Uri ((Get-MBSApiUrl).Destinations + "/" + $DestinationID + '?userId=' + $userID) -Method Delete -Headers (Get-MBSAPIHeader -ProfileName $ProfileName)
            }
        }
    }
    end {

    }

}

# SIG # Begin signature block
