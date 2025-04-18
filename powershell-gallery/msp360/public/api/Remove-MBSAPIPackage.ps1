function Remove-MBSAPIPackage {
    <#
    .SYNOPSIS
    Removes a Storage limit (package) from your account. 
    
    .DESCRIPTION
    Calls the DELETE api/Packages/{id} API to remove a package from your account. 
    
    .PARAMETER PackageID
    ID of the package you wish to remove. Use Get-MBSAPIPackages to determine
    
    .PARAMETER Force
    Bypass confirmation prompt for removal operation
    
    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Remove-MBSAPIPackage -ProfileName ao -PackageID 64028 -Force

    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    String
    
    .NOTES
        Author: MSP360 Onboarding Team
    
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/remove-mbsapipackage
    #>
    
    param(
        [Parameter(Mandatory=$true, HelpMessage="Package ID", ValueFromPipelineByPropertyName)]
        [Alias('ID')]
        [string]$PackageID,
        [Parameter(Mandatory=$false, HelpMessage="Bypass confirmation")]
        [switch]$Force,
        [Parameter(Mandatory=$false, HelpMessage="The profile name")]
        [string]$ProfileName
    ) 
    begin {

    }
    process {
        if($Force) {
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Packages +'/' + "$PackageID"))
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): DELETE Request"
            return Invoke-RestMethod -Uri ((Get-MBSApiUrl).Packages +'/' + "$PackageID") -Method Delete -Headers (Get-MBSAPIHeader -ProfileName $ProfileName)
        }
        else {
            if(Confirm-MBSAction -operation "Remove-MBSAPIPackage" -target "Remove storage limit with id $PackageID. This will allow users to backup more data than you have previously limited them to") {
                Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Packages +'/' + "$PackageID"))
                Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): DELETE Request"
                return Invoke-RestMethod -Uri ((Get-MBSApiUrl).Packages +'/' + "$PackageID") -Method Delete -Headers (Get-MBSAPIHeader -ProfileName $ProfileName)    
            }
        }

    }
    end {

    }
}

Set-Alias Remove-MBSAPIStorageLimit Remove-MBSAPIPackage

# SIG # Begin signature block
