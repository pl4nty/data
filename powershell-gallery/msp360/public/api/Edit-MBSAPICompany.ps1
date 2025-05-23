function Edit-MBSAPICompany {
    <#
    .SYNOPSIS
    Change MBS company properties.
    
    .DESCRIPTION
    Calls PUT request to api/Companies
    
    .PARAMETER ID
    Company Id. Use Get-MBSAPICompany to list companies ID.
    
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
    Edit-MBSAPICompany -ID 27fbcbb0-cb0b-40e5-8c4a-bd7faf18ffce -Name "My Contoso" -StorageLimit 100000 -LicenseSettings 2 -ProfileName profile

    Change the name, storage limit, and license setting for company with ID 27fbcbb0-cb0b-40e5-8c4a-bd7faf18ffce
    
    .EXAMPLE
    Edit-MBSAPICompany -ID 27fbcbb0-cb0b-40e5-8c4a-bd7faf18ffce -DestinationID ((Get-MBSAPIStorageAccount -ProfileName profile).Destinations | Where-Object {$_.DestinationDisplayName -like "*Local*"}).DestinationID -ProfileName profile

    Change (overwrite) the destinations of a company with ID 27fbcbb0-cb0b-40e5-8c4a-bd7faf18ffce

    .INPUTS
    System.Management.Automation.PSCustomObject
    String

    .OUTPUTS
    String

    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/edit-mbsapicompany
    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false, HelpMessage="Company Id",ValueFromPipelineByPropertyName, ValueFromPipeline=$true)]
        [string]$ID,
        [Parameter(Mandatory=$false, HelpMessage="Company name")]
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
        $CompaniesPut = @{
            ID = $ID
            Name = $Name
            StorageLimit = $StorageLimit
            LicenseSettings = $LicenseSettings
            Destinations = $Destinations
        }
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Companies))
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): PUT Request: " + ($CompaniesPut|ConvertTo-Json))
        $Companies = Invoke-RestMethod -Uri (Get-MBSApiUrl).Companies -Method PUT -Headers $headers -Body ($CompaniesPut|ConvertTo-Json) -ContentType 'application/json'
        return $Companies
    }
    
    end {
        
    }
}

# SIG # Begin signature block
