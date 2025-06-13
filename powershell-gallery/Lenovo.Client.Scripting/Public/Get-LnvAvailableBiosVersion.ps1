<#
  .SYNOPSIS
  Gets the current BIOS version available in the catalog.

  .DESCRIPTION
  If you specify a machine type, the cmdlet will return the version of the
  currently available BIOS update. If no machine type is specified, the
  cmdlet will use the running system's machine type and will compare the
  version of the currently available update to the version of the system and
  return an alert if the update is newer. The -Download switch can be used to
  trigger the download of the current update in either case. The package will
  be downloaded to the env:TEMP folder location unless -DownloadPath is
  specified. The -ReadMe switch can be used to display the ReadMe for the BIOS
  update.

  .PARAMETER MachineType
  Mandatory: False
  Specify a four-character machine type.

  .PARAMETER WindowsVersion
  Mandatory: False
  Specify the Windows version ("10" or "11").

  .PARAMETER ReadMe
  Mandatory: False
  Display the ReadMe file for the BIOS package if available.

  .PARAMETER Download
  Mandatory: False
  Download the BIOS package if available.

  .PARAMETER DownloadPath
  Mandatory: False
  Path to download package to. Defaults to $env:TEMP folder

  .EXAMPLE
  Get-LnvAvailableBiosVersion -MachineType 21DD -Download

  .NOTES
  OS is strictly optional as generally one BIOS update package is released for
  both Windows 10 and 11.
  Updated in 2.3.0 to support new single-capsule updates with System Firmware Versions

