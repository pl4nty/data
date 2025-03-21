function Remove-MBSAPIComputerData {
    <#
    .SYNOPSIS
    Deletes specified user computer data from cloud. Data will be deleted during the day.
    
    .DESCRIPTION
    Calls DELETE request to api/Users/{userId}/Computers.
    
    .PARAMETER UserID
    Backup user ID.
    
    .PARAMETER DestinationId
    Cloud destination ID. Use Get-MBSApiStorageAccountDestination to list backup storage destinations.
    
    .PARAMETER ComputerName
    Computer name
    
    .PARAMETER Force
    Force delete. Confirmation is disabled.
    
    .PARAMETER ProfileName
    Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Remove-MBSAPIComputerData -UserID 7c7044bb-313b-4b1b-900e-76d652246f4d -DestinationId 1f342fb4-0775-4ae8-9c63-a2d5955752b6 -ComputerName MyComputer -Force -ProfileName MyProfile
    
    Delete backed up to cloud data for specified user ID, Destination and ComputerName

    .INPUTS
    System.Management.Automation.PSCustomObject

    .OUTPUTS
    String

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/remove-mbsapicomputerdata
    #>
    

    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$true, HelpMessage="User ID", ValueFromPipelineByPropertyName)]
        [string]$UserID,
        #
        [Parameter(Mandatory=$true, HelpMessage="Destination Id", ValueFromPipelineByPropertyName)]
        [string]$DestinationId,
        #
        [Parameter(Mandatory=$true, HelpMessage="Computer Name", ValueFromPipelineByPropertyName)]
        [string]$ComputerName,
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
        $ComputerDelete = @(
            @{
            DestinationId = $DestinationId
            ComputerName = $ComputerName
            }
        )
        if ($Force){
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Users+"/"+$UserID+"/Computers"))
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): DELETE Request: " + ($ComputerDelete | ConvertTo-Json))
            $ComputerData = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Users+"/"+$UserID+"/Computers") -Method DELETE -Headers $headers -Body (ConvertTo-Json -InputObject $ComputerDelete) -ContentType 'application/json'          
            return $ComputerData
        }else{
            if (Confirm-MBSAction -Operation "Remove-ComputerData" -Target "Remove computer data for the user with ID: $UserID"){
                Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Users+"/"+$UserID+"/Computers"))
                Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): DELETE Request: " + ($ComputerDelete | ConvertTo-Json))
                $ComputerData = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Users+"/"+$UserID+"/Computers") -Method DELETE -Headers $headers -Body (ConvertTo-Json -InputObject $ComputerDelete) -ContentType 'application/json'
                return $ComputerData
            }
        }
    }
    
    end {
        
    }
}

# SIG # Begin signature block
