<#
  .SYNOPSIS
  Searches for updates based on the machine type and os saved in the machine updates database file (lnvUpdatesDatabase.json).

  .DESCRIPTION
  This script allows users to search for updates for a specified machine type.
        -Compares CRC values
        -Requires users to enter at least a machine type
        -Can be called without paramters (default file path will be used to retrieve json file)
        -If new updates, CRC and LastScanDate value is updated

    Get-LnvUpdatesNotification displays a grid-view of the result by default. A single selected update can be
    returned when the grid-view is closed.

    Then it is possible to view the attributes of the update like this:

    MTOS        : 21CD + win10
    PackageID   : n3auj27w
    Title       : BIOS Update Utility - 10/11
    Version     : 1.48
    ReleaseDate : 2024-09-27
    Readme      : https://download.lenovo.com/pccbbs/mobiles/n3auj27w.html

    To get an object list of all the updates instead grid-view, specify -ListAll as a parameter

  .PARAMETER ListPath
  Set the file path for the json file to be stored. Or it will store by default at "C:\ProgramData\Lenovo\ClientScriptingModule\lnvUpdatesDatabase.json."

  .PARAMETER ListAll
    Mandatory: False

  .EXAMPLE
  Get-LnvUpdatesNotification -Path "C:\ProgramData\Lenovo\ClientScriptingModule\lnvUpdatesDatabase.json."

  .Example
  Get-LnvUpdatesNotification -ListAll

  .NOTES
  The Add-LnvMTOS command must be ran first to store machine details so that Get-LnvUpdatesNotification can check for updates.
#>

