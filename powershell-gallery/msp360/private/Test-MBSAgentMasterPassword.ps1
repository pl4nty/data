function Test-MBSAgentMasterPassword {
    <#
    .SYNOPSIS
        Check if master password is enabled.

    .DESCRIPTION
        Check if master password is enabled in MBS backup agent CLI and is specified by user. Used by other cmdlets internally.

    .PARAMETER CheckMasterPassword
        Check if master password specified.

    .PARAMETER MasterPassword
        Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)

    .EXAMPLE
        PS C:\> Test-MBSAgentMasterPassword

    .EXAMPLE
        PS C:\> Test-MBSAgentMasterPassword -CheckMasterPassword -MasterPassword $MasterPassword

    .INPUTS
        None

    .OUTPUTS
        System.Boolean

    .NOTES
        Author: MSP360 Onboarding Team

    #>

    [cmdletbinding()]
    param(
        [Parameter(Mandatory=$false, HelpMessage="Check if master password specified")]
        [switch]
        $CheckMasterPassword,
        [Parameter(Mandatory=$false, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        [securestring]
        $MasterPassword
    )

    begin {

    }

    process {
        if ($Settings = (Get-MBSAgentSetting -ErrorAction SilentlyContinue)) {
            if (($Settings.MasterPassword -ne "") -And ($null -ne $Settings.MasterPassword)) {
                if ($Settings.UseMasterPasswordForCLI) {
                    if ($CheckMasterPassword) {
                        if (($null -ne $MasterPassword) -And ($MasterPassword.Length -ne 0)) {
                            #Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): Master password for CLI is enabled and specified"
                            return $true
                        } else {
                            #Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): Master password is not specified"
                            return $false
                        }
                    } else {
                        #Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): Master password for CLI is enabled"
                        return $true
                    }
                } else {
                    #Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): Master password for CLI is disabled"
                }
            } else {
                #Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): Master password is not set"
            }

            return $false
        }
    }

    end {

    }
}
# SIG # Begin signature block
