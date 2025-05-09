function New-MBSAPIPackage {
    <#
    .SYNOPSIS
    Add a storage limit (package)
    
    .DESCRIPTION
    Calls the POST api/Packages API to create a new storage limit according to specified parameters
    
    .PARAMETER Name
    Name for this package.
    
    .PARAMETER Description
    Description for this package.
    
    .PARAMETER StorageLimit
    Storage Limit in GB.
       
    .PARAMETER RestoreLimit
    Restore limit for this package -- how much data can the customer restore. Value in GB
    
    .PARAMETER Cost
    Cost in $
    
    .PARAMETER GlacierRestoreType
    Standard=0, Bulk=1, Expedited=2, Don't restore from Glacier=3
    
    .PARAMETER UseRestoreLimit
    Enforece the RestoreLimit value
    
    .PARAMETER ProfileName
    Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    New-MBSAPIPackage -ProfileName ao -cost 0 -Description 'test'  -name 'Test' -StorageLimit 420420 -isGlacierRestoreLimit $false
    
    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    String

    .NOTES
    Author: MSP360 Onboarding Team
    
    .LINK
    https://mspbackups.com/AP/Help/powershell/cmdlets/api/new-mbsapipackage
    #>
    
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, HelpMessage="Package name", ValueFromPipelineByPropertyName)]
        [string]$Name,   
        [Parameter(Mandatory=$false, HelpMessage="Package Description", ValueFromPipelineByPropertyName)]
        [string]$Description,   
        [Parameter(Mandatory=$true, HelpMessage="Storage Limit (in Gb)", ValueFromPipelineByPropertyName)]
        [float]$StorageLimit,  
        [Parameter(Mandatory=$false, HelpMessage="Restore Limit (in Gb)", ValueFromPipelineByPropertyName)]
        [nullable[float]]$RestoreLimit=$null,    
        [Parameter(Mandatory=$true, HelpMessage="Cost", ValueFromPipelineByPropertyName)]
        [float]$Cost, 
        [Parameter(Mandatory=$false, HelpMessage="GlacierRestoreType", ValueFromPipelineByPropertyName)]
        [string]$GlacierRestoreType=$null,
        [Parameter(Mandatory=$false, HelpMessage="Enforce restore limit", ValueFromPipelineByPropertyName)]
        [nullable[bool]]$UseRestoreLimit=$false, 
        [Parameter(Mandatory=$false, HelpMessage="The profile name")]
        [string]$ProfileName
    )
    begin {
        
    }
    process {
        $PackagePost = New-Object -typename PSCustomObject -property @{
            Name = $Name
            Description = $Description
            StorageLimit = $StorageLimit
            RestoreLimit = $RestoreLimit
            isGlacierRestoreLimit = $True
            Cost = $Cost
            GlacierRestoreType = $GlacierRestoreType
            UseRestoreLimit = $UseRestoreLimit
        }
        $PackagePost = Remove-NullProperties($PackagePost)
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Packages))
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): POST Request: " + ($PackagePost | ConvertTo-Json))
        $PackageID = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Packages) -Method Post -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) -Body ($PackagePost | ConvertTo-Json) -ContentType 'application/json'
        return $PackageID
    }
    end {
    }
}

Set-Alias -Name New-MBSAPIStorageLimit New-MBSAPIPackage

# SIG # Begin signature block
