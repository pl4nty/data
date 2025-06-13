<#
.SYNOPSIS
Removes updates, based on machine type and os input, from the machine updates
database (lnvUpdatesDatabase.json).

.DESCRIPTION
This cmdlet requires the appropriate parameters such as machine type, os, and
path. If the ListPath is not specified the default path will be searched. If
specified MT+OS pair is found in the database file, it will be removed.
If the MT+OS pair is not found, it will return a message indicating that no
machine was found with the specified criteria.


.PARAMETER MachineType
Mandatory: True
Data Type: String
Description: The four-character Machine Type to search for (e.g., "21DD").

.PARAMETER OS
Mandatory: True
Data Type: String
Description: The operating system to search for.
Use tab complete to select from OS options ("Win10", "Win11").

.PARAMETER ListPath
Set the file path where the json file is stored. Or it will searh by default
at "C:\ProgramData\Lenovo\ClientScriptingModule\lnvUpdatesDatabase.json."

.EXAMPLE
Remove-LnvMTOS -MachineType 11W2 -OS Win11 -Path "C:\ProgramData\Lenovo\ClientScriptingModule\lnvUpdatesDatabase.json"

.NOTES
The json database file is created by the Add-LnvMTOS cmdlet. Use it to add
models and their current updates to the json file.
#>

function Remove-LnvMTOS {

    [CmdletBinding(SupportsShouldProcess)]
    param (
        [ValidateLength(4,4)]
        [parameter(position = 0, Mandatory = $true, helpMessage = "Enter the four-character Machine Type to be removed.")]
        [string]$MachineType,

        [ValidateSet("Win10", "Win11")]
        [parameter(position = 1, Mandatory = $true, helpMessage = "Specify the appropriate OS value.")]
        [string]$OS,

        [parameter(position = 2, Mandatory = $false)]
        [string]$ListPath
    )

    Begin{
        # Set a default path if -Path is not specified or is empty
        if (-not $ListPath -or $ListPath.Trim() -eq "") {
            $ListPath = "C:\ProgramData\Lenovo\ClientScriptingModule\lnvUpdatesDatabase.json"
            Write-Output "No path provided. Using default path: $ListPath"
        }

        # Ensure the file name is always 'lnvUpdatesDatabase.json'
        $fileName = "lnvUpdatesDatabase.json"
        if (-Not ($ListPath -like "*$fileName")) {
            $ListPath = Join-Path -Path (Split-Path -Path $ListPath -Parent) -ChildPath $fileName
        }


        # Validate the path
        $directory = Split-Path -Parent $ListPath
        if (-not (Test-Path -Path $directory)) {
            New-Item -ItemType Directory -Path $directory -Force
            Write-Error "The specified path is not valid. Please enter a valid path."
            return
        }
    }

    Process{
        if (Test-Path $ListPath) {
            # Load existing JSON Content
            $jsonContent = Get-Content -Raw -Path $ListPath | ConvertFrom-Json

            # Remove objects with specific criteria (e.g., MachineType = "20ED" and OS = "Win11")
            $originalMachineCount = $jsonContent.Machines.Count
            [array]$jsonContent.Machines = [array]$jsonContent.Machines | Where-Object {
                $_.MachineType -ne $MachineType -or $_.OS -ne $OS
            }

            # Ensure Machines is always treated as an array
            #if ($jsonContent.Machines -isnot [System.Collections.ArrayList]) {
             #   $jsonContent.Machines = @($jsonContent.Machines) # Wrap in an array if it's not already
            #}

            # Convert the modified object back to JSON
            $updatedJson = $jsonContent | ConvertTo-Json -Depth 10

            # Save the updated JSON back to the file
            Set-Content -Path $ListPath -Value $updatedJson

            # Check if any machines were removed
            if ($originalMachineCount -eq $jsonContent.Machines.Count) {
                Write-Output "No machine found with MachineType: $MachineType and OS: $OS"
            } else {
                Write-Output "Removed MachineType: $MachineType and OS: $OS"
            }


        }else{
            Write-Output "The File does not exists. Use the Add-LnvMTOS cmdlet to add machines to the database."
        }
    }



}
# SIG # Begin signature block
