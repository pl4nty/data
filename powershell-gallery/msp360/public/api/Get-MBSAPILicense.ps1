function Get-MBSAPILicense {
    <#
    .SYNOPSIS
    List MBS licenses
    
    .DESCRIPTION
    Calls GET request to api/Licenses
    
    .PARAMETER ID
    License ID
    
    .PARAMETER ProfileName
    Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Get-MBSAPILicense -ProfileName profile

    List all licenses.

    .EXAMPLE
    Get-MBSAPILicense -ID ec315596-ab48-4360-aee4-e725b5746a42 -ProfileName profile

    Get license details by specific license ID
    
    .INPUTS
    System.Management.Automation.PSCustomObject
    String

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/get-mbsapilicense
    #>
    
    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$false, HelpMessage="License ID", ValueFromPipelineByPropertyName, ValueFromPipeline=$true)]
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
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Licenses+"/"+$ID))
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): GET Request"
            [MBS.API.License[]]$Licenses = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Licenses+"/"+$ID) -Method Get -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) | Convert-PSObjectToHash
        }else{
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + (Get-MBSApiUrl).Licenses)
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): GET Request"
            [MBS.API.License[]]$Licenses = Invoke-RestMethod -Uri (Get-MBSApiUrl).Licenses -Method Get -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) | Convert-PSObjectToHash
        }
        return $Licenses
    }
    
    end {
        
    }
}

# SIG # Begin signature block
