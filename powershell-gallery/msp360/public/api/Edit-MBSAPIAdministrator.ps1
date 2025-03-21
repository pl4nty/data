function Edit-MBSAPIAdministrator {
    <#
    .SYNOPSIS
    Changes properties of an existing MBS admin
    
    .DESCRIPTION
    Calls the PUT api/Administrators API to edit properties of an existing MBS administrator
    
    .PARAMETER AdminID
    ID of the admin that you are editing. Use Get-MBSAPIAdministrator to determine
    
    .PARAMETER FirstName
    First Name
    
    .PARAMETER LastName
    Last name
    
    .PARAMETER Companies
    List of companies the admin should have access to
    
    .PARAMETER Enabled
    Whether the admin is to be enabled.
    
    .PARAMETER Password
    The administrator's password.
    
    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .PARAMETER PermissionsModels
    Permissions for the administrator. Use New-MBSAPIAdministratorPermission to create an object. Valid permissions can be found here: https://api.mspbackups.com/Help/ResourceModel?modelName=PermissionsModels
    
    .PARAMETER AccessToCompaniesMode
    Assign the administrator to specified companies (in Companies parameter) or to all companies. Accepted values: SpecifiedCompanies, AllCompanies (https://mspbackups.com/mbsapi/Help/ResourceModel?modelName=AccessToCompaniesEnum)

    .PARAMETER AccountType
    If set to 'Internal' then access to an employee inside company is provided. If set to 'External' then access to any third party, such as a customer, is provided. This field can be empty for backward compatibility.

    .EXAMPLE
    PS C:\>Edit-MBSAPIAdministrator -ProfileName ao -AdminID 0b7e0a79-78e9-493e-af72-764f21960b05 -password (ConvertTo-SecureString -force -asplaintext 'Changed') -FirstName admin -LastName adminson -Enabled $true -PermissionsModels (New-MBSAPIAdministratorPermission -EnableUndefinedPermissions) -AccessToCompaniesMode SpecifiedCompanies -Companies 'DemoCompany'
    
    .EXAMPLE
    PS C:\>Get-MBSAPIAdministrator -ProfileName ao -AdminID 0b7e0a79-78e9-493e-af72-764f21960b05 | Edit-MBSAPIAdministrator -AccessToCompaniesMode SpecifiedCompanies -Companies 'DemoCompany','NewCompany' -ProfileName ao

    Note: If the administrator initially has access to all companies and you want to assign specific companies to him, parameter '-AccessToCompaniesMode SpecifiedCompanies' is needed to be explicitly specified.

    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/edit-mbsapiadministrator
    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="Admin ID", ValueFromPipelineByPropertyName)]
        [string]$AdminID,
        [Parameter(Mandatory=$false, HelpMessage="FirstName", ValueFromPipelineByPropertyName)]
        [string]$FirstName,
        [Parameter(Mandatory=$false, HelpMessage="LastName", ValueFromPipelineByPropertyName)]
        [string]$LastName,
        [Parameter(Mandatory=$false, HelpMessage="Company", ValueFromPipelineByPropertyName)]
        [string[]]$Companies,
        [Parameter(Mandatory=$false, HelpMessage="Enabled", ValueFromPipelineByPropertyName)]
        [bool]$Enabled = $true,
        [Parameter(Mandatory=$false, HelpMessage="Password", ValueFromPipelineByPropertyName)]
        [SecureString]$Password,
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
        $AdminPut = New-Object -TypeName PSCustomObject -Property ([ordered]@{
            adminID = $AdminID
            FirstName = $FirstName
            LastName = $LastName
            PermissionsModels = $PermissionsModels
            Companies = $Companies
            Enabled = $Enabled
            AccessToCompaniesMode = $AccessToCompaniesMode
            AccountType = $AccountType
            })

        if ($Password) {
            $UsersPut.Add("Password", [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password)))
        }
        if (-not $AdminPut.Companies) {
            $AdminPut.PSObject.Properties.remove('Companies')
        }
        if ($AdminPut.Companies -and ($AccessToCompaniesMode -eq 'AllCompanies')) {
            Write-Warning -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): AccessToCompaniesMode is set to ""AllCompanies"". Ignoring Companies option")
            $AdminPut.PSObject.Properties.remove('Companies')
        }
        if ($null -eq $AdminPost.AccountType){
            $AdminPost.PSObject.Properties.remove('AccountType')
        }
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + (Get-MBSApiUrl).Administrators)
        Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): PUT Request: " + ($AdminPut|ConvertTo-Json))
        $AdministratorID = Invoke-RestMethod -Uri (Get-MBSApiUrl).Administrators -Method Put -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) -Body ($AdminPut|ConvertTo-Json) -ContentType 'application/json'
        return $AdministratorID
    }
    
    end {
        
    }
}

# SIG # Begin signature block
