function Remove-MBSAPICompany {
    <#
    .SYNOPSIS
    Remove MBS company by ID
    
    .DESCRIPTION
    Calls DELETE request to api/Companies
    
    .PARAMETER ID
    Company Id
    
    .PARAMETER Force
    Force delete. Confirmation is disabled.
    
    .PARAMETER ProfileName
    Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Remove-MBSAPICompany -id ce786a8f-46a7-4442-b4ab-f2e2f1d9858a -Force -ProfileName MyProfile

    Remove company by ID in force mode (no confirmation)

    .EXAMPLE
    Remove-MBSAPICompany -id ce786a8f-46a7-4442-b4ab-f2e2f1d9858a -ProfileName MyProfile

    Remove company with confirmation prompt.
    
    .INPUTS
    System.Management.Automation.PSCustomObject
    String

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/remove-mbsapicompany
    #>
    
    [CmdletBinding(SupportsShouldProcess=$True,ConfirmImpact="High")]
    param (
        #
        [Parameter(Mandatory=$false, HelpMessage="Company Id", ValueFromPipelineByPropertyName, ValueFromPipeline=$true)]
        [string]$ID,
        #
        [Parameter(Mandatory=$false, HelpMessage="Force delete")]
        [switch]$Force,
        #
        [Parameter(Mandatory=$false, HelpMessage="The profile name, which must be unique.")]
        [string]
        $ProfileName
    )
    
    begin {
        $headers = Get-MBSAPIHeader -ProfileName $ProfileName
    }
    
    process {
        if ($Force){
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Companies+"/"+$ID))
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): DELETE Request"
            $Companies = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Companies+"/"+$ID) -Method DELETE -Headers $headers -ContentType 'application/json'            
            return $Companies
        }else{
            if (Confirm-MBSAction -Operation "Remove-MBSAPICompany" -Target "Removing company with ID: $ID"){
                Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Companies+"/"+$ID))
                Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): DELETE Request"
                $Companies = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Companies+"/"+$ID) -Method DELETE -Headers $headers -ContentType 'application/json'
                return $Companies
            }
        }
    }
    
    end {
        
    }
}

# SIG # Begin signature block
