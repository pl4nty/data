function Remove-MBSAPIStorageAccountDestination {
    <#
    .SYNOPSIS
    This cmdlet removed a backup destination from one of your storage accounts.

    .DESCRIPTION
    This function invokes the PUT api/Accounts/RemoveDestination API call to remove a backup destination from a storage account.

    .PARAMETER DestinationID
    The ID of the destination you want to delete. You may obtain this ID via Get-MBSAPIStorageAccountDestination

    .PARAMETER AccountID
    The ID of the storage account this destination belongs to. You may obtain this via Get-MBSAPIStorageAccount

    .PARAMETER Destination
    Actual destination identifier on the storage(bucket name, etc.)

    .PARAMETER DestinationDisplayName
    The display name of the destination in the MBS portal (and in the online backup GUI)

    .PARAMETER Force
    Bypass confirmation prompt

    .PARAMETER ProfileName
    Profile name to use for API connection

    .EXAMPLE
    Remove-MBSAPIStorageAccountDestination -DestinationID "e770933d-848f-4fdf-b24f-01aebd4e1405" -accountid "27bb3fcb-dc04-4a29-ac57-4d679809a2ba" -Destination "test-mbsapi" -ProfileName ao -Force

    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    String
    
    .NOTES
        Author: MSP360 Onboarding Team
        
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/remove-mbsapistorageaccountdestination
    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="Storage Account Destination ID", ValueFromPipelineByPropertyName)]
        [string]$DestinationID,
        [Parameter(Mandatory=$true, HelpMessage="Storage Account ID", ValueFromPipelineByPropertyName)]
        [string]$AccountID,
        [Parameter(Mandatory=$true, HelpMessage="Actual destination identifier on the storage(bucket name, etc.)", ValueFromPipelineByPropertyName)]
        [string]$Destination,
        [Parameter(Mandatory=$false, HelpMessage="Destination display name", ValueFromPipelineByPropertyName)]
        [string]$DestinationDisplayName,
        [Parameter(Mandatory=$false, HelpMessage="Bypass confirmation")]
        [switch]$Force,
        [Parameter(Mandatory=$false, HelpMessage="The profile name")]
        [string]$ProfileName
    )      
    begin {
        
    } 
    process {
        $RemoveDestinationPut = New-Object -TypeName PSObject -property ([ordered]@{
            DestinationID=$DestinationID
            AccountID=$AccountID
            Destination=$Destination
            DestinationDisplayName=$DestinationDisplayName
        })
        $RemoveDestinationPut = Remove-NullProperties ($RemoveDestinationPut)
        if ($Force) {
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Accounts+"/RemoveDestination"))
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): PUT Request: " + ($RemoveDestinationPut | ConvertTo-Json))
            return Invoke-RestMethod -Uri ((Get-MBSApiUrl).Accounts+"/RemoveDestination") -Headers (Get-MBSAPIHeader -ProfileName $profilename) -body ($RemoveDestinationPut | ConvertTo-Json) -ContentType 'application/json' -Method Put
        }
        else {
            if(Confirm-MBSAction -operation "Remove-MBSAPIStorageAccountDestionation" -target "Destination $Destination will be removed from storage account $AccountID") {
                Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Accounts+"/RemoveDestination"))
                Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): PUT Request: " + ($RemoveDestinationPut | ConvertTo-Json))
                return Invoke-RestMethod -Uri ((Get-MBSApiUrl).Accounts+"/RemoveDestination") -Headers (Get-MBSAPIHeader -ProfileName $profilename) -body ($RemoveDestinationPut | ConvertTo-Json) -ContentType 'application/json' -Method Put    
            }
        }
    }
    end {

    }
}

# SIG # Begin signature block
