function New-MBSAPIUser {
    <#
    .SYNOPSIS
    Creates MBS backup user. 
    
    .DESCRIPTION
    Calls POST request to https://api.mspbackups.com/api/Users. 
    
    .PARAMETER Email
    Backup user login name.
    
    .PARAMETER FirstName
    Backup user first name.
    
    .PARAMETER LastName
    Backup user last name.
    
    .PARAMETER NotificationEmails
    Backup user notification emails. 
    
    .PARAMETER Company
    Company name.
    
    .PARAMETER Enabled
    Backup user status. Specify $false or $true.
    
    .PARAMETER Password
    Backup user password. Use (ConvertTo-SecureString -Force -asplaintext 'test1341343')
    
    .PARAMETER DestinationList
    Array of the backup storage destination collection JSON. Get more https://mspbackups.com/Admin/Help/mbs-api-specification/methods/post-apiusers/destinationfornewuser
    
    .PARAMETER SendEmailInstruction
    Send instructions to notification emails for user.
    
    .PARAMETER LicenseManagementMode
    Licensing mode. Get more https://mspbackups.com/Admin/Help/mbs-api-specification/methods/post-apiusers/usermodetype
    
    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)

    .EXAMPLE
    PS C:\> $MyDestinationList = @(@{
        AccountID = "7cf9cbfe-504c-43ca-9a61-ef2f69f8ee91"
        Destination = "cblalexv"
        PackageID = 64130
    },@{
        AccountID = "bdb27298-c831-4be9-ae47-e35a38debacb"
        Destination = "cblalexv"
        PackageID = 64130
    })
    PS C:\> New-MBSAPIUser -Email TestUser -FirstName "My" -LastName "User" -NotificationEmails User@contoso.com -Company Contoso -Enabled $true -Password (ConvertTo-SecureString -Force -asplaintext 'test1341343') -DestinationList $MyDestinationList -SendEmailInstruction $true -LicenseManagementMode 0 -ProfileName Profile

    Create new MBS backup user.
    .INPUTS
        None

    .OUTPUTS
        String

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/new-mbsapiuser
    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="Email")]
        [string]$Email,
        [Parameter(Mandatory=$false, HelpMessage="FirstName")]
        [string]$FirstName,
        [Parameter(Mandatory=$false, HelpMessage="LastName")]
        [string]$LastName,
        [Parameter(Mandatory=$false, HelpMessage="NotificationEmails")]
        [string[]]$NotificationEmails,
        [Parameter(Mandatory=$false, HelpMessage="Company")]
        [string]$Company,
        [Parameter(Mandatory=$false, HelpMessage="Enabled")]
        [bool]$Enabled = $true,
        [Parameter(Mandatory=$true, HelpMessage="Password")]
        [Securestring]$Password,
        [Parameter(Mandatory=$false, HelpMessage="DestinationList")]
        [array]$DestinationList,
        [Parameter(Mandatory=$false, HelpMessage="SendEmailInstruction")]
        [bool]$SendEmailInstruction,
        [Parameter(Mandatory=$false, HelpMessage="LicenseManagementMode")]
        [int]$LicenseManagementMode,
        #
        [Parameter(Mandatory=$false, HelpMessage="The profile name, which must be unique.")]
        [string]
        $ProfileName
    )
    
    begin {
        $headers = Get-MBSAPIHeader -ProfileName $ProfileName
    }
    
    process {
        $UsersPost = [ordered]@{
            Email = $Email.Trim()
            FirstName = $FirstName
            LastName = $LastName
            NotificationEmails = $NotificationEmails
            Company = $Company.Trim()
            Enabled = $Enabled
            Password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password))
            DestinationList = $DestinationList
            SendEmailInstruction = $SendEmailInstruction
            LicenseManagmentMode = $LicenseManagementMode
        }
        if (-not $DestinationList){
            $UsersPost.Remove("DestinationList")
        }
        if (-not $NotificationEmails){
            $UsersPost.Remove("NotificationEmails")
        }
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + (Get-MBSApiUrl).Users)
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): POST Request: " + ($UsersPost | ConvertTo-Json))
        $UserID = Invoke-RestMethod -Uri (Get-MBSApiUrl).Users -Method Post -Headers $headers -Body ($UsersPost|ConvertTo-Json) -ContentType 'application/json'
        return $UserID
    }
    
    end {
        
    }
}

# SIG # Begin signature block