#>
function Get-LnvAvailableBiosVersion
{
    param (
        [ValidateLength(4, 4)]
        [parameter(Mandatory = $false, Position = 0, HelpMessage = "Enter the four-character Machine Type")]
        [string]$MachineType,

        [parameter(Mandatory = $false, Position = 1)]
        [ValidateSet("10", "11")]
        [string]$WindowsVersion,

        [parameter(Mandatory = $false)]
        [Switch]$ReadMe,

        [parameter(Mandatory = $false)]
        [Switch]$Download,

        [parameter(Mandatory = $false)]
        [string]$DownloadPath = "$env:TEMP"
    )

    # Determine Windows version if not specified
    $script:WindowsVersion2 = if ([string]::IsNullOrWhiteSpace($WindowsVersion)) { "win11" } else { "win" + $WindowsVersion }

    $script:isSelf = $false
    if ([string]::IsNullOrWhiteSpace($MachineType))
    {
        $script:isSelf = $true
        $MachineType = Get-LnvMachineType
        $BiosVersion = Get-LnvBiosVersion -Format 'decimal'
    }

    # Build Catalog URLs
    $win11CatalogUrl = "https://download.lenovo.com/catalog/$MachineType`_$WindowsVersion2.xml"
    $win10CatalogUrl = "https://download.lenovo.com/catalog/$MachineType`_win10.xml"

    # Function to retrieve package URLs from a catalog
    function Get-PackageUrl
    {
        param ([string]$CatalogUrl)

        try
        {
            [System.Xml.XmlDocument]$CatalogXml = Get-LnvXmlFilePvt $CatalogUrl
            $PackageUrls = $CatalogXml.packages.ChildNodes | Where-Object { $_.category -match "BIOS UEFI" } | ForEach-Object { $_.location }
            return $PackageUrls
        }
        catch
        {
            Write-Error "Failed to retrieve or parse catalog at ${CatalogUrl}: $_"
            return
        }
    }

    function Get-LnvSFWBiosVersion
    {
        param (
            [parameter(Mandatory = $true)]
            [string]$ReadmeUrl
        )

        $readme = (New-Object System.Net.WebClient).DownloadString($ReadmeUrl)
        # Use regular expression to find the version number for System Firmware
        $regex = [regex]::Match($readme, '(\d+\.\d+)&nbsp;&nbsp;\(UEFI BIOS\)')
        if ($regex.Success) {
            $systemFirmwareVersion = $regex.Groups[1].Value

            return $systemFirmwareVersion
        }
    }

    # Retrieve package URLs from catalogs
    $PackageUrls = Get-PackageUrl -CatalogUrl $win11CatalogUrl
    if (-not $PackageUrls)
    {
        Write-Output "No BIOS update found in Windows 11 catalog, checking Windows 10 catalog..."
        $PackageUrls = Get-PackageUrl -CatalogUrl $win10CatalogUrl
    }

    # Handle cases where no packages are found
    if (-not $PackageUrls)
    {
        Write-Output "No BIOS packages found in either catalog."
        return
    }

    # Process each package URL
    foreach ($Url in $PackageUrls)
    {
        try
        {
            [System.Xml.XmlDocument]$PackageXml = Get-LnvXmlFilePvt $Url
            if (-not $PackageXml)
            {
                Write-Output "Invalid or missing XML for $Url."
                continue
            }

            $baseUrl = $Url.Substring(0, $Url.LastIndexOf('/') + 1)
            $PackageExe = $baseUrl + $PackageXml.Package.Files.Installer.File.Name
            $PackageTitle = $PackageXml.Package.Title.Desc.InnerText
            if ($PackageTitle.StartsWith("System Firmware", [System.StringComparison]::OrdinalIgnoreCase)) {
                $PackageReadme = $baseUrl + $PackageXml.Package.Files.ReadMe.File.Name
                $PackageVersion = Get-LnvSFWBiosVersion -ReadmeUrl $PackageReadme
            } else {
                $PackageVersion = $PackageXml.Package.version
            }

            $ReleaseDate = $PackageXml.Package.ReleaseDate

            # ThinkCentre/ThinkStation have full BIOS image name with hex build number in package XML version attribute, need to convert to decimal for comparison.
            if ($PackageExe -like "*jy*")
            {
                $PackageVersionHex = "0x" + $PackageVersion.SubString(5,2)
                $PackageVersion = "1." + [Convert]::ToInt32($PackageVersionHex, 16)
            }
            else
            {
                $PackageVersion = $PackageVersion.Substring(0,4)
            }

            # If running on the same machine, compare versions
            if ($script:isSelf)
            {
                if ($BiosVersion -lt $PackageVersion)
                {
                    Write-Output "Installed version: $BiosVersion"
                    Write-Output "Available version: $PackageVersion released $ReleaseDate"
                }
                else
                {
                    Write-Output "BIOS is current: $BiosVersion"
                }
            }
            else
            {
                Write-Output "Available version: $PackageVersion released $ReleaseDate"
            }

            # Display the ReadMe file
            if ($ReadMe)
            {
                if ($PackageXml.Package.Files.Readme.File.Name)
                {
                    $readmeUrl = $baseUrl + $PackageXml.Package.Files.Readme.File.Name
                    try
                    {
                        Write-Output "Opening ReadMe file..."
                        Start-Process -FilePath $readmeUrl -ErrorAction SilentlyContinue
                    }
                    catch
                    {
                        Write-Error "Failed to open ReadMe file from $readmeUrl. Error: $($_.Exception.Message)"
                    }
                }
                else
                {
                    Write-Output "ReadMe not found for this package."
                }
            }
            # Download the package if requested
            if ($Download)
            {
                try
                {
                    # Build the destination path
                    $dest = Join-Path -Path $DownloadPath -ChildPath $PackageXml.Package.Files.Installer.File.Name

                    # Attempt the download
                    Invoke-WebRequest -Uri $PackageExe -OutFile $dest -ErrorAction Stop

                    Write-Output "Downloaded BIOS package to $dest"
                    Write-Output "To view the ReadMe file, use the -ReadMe parameter."
                }
                catch
                {
                    # Catch any errors during the download process
                    Write-Error "Failed to download BIOS package from $PackageExe. Error: $($_.Exception.Message)"
                }
            }
        }
        catch
        {
            Write-Error "Error processing package URL ${Url}: $_"
        }
    }
}
# SIG # Begin signature block
