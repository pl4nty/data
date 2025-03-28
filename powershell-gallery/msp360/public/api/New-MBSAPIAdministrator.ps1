function New-MBSAPIAdministrator {
    <#
    .SYNOPSIS
    Creates an Administrator for MBS
    
    .DESCRIPTION
    Calls the POST api/Administrators API to create a new administrator according to the specified parameters.

    .PARAMETER Email
    Email address of the administrator
    
    .PARAMETER FirstName
    First name of the administrator
    
    .PARAMETER LastName
    Last name of the administrator
    
    .PARAMETER Companies
    List of companies the adminstrator will have access to.
    
    .PARAMETER Enabled
    Whether the administrator should be enabled after creation
    
    .PARAMETER Password
    Password
    
    .PARAMETER SendEmailInstruction
    Whether or not to send instructions to the new administrator
    
    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .PARAMETER PermissionsModels
    Permissions for the administrator. Use New-MBSAPIAdministratorPermission to create an object. Valid permissions can be found here: https://api.mspbackups.com/Help/ResourceModel?modelName=PermissionsModels
    
    .PARAMETER AccessToCompaniesMode
    Assign the administrator to specified companies (in Companies parameter) or to all companies. Accepted values: SpecifiedCompanies, AllCompanies (https://mspbackups.com/mbsapi/Help/ResourceModel?modelName=AccessToCompaniesEnum)

    .PARAMETER AccountType
    If set to 'Internal' then access to an employee inside company is provided. If set to 'External' then access to any third party, such as a customer, is provided. This field can be empty for backward compatibility.
    
    .EXAMPLE
    PS C:\>New-MBSAPIAdministrator -Email 'QQQ@test.com' -Password (ConvertTo-SecureString -Force -asplaintext 'test') -SendEmailInstruction $false -FirstName admin -LastName adminson -Enabled $true -PermissionsModels (New-MBSAPIAdministratorPermission -EnableUndefinedPermissions) -AccessToCompaniesMode AllCompanies -ProfileName profile
    
    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    String

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/new-mbsapiadministrator
    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="Email", ValueFromPipelineByPropertyName)]
        [string]$Email,
        [Parameter(Mandatory=$false, HelpMessage="FirstName", ValueFromPipelineByPropertyName)]
        [string]$FirstName,
        [Parameter(Mandatory=$false, HelpMessage="LastName", ValueFromPipelineByPropertyName)]
        [string]$LastName,
        [Parameter(Mandatory=$false, HelpMessage="Company", ValueFromPipelineByPropertyName)]
        [string[]]$Companies,
        [Parameter(Mandatory=$false, HelpMessage="Enabled", ValueFromPipelineByPropertyName)]
        [bool]$Enabled = $true,
        [Parameter(Mandatory=$true, HelpMessage="Password", ValueFromPipelineByPropertyName)]
        [SecureString]$Password,
        [Parameter(Mandatory=$false, HelpMessage="Send Email Instruction", ValueFromPipelineByPropertyName)]
        [bool]$SendEmailInstruction,
        [Parameter(Mandatory=$false, HelpMessage="The profile name, which must be unique.")]
        [string]$ProfileName,
        [Parameter(Mandatory=$true, HelpMessage="The Permission set for this administrator", ValueFromPipelineByPropertyName)]
        [MBS.API.AdministratorPermission]
        $PermissionsModels,
        [Parameter(Mandatory=$false, HelpMessage="Assign the administrator to specified companies (in Companies parameter) or to all companies", ValueFromPipelineByPropertyName)]
        [MBS.API.AccessToCompaniesMode]
        $AccessToCompaniesMode='SpecifiedCompanies',
        [Parameter(Mandatory=$false, HelpMessage="If set to 'Internal' then access to an employee inside company is provided. If set to 'External' then access to any third party, such as a customer, is provided. This field can be empty for backward compatibility.")]
        [MBS.API.AdministratorAccountType]
        $AccountType
    )
    begin {
        
    }
    process {
        $AdminPost = New-Object -TypeName PSCustomObject -Property ([ordered]@{
            Email = $Email.trim()
            InitialPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password))
            SendInstruction = $SendEmailInstruction
            FirstName = $FirstName
            LastName = $LastName
            PermissionsModels = $PermissionsModels
            Companies = $Companies
            Enabled = $Enabled
            AccessToCompaniesMode = $AccessToCompaniesMode
            AccountType = $AccountType
            })
        if ($null -eq $AdminPost.Companies){
            $AdminPost.PSObject.Properties.remove('Companies')
        }
        if ($AdminPost.Companies -and ($AccessToCompaniesMode -eq 'AllCompanies')) {
            Write-Warning -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): AccessToCompaniesMode is set to ""AllCompanies"". Ignoring Companies option")
            $AdminPost.PSObject.Properties.remove('Companies')
        }
        if ($null -eq $AdminPost.AccountType){
            $AdminPost.PSObject.Properties.remove('AccountType')
        }
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Administrators))
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): POST Request: " + ($AdminPost | ConvertTo-Json))
        $AdministratorID = Invoke-RestMethod -Uri (Get-MBSApiUrl).Administrators -Method Post -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) -Body ($AdminPost|ConvertTo-Json) -ContentType 'application/json'
        return $AdministratorID
    }
    end {
    }
}

# SIG # Begin signature block
