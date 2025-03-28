<#
  .SYNOPSIS
  Get the latest Lenovo updates for specified machine types
  and store in an Update Retriever style local repository.

  .DESCRIPTION
  For instances where Update Retriever cannot be used to create the local
  repository or where full automation of the repository creation is desired.
  This cmdlet can be customized and executed on a regular basis to get the
  latest update packages.

  .PARAMETER MachineTypes
  Mandatory: False
  Data type: String
  Must be a string of machine type ids separated with comma and surrounded
  by single quotes. Although multiple machine types can be specified, it is
  recommended to keep the list small to reduce download times for all updates.
  If no value is specified, the machine type of the device running the script
  will be used.

  .PARAMETER WindowsVersion
  Mandatory: False
  Data type: String
  Must be a string of '10' or '11'. The default if no value is specified will
  be determined by the OS of the device the script is running on.

  .PARAMETER PackageTypes
  Mandatory: False
  Data type: String
  Must be a string of Package Type integers separated by commas and surrounded
  by single quotes. The possible values are:
  1: Application
  2: Driver
  3: BIOS
  4: Firmware

  The default if no value is specified will be all package types.

  .PARAMETER RebootTypes
  Mandatory: False
  Data type: String
  Must be a string of integers, separated by commas, representing the different
  boot types and surrounded by single quotes:
  0: No reboot required
  1: Forces a reboot (not recommended in a task sequence)
  3: Requires a reboot (but does not initiate it)
  4: Forces a shutdown (not used much anymore)
  5: Delayed forced reboot (used by many firmware updates)
  The default if no value is specified will be all RebootTypes.

  .PARAMETER RepositoryPath
  Mandatory: True
  Data type: string
  Must be a fully qualified path to the folder where the local repository
  will be saved. Must be surrounded by single quotes.

  .PARAMETER RT5toRT3
  Mandatory: False
  Data type: Switch
  Specify this parameter if you want to convert Reboot Type 5 (Delayed Forced
  Reboot) packages to be Reboot Type 3 (Requires Reboot). Only do this in
  task sequence scenarios where a Restart can be performed after the Thin
  Installer task. Use the -noreboot parameter on the Thin Installer command
  line to suppress reboot to allow the task sequence to control the restart.
  NOTE: This parameter can only be used when Thin Installer will be processing
  the updates in the repository. This parameter cannot be specified with -CloudRepo.

  .PARAMETER PackageList
  Mandatory: False
  Data type: String
  Specify a list of updates by their package IDs which can be obtained through Update
  Retriever. One or more updates can be specified, separated by a comma.

  .PARAMETER CloudRepo
  Mandatory: False
  Data type: Switch
  Configures the repository so that the actual packages are hosted on Lenovo's global
  Content Delivery Network. Only the repository database and package descriptors will
  be stored in the local directory or network share. This cannot be specified with -RT5toRT3.

  .EXAMPLE
  Get-LnvUpdatesRepo.ps1 -RepositoryPath 'C:\Program Files (x86)\Lenovo\ThinInstaller\Repository' -PackageTypes '1,2' -RebootTypes '0,3'

  .EXAMPLE
  Get-LnvUpdatesRepo.ps1 -RepositoryPath 'Z:\21DD' -PackageTypes '1,2,3' -RebootTypes '0,3,5' -RT5toRT3

  .INPUTS
  None.

  .OUTPUTS

  .NOTES

