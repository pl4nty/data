<#
.SYNOPSIS
Displays the list of Machine Types and OS pairs from the lnvUpdatesDatabase.json file.

.DESCRIPTION
This cmdlet will read the json database (lnvUpdatesDatabase.json) and return the machine type and os. The json database file is created by the Add-LnvMTOS cmdlet.

.PARAMETER ListPath
File path where the json file is stored. Stored by default at "C:\ProgramData\Lenovo\ClientScriptingModule\lnvUpdatesDatabase.json."

.EXAMPLE
Get-LnvMTOSList -Path "C:\ProgramData\Lenovo\ClientScriptingModule\lnvUpdatesDatabase.json."

.NOTES
To add a machine, use the Add-LnvMTOS cmdlet. To remove a machine, use the Remove-MTOS cmdlet.

#>

function Get-LnvMTOSList{

    param (
        [parameter(position = 0, Mandatory = $false)]
        [string]$ListPath
    )

    begin{
        # Set a default path if -Path is not specified or is empty
        if (-not $ListPath -or $ListPath.Trim() -eq "") {
            $ListPath = "C:\ProgramData\Lenovo\ClientScriptingModule\lnvUpdatesDatabase.json"
            Write-Output "No path provided. Using default path: $ListPath"
        }

        # Validate the path
        $directory = Split-Path -Parent $ListPath
        if (-not (Test-Path -Path $directory)) {
            New-Item -ItemType Directory -Path $directoryPath -Force
            Write-Error "The specified path is not valid. Please enter a valid path."
            return
        }
    }
    process{

        if (Test-Path $ListPath) {
            # Load existing JSON Content
            $jsonContent = Get-Content -Raw -Path $ListPath | ConvertFrom-Json

            # Loop through each machine in the JSON file
            foreach ($machine in $jsonContent.Machines) {
                $machineType = $machine.MachineType
                $os = $machine.OS

                Write-Output "$machineType ($os)"
            }
        }else{
            Write-Output "The File does not exists. Use the Add-LnvMTOS cmdlet to add machines to the database."
        }
    }

}
# SIG # Begin signature block
