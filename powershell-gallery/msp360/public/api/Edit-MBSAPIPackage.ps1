function Edit-MBSAPIPackage {
    <#
    .SYNOPSIS
    Edit an existing Storage Limit (package)
    
    .DESCRIPTION
    Calls the PUT api/Packages API to edit an existing storage limit (package). 
    
    .PARAMETER ID
    ID of the package to edit.
    
    .PARAMETER Name
    Name for this package.
    
    .PARAMETER Description
    Description for this package.
    
    .PARAMETER StorageLimit
    Storage Limit in GB.
    
    .PARAMETER isGlacierRestoreLimit
    Deprecated parameter
    
    .PARAMETER RestoreLimit
    Restore limit for this package -- how much data can the customer restore. Value in GB
    
    .PARAMETER Cost
    Cost in $
    
    .PARAMETER GlacierRestoreType
    Standard=0, Bulk=1, Expedited=2, Don't restore from Glacier=3
    
    .PARAMETER UseRestoreLimit
    Enforece the RestoreLimit value
    
    .PARAMETER Enabled
    Whether this storage limit is currently enabled.
    
    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Edit-MBSAPIPackage -ProfileName ao -id 64028 -cost 0 -Description 'test' -Enabled $false -name 'Test' -StorageLimit 420420 -isGlacierRestoreLimit $false
    
    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
        Author: MSP360 Onboarding Team
    
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/edit-mbsapipackage
    #>
    
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, HelpMessage="Package ID", ValueFromPipelineByPropertyName)]
        [string]$ID,  
        [Parameter(Mandatory=$true, HelpMessage="Package name", ValueFromPipelineByPropertyName)]
        [string]$Name,   
        [Parameter(Mandatory=$false, HelpMessage="Package Description", ValueFromPipelineByPropertyName)]
        [string]$Description=$null,   
        [Parameter(Mandatory=$false, HelpMessage="Storage Limit (in Gb)", ValueFromPipelineByPropertyName)]
        [nullable[float]]$StorageLimit=$null,   
        [Parameter(Mandatory=$false, HelpMessage="isGlacierRestoreLimit", ValueFromPipelineByPropertyName)]
        [bool]$isGlacierRestoreLimit=$false,
        [Parameter(Mandatory=$false, HelpMessage="Restore Limit (in Gb)", ValueFromPipelineByPropertyName)]
        [nullable[float]]$RestoreLimit=$null,    
        [Parameter(Mandatory=$false, HelpMessage="Cost", ValueFromPipelineByPropertyName)]
        [nullable[float]]$Cost=$null, 
        [Parameter(Mandatory=$false, HelpMessage="GlacierRestoreType", ValueFromPipelineByPropertyName)]
        [string]$GlacierRestoreType=$null,
        [Parameter(Mandatory=$false, HelpMessage="Storage Limit (in Gb)", ValueFromPipelineByPropertyName)]
        [nullable[bool]]$UseRestoreLimit=$null, 
        [Parameter(Mandatory=$false, HelpMessage="Storage Limit (in Gb)", ValueFromPipelineByPropertyName)]
        [bool]$Enabled=$true, 
        [Parameter(Mandatory=$false, HelpMessage="The profile name")]
        [string]$ProfileName
    )
    begin {
        
    }
    process {
        $PackageRaw = New-Object -TypeName PSCustomObject -Property ([ordered]@{
            ID = $ID
            Name = $Name
            isGlacierRestoreLimit = $isGlacierRestoreLimit
            Enabled = $Enabled

            Description = $Description
            StorageLimit = $StorageLimit
            RestoreLimit = $RestoreLimit
            Cost = $Cost
            GlacierRestoreType = $GlacierRestoreType
            UseRestoreLimit = $UseRestoreLimit
        })
        $PackagePut = Remove-NullProperties($PackageRaw)

        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Packages))
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): PUT Request: " + ($PackagePut|ConvertTo-Json))
        $PackageID = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Packages) -Method Put -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) -Body ($PackagePut | ConvertTo-Json) -ContentType 'application/json'
        return $PackageID
    }
    end {

    }
}

Set-Alias -Name Edit-MBSAPIStorageLimit Edit-MBSAPIPackage

# SIG # Begin signature block
