function Get-MBSApiUrl {
    <#
    .SYNOPSIS
        The cmdlet returns MBS API URLs object
    .DESCRIPTION
        The cmdlet returns MBS API URLs object
    .EXAMPLE
        PS C:\> Get-MBSApiUrl
        Explanation of what the example does
    .INPUTS
        None
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        
    #>

    #param ($obj)

    $obj = New-Object -TypeName psobject
    $obj | Add-Member -MemberType NoteProperty -Name Users -Value 'https://api.mspbackups.com/api/Users'
    $obj | Add-Member -MemberType NoteProperty -Name UsersAuthenticate -Value 'https://api.mspbackups.com/api/Users/Authenticate'
    $obj | Add-Member -MemberType NoteProperty -Name ProviderLogin -Value 'https://api.mspbackups.com/api/Provider/Login'
    $obj | Add-Member -MemberType NoteProperty -Name Packages -Value 'https://api.mspbackups.com/api/Packages'
    $obj | Add-Member -MemberType NoteProperty -Name Monitoring -Value 'https://api.mspbackups.com/api/Monitoring'
    $obj | Add-Member -MemberType NoteProperty -Name Companies -Value 'https://api.mspbackups.com/api/Companies'
    $obj | Add-Member -MemberType NoteProperty -Name Licenses -Value 'https://api.mspbackups.com/api/Licenses'
    $obj | Add-Member -MemberType NoteProperty -Name Destinations -Value 'https://api.mspbackups.com/api/Destinations'
    $obj | Add-Member -MemberType NoteProperty -Name Accounts -Value 'https://api.mspbackups.com/api/Accounts'
    $obj | Add-Member -MemberType NoteProperty -Name Billing -Value 'https://api.mspbackups.com/api/Billing'
    $obj | Add-Member -MemberType NoteProperty -Name Builds -Value 'https://api.mspbackups.com/api/Builds'
    $obj | Add-Member -MemberType NoteProperty -Name Administrators -Value 'https://api.mspbackups.com/api/Administrators'
    $obj | Add-Member -MemberType NoteProperty -Name ReportIssue -Value 'https://api.mspbackups.com/api/ReportIssue'
    return $obj
}

# SIG # Begin signature block
