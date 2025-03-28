function Get-MBSAPIHeader {
    <#
    .SYNOPSIS
    Get API request header with MBS token
    
    .DESCRIPTION
    Calls POST method to https://api.mspbackups.com/api/Provider/Login 
    
    .PARAMETER ProfileName
    Profile name
    
    .EXAMPLE
    Get-MBSAPIHeader -ProfileName $ProfileName
    
    .INPUTS
    None

    .OUTPUTS
    System.Management.Automation.PSCustomObject

    .NOTES
    Author: MSP360 Onboarding Team
    
    .LINK

    #>
    
    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$false, HelpMessage="The profile name, which must be unique.")]
        [string]
        $ProfileName
    )
    
    begin {
        if(-not $Global:APICred -and -not $ProfileName){
            Write-Error "API credentials are not set. Use Set-MBSAPICredential cmdlet to set credentials."
            break
        }elseif($ProfileName){
            if(-not (Test-Path -Path "$env:USERPROFILE\.mbs\$ProfileName.json")){
                Write-Error "API credentials profile cannot be found. Use Set-MBSAPICredential cmdlet to set credentials."
                break
            }
        }elseif($Global:APICred){
            if($Global:APICred.GetType().Name -ne "PSCredential"){
                Write-Error "API credentials have incorrect type. Use Set-MBSAPICredential cmdlet to set credentials."
                break
            }
        }
    }
    
    process {

        if ($ProfileName){
            $APICredLocal = Get-Content "$env:USERPROFILE\.mbs\$ProfileName.json" -Raw | ConvertFrom-Json | Select UserName,@{Name="Password";Expression={ConvertTo-SecureString $_.Password}}
            $APICredLocal = New-Object System.Management.Automation.PSCredential -ArgumentList @($APICredLocal.UserName, $APICredLocal.Password)
        }else{
            $APICredLocal = $APICred
        }

        $BodyProviderLogin = @{
            UserName = $APICredLocal.GetNetworkCredential().UserName
            Password = $APICredLocal.GetNetworkCredential().Password
        }
        $Login = Invoke-RestMethod -Method 'Post' -Uri (Get-MBSApiUrl).ProviderLogin -Body $BodyProviderLogin
        $headers = @{
            'Authorization' = "Bearer " + $Login.access_token
            '20' = "application/json"
        }
        return $headers
    }
    
    end {
        
    }
}

# SIG # Begin signature block
