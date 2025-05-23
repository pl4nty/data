function Revoke-MBSAPILicense {
    <#
    .SYNOPSIS
    Removes the association of a license to a specified computer or user.
    
    .DESCRIPTION
    Calls the POST api/Licenses/Revoke API to detach a license form the computer it is currently applied to. The license is moved back to the license pool it was taken from. In case Global Pool is used, user association is also removed. If a user has a custom pool specified, the license retains the attachment to that user's pool. Learn more about pools and license management here: https://help.mspbackups.com/administration/licenses/manage-licenses 
    Calls the POST api/Licenses/Release API to remove the association of a license to a user. This action also removes the license from the computer it is assigned to.

    .PARAMETER LicenseID
    The ID of the license to revoke. Use Get-MBSAPILicenses to determine this parameter.
    
    .PARAMETER UserID
    The ID of the user that the license is attached to. 
    
    .PARAMETER Target
    Defines the subject of the revoke action. If User in the Target parameter is specified, license releases from the user. If Computer in the Target parameter is specified, license revokes from the computer. Valid parameter inputs are User or Computer.

    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Revoke-MBSAPILicense -ProfileName ao -LicenseID 8fc593d1-bb74-4a52-a644-0a574967df83 -UserID e472840f-e01f-40e0-95fc-b28882a28cfe

    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    String
    
    .NOTES
        Author: MSP360 Onboarding Team
    
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/revoke-mbsapilicense
    #>
    
    param(
        [Parameter(Mandatory=$true, HelpMessage="License ID", ValueFromPipelineByPropertyName)]
        [string]$LicenseID,
        [Parameter(Mandatory=$true, HelpMessage="User ID", ValueFromPipelineByPropertyName)]
        [string]$UserID,
        [Parameter(Mandatory=$true, HelpMessage="Revoke license target", ValueFromPipelineByPropertyName)]
        [ValidateSet("User", "Computer")]
        [string]$Target,
        [Parameter(Mandatory=$false, HelpMessage="The profile name")]
        [string]$ProfileName
    )
    begin {
        
    } 
    process { 
        $RevokeLicensePost = @{
            LicenseID=$LicenseID
            UserID=$UserID
        }
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Licenses +'/Revoke')) 
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): POST Request: " + ($RevokeLicensePost|ConvertTo-Json))
        switch ($Target) {
            Computer {return Invoke-RestMethod -Uri ((Get-MBSApiUrl).Licenses +'/Revoke') -Method Post -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) -body ($RevokeLicensePost | ConvertTo-Json) -ContentType 'application/json'}
            User {return Invoke-RestMethod -Uri ((Get-MBSApiUrl).Licenses +'/Release') -Method Post -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) -body ($RevokeLicensePost | ConvertTo-Json) -ContentType 'application/json'}
            Default {Write-Host "Incorrect target parameter is specified. Use eather User or Computer"}
        }
    } 
    end {
        
    }
}

# SIG # Begin signature block
