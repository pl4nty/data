function Import-MBSAPIUser {
    <#
    .Synopsis
    Import users from CSV file to MBS via API 2.0

    .DESCRIPTION
    The cmdlet imports users from CSV file to MBS via API 2.0. For more information, see https://kb.msp360.com/managed-backup-service/add-users-and-companies-to-MBS-in-bulk

    .PARAMETER UserFile
    Specify user csv file path. The script uses .\Users.csv by default.

    .PARAMETER GeneratePassword
    Generate random password (8 symbols long) for users with blank password fields.

    .PARAMETER Force
    Import users without errors from CSV file. By default, in case of any errors in CSV file no users will be imported.

    .PARAMETER ProfileName
	Profile name used with MSP360 PowerShell for MBS API (set via Set-MBSApiCredential)

    .EXAMPLE
        Import-MBSAPIUser -GeneratePassword

        Imports users from file "Users.csv" in current folder. If no password specified for user in CSV file, it will be generated.

    .EXAMPLE
        Import-MBSAPIUser -UserFile "D:\Users.csv" -Force

        Imports users from file "D:\Users.csv" to MBS. In case of errors, only users with correct information will be imported.

    .INPUTS
        None

    .OUTPUTS
        None

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/import-mbsapiuser
    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false, HelpMessage="Full path to user CSV file. By default, "".\Users.csv"".")]
        [string]
        $UserFile = "$((Get-Location).Path)\Users.csv",
        #
        [Parameter(Mandatory=$false, HelpMessage="Generate random password if no password specified for user in CSV file.")]
        [switch]
        $GeneratePassword,
        #
        [Parameter(Mandatory=$false, HelpMessage="Import users without errors from CSV file.")]
        [switch]
        $Force,
        #
        [Parameter(Mandatory=$false, HelpMessage="The profile name, which must be unique.")]
        [string]
        $ProfileName
    )
    
    begin {
        if (Test-Path $UserFile) {
            Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): File ""$UserFile"" found."
            $headers = Get-MBSAPIHeader -ProfileName $ProfileName
        } else {
            Write-Error -Message "Cannot find file ""$UserFile"""
            Break
        }
    }

    process {
        [array]$UsersCSV = Import-Csv -Path $UserFile
        Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Checking contents of ""$UserFile"" for errors..."
        $UsersCSV | ForEach-Object {$i = 0; $HasErrors = $False; $SuccessIndexList = [System.Collections.ArrayList]@()} {
            $Errors = "Found errors in line ["+($i+2)+"]: "
            if (-Not ($_.Email)) {
                $Errors += ' Email (empty) '
                $HasErrors = $True
            }
            if (-Not ($_.Enabled)) {
                $Errors += ' Enabled (empty) '
                $HasErrors = $True
            }
            if ((-Not ($_.Password)) -And (-Not ($GeneratePassword))) {
                $Errors += ' Password (empty)'
                $HasErrors = $True
            } elseif (($_.Password) -And ($_.Password.Length -lt 6)) {
                $Errors += ' Password (length less than 6 symbols)'
                $HasErrors = $True
            }
            if (-Not ($_.SendEmailInstruction)) {
                $Errors += ' SendEmailInstruction (empty) '
                $HasErrors = $True
            }
            if (-Not ($HasErrors)) {
                $SuccessIndexList.Add($i) | Out-Null
            } else {
                Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): $Errors"
            }
            $i++
            $HasErrors = $False
        }

        if ((($SuccessIndexList.Count -eq $UsersCSV.Count) -Or (($SuccessIndexList.Count -gt 0) -And ($Force))) -And ($UsersCSV.Count -gt 0)) {
            $CurrentDateTime = -join (('{0:d4}' -f ((Get-Date).Year)), ('{0:d2}' -f ((Get-Date).Month)), ('{0:d2}' -f ((Get-Date).Day)), ('{0:d2}' -f ((Get-Date).Hour)), ('{0:d2}' -f ((Get-Date).Minute)), ('{0:d2}' -f ((Get-Date).Second)))
            $ExportPath = ($UserFile.Substring(0, $UserFile.LastIndexOf('\'))) + "\ImportedUsers_" + $CurrentDateTime + ".csv"
            $SuccessIndexList | ForEach-Object {$i = 0} {
                Write-Progress -Activity "Adding users to MBS" -Id 1 -PercentComplete (($i/$SuccessIndexList.Count)*100) -CurrentOperation ($UsersCSV[$_].'Email')
                Write-Host "Adding user ""$($UsersCSV[$_].'Email')"""
                $NotificationEmailsArray = $UsersCSV[$_].'NotificationEmails' -split ';'
                if ((-Not ($UsersCSV[$_].'Password')) -And ($GeneratePassword)) {
                    $PasswordChars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".tochararray()
                    $Password = ($PasswordChars | Get-Random -Count 8) -Join ''
                } else {
                    $Password = $UsersCSV[$_].'Password'
                }
                $UsersPost = @{
                    Email = $UsersCSV[$_].'Email'.Trim()
                    FirstName =  $UsersCSV[$_].'FirstName'
                    LastName =  $UsersCSV[$_].'LastName'
                    NotificationEmails = @($NotificationEmailsArray)
                    Company =  $UsersCSV[$_].'Company'.Trim()
                    Enabled =  $UsersCSV[$_].'Enabled'
                    Password =  $Password
                    SendEmailInstruction =  $UsersCSV[$_].'SendEmailInstruction'
                }
                $UsersResponse = Invoke-RestMethod -Uri (Get-MBSApiUrl).Users -Method POST -Headers $headers -Body ($UsersPost|ConvertTo-Json) -ContentType 'application/json'
                Write-Host "Response: $UsersResponse"
                $i++
                if ($GeneratePassword) {
                    $UsersPostObject = New-Object -TypeName PSObject
                    $UsersPostObject | Add-Member -MemberType NoteProperty -Name Email -Value ($UsersPost.Get_Item("Email"))
                    $UsersPostObject | Add-Member -MemberType NoteProperty -Name FirstName -Value ($UsersPost.Get_Item("FirstName"))
                    $UsersPostObject | Add-Member -MemberType NoteProperty -Name LastName -Value ($UsersPost.Get_Item("LastName"))
                    $UsersPostObject | Add-Member -MemberType NoteProperty -Name NotificationEmails -Value ($UsersCSV[$_].'NotificationEmails')
                    $UsersPostObject | Add-Member -MemberType NoteProperty -Name Company -Value ($UsersPost.Get_Item("Company"))
                    $UsersPostObject | Add-Member -MemberType NoteProperty -Name Enabled -Value ($UsersPost.Get_Item("Enabled"))
                    $UsersPostObject | Add-Member -MemberType NoteProperty -Name Password -Value ($UsersPost.Get_Item("Password"))
                    $UsersPostObject | Add-Member -MemberType NoteProperty -Name SendEmailInstruction -Value ($UsersPost.Get_Item("SendEmailInstruction"))
                    Export-CSV -InputObject $UsersPostObject -Path $ExportPath -NoTypeInformation -Append
                }
            }
            if ($GeneratePassword) {
                Write-Host "List of imported users has been exported to: ""$ExportPath"""
            }
        } elseif (($SuccessIndexList.Count -gt 0) -And (-Not ($Force))) {
            Write-Error -Message "Nothing imported. There was a number of incorrect lines in CSV file. You can view the errors by running the script with ""-Verbose"" parameter. If you want to import at least correct lines from CSV file, use ""-Force"" parameter."
        } elseif ($UsersCSV.Count -eq 0) {
            Write-Error -Message "Nothing imported. CSV file is empty."
        } else {
            Write-Error -Message "Nothing imported. This may happen if there were no correct lines in CSV file."
        }
    }

    end {

    }
}

# SIG # Begin signature block
