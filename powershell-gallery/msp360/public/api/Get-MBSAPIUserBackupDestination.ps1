function Get-MBSAPIUserBackupDestination {
    <#
    .SYNOPSIS
    Gets a list of backup destinations
    
    .DESCRIPTION
    Calls the GET api/Destinations/{userEmail} API to get a list of user backup destinations.
    
    .PARAMETER userEmail
    Email of the user for which to query backup destinations. If none is specified, returns backup destinations for all users.
    
    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Get-MBSAPIUserBackupDestination -ProfileName ao -userEmail test@test.com

    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
        Author: MSP360 Onboarding Team
    
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/get-mbsapiuserbackupdestination
    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false, HelpMessage="Email of the user", ValueFromPipelineByPropertyName)]
        [Alias('Email')]
        [string]$userEmail,
        [Parameter(Mandatory=$false, HelpMessage="The profile name")]
        [string]$ProfileName
    )
    begin {

    }

    process {
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Destinations + '/' + $userEmail))
        Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): GET Request"
        [MBS.API.UserDestination[]]$AvailalbeStorageDestinations = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Destinations + '/' + $userEmail) -Method Get -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) | Convert-PSObjectToHash     
        return $AvailalbeStorageDestinations
    }
    
    end {
    }
}

# SIG # Begin signature block
