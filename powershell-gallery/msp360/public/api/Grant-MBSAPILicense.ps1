function Grant-MBSAPILicense {
    <#
    .SYNOPSIS
    Grants a license to a specified user
    
    .DESCRIPTION
    Calls the POST api/Licenses/Grant API to grant a specified user a license from the appropriate license pool (determined by MBS user settings)
    
    .PARAMETER LicenseID
    ID of the license to grant. Use Get-MBSAPILicenses to determine.
    
    .PARAMETER UserID
    ID of the user to which the license needs to be granted. Use Get-MBSAPIUser to determine.
    
    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Grant-MBSAPILicense -ProfileName ao -LicenseID 8fc593d1-bb74-4a52-a644-0a574967df83 -UserID e472840f-e01f-40e0-95fc-b28882a28cfe

    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    String

    .NOTES
        Author: MSP360 Onboarding Team
    
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/grant-mbsapilicense
    #>
    
    param(
        [Parameter(Mandatory=$true, HelpMessage="License ID", ValueFromPipelineByPropertyName)]
        [string]$LicenseID,
        [Parameter(Mandatory=$true, HelpMessage="User ID", ValueFromPipelineByPropertyName)]
        [string]$UserID,
        [Parameter(Mandatory=$false, HelpMessage="The profile name")]
        [string]$ProfileName
    )
    begin {
        
    } 
    process { 
        $GrantLicensePost = @{
            LicenseID=$LicenseID
            UserID=$UserID
        }
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Licenses +'/Grant'))
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): POST Request: " + ($GrantLicensePost | ConvertTo-Json))
        return Invoke-RestMethod -Uri ((Get-MBSApiUrl).Licenses +'/Grant') -Method Post -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) -body ($GrantLicensePost | ConvertTo-Json) -ContentType 'application/json'
    } 
    end {
        
    }
}

# SIG # Begin signature block