function Get-LnvUpdatesNotification {

    param (
        [parameter(position = 0, Mandatory = $false)]
        [string]$ListPath,
        [parameter(position = 1, Mandatory = $false )]
        [Switch] $ListAll
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
            # Set Depth bc default depth = 2 which gives a warning in powershell 7
            $jsonContent = $jsonContent | ConvertTo-Json -Depth 10

            # Write the JSON content to the file
            $jsonContent | Out-File -FilePath $ListPath

            Write-Output "JSON file was created at $ListPath"

            Write-Output "Use Add-LnvMTOS cmdlet to add machines to track updates."

        }

    }
    process{

        # Check if the file exists
        if (Test-Path $ListPath) {
            # Load existing JSON Content
            $jsonContent = Get-Content -Path $ListPath | ConvertFrom-Json

            # Get the total number of updates to process
                $newAvailableUpdates = @()
                $counter = 0
                $updatesFound = $false

                #Create table format to display information about the updates
                $tbl = New-Object System.Data.DataTable "Available Updates"
                $col0 = New-Object System.Data.DataColumn MTOS
                $col1 = New-Object System.Data.DataColumn PackageID
                $col2 = New-Object System.Data.DataColumn Title
                $col3 = New-Object System.Data.DataColumn Version
                $col4 = New-Object System.Data.DataColumn ReleaseDate
                $col5 = New-Object System.Data.DataColumn Readme

                $tbl.Columns.Add($col0)
                $tbl.Columns.Add($col1)
                $tbl.Columns.Add($col2)
                $tbl.Columns.Add($col3)
                $tbl.Columns.Add($col4)
                $tbl.Columns.Add($col5)


                # Loop through each machine in the JSON file
                foreach ($machine in $jsonContent.Machines) {
                    $machineType = $machine.MachineType
                    $os = $machine.OS
                    $crc = $machine.CRC
                    $availableUpdates = $machine.AvailableUpdates

                    # Define the description URL
                    $descUrl = "https://download.lenovo.com/catalog/$($machineType)_$($os)_DESC.xml"

                    [System.XML.XMLDocument]$xmlDesc = Get-LnvXmlFilePvt $descUrl #[xml]$descXml

                    # Get the CRC value from the description XML
                    $descCRC = $xmlDesc.SelectSingleNode("//catalog/checksum").InnerText

                    # Compare the CRC value with the JSON file
                    if ($descCRC -ne $crc) {
                        $updatesFound = $true

                        # Get the package locations from the description XML
                        $packageLocations = $xmlDesc.SelectNodes("//catalog/location") | ForEach-Object { $_.InnerText }

                        # Construct the package URLs
                        $catalogUpdates = $packageLocations | ForEach-Object { "https://download.lenovo.com/catalog/$_" }

                        # Find the update node in the description XML
                        [System.XML.XMLDocument]$xmlPackage = Get-LnvXmlFilePvt $catalogUpdates

                        # Extract the location node texts
                        $packageLocations = $xmlPackage.SelectNodes("//packages/package/location") | ForEach-Object { $_.InnerText }

                        # Find new updates and add to newAvailableUpdates list
                        $newUpdates = $packageLocations | Where-Object { $availableUpdates -notcontains $_ }#$packageLocations}
                        $newAvailableUpdates += $newUpdates

                        $totalUpdates = $newUpdates.Count
                        # Ensure $totalUpdates is greater than 0 to avoid division issues
                        if ($totalUpdates -eq 0) {
                            Write-Output "No updates to process."

                            continue
                        }

                        # Process new updates
                        foreach ($update in $newUpdates) {
                            # Download and parse the update XML
                            [System.XML.XMLDocument]$updateXml = Get-LnvXmlFilePvt $update

                            # Output the Package node attribute version, Desc node text, and ReleaseDate node text
                            $packageVersion = $updateXml.SelectSingleNode("//Package").version
                            $packageID = $updateXml.SelectSingleNode("//Package").id
                            $descText = $updateXml.SelectSingleNode("//Package/Title/Desc").InnerText
                            $releaseDate = $updateXml.SelectSingleNode("//Package/ReleaseDate").InnerText
                            $readme = $updateXml.SelectSingleNode("//Package/Files/Readme/File/Name").InnerText

                            $row = $tbl.NewRow()
                            $row.MTOS = "$machineType + $os"
                            $row.PackageID = $packageID
                            $row.Title = $descText
                            $row.Version = $packageVersion
                            $row.ReleaseDate = $releaseDate
                            $row.Readme = "https://download.lenovo.com/pccbbs/mobiles/$readme" #$readmeHyperlink

                            $tbl.Rows.Add($row)

                            # Increment counter and calculate progress
                            $counter++
                            $percent_complete = (($counter/$totalUpdates)*100)
                            # Ensure PercentComplete does not exceed 100
                            if ($percent_complete -gt 100) {
                                $percent_complete = 100
                            }
                            Write-Progress -Activity "Processing Updates" -Status "Processed $counter of $totalUpdates updates..." -PercentComplete $percent_complete


                        }
                        #Add new updates to the AvailableUpdates array in Json file and replace with new CRC value
                        $machine.AvailableUpdates += $newAvailableUpdates
                        $machine.CRC = $descCRC

                        # Save the updated JSON back to the file
                        $jsonContent | ConvertTo-Json -Depth 10 | Set-Content -Path $ListPath

                    }else{
                       #Write-Output "No updates were found for $machineType ($os)."
                    }

                }

                #Display output in list or datagridview based on parameter
                if ($ListAll) {
                    if ($tbl.Rows.Count -eq 0) {
                        $updatesFound = $false
                    } else {
                        return $tbl
                    }

                } else {
                    $selection = ($tbl | Out-GridView -OutputMode Single -Title 'Found updates')
                    if ($null -ne $selection) {
                        $selection

                        # Opens the Readme link that was clicked as "ok" in the default browser
                        if ($selection.Readme) {
                           Start-Process $selection.Readme
                        }
                    }
                }

                # Update the LastScanDate key pair
                $jsonContent.LastScanDate = (Get-Date).ToString("yyyy-MM-dd")

                # Save the updated JSON back to the file
                $jsonContent | ConvertTo-Json -Depth 10 | Set-Content -Path $ListPath

                if (-not $updatesFound) {
                    Write-Output "No updates were found."
                }

                Write-Output "The LastScanDate was updated."

        } else {

            Write-Output "The file does not exist at the specified path: $ListPath"

        }
    }
}

# SIG # Begin signature block
