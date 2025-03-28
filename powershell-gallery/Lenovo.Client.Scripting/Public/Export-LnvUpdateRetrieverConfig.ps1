<#
  .SYNOPSIS
  Exports the settings for Update Retriever from the registry

  .DESCRIPTION
  Generates a .reg file containing an export of the Update Retriever settings
  found at:
  HKLM\Software\Wow6432Node\Lenovo\Update Retriever\Preferences\UserSetting\General

  These settings include the local repository path that was last used and the list
  of models in the Systems list that can be searched for in Update Retirever.

  .PARAMETER Outfile
  Mandatory: True
  Specifies the file that will be created. The file will be created with .reg
  extension.

  .EXAMPLE
  Export-LnvUpdateRetrieverConfig -Outfile C:\users\admin\Downloads\urconfig

  .INPUTS

  .OUTPUTS

  .NOTES

#>
function Export-LnvUpdateRetrieverConfig {
    param (
        [parameter(Mandatory = $true)]
        [string]$Outfile
    )

    $Path = "HKLM:\SOFTWARE\WOW6432Node\Lenovo\Update Retriever"

    if (Test-Path -Path $Path -ErrorAction Stop) {
        Write-Output -InputObject "Update Retriever key exists..."
    }
    else {
        Write-Warning -Message "Update Retriever is not installed..."
        return
    }

    $Key = Get-ChildItem -Path (Join-Path -Path (Join-Path -Path $Path -ChildPath "Preferences") -ChildPath "UserSettings") | Where-Object { $_.Name -match "General" }

    $Outfile = $Outfile.Split('.')[0]

    try {
        Write-Output -InputObject "Exporting Update Retriever Configuration as a .reg file..."
        Invoke-Command { reg.exe export $Key "$($Outfile).reg" /y }
    }
    catch {
        Write-Warning -Message $_.Exception.Message
        return
    }
}

# SIG # Begin signature block
