function New-MBSAPICompany {
    <#
    .SYNOPSIS
    Create MBS company.
    
    .DESCRIPTION
    Calls POST request to api/Companies.
    
    .PARAMETER Name
    Company name
    
    .PARAMETER StorageLimit
    Company backup limit. A negative value indicates the resource is unconstrained by a quota.
    
    .PARAMETER LicenseSettings
    Company license settings: 0 - Custom (Users have custom license settings) 1 - Global Pool(Users activate paid licenses from the global pool automatically) 2 - Company Pool(Users can activate only limited number of paid licenses from the company pool)
    
    .PARAMETER DestinationID
    Backup storage destination ID. Multiple IDs can be specified.

    .PARAMETER ProfileName
    Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    New-MBSAPICompany -Name Contoso -StorageLimit -1 -LicenseSettings 1 -ProfileName profile

    Create company named Contoso with unlimited storage and Global licensing pool.
    
    .EXAMPLE
    New-MBSAPICompany -Name ComputerCompany -StorageLimit 1073741824000 -LicenseSettings 0 -DestinationID ((Get-MBSAPIStorageAccount -ProfileName profile).Destinations | Where-Object {($_.DestinationDisplayName -like "*AWS*") -Or ($_.DestinationDisplayName -like "*Local*")}).DestinationID -ProfileName profile

    Create company named ComputerCompany with 1 Tb storage limit, Custom licensing pool and backup destinations that have display names containing "AWS" and "Local"

    .INPUTS
    System.Management.Automation.PSCustomObject
    String

    .OUTPUTS
    String

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/new-mbsapicompany
    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="Company name",ValueFromPipelineByPropertyName, ValueFromPipeline=$true)]
        [string]$Name,
        [Parameter(Mandatory=$false, HelpMessage="Company backup limit. A negative value indicates the resource is unconstrained by a quota.")]
        [string]$StorageLimit,
        [Parameter(Mandatory=$false, HelpMessage="Company license settings: 0 - Custom (Users have custom license settings) 1 - Global Pool(Users activate paid licenses from the global pool automatically) 2 - Company Pool(Users can activate only limited number of paid licenses from the company pool)")]
        [string]$LicenseSettings,
        [Parameter(Mandatory=$false, HelpMessage="Backup storage destination ID. Multiple IDs can be specified.")]
        [string[]]$DestinationID,
        #
        [Parameter(Mandatory=$false, HelpMessage="The profile name, which must be unique.")]
        [string]
        $ProfileName
    )
    
    begin {
        $headers = Get-MBSAPIHeader -ProfileName $ProfileName
    }
    
    process {
        $Destinations = @()
        if ($DestinationID) {
            ForEach ($Destination in $DestinationID) {
                $CurrentDestination = New-Object -TypeName MBS.API.CompanyDestination
                $CurrentDestination.DestinationId = $Destination
                $Destinations += $CurrentDestination
            }
        }
        $CompaniesPost = @{
            Name = $Name
            StorageLimit = $StorageLimit
            LicenseSettings = $LicenseSettings
            Destinations = $Destinations
        }
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Companies))
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): POST Request: " + ($CompaniesPost | ConvertTo-Json))
        $Companies = Invoke-RestMethod -Uri (Get-MBSApiUrl).Companies -Method POST -Headers $headers -Body ($CompaniesPost|ConvertTo-Json) -ContentType 'application/json'
        return $Companies
    }
    
    end {
        
    }
}

# SIG # Begin signature block
