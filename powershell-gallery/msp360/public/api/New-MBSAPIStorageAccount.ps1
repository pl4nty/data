function New-MBSAPIStorageAccount {
    <#
    .SYNOPSIS
    Create a Storage account in MBS
    
    .DESCRIPTION
    Calls the POST api/Accounts API to create a new storage account
    
    .PARAMETER DisplayName
    Display name for your storage account
    
    .PARAMETER Type
    Storage Type either as a numeric [0-24] or in a human-readable format such as 'Amazon S3'. Consult with https://api.mspbackups.com/Help/ResourceModel?modelName=AccountType
    
    .PARAMETER AccountSettings
    Accounts settings in a JSON string. You can find the required fields for the JSON here: https://api.mspbackups.com/Help/ResourceModel?modelName=Settings
    
    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    New-MBSAPIStorageAccountSetting -AmazonS3 -DisplayName 'Amazon S3' -AccessKey ACCESS_KEY -SecretKey SECRET_KEY -IsGovCloud $false | New-MBSAPIStorageAccount -profilename ao
    
    Add Amazon S3 storage account

    .INPUTS
    MBS.API.StorageAccountSetting

    .OUTPUTS
    String

    .NOTES
        Author: MSP360 Onboarding Team
    
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/new-mbsapistorageaccount
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="Storage Account Display Name", ValueFromPipelineByPropertyName)]
        [string]$DisplayName,
        [Parameter(Mandatory=$true, HelpMessage="Storage Account Type", ValueFromPipelineByPropertyName)]
        [MBS.API.StorageAccountType]$Type,
        [Parameter(Mandatory=$true, HelpMessage="Storage Account Settings", ValueFromPipelineByPropertyName)]
        [string]$AccountSettings,
        [Parameter(Mandatory=$false, HelpMessage="The profile name")]
        [string]$ProfileName
    )

    begin {
        
    }

    process {
        #Storage Type can actually be passed as both [0-24] and in a human-readable format such as 'Amazon S3. Consult with https://api.mspbackups.com/Help/ResourceModel?modelName=AccountType'
        $StorageAccountPost = [ordered]@{
            DisplayName = $DisplayName
            Type = $Type
            AccountSettings = $AccountSettings | ConvertFrom-Json
        }
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Accounts))
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): POST Request: " + ($StorageAccountPost | ConvertTo-Json))
        $StorageDestinationID = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Accounts) -Method Post -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) -Body ($StorageAccountPost | ConvertTo-Json) -ContentType 'application/json'
        return $StorageDestinationID
    }

    end {
    }
}

# SIG # Begin signature block
