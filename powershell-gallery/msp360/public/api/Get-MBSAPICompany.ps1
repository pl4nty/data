function Get-MBSAPICompany {
    <#
    .SYNOPSIS
    Get companies list 
    
    .DESCRIPTION
    Calls GET request to api/Companies

    .PARAMETER ID
    Company ID
    
    .PARAMETER ProfileName
    Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Get-MBSAPICompany -ProfileName profile
    
    List all companies
    .EXAMPLE
    Get-MBSAPICompany -ID f3090b26-16c8-418f-a57d-00b744abb869 -ProfileName profile

    Id                                   Name         StorageLimit LicenseSettings
    --                                   ----         ------------ ---------------
    f3090b26-16c8-418f-a57d-00b744abb869 Test Company 107374182400               0

    Get details for specific company.

    .INPUTS
    System.Management.Automation.PSCustomObject
    String

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/get-mbsapicompany
    #>
    
    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$false, HelpMessage="Company ID",ValueFromPipelineByPropertyName, ValueFromPipeline=$true)]
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
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Companies+"/"+$ID))
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): GET Request"
            [MBS.API.Company[]]$Companies = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Companies+"/"+$ID) -Method Get -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) | Convert-PSObjectToHash
        }else{
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + (Get-MBSApiUrl).Companies)
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): GET Request"
            [MBS.API.Company[]]$Companies = Invoke-RestMethod -Uri (Get-MBSApiUrl).Companies -Method Get -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) | Convert-PSObjectToHash
        }
        return $Companies
    }
    
    end {
        
    }
}

# SIG # Begin signature block
