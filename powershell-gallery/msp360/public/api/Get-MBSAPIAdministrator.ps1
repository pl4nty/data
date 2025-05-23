function Get-MBSAPIAdministrator {
    <#
    .SYNOPSIS
    List MBS account administrators
    
    .DESCRIPTION
    Calls GET request to api/Administrators.
    
    .PARAMETER AdminID
    Admin ID.
    
    .PARAMETER ProfileName
    Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)

    .EXAMPLE
    Get-MBSAPIAdministrator -ProfileName profile
    
    .EXAMPLE
    Get-MBSAPIAdministrator -ID 008410b2-e1f7-47f9-b35e-a7d13b74b516 -ProfileName profile

    Get administrator details with specific ID.
    
    .INPUTS
    System.Management.Automation.PSCustomObject
    String

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/get-mbsapiadministrator
    #>
    
    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$false, HelpMessage="Administrator ID", ValueFromPipelineByPropertyName, ValueFromPipeline=$true)]
        [Alias("AdminID")]
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
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Administrators+"/"+$ID))
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): GET Request"
            [MBS.API.Administrator[]]$Administrators = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Administrators+"/"+$ID) -Method Get -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) | Convert-PSObjectToHash
        }else{
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + (Get-MBSApiUrl).Administrators)
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): GET Request"
            [MBS.API.Administrator[]]$Administrators = Invoke-RestMethod -Uri (Get-MBSApiUrl).Administrators -Method Get -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) | Convert-PSObjectToHash
        }
        return $Administrators
    }
    
    end {
        
    }
}

# SIG # Begin signature block
