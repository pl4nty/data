<#
  .SYNOPSIS
  Returns list of updates that have been processed by System Update.

  .DESCRIPTION
  Reads the data from the Lenovo_Updates WMI class to display a
  history of updates that have been applied to the system using a
  System Update solution like Commercial Vantage, Lenovo System
  Update or Thin Installer. The latter two require -exporttowmi
  parameter to be used when executing the tool to trigger the
  writing of the history.

  The output includes the package ID, title, version, date installed

  .EXAMPLE
  Show-LnvUpdatesHistory

  .INPUTS

  .OUTPUTS

  .NOTES

#>


function Show-LnvUpdatesHistory {

    try {
        $updates = (Get-WmiObject -Namespace "root\Lenovo" -Class "Lenovo_Updates")
    }
    catch {
        Write-Error "Error accessing WMI class Lenovo_Updates.  Ensure that a System Update solution is installed or -exporttowmi parameter is used."
        return
    }
    if ($null -eq $updates)
    {
        Write-Output "No update history found."
        return
    } else {
        $updateHistory = [System.Collections.ArrayList]::new()
        foreach ($update in $updates) {
            $obj = New-Object PSObject -Property @{
                PackageID   = $update.PackageID
                Title       = $update.Title
                Version     = $update.Version
                DateInstalled = $update.InstallDate
                Status = $update.Status
                Severity = $update.Severity
                AdditionalInfo = $update.AdditionalInfo
            }
            $updateHistory.Add($obj) | Out-Null
        }
        $updateHistory | Sort-Object DateInstalled -Descending | Format-Table -AutoSize
    }
}

# SIG # Begin signature block
