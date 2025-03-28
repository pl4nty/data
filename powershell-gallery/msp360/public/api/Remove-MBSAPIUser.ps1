function Remove-MBSAPIUser {
    <#
    .SYNOPSIS
    Deletes specified user and all user-related information.
    
    .DESCRIPTION
    Calls DELETE request to https://api.mspbackups.com/api/Users
    
    .PARAMETER ID
    User ID. User Get-MBSAPIUser to list MBS backup users.
    
    .PARAMETER Force
    Force delete. Confirmation is disabled.
    
    .PARAMETER DeleteData
    Deletes specified user and all user-related backup data. Data will be deleted during the day.
    
    .PARAMETER ProfileName
    Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Remove-MBSAPIUser -id 7c7044bb-313b-4b1b-900e-76d652246f4d -Force -ProfileName MyProfile

    Remove backup user by ID in force mode (no confirmation)

    .EXAMPLE
    Remove-MBSAPIUser -id 7c7044bb-313b-4b1b-900e-76d652246f4d -DeleteData -Force -ProfileName MyProfile

    Remove backup user and all user-related backup data by ID
    
    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    String

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/remove-mbsapiuser
    #>
    

    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$false, HelpMessage="User Id", ValueFromPipelineByPropertyName)]
        [string]$ID,
        #
        [Parameter(Mandatory=$false, HelpMessage="Force delete")]
        [switch]$Force,
        #
        [Parameter(Mandatory=$false, HelpMessage="Deletes specified user and all user-related backup data. Data will be deleted during the day.")]
        [switch]$DeleteData,
        #
        [Parameter(Mandatory=$false, HelpMessage="The profile name, which must be unique.")]
        [string]
        $ProfileName
    )
    
    begin {
        $headers = Get-MBSAPIHeader -ProfileName $ProfileName
    }
    
    process {
        if ($DeleteData){
            if ($Force){
                Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Users+"/"+$ID))
                Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): DELETE Request"
                $User = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Users+"/"+$ID) -Method DELETE -Headers $headers -ContentType 'application/json'            
                return $User
            }else{
                if (Confirm-MBSAction -Operation "Remove-MBSAPIUser" -Target "Remove user with ID: $ID and ALL USER-RELATED INFORMATION"){
                    Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Users+"/"+$ID))
                    Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): DELETE Request"
                    $User = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Users+"/"+$ID) -Method DELETE -Headers $headers -ContentType 'application/json'
                    return $User
                }
            }
        }else{
            if ($Force){
                Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Users+"/"+$ID+"/Account"))
                Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): DELETE Request"
                $User = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Users+"/"+$ID+"/Account") -Method DELETE -Headers $headers -ContentType 'application/json'            
            }else{
                if (Confirm-MBSAction -Operation "Remove-MBSAPIUser" -Target "Drop user with ID: $ID"){
                    Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Users+"/"+$ID+"/Account"))
                    Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): DELETE Request"
                    $User = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Users+"/"+$ID+"/Account") -Method DELETE -Headers $headers -ContentType 'application/json'
                    return $User
                }
            }
        }

    }
    
    end {
        
    }
}

# SIG # Begin signature block
