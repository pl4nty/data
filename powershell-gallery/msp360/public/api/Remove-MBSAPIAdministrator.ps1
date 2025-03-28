function Remove-MBSAPIAdministrator {
    <#
    .SYNOPSIS
    Removes an Administrator from MBS
    
    .DESCRIPTION
    Call the DELETE api/Administrators/{id} API to delete an administrator
    
    .PARAMETER AdminID
    ID of the admin to be deleted. Use Get-MBSAPIAdmin to determine
    
    .PARAMETER Force
    Bypass confirmation prompt
    
    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Remove-MBSAPIAdministrator -AdminID 0b7e0a79-78e9-493e-af72-764f21960b05 -Force  -ProfileName ao
    
    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    String

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/remove-mbsapiadministrator
    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="Admin ID", ValueFromPipelineByPropertyName)]
        [string]$AdminID,
        [Parameter(Mandatory=$false, HelpMessage="Bypass confirmation")]
        [switch]$Force,
        [Parameter(Mandatory=$false, HelpMessage="The profile name, which must be unique.")]
        [string]$ProfileName
    )
    begin {
    }
    
    process {
        $AdministratorID = $False
        if($Force){
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Administrators + '/' + "$AdminID") )
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): DELETE Request"
            $AdministratorID = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Administrators + '/' + "$AdminID") -Method Delete -Headers (Get-MBSAPIHeader -ProfileName $ProfileName)
        }
        else {
            if(Confirm-MBSAction -operation "Remove-MBSAPIAdministrator" -target "Remove administrator with id $AdminID") {
                Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Administrators + '/' + "$AdminID") )
                Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): DELETE Request"
                $AdministratorID = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Administrators + '/' + "$AdminID") -Method Delete -Headers (Get-MBSAPIHeader -ProfileName $ProfileName)    
            }
        }
        return $AdministratorID
    }
    
    end {
        
    }
}

# SIG # Begin signature block
