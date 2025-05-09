function Edit-MBSAPIUser {
    <#
    .SYNOPSIS
    Updates user properties to new values.
    
    .DESCRIPTION
    Calls POST request to https://api.mspbackups.com/api/Users.
    
    .PARAMETER ID
    MBS Backup user ID. 
    
    .PARAMETER Email
    MBS Backup user login name.
    
    .PARAMETER FirstName
    Backup user first name.
    
    .PARAMETER LastName
    Backup user last name.
    
    .PARAMETER NotificationEmail
    Backup user notification emails. 
    
    .PARAMETER Company
    Company name.
    
    .PARAMETER Enabled
    Backup user status. Specify $false or $true.
    
    .PARAMETER Password
    Backup user password.
    
    .PARAMETER LicenseManagementMode
    Licensing mode. Get more https://mspbackups.com/Admin/Help/mbs-api-specification/methods/post-apiusers/usermodetype
    
    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)

    .EXAMPLE
    Edit-MBSAPIUser -id 7c7044bb-313b-4b1b-900e-76d652246f4d -FirstName "NewFirstName" -LastName "NewLastName" -NotificationEmail NewEmail@contoso.com -Enabled $true -Password (ConvertTo-SecureString -Force -asplaintext 'NewPassword') -LicenseManagementMode 1 -ProfileName MyProfile

    Update user properties, with specific ID, to new values.
    
    .INPUTS
        System.Management.Automation.PSCustomObject

    .OUTPUTS
        String

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/edit-mbsapiuser
    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="ID", ValueFromPipelineByPropertyName)]
        [string]$ID,
        [Parameter(Mandatory=$false, HelpMessage="Email")]
        [string]$Email,
        [Parameter(Mandatory=$false, HelpMessage="FirstName")]
        [string]$FirstName,
        [Parameter(Mandatory=$false, HelpMessage="LastName")]
        [string]$LastName,
        [Parameter(Mandatory=$false, HelpMessage="NotificationEmail")]
        [string[]]$NotificationEmail,
        [Parameter(Mandatory=$false, HelpMessage="Company")]
        [string]$Company,
        [Parameter(Mandatory=$true, HelpMessage="Enabled")]
        [bool]$Enabled = $true,
        [Parameter(Mandatory=$false, HelpMessage="Password")]
        [Securestring]$Password,
        [Parameter(Mandatory=$false, HelpMessage="LicenseManagementMode")]
        [string]$LicenseManagementMode,
        #
        [Parameter(Mandatory=$false, HelpMessage="The profile name, which must be unique.")]
        [string]
        $ProfileName
    )
    
    begin {
        $headers = Get-MBSAPIHeader -ProfileName $ProfileName
    }
    
    process {
        $UsersPut = @{
            ID = $ID
            Email = $Email.Trim()
            FirstName = $FirstName
            LastName = $LastName
            NotificationEmails = $NotificationEmail
            Company = $Company.Trim()
            Enabled = $Enabled
            LicenseManagmentMode = $LicenseManagementMode
        }
        if (-not $Company){
            $UsersPut.Remove("Company")
        }

        if ($Password) {
            $UsersPut.Add("Password", [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password)))
        }
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + (Get-MBSApiUrl).Users)
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): PUT Request: " + ($UsersPut|ConvertTo-Json))
        $UserID = Invoke-RestMethod -Uri (Get-MBSApiUrl).Users -Method PUT -Headers $headers -Body ($UsersPut|ConvertTo-Json) -ContentType 'application/json'
        return $UserID
    }
    
    end {
        
    }
}

# SIG # Begin signature block
