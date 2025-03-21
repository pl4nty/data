function Import-MBSUsers {
    <#
    .Synopsis
    The cmdlet imports users from CSV file to MBS via API 2.0 
    .DESCRIPTION
    The cmdlet imports users from CSV file to MBS via API 2.0 
    .PARAMETER APIlogin
    Mandatory parameter. Specify MSB API login name. You can generate new one in General settings https://mspbackups.com/Admin/Settings.aspx

    .PARAMETER APIpassword
    Mandatory parameter. Specify MSB API password. You can generate new one in General settings https://mspbackups.com/Admin/Settings.aspx

    .PARAMETER LogFilePath
    Optional parameter. Specify log file path. The script uses \api.log by default.

    .PARAMETER UserFile
    Optional parameter. Specify user csv file path. The script uses \Users.csv by default.

    .EXAMPLE
        .\Import-Users.ps1 -APIlogin VFBB634wKpHQ -APIpassword ggH9ng6ertrB445BPDQQwU3
    .EXAMPLE
        .\Import-Users.ps1 -APIlogin VFBB634wKpHQ -APIpassword ggH9ng6ertrB445BPDQQwU3 -UserFile Users.csv -LogFilePath Mylog.txt
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://kb.msp360.com/managed-backup-service/add-users-and-companies-to-MBS-in-bulk
    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True)]
        [string]$APIlogin,
        [Parameter(Mandatory=$True)]
        [string]$APIpassword,
        [string]$LogFilePath = "api.log",
        [string]$UserFile = "Users.csv")

    $versionMinimum = [Version]'3.0'

    if ($versionMinimum -le $PSVersionTable.PSVersion)
    { 
        Write-HostAndLog -Message "*********** The script has started ****************" -FilePath $LogFilePath
        
        #Magic
        if (Test-Path $UserFile){
            $UrlUsers = (Get-MBSApiUrl).Users
            $UrlProviderLogin = (Get-MBSApiUrl).ProviderLogin
            $BodyProviderLogin = @{
                UserName = $APIlogin 
                Password = $APIpassword
            }
            $Login = Invoke-RestMethod -Method 'Post' -Uri $UrlProviderLogin -Body $BodyProviderLogin 
            $headers = @{
                'Authorization' = "Bearer " + $Login.access_token
                'Accept' = "application/json"
            }
            Write-HostAndLog -Message ($headers|ConvertTo-Json) -FilePath $LogFilePath -showMessage $false
            $UsersCSV = Import-Csv -Path $UserFile
            $i=0
            $UsersCSV | ForEach-Object{
                Write-Progress -Activity "Adding users to MBS" -Id 1 -PercentComplete (($i/$UsersCSV.Length)*100) -CurrentOperation $_.Email
                Write-HostAndLog -Message ("Adding user "+$_.Email) -FilePath $LogFilePath
                $NotificationEmailsArray = $_.'NotificationEmails' -split ';'
                $UsersPost = @{
                    Email = $_.'Email'.Trim()
                    FirstName =  $_.'FirstName'
                    LastName =  $_.'LastName'
                    NotificationEmails = @($NotificationEmailsArray)
                    Company =  $_.'Company'.Trim()
                    Enabled =  $_.'Enabled'
                    Password =  $_.'Password'
                    SendEmailInstruction =  $_.'SendEmailInstruction'
                }
                Write-HostAndLog -Message ($UsersPost|ConvertTo-Json) -FilePath $LogFilePath -showMessage $false
                $UsersResponse = Invoke-RestMethod -Uri $UrlUsers -Method POST -Headers $headers -Body ($UsersPost|ConvertTo-Json) -ContentType 'application/json'
                Write-HostAndLog -Message ("Response: "+$UsersResponse) -FilePath $LogFilePath
                $i++
            }
        }else{
            Write-HostAndLog -Message "Cannot find file $UserFile" -FilePath $LogFilePath
        }
        
        Write-HostAndLog -Message "*********** The script has finished ****************" -FilePath $LogFilePath
    }else{
        "This script requires PowerShell $versionMinimum. Update PowerSheel https://docs.microsoft.com/en-us/powershell/scripting/install/installing-windows-powershell?view=powershell-6#upgrading-existing-windows-powershell"
        
    }
}

# SIG # Begin signature block
