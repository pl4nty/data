function Get-MBSAPIUser {
    
    <#
    .SYNOPSIS
        Get backup user list.
    .DESCRIPTION
        Calls the GET request to https://api.mspbackups.com/api/Users. 
    
    .PARAMETER ID
        MBS User ID. Specify to filter by MBS User ID.

    .PARAMETER ProfileName
	    Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)

    .EXAMPLE
        PS C:\> Get-MBSAPIUser | ft
        
        Get all MBS users and format output as table

    .EXAMPLE
        PS C:\> Get-MBSAPIUser -ID 6970973d-e245-4bbf-a766-dc65a96549c9
        
        Get MBS users with ID 6970973d-e245-4bbf-a766-dc65a96549c9
    .INPUTS
        None

    .OUTPUTS
        MBS.API.User

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/get-mbsapiuser
    #>

    

    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$false, HelpMessage="User ID")]
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
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Users+"/"+$ID))
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): GET Request"
            [MBS.API.User[]]$Users = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Users+"/"+$ID) -Method Get -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) | Convert-PSObjectToHash
        }else{
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + (Get-MBSApiUrl).Users)
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): GET Request"
            [MBS.API.User[]]$Users = Invoke-RestMethod -Uri (Get-MBSApiUrl).Users -Method Get -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) | Convert-PSObjectToHash
        }
        return $Users
    }
    
    end {
        
    }
}

# SIG # Begin signature block
