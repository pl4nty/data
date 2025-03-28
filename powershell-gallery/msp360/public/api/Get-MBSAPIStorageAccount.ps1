function Get-MBSAPIStorageAccount {
    <#
    .SYNOPSIS
    Gets a list of storage accounts
    
    .DESCRIPTION
    Calls the GET api/Accounts API to get a list of Storage Accounts
    
    .PARAMETER ID
    Storage account ID
    
    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Get-MBSAPIStorageAccount -profilename ao

    Get a list of storage accounts

    .EXAMPLE
    Get-MBSAPIStorageAccount -ID 7cf9cbfe-504c-43ca-9a61-ef2f69f8ee91 -profilename ao

    Get specific storage account details by ID.

    .INPUTS
    System.Management.Automation.PSCustomObject
    String

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/get-mbsapistorageaccount
    #>
    
    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$false, HelpMessage="Storage account ID", ValueFromPipelineByPropertyName, ValueFromPipeline=$true)]
        [Alias("AccountID")]
        [string]$ID,
        #
        [Parameter(Mandatory=$false, HelpMessage="The profile name, which must be unique.")]
        [string]
        $ProfileName
    )
    
    begin {
       
    }
    
    process {
        if ($ID) {
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Accounts+"/"+$ID))
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): GET Request"
            [MBS.API.StorageAccount[]]$StorageAccounts = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Accounts+"/"+$ID) -Method Get -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) | Convert-PSObjectToHash
        }else{
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + (Get-MBSApiUrl).Accounts)
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): GET Request"
            [MBS.API.StorageAccount[]]$StorageAccounts = Invoke-RestMethod -Uri (Get-MBSApiUrl).Accounts -Method Get -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) | Convert-PSObjectToHash
        }
        return $StorageAccounts
    }
    
    end {
        
    }
}

# SIG # Begin signature block
