function Edit-MBSAPIStorageAccountDestination {
    <#
    .SYNOPSIS
    Edit a destination for a specified storage account.
    
    .DESCRIPTION
    Performs the PUT api/Accounts/EditDestination API call to edit an existing destination that belongs to one of your storage accounts.
    
    .PARAMETER DestinationID
    The ID of the destination you want to edit. You may obtain this ID via Get-MBSAPIStorageAccountDestination

    .PARAMETER AccountID
    The ID of the storage account this destination belongs to. You may obtain this via Get-MBSAPIStorageAccount

    .PARAMETER Destination
    Actual destination identifier on the storage(bucket name, etc.)

    .PARAMETER DestinationDisplayName
    The display name of the destination in the MBS portal (and in the online backup GUI)
    
    .PARAMETER ProfileName
    Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Edit-MBSApiStorageAccountDestination -ProfileName ao -destinationid e770933d-848f-4fdf-b24f-01aebd4e1405 -AccountID 27bb3fcb-dc04-4a29-ac57-4d679809a2ba -Destination 'test-mbsapi' -DestinationDisplayName 'new name'
    
    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
        Author: MSP360 Onboarding Team
    
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/edit-mbsapistorageaccountdestination
    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="Storage Account Destination ID", ValueFromPipelineByPropertyName)]
        [string]$DestinationID,
        [Parameter(Mandatory=$true, HelpMessage="Storage Account ID", ValueFromPipelineByPropertyName)]
        [string]$AccountID,
        [Parameter(Mandatory=$true, HelpMessage="Actual destination identifier on the storage(bucket name, etc.)", ValueFromPipelineByPropertyName)]
        [string]$Destination,
        [Parameter(Mandatory=$true, HelpMessage="Destination display name", ValueFromPipelineByPropertyName)]
        [string]$DestinationDisplayName,
        [Parameter(Mandatory=$false, HelpMessage="The profile name")]
        [string]$ProfileName
    )    
    begin {
        
    }
    process {
        $EditDestinationPut = New-Object -TypeName PSObject -property (@{
            DestinationID=$DestinationID
            AccountID=$AccountID
            Destination=$Destination
            DestinationDisplayName=$DestinationDisplayName
        })
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSAPIUrl).Accounts + "/EditDestination"))
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): PUT Request: " + ($EditDestinationPut|ConvertTo-Json))
        $DestinationID = Invoke-RestMethod -uri ((Get-MBSAPIUrl).Accounts + "/EditDestination") -body ($EditDestinationPut | ConvertTo-Json) -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) -method Put -ContentType 'application/json'
        return $DestinationID
    }
    end{

    }
}

# SIG # Begin signature block
