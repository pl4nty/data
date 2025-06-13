<#
.SYNOPSIS
Stores list of available updates, based on machine type and OS input, into an updates database file (lnvUpdatesDatabase.json). The database consists of Machine Type, OS, CRC, and Available Updates. The updates come from the System Update catalog for the machine type & OS combination.

.DESCRIPTION
This cmdlet will populate the database file with the specified MT, OS and a list of the current updates available in that model's catalog. The database file will be saved by default to ProgramData\Lenovo\ClientScriptingModule unless the Path parameter is otherwise specified. If the updates database file does not exist, one will be created.

.PARAMETER MachineType
The four-character Machine Type to search for (e.g., "21DD").

.PARAMETER OS
Select from os options (e.g., "Win10", "Win11")

.PARAMETER ListPath
Set the file path for the json file to be stored. Or it will store by default at "C:\ProgramData\Lenovo\ClientScriptingModule\lnvUpdatesDatabase.json."

.EXAMPLE
Add-LnvMTOS -MachineType 11W2 -OS Win11 -Path "C:\ProgramData\Lenovo\ClientScriptingModule\lnvUpdatesDatabase.json"

.NOTES

#>

function Add-LnvMTOS {

    param (
        [ValidateLength(4,4)]
        [parameter(position = 0, Mandatory = $true, helpMessage = "Enter the four-character Machine Type to be added.")]
        [string]$MachineType,

        [ValidateSet("Win10", "Win11")]
        [parameter(position = 1, Mandatory = $true, helpMessage = “Specify the appropriate OS value.”)]
        [string]$OS,

        [parameter(position = 2, Mandatory = $false)][string]$ListPath
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

        # Define folder paths
        $baseFolderPath = "C:\ProgramData\Lenovo"
        $subFolderPath = Join-Path -Path $baseFolderPath -ChildPath "ClientScriptingModule"

        # Check and create base folder if it doesn't exist
        if (-Not (Test-Path -Path $baseFolderPath)) {
            New-Item -ItemType Directory -Path $baseFolderPath
        }

        # Check and create subfolder if it doesn't exist
        if (-Not (Test-Path -Path $subFolderPath)) {
            New-Item -ItemType Directory -Path $subFolderPath
        }

        # Check and create the file if it doesn't exist
        if (-Not (Test-Path -Path $ListPath)) {
            New-Item -ItemType File -Path $ListPath
            # Define the JSON structure
            $jsonContent = [Ordered]@{
                LastScanDate = ""
                Machines = @()
            }

            # Update the LastScanDate key pair
            $jsonContent.LastScanDate = (Get-Date).ToString("yyyy-MM-dd")

            # Convert the updated content to JSON format
            $jsonContent = $jsonContent | ConvertTo-Json -Depth 10

            # Write the JSON content to the file
            $jsonContent | Out-File -FilePath $ListPath

            Write-Output "JSON file was created at $ListPath"

            Write-Output "Use Add-LnvMTOS cmdlet to add machines to track updates."

        }

    }


    process{
        $crcUrl = "https://download.lenovo.com/catalog/$($MachineType)_$($OS)_DESC.xml"
        $packagesUrl = "https://download.lenovo.com/catalog/$($MachineType)_$($OS).xml"

        $MachineType = $MachineType.ToUpper()

        # Validate MachineType length
        if ($MachineType.Length -ne 4) {
            Write-Error "MachineType must be a string of exactly 4 characters."
            return
        }

        # Load existing jsonContent
        $jsonContent = Get-Content -Path $ListPath | ConvertFrom-Json

        # Check if the machine + OS pair already exists in json file
        $exists = [array]$jsonContent.Machines | Where-Object { $_.MachineType -eq $MachineType -and $_.OS -eq $OS }
        if ($exists) {
            Write-Output "Entry for $MachineType and $OS already exists in the jsonContent."
            continue
        }

        # Initialize arrays for storing the extracted data
        $AvailableUpdates = @()
        $CRC = @{}

        # Load the XML document to grab checksum node value
        try{
            [System.XML.XMLDocument]$xmlCrc = Get-LnvXmlFilePvt $crcUrl

            # Extract the checksum value
            $CRC = $xmlCrc.catalog.checksum.'#text'

        } catch {
            Write-Error "Failed to load CRC XML document: $_"
            exit
        }


        # Load the XML document to grab Package Updates
        try {

           [System.XML.XMLDocument]$xmlP = Get-LnvXmlFilePvt $packagesUrl

            # Add each package URL update to array list
            $packageNodes = $xmlP.SelectNodes("//packages/package/location")
            foreach ($package in $packageNodes) {
                $location = $package.InnerText
                $AvailableUpdates += $location
            }

        } catch {
            Write-Error "Failed to load XML document: $_"
            exit
        }


        # Create the new machine
        $newMachine = [Ordered]@{
            MachineType = $MachineType
            OS = $OS
            CRC =  $CRC
            AvailableUpdates = $AvailableUpdates #-join ", "
            }

        # Add the new machine object to the Machines array
        if (-not [array]$jsonContent.Machines) {
            $jsonContent.Machines = @()
        }
        [array]$jsonContent.Machines += $newMachine

        # Save the updated JSON data back to the file
        try{
            ## Set Depth bc default depth = 2 which gives a warning in powershell 7
            $jsonContent | ConvertTo-Json -Depth 10 | Set-Content -Path $ListPath
            Write-Output "MachineType: $MachineType and OS: $OS were saved to JSON file"
        } catch {
            Write-Error "Failed to save JSON file: $_"
            exit
        }

    }

}

# SIG # Begin signature block
