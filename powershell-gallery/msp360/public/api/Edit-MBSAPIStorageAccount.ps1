function Edit-MBSAPIStorageAccount {
    <#
    .SYNOPSIS
    Edit a Storage account
    
    .DESCRIPTION
    Calls the PUT api/Accounts API to edit an existing storage account.
    
    .PARAMETER AccountID
    ID of the storage account to edit. Use Get-MBSStorageAccount to determine.
    
    .PARAMETER DisplayName
    Display Name for the storage account
    
    .PARAMETER Type
    Storage Type either as a numeric [0-24] or in a human-readable format such as 'Amazon S3'. Consult with https://api.mspbackups.com/Help/ResourceModel?modelName=AccountType
    
    .PARAMETER AccountSettings
    Accounts settings in a JSON string. You can find the required fields for the JSON here: https://api.mspbackups.com/Help/ResourceModel?modelName=Settings
    
    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Edit-MBSAPIStorageAccount -AccountID '2789654d-68a5-436b-a286-acbc4c22d26f' -DisplayName 'qwerty' -Type 'AmazonS3' -AccountSettings '{"AmazonS3":{"AccessKey": "****","SecretKey": "*****","isGovCloud": false}}' -ProfileName ao  

    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
        Author: MSP360 Onboarding Team
    
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/edit-mbsapistorageAccount
    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="Storage Account ID", ValueFromPipelineByPropertyName)]
        [string]$AccountID,
        [Parameter(Mandatory=$true, HelpMessage="Storage Account Display Name", ValueFromPipelineByPropertyName)]
        [string]$DisplayName,
        [Parameter(Mandatory=$true, HelpMessage="Storage Account Type", ValueFromPipelineByPropertyName)]
        [string]$Type,
        [Parameter(Mandatory=$true, HelpMessage="Storage Account Settings JSON", ValueFromPipelineByPropertyName)]
        [string]$AccountSettings,
        [Parameter(Mandatory=$false, HelpMessage="The profile name")]
        [string]$ProfileName
    )
    begin {
        
    }
    process {
        #Storage Type can actually be passed as both [0-24] and in a human-readable format such as 'Amazon S3'. Consult with https://api.mspbackups.com/Help/ResourceModel?modelName=AccountType
        $StorageDestinationPut = [ordered]@{
            AccountID = $AccountID
            DisplayName = $DisplayName
            Type = $Type
            AccountSettings = $AccountSettings | ConvertFrom-Json
        }

        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Accounts))
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): PUT Request: " + ($StorageDestinationPut|ConvertTo-Json))

        $StorageAccountID = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Accounts) -Method Put -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) -Body ($StorageDestinationPut | ConvertTo-Json) -ContentType 'application/json'
        return $StorageAccountID
    }
    end {
    }
}

# SIG # Begin signature block