#>
function Get-LnvUpdatesRepo
{
    param (
        [Parameter(Mandatory = $True)]
        [string]$RepositoryPath,

        [Parameter(Mandatory = $False)]
        [string]$MachineTypes,

        [Parameter(Mandatory = $False)]
        [ValidateSet("10", "11")]
        [string]$WindowsVersion,

        [Parameter(Mandatory = $False)]
        [string]$PackageTypes,

        [Parameter(Mandatory = $False)]
        [string]$RebootTypes,

        [Parameter(Mandatory = $False)]
        [string]$Severities,

        [Parameter(Mandatory = $False)]
        [switch]$RT5toRT3,

        [Parameter(Mandatory = $False)]
        [string]$PackageList,

        [Parameter(Mandatory = $false)]
        [switch]$CloudRepo
    )

    #region globals
    #region XSD
    $dbxsd_text = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified">
    <xs:element name="Database">
            <xs:complexType>
                <xs:sequence>
                        <xs:element name="Package" type="PackageType" minOccurs="0" maxOccurs="unbounded"/>
                </xs:sequence>
                <xs:attribute name="version" use="required">
                    <xs:simpleType>
                        <xs:restriction base="xs:string"/>
                    </xs:simpleType>
                </xs:attribute>
                <xs:attribute name="cloud" type="xs:string" use="optional"/>
            </xs:complexType>
    </xs:element>
    <xs:element name="FileName">
            <xs:simpleType>
                <xs:restriction base="xs:string"/>
            </xs:simpleType>
    </xs:element>
    <xs:element name="LocalPath">
            <xs:simpleType>
                <xs:restriction base="xs:string"/>
            </xs:simpleType>
    </xs:element>
    <xs:element name="Mode">
            <xs:simpleType>
                <xs:restriction base="xs:string"/>
            </xs:simpleType>
    </xs:element>
    <xs:complexType name="PackageType">
            <xs:sequence>
                <xs:element ref="FileName"/>
                <xs:element ref="Version"/>
                <xs:element ref="ReleaseDate"/>
                <xs:element ref="Size"/>
                <xs:element ref="URL"/>
                <xs:element ref="Mode"/>
                <xs:element ref="Type"/>
                <xs:element ref="Status"/>
                <xs:element ref="PreviousStatus"/>
                <xs:element ref="LocalPath"/>
                <xs:element ref="Severity"/>
                <xs:element ref="DisplayLicense"/>
                <xs:element name="SystemCompatibility" type="SystemCompatibilityType"/>
            </xs:sequence>
            <xs:attribute name="id" use="required">
                <xs:simpleType>
                        <xs:restriction base="xs:string"/>
                </xs:simpleType>
            </xs:attribute>
            <xs:attribute name="name" use="required">
                <xs:simpleType>
                        <xs:restriction base="xs:string"/>
                </xs:simpleType>
            </xs:attribute>
            <xs:attribute name="description" use="required">
                <xs:simpleType>
                        <xs:restriction base="xs:string"/>
                </xs:simpleType>
            </xs:attribute>
    </xs:complexType>
    <xs:element name="PreviousStatus">
            <xs:simpleType>
                <xs:restriction base="xs:string">
                        <xs:enumeration value="Active"/>
                        <xs:enumeration value="Archived"/>
                        <xs:enumeration value="Test"/>
                        <xs:enumeration value="Draft"/>
                        <xs:enumeration value="Hidden"/>
                        <xs:enumeration value="Default"/>
                        <xs:enumeration value="None"/>
                </xs:restriction>
            </xs:simpleType>
    </xs:element>
    <xs:element name="ReleaseDate">
            <xs:simpleType>
                <xs:restriction base="xs:string"/>
            </xs:simpleType>
    </xs:element>
    <xs:element name="Size">
            <xs:simpleType>
                <xs:restriction base="xs:long"/>
            </xs:simpleType>
    </xs:element>
    <xs:element name="Status">
            <xs:simpleType>
                <xs:restriction base="xs:string">
                        <xs:enumeration value="Active"/>
                        <xs:enumeration value="Archived"/>
                        <xs:enumeration value="Test"/>
                        <xs:enumeration value="Draft"/>
                        <xs:enumeration value="Hidden"/>
                        <xs:enumeration value="Default"/>
                </xs:restriction>
            </xs:simpleType>
    </xs:element>
    <xs:element name="Severity">
            <xs:simpleType>
                <xs:restriction base="xs:string">
                        <xs:enumeration value="Critical"/>
                        <xs:enumeration value="Recommended"/>
                        <xs:enumeration value="Optional"/>
                        <xs:enumeration value="Default"/>
                </xs:restriction>
            </xs:simpleType>
    </xs:element>
    <xs:element name="DisplayLicense">
            <xs:simpleType>
                <xs:restriction base="xs:string">
                        <xs:enumeration value="Display"/>
                        <xs:enumeration value="NotDisplay"/>
                        <xs:enumeration value="Default"/>
                </xs:restriction>
            </xs:simpleType>
    </xs:element>
    <xs:complexType name="SystemType">
            <xs:attribute name="mtm" use="required">
                <xs:simpleType>
                        <xs:restriction base="xs:string"/>
                </xs:simpleType>
            </xs:attribute>
            <xs:attribute name="os" use="required">
                <xs:simpleType>
                        <xs:restriction base="xs:string"/>
                </xs:simpleType>
            </xs:attribute>
    </xs:complexType>
    <xs:complexType name="SystemCompatibilityType">
            <xs:sequence>
                <xs:element name="System" type="SystemType" minOccurs="0" maxOccurs="unbounded"/>
            </xs:sequence>
    </xs:complexType>
    <xs:element name="Type">
            <xs:simpleType>
                <xs:restriction base="xs:string">
                        <xs:enumeration value="Quest"/>
                        <xs:enumeration value="Local"/>
                </xs:restriction>
            </xs:simpleType>
    </xs:element>
    <xs:element name="URL">
            <xs:simpleType>
                <xs:restriction base="xs:string"/>
            </xs:simpleType>
    </xs:element>
    <xs:element name="Version">
            <xs:simpleType>
                <xs:restriction base="xs:string"/>
            </xs:simpleType>
    </xs:element>
</xs:schema>
"@
    #endregion

    #region Messages
    function Write-LogError
    {
        Param(
            [Parameter(Mandatory = $True)]
            [string]$Message
        )

        $logline = "[LNV_ERROR_$((Get-Date).ToString("yyyy-MM-ddTHH:mm:ss"))]: $Message"
        Out-File -FilePath "$LogPath" -InputObject $logline -Append -NoClobber -Force
        return $logline
    }

    function Write-LogWarning
    {
        Param(
            [Parameter(Mandatory = $True)]
            [string]$Message
        )
        $logline = "[LNV_WARNING_$((Get-Date).ToString("yyyy-MM-ddTHH:mm:ss"))]: $Message"
        Out-File -FilePath "$LogPath" -InputObject $logline -Append -NoClobber
        return $logline
    }

    function Write-LogInformation
    {
        Param(
            [Parameter(Mandatory = $True)]
            [string]$Message
        )
        $logline = "[LNV_INFORMATION_$((Get-Date).ToString("yyyy-MM-ddTHH:mm:ss"))]: $Message"
        Out-File -FilePath "$LogPath" -InputObject $logline -Append -NoClobber
        return $logline
    }

    #Log path
    #Get the current date and time
    $timestamp = Get-Date -Format "ddMMyyHHmmss"

    #Create the log file name
    $logFileName = "get-lnvupdatesepo_$timestamp.log"

    $LogPath = Join-Path -Path $RepositoryPath -ChildPath $logFileName

    #endregion

    #RebootTypes
    $script:MachineTypesArray = $null
    $script:rt = @()

    if (-not[string]::IsNullOrWhiteSpace($RebootTypes))
    {
        $script:rt = $RebootTypes.Split(',')
    }
    else
    {
        $script:rt = @('0', '1', '3', '4', '5')
    }

    #PackageTypes
    $script:pt = @()
    if (-not[string]::IsNullOrWhiteSpace($PackageTypes))
    {
        $script:pt = $PackageTypes.Split(',')
    }
    else
    {
        $script:pt = @('1', '2', '3', '4')
    }

    #Severeties
    $script:sv = @()
    if (-not[string]::IsNullOrWhiteSpace($Severities))
    {
        $script:sv = $Severities.Split(',')
    }
    else
    {
        $script:sv = @('0', '1', '2', '3')
    }

    #PackageList
    $script:Packages = @()
    if (-not[string]::IsNullOrWhiteSpace($PackageList))
    {
        $PackageList = $PackageList.Replace(' ', '')
        $script:Packages = $PackageList.Split(',')
    }

    #get OS - if not specified or not one of 11 or 10, then default to 10
    if ('' -eq $WindowsVersion)
    {
        $WinVersion = (Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_OperatingSystem).Version
        if ($WinVersion -match '10.0.1')
        {
            $script:OS = "Win10"
            $script:OSName = "Windows 10"
        }
        elseif ($WinVersion -match '10.0.2')
        {
            $script:OS = "Win11"
            $script:OSName = "Windows 11"
        }
    }
    elseif ($WindowsVersion -eq '10')
    {
        $script:OS = "Win10"
        $script:OSName = "Windows 10"
    }
    elseif ($WindowsVersion -eq '11')
    {
        $script:OS = "Win11"
        $script:OSName = "Windows 11"
    }

    #endregion

    try
    {
        #Confirm Parameters
        if ($CloudRepo -and $RT5toRT3)
        {
            throw "The -CloudRepo switch cannot be used with the -RT5toRT3 parameter"
        }
        if ($RepositoryPath)
        {
            $result = $RepositoryPath -match "^((?:~?\/)|(?:(?:\\\\\?\\)?[a-zA-Z]+\:))(?:\/?(.*))?$"

            if ($result -ne $True)
            {
                Write-LogError("RepositoryPath parameter must be a properly formatted and fully qualified path to an existing folder where the local repository resides.")
                return
            }
        }

        $trimmedMachineTypes = $MachineTypes.ToUpper().Trim()
        if ($trimmedMachineTypes -eq '')
        {
            if ((Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_ComputerSystemProduct).Vendor.ToLower() -ne 'lenovo')
            {
                Write-LogWarning("This script is only supported on Lenovo commercial PC products.")
                return
            }
            $trimmedMachineType = (Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_ComputerSystemProduct).Name.Substring(0, 4).ToUpper().Trim()
            $script:MachineTypesArray = $trimmedMachineType
        }
        else
        {
            $script:MachineTypesArray = $trimmedMachineTypes -split ',' -replace '^\s+|\s+$'
        }

        if ($script:MachineTypesArray.Length -eq 0)
        {
            Write-LogWarning("MachineTypes parameter must contain at least one four character machine type of a Lenovo PC.")
            return
        }

        # What to do if repository folder already exists
        #TODO Add parameter to configure this behavior
        # Comment and uncomment lines in the if clause below to achieve desired behavior.
        $repositoryFolderExists = Test-Path -Path $RepositoryPath
        if ($repositoryFolderExists -eq $True)
        {
            # repopulate each time with latest content
            Remove-Item $RepositoryPath -Recurse -ErrorAction SilentlyContinue

            # exit script and use existing repo
            #Write-LogInformation "Exiting script as repo already exists."
            #Exit
        }

        #1 Prepare repository location
        New-Item -ItemType Directory -Path $RepositoryPath -Force | Out-Null

        $repositoryFolderExists = Test-Path -Path $RepositoryPath
        if ($repositoryFolderExists -eq $False)
        {
            Write-LogError("Failed to create folder at the following path $RepositoryPath")
            return
        }

        #region Database
        #1.1 Create database.xsd file
        [System.XML.XMLDocument]$dbxsd = New-Object -TypeName System.Xml.XmlDocument
        $dbxsd.LoadXml($dbxsd_text)
        $databaseXsdPath = Join-Path -Path $RepositoryPath -ChildPath "database.xsd"
        $dbxsd.Save($databaseXsdPath)

        #1.2 Create an XML document object to contain database.xml
        #Array of severities to translate integer into string
        $severities = @("None", "Critical", "Recommended", "Optional")

        #Initialize dbxml
        [System.XML.XMLDocument]$dbxml = New-Object -TypeName System.Xml.XmlDocument

        #Add the XML declaration
        $xmldecl = $dbxml.CreateXmlDeclaration("1.0", "UTF-8", $null)

        #Create the root element <Database>
        [System.XML.XMLElement]$dbxmlRoot = $dbxml.CreateElement("Database")
        $dbxml.InsertBefore($xmldecl, $dbxml.DocumentElement) | Out-Null
        $dbxml.AppendChild($dbxmlRoot) | Out-Null

        #Add the 'version' attribute to the <Database> element
        $dbxmlRoot.SetAttribute("version", "301") | Out-Null

        #Conditionally add the 'cloud' attribute
        if ($CloudRepo)
        {
            $dbxmlRoot.SetAttribute("cloud", "True") | Out-Null
        }
        #endregion

        #2. Download the updates catalog from https://download.lenovo.com/catalog/<mt>_<os>.xml
        $script:mtcount = $script:MachineTypesArray.Count
        $script:mtportion = (100 / $script:mtcount)
        $UrlTypeTable = @{}
        $counter = 1
        foreach ($mt in $script:MachineTypesArray)
        {
            Write-Progress -Activity "Gathering packages to evaluate" -Status $mt -PercentComplete ($counter * $script:mtportion)
            if ($mt.Length -eq 4)
            {
                $catalogUrl = "https://download.lenovo.com/catalog/$mt`_$script:OS.xml"
                $catalog = Get-LnvXmlFilePvt -Url $catalogUrl
                if (-not($catalog))
                {
                    Write-LogError("Failed to download the updates catalog from $catalogUrl. Check that $mt is a valid machine type.")
                    return
                }

                #2.1. Get URLs for package descriptors
                $updates = @{}
                $packagesUrls = $catalog.packages.package.location

                foreach ($url in $packagesUrls)
                {
                    $filename = $url.Substring($url.LastIndexOf("/") + 1)
                    $separatorIndex = $filename.IndexOf('.')
                    $packageID = $filename.Substring(0, $separatorIndex - 3)

                    $updates.Add($packageID, $url)
                }

                $packagesCount = $updates.Count
                Write-LogInformation("Found packages for $($mt): $($packagesCount)")

                if ($updates.Count -eq 0)
                {
                    Write-LogError("No updates found in the updates catalog")
                    return
                }

                if ($updates.Count -ne 0)
                {
                    #For each package, get package descriptor XML
                    foreach ($item in $updates.GetEnumerator())
                    {
                        $url = $item.Value
                        if ($UrlTypeTable.Keys -contains $url)
                        {
                            $UrlTypeTable[$url] += $mt
                        }
                        else
                        {
                            $UrlTypeTable[$url] = @($mt)
                        }
                    }
                }
            }
            else
            {
                Write-LogWarning("Skipping $mt as it is not a valid machine type.")
            }
        }
        Write-Progress -Completed -Activity "Gathering packages to evaluate"

        $counter = 1
        foreach ($url in $UrlTypeTable.Keys)
        {
            Write-Progress -Activity "Evaluating packages" -Id 1 -PercentComplete ($counter / $UrlTypeTable.Keys.Count * 100.0)
            #Download package descriptor XML to this subfolder
            try
            {
                [xml] $pkgXML = Get-LnvXmlFilePvt -Url $url
            }
            catch
            {
                Write-LogError("Failed to download the package descriptor from $url")
                continue
            }

            #Get real package ID from XML attribute
            try
            {
                $packageId = $pkgXml.Package.id
            }
            catch
            {
                Write-LogError("Could not find package ID in package descriptor from $url")
                continue
            }
            Write-Progress -ParentId 1 -Activity "Evaluating package" -Status $packageId -PercentComplete 0


            #Filter by PackageId if PackageList specified and filter by Package Type and Reboot Type
            if ((($script:Packages.Count -eq 0) -or ($script:Packages.Contains($packageId))) -and ($script:rt -contains $pkgXML.Package.Reboot.type) -and ($script:pt -contains $pkgXML.Package.PackageType.type) -and ($script:sv -contains $pkgXML.Package.Severity.type))
            {
                #Save package xml
                #Create a subfolder using package ID as the folder name
                $packagePath = Join-Path -Path $RepositoryPath -ChildPath $packageId
                New-Item -ItemType "directory" -Force $packagePath | Out-Null

                $packageFolderExists = Test-Path -Path $packagePath
                if ($packageFolderExists -eq $False)
                {
                    Write-LogError("Failed to create folder at the following path $RepositoryPath\$packageId")
                    continue
                }
            }
            else
            {
                $counter++
                continue
            }

            Write-LogInformation("Getting $packageID...")

            #Gather data needed for dbxml
            $__packageID = $pkgXML.Package.id
            $__name = $pkgXML.Package.name
            $__description = $pkgXML.Package.Title.Desc.InnerText
            $__filename = $url.SubString($url.LastIndexOf('/') + 1)
            $__version = $pkgXML.Package.version
            $__releasedate = $pkgXML.Package.ReleaseDate
            #$__size = $pkgXML.Package.Files.Installer.File.Size
            $__size = 0
            $__url = $url.SubString(0, $url.LastIndexOf('/') + 1)
            $__localRepositoryPath = [IO.Path]::Combine($RepositoryPath, $__packageID, $__filename)
            $__localpath = [IO.Path]::Combine("\", $__packageID, $__filename)
            #$__severity = $severities[$pkgXML.Package.Severity.type]
            switch ($pkgXML.Package.Severity.type)
            {
                0 { $__severity = "Default" }
                1 { $__severity = "Critical" }
                2 { $__severity = "Recommended" }
                3 { $__severity = "Optional" }
                default { $__severity = "Default" }
            }

            try
            {
                (New-Object System.Net.WebClient).DownloadFile($url, $__localRepositoryPath)

                #alter Reboot Type 5 to 3 if RT5toRT3 is specified
                if (($RT5toRT3.IsPresent) -and ($pkgXML.Package.Reboot.type -eq '5'))
                {
                    Write-LogInformation("Changing reboot type for $packageID")
                    $xml = [xml](Get-Content -Path $__localRepositoryPath)
                    $xml.Package.Reboot.type = '3'
                    $xml.Save($__localRepositoryPath)
                }
            }
            catch
            {
                Write-LogError("Failed to save xml at the following path $__localRepositoryPath")
                continue
            }

            #Load package descriptor XML and download each of the files referenced under the <Files> tag.
            #Note that the files will be located at the same relative path as the package descriptor XML on https://download.lenovo.com/...
            $fileNameElements = @()
            $installerFile = @()
            $readmeFile = @()
            $externalFiles = @()

            $installerFile = $pkgXML.GetElementsByTagName("Files").GetElementsByTagName("Installer").GetElementsByTagName("File")
            try
            {
                $readmeFile = $pkgXML.GetElementsByTagName("Files").GetElementsByTagName("Readme").GetElementsByTagName("File")
            }
            catch
            {
                Write-LogInformation("No readme file specified.")
                #Continue on exception: No readme file specified.
            }

            Write-Progress -ParentId 1 -Activity "Evaluating package" -Status $packageId -PercentComplete 33

            try
            {
                $externalFiles = $pkgXML.GetElementsByTagName("Files").GetElementsByTagName("External").GetElementsByTagName("File")
            }
            catch
            {
                Write-LogInformation("No external detection files specified.")
                #Continue on exception: No external detection files specified.
            }

            Write-Progress -ParentId 1 -Activity "Evaluating package" -Status $packageId -PercentComplete 66

            if ($readmeFile) { $fileNameElements += $readmeFile }
            if ($externalFiles) { $fileNameElements += $externalFiles }

            $fileNameElements += $installerFile

            foreach ($element in $fileNameElements)
            {
                $filename = $element.GetElementsByTagName("Name").InnerText
                $expectedFileSize = $element.GetElementsByTagName("Size").InnerText
                $expectedFileCRC = $element.GetElementsByTagName("CRC").InnerText

                $fileUrl = $__url + "/" + $filename
                $fileDestinationPath = [IO.Path]::Combine($RepositoryPath, $__packageID, $filename)

                if (-not($CloudRepo))
                {
                    try
                    {
                        $fileDownloadParams = @{
                            Url              = $fileUrl
                            DestinationPath  = $fileDestinationPath
                            ExpectedFileSize = $expectedFileSize
                            ExpectedFileCRC  = $expectedFileCRC
                        }

                        $ExpectedFileSizeMB = [math]::round($ExpectedFileSize / 1Mb, 2)
                        Write-LogInformation "Downloading $filename ($ExpectedFileSizeMB MB)"
                        $fileDownloadResult = Get-LnvFilePvt @fileDownloadParams
                    }
                    catch
                    {
                        Write-LogError($_)
                    }
                }

                #Delete the package folder if one of the files did not download or the size or CRC is invalid
                if ($fileDownloadResult -eq $false)
                {
                    Write-LogWarning("Failed to download the file $__url/$filename. Package $__packageID will be deleted")
                    $packageFolder = [IO.Path]::Combine($RepositoryPath, $__packageID)
                    Remove-Item $packageFolder -Recurse
                    $counter++
                    return
                }
                else
                {
                    $__size += $expectedFileSize
                    Write-LogInformation("Downloaded $filename")
                }
            }

            Write-LogInformation("$($__packageID) complete.")
            Write-Progress -ParentId 1 -Activity "Evaluating package" -Status $packageId -PercentComplete 100

            #Build xml elements for dbxml
            $_package = $dbxml.CreateElement("Package")
            $_package.SetAttribute("id", $__packageID) | Out-Null
            $_package.SetAttribute("name", $__name) | Out-Null
            $_package.SetAttribute("description", $__description) | Out-Null

            $sub1 = $dbxml.CreateElement("FileName")
            $sub1text = $dbxml.CreateTextNode($__filename)
            $sub1.AppendChild($sub1text) | Out-Null

            $sub2 = $dbxml.CreateElement("Version")
            $sub2text = $dbxml.CreateTextNode($__version)
            $sub2.AppendChild($sub2text) | Out-Null

            $sub3 = $dbxml.CreateElement("ReleaseDate")
            $dateparts = $__releasedate.Split('-')
            $urdate = "{0}/{1}/{2}" -f $dateparts[1].TrimStart('0'), $dateparts[2], $dateparts[0]
            $sub3text = $dbxml.CreateTextNode($urdate)
            $sub3.AppendChild($sub3text) | Out-Null

            $sub4 = $dbxml.CreateElement("Size")
            $sub4text = $dbxml.CreateTextNode($__size)
            $sub4.AppendChild($sub4text) | Out-Null

            $sub5 = $dbxml.CreateElement("URL")
            $sub5text = $dbxml.CreateTextNode($__url)
            $sub5.AppendChild($sub5text) | Out-Null

            $sub6 = $dbxml.CreateElement("Mode")
            $sub6text = $dbxml.CreateTextNode("")
            $sub6.AppendChild($sub6text) | Out-Null

            $sub7 = $dbxml.CreateElement("Type")
            $sub7text = $dbxml.CreateTextNode("Quest")
            $sub7.AppendChild($sub7text) | Out-Null

            $sub8 = $dbxml.CreateElement("Status")
            $sub8text = $dbxml.CreateTextNode("Active")
            $sub8.AppendChild($sub8text) | Out-Null

            $sub9 = $dbxml.CreateElement("PreviousStatus")
            $sub9text = $dbxml.CreateTextNode("None")
            $sub9.AppendChild($sub9text) | Out-Null

            $sub10 = $dbxml.CreateElement("LocalPath")
            $sub10text = $dbxml.CreateTextNode($__localpath)
            $sub10.AppendChild($sub10text) | Out-Null

            $sub11 = $dbxml.CreateElement("Severity")
            $sub11text = $dbxml.CreateTextNode($__severity)
            $sub11.AppendChild($sub11text) | Out-Null

            $sub12 = $dbxml.CreateElement("DisplayLicense")
            $sub12text = $dbxml.CreateTextNode("NotDisplay")
            $sub12.AppendChild($sub12text) | Out-Null

            $sub13 = $dbxml.CreateElement("SystemCompatibility")
            foreach ($mt in $UrlTypeTable[$url])
            {
                $sub13sub = $dbxml.CreateElement("System")
                $sub13sub.SetAttribute("mtm", $mt)
                $sub13sub.SetAttribute("os", $script:OSName)
                $sub13.AppendChild($sub13sub) | Out-Null
            }

            #Set details for the update and populate database.xml
            $_package.AppendChild($sub1) | Out-Null
            $_package.AppendChild($sub2) | Out-Null
            $_package.AppendChild($sub3) | Out-Null
            $_package.AppendChild($sub4) | Out-Null
            $_package.AppendChild($sub5) | Out-Null
            $_package.AppendChild($sub6) | Out-Null
            $_package.AppendChild($sub7) | Out-Null
            $_package.AppendChild($sub8) | Out-Null
            $_package.AppendChild($sub9) | Out-Null
            $_package.AppendChild($sub10) | Out-Null
            $_package.AppendChild($sub11) | Out-Null
            $_package.AppendChild($sub12) | Out-Null
            $_package.AppendChild($sub13) | Out-Null

            $dbxml.LastChild.AppendChild($_package) | Out-Null
            $counter++
        }

        #3. Write dbxml file
        $databaseXmlPath = Join-Path -Path $RepositoryPath -ChildPath "database.xml"
        $dbxml.Save($databaseXmlPath)

        Write-LogInformation("Update packages downloaded.")
        Write-Progress -Completed -Activity "Evaluating packages"
    }
    catch
    {
        Write-LogError("Unexpected error occurred:`n $_")
        return
    }
}

# SIG # Begin signature block
