function Set-MBSAPICredential {
    <#
    .SYNOPSIS
    Saves MBS API credentials 

    .DESCRIPTION
    Saves provided credentials to temp variable or local profile.
    
    .PARAMETER UserName
    API Login name. Generate new one on https://mspbackups.com/Admin/Settings.aspx
    
    .PARAMETER Password
    API Password. Generate new one on https://mspbackups.com/Admin/Settings.aspx
    
    .PARAMETER StoreAs
    Profile name. Specify to save credentials securely to local file. File is stored in %USERPROFILE%\.mbs folder. 
    
    .EXAMPLE
    Set-MBSAPICredential -UserName MyUser -Password MyPassword -StoreAs MyProfile

    .INPUTS
    None

    .OUTPUTS
    None

    .NOTES
    Author: MSP360 Onboarding Team

    .LINK
    https://mspbackups.com/AP/Help/powershell/cmdlets/api/set-mbsapicredential
    #>
    

    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$true, HelpMessage="API User Name")]
        [string]
        $UserName,
        #
        [Parameter(Mandatory=$true, HelpMessage="API Password")]
        [String]
        $Password,
        #
        [Parameter(Mandatory=$false, HelpMessage="The profile name, which must be unique.")]
        [string]
        $StoreAs
    )
    
    begin {
        
    }
    
    process {
        $Global:APICred = New-Object -typename PSCredential -ArgumentList @($UserName,(ConvertTo-SecureString -String $Password -AsPlainText -Force))

        if ($StoreAs) {
            if (-not (Test-Path "$env:USERPROFILE\.mbs")){
                $Folder = New-Item -Path "$env:USERPROFILE" -Name ".mbs" -ItemType "directory" -ErrorAction SilentlyContinue
            }
            $Global:APICred | Select-Object Username,@{Name="Password";Expression = { $_.password | ConvertFrom-SecureString }} | ConvertTo-Json | Out-File "$env:USERPROFILE\.mbs\$StoreAs.json" -Force
        }
    }
    
    end {
        
    }
}

# SIG # Begin signature block
