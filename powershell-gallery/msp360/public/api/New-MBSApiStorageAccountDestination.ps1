function New-MBSAPIStorageAccountDestination {
    <#
    .SYNOPSIS
    Adds an existing location on your storage account as a destination available in MBS
    
    .DESCRIPTION
    Calls the POST api/Accounts/AddDestination API to add a location (bucket etc.) that already exists on your storage as a destination in MBS. This will allow you to then target backups to this destination
    
    .PARAMETER AccountID
    AccountID for the storage account where the location you are adding is. Use Get-MBSAPIStorageAccount to find out the AccountID.
    
    .PARAMETER Destination
    Actual destination identifier on the storage(bucket name, etc.)
    
    .PARAMETER DestinationDisplayName
    A display name for your storage in MBS
    
    .PARAMETER ProfileName
    Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    New-MBSApiStorageAccountDestination -AccountID 27bb3fcb-dc04-4a29-ac57-4d679809a2ba -Destination 'test-mbsapi' -DestinationDisplayName 'Test' -ProfileName ao
    
    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    String

    .NOTES
        Author: MSP360 Onboarding Team
    
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/new-mbsapistorageaccountdestination
    #>
    
    
    [CmdletBinding()]
    param (
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
        $AddDestinationPost = New-Object -TypeName PSObject -property (@{
            AccountID=$AccountID
            Destination=$Destination
            DestinationDisplayName=$DestinationDisplayName
        })
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSAPIUrl).Accounts + "/AddDestination"))
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): POST Request: " + ($AddDestinationPost | ConvertTo-Json))

        $DestinationID = Invoke-RestMethod -uri ((Get-MBSAPIUrl).Accounts + "/AddDestination") -body ($AddDestinationPost | ConvertTo-Json) -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) -method POST -ContentType 'application/json'
        return $DestinationID
    }
    end{

    }
}

# SIG # Begin signature block
