function Get-MBSAPIBilling {
    <#
    .SYNOPSIS
    Get Billing information for current month
    
    .DESCRIPTION
    Calls GET/PUT request to api/Billing or api/Billing/Details
    
    .PARAMETER UserID
    Specify to filter output by backup user ID.
    
    .PARAMETER CompanyName
    Specify to filter output by backup Company name.
    
    .PARAMETER Date
    Billing date. Date format "yyyy-MM-dd". If empty or not specified, MBS will set current month.
    
    .PARAMETER ProfileName
    Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)
    
    .EXAMPLE
    Get-MBSAPIBilling -ProfileName profile

    Get billing details for all users and current month.
    .EXAMPLE
    Get-MBSAPIBilling -UserID bf3206df-ad73-4cdc-96ad-d4e3afa66ebc -ProfileName profile -Date "2020-02-01"

    Get billing details for the specified user ID and date.
    .EXAMPLE
    Get-MBSAPIBilling -CompanyName "APITest" -ProfileName profile

    Get billing details for the specified company and current month.    
    
    .INPUTS
    System.Management.Automation.PSCustomObject
    String

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/get-mbsapibilling
    #>
    
    [CmdletBinding(DefaultParameterSetName='NoFilterOutput')]
    param (
        #
        [Parameter(Mandatory=$true, HelpMessage="UserID", ValueFromPipelineByPropertyName, ValueFromPipeline=$true, ParameterSetName='UserBillingDetails')]
        [string]$UserID,
        #
        [Parameter(Mandatory=$true, HelpMessage="Company Name", ValueFromPipelineByPropertyName, ValueFromPipeline=$true, ParameterSetName='CompanyBillingDetails')]
        [string]$CompanyName,
        #
        [Parameter(Mandatory=$false, HelpMessage="Date", ParameterSetName='UserBillingDetails')]
        [Parameter(Mandatory=$false, HelpMessage="Date", ParameterSetName='CompanyBillingDetails')]
        [string]$Date,
        #
        [Parameter(Mandatory=$false, HelpMessage="Common parameter", ParameterSetName='NoFilterOutput')]
        [switch]$NoFilterOutput=$true,
        #
        [string]
        $ProfileName
    )
    
    begin {
       
    }
    
    process {
        if ($UserID) {
            $UserPUT = @{
                UserID = $UserID
                Date = $Date
            }
            if (-not $Date){
                $UserPUT.Remove("Date")
            }
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + ((Get-MBSApiUrl).Billing +'/Details'))
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): PUT Request"
            [MBS.API.BillingDetails[]]$Billing = Invoke-RestMethod -Uri ((Get-MBSApiUrl).Billing +'/Details') -Method PUT -Body ($UserPUT|ConvertTo-Json) -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) -ContentType 'application/json' | Convert-PSObjectToHash
        }elseif ($CompanyName) {
            $CompanyPUT = @{
                CompanyName = $CompanyName
                Date = $Date
            }
            if (-not $Date){
                $CompanyPUT.Remove("Date")
            }
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + (Get-MBSApiUrl).Billing)
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): PUT Request"
            [MBS.API.Billing[]]$Billing = Invoke-RestMethod -Uri (Get-MBSApiUrl).Billing -Method PUT -Body ($CompanyPUT|ConvertTo-Json) -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) -ContentType 'application/json' | Convert-PSObjectToHash
        }elseif ($NoFilterOutput) {
            Write-Verbose -Message ("$($PSCmdlet.MyInvocation.MyCommand.Name): URL: " + (Get-MBSApiUrl).Billing)
            Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): GET Request"
            [MBS.API.Billing[]]$Billing = Invoke-RestMethod -Uri (Get-MBSApiUrl).Billing -Method Get -Headers (Get-MBSAPIHeader -ProfileName $ProfileName) | Convert-PSObjectToHash
        }else{
            Write-host "Incorrect parameters."
        }
        return $Billing
    }

    end {
        
    }
}

# SIG # Begin signature block
