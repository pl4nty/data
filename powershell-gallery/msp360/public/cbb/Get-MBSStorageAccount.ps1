function Get-MBSStorageAccount {
    <#
    .SYNOPSIS
        Get MBS storage accounts assigned to the MBS agent
    .DESCRIPTION
        Get MBS storage accounts assigned to the MBS agent
    .EXAMPLE
        PS C:\> Get-MBSStorageAccount | ft
        Get all assigned storage accounts
    .EXAMPLE
        PS C:\> Get-MBSStorageAccount -ID 92ad7b17-9e2a-41bb-b0e6-c11d60fe9c63
        Get storage account by ID
    .EXAMPLE
        PS C:\> Get-MBSStorageAccount -Name "Oracle Cloud"
        Get all assigned storage accounts
    .INPUTS
        None
    .OUTPUTS
        MBS.Agent.StorageAccount
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/get-mbsstorageaccount
    #>

    param(
        [Parameter(Mandatory=$false, HelpMessage="Storage account ID")]
        [string]$ID,
        [Parameter(Mandatory=$false, HelpMessage="Storage account name")]
        [string]$Name
    )

    begin {
        if (-not($CBB = Get-MBSAgent)) {
            Break
        }
    }

    process {
        if ($CBBProgramData = $CBB.CBBProgramData) {
            if (Test-Path -Path "$CBBProgramData\enginesettings.list" -PathType leaf) {
                $StorageAccountsArray = @()
                try {
                    $enginesettings = [xml](Get-Content ("$CBBProgramData\enginesettings.list"))
                    foreach ($Account in ($enginesettings.EngineSettings.Accounts.BaseConnection)){
                        if($ID){
                            if($ID -eq $Account.ID){
                                $StorageAccountsArray += Convert-ToMBSType -MBSType MBS.Agent.StorageAccount -object (Convert-XMLtoPSObject $Account)
                            }
                        }elseif($Name){
                            if($Name -eq $Account.DisplayName){
                                $StorageAccountsArray += Convert-ToMBSType -MBSType MBS.Agent.StorageAccount -object (Convert-XMLtoPSObject $Account)
                            }
                        }else{
                            $StorageAccountsArray += Convert-ToMBSType -MBSType MBS.Agent.StorageAccount -object (Convert-XMLtoPSObject $Account)
                        }
                    }
                    return $StorageAccountsArray
                }
                catch {
                    Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): ""enginesettings.list"" is incorrect format"
                }
            } else {
                Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): ""enginesettings.list"" is missing in folder ""$CBBProgramData"""
            }
        }
    }

    end {

    }
}

# SIG # Begin signature block
