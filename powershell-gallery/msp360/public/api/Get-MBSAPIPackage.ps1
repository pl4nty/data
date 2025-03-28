function Get-MBSAPIPackage {
    <#
    .SYNOPSIS
    Get a list of package/storage limits structures that are available to users
    
    .DESCRIPTION
    Calls GET request to api/Packages
    
    .PARAMETER ID
    Package ID
    
    .PARAMETER ProfileName
    Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Get-MBSAPIPackage -ProfileName profile

    List all available packages/storage limits.

    .EXAMPLE
    Get-MBSAPIPackage -ID 52277 -ProfileName profile

    Get package/storage limit details by specific package ID
    
    .INPUTS
    System.Management.Automation.PSCustomObject
    String

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/get-mbsapipackage
    #>
    
    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$false, HelpMessage="Package ID", ValueFromPipelineByPropertyName, ValueFromPipeline=$true)]
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
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Packages+"/"+$ID))
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): GET Request"
            [MBS.API.StoragePackage[]]$Packages = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Packages+"/"+$ID) -Method Get -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) | Convert-PSObjectToHash
        }else{
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + (Get-MBSApiUrl).Packages)
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): GET Request"
            [MBS.API.StoragePackage[]]$Packages = Invoke-RestMethod -Uri (Get-MBSApiUrl).Packages -Method Get -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) | Convert-PSObjectToHash
        }
        return $Packages
    }
    
    end {
        
    }
}

# SIG # Begin signature block
