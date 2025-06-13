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
  Must be a string of machine type ids separated with commas and surrounded
  by double quotes (e.g., "21DD,21DE,21DF"). Although multiple machine types
  can be specified, it is recommended to keep the list small to reduce download
  times for all updates. If no value is specified, the machine type of the device
  running the script will be used.

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
  will be saved. Can use single quotes for literal paths or double quotes
  if path contains variables.

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
  Switch to use Lenovo CDN for package hosting.
  Cannot be used with RT5toRT3.

  .PARAMETER DeltaUpdate
  Mandatory: False
  Data type: Switch
  Downloads only new/changed packages since the last run.

  For the initial repository creation, it is recommended to run this cmdlet without the -DeltaUpdate parameter while
  specifying all Machine Type Models. Moving forward, the -DeltaUpdate parameter can be used to only download new updates
  since the last run. This will significantly reduce the download time and network traffic.

  If introducing a new Machine Type, it is recommended to append it to the original Machine Types list that was used
  when initially creating the repository, while also specifying the -DeltaUpdate parameter.

  .INPUTS
  None. Does not accept pipeline input.

  .OUTPUTS
  Creates repository folder structure with:
  - Package files in subfolders
  - database.xml catalog file
  - database.xsd schema file
  - Log file with operation details

  .EXAMPLE
  # Initial repository creation
  Get-LnvUpdatesRepo.ps1 -RepositoryPath 'C:\Repository' -MachineTypes "21DD,21DE,21DF" -PackageTypes "2,3,4" -RebootTypes "3,5" -RT5toRT3

  .EXAMPLE
  # Add new machine type to existing repo
  Get-LnvUpdatesRepo.ps1 -RepositoryPath 'C:\Repository' -MachineTypes "21DD,21DE,21DF,21DG" -PackageTypes "2,3,4" -RebootTypes "3,5" -RT5toRT3 -DeltaUpdate

  .EXAMPLE
  Get-LnvUpdatesRepo.ps1 -RepositoryPath 'C:\Repository' -PackageTypes "1,2" -RebootTypes "0,3"

  .EXAMPLE
  Get-LnvUpdatesRepo.ps1 -RepositoryPath 'Z:\21DD' -PackageTypes "1,2,3" -RebootTypes "0,3,5" -RT5toRT3

  .NOTES
#>
function Get-LnvUpdatesRepo
{
    #region Function parameters
    param (
        # Repository path for storing update files and metadata
        [Parameter(Mandatory = $true)]
        [System.String]
        $RepositoryPath,

        # Machine types to process (4-characters)
        [Parameter(Mandatory = $false)]
        [ValidateScript({
                $mtArray = $_ -split ',' | ForEach-Object { $_.Trim() }
                $mtArray | ForEach-Object {
                    if ($_ -notmatch '^[A-Z0-9]{4}$')
                    {
                        throw "Machine type '$_' is invalid. Must be 4 characters of letters and numbers only."
                    }
                }
                return $true
            })]
        $MachineTypes,

        [Parameter(Mandatory = $false)]
        [ValidateSet("10", "11")]
        [System.String]
        $WindowsVersion,

        [Parameter(Mandatory = $false)]
        [System.String]
        $PackageTypes,

        [Parameter(Mandatory = $false)]
        [System.String]
        $RebootTypes,

        [Parameter(Mandatory = $false)]
        [System.String]
        $Severities,

        [Parameter(Mandatory = $false)]
        [System.Management.Automation.SwitchParameter]
        $RT5toRT3,

        [Parameter(Mandatory = $false)]
        [System.String]
        $PackageList,

        [Parameter(Mandatory = $false)]
        [System.Management.Automation.SwitchParameter]
        $CloudRepo,

        [Parameter(Mandatory = $false)]
        [System.Management.Automation.SwitchParameter]
        $DeltaUpdate
    )
    #endregion

    #region Begin block
    begin
    {
        #region Variable Initialization
        $script:MachineTypesArray = $null
        $script:rt = @()
        $script:pt = @()
        $script:sv = @()
        $script:Packages = @()

        # Set RebootTypes
        if (-not [string]::IsNullOrWhiteSpace($RebootTypes))
        {
            $script:rt = $RebootTypes.Split(',')
        }
        else
        {
            $script:rt = @('0', '1', '3', '4', '5')
        }

        # Set PackageTypes
        if (-not [string]::IsNullOrWhiteSpace($PackageTypes))
        {
            $script:pt = $PackageTypes.Split(',')
        }
        else
        {
            $script:pt = @('1', '2', '3', '4')
        }

        # Set Severities
        if (-not [string]::IsNullOrWhiteSpace($Severities))
        {
            $script:sv = $Severities.Split(',')
        }
        else
        {
            $script:sv = @('0', '1', '2', '3')
        }

        # Set PackageList
        if (-not [string]::IsNullOrWhiteSpace($PackageList))
        {
            $PackageList = $PackageList.Replace(' ', '')
            $script:Packages = $PackageList.Split(',')
        }
        #endregion

        #region XML Schema Definition
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

        #region Logging functions
        function Write-LnvLog
        {
            Param(
                [Parameter(Mandatory = $true)]
                [ValidateSet("Information", "Warning", "Error")]
                [string]$Level,

                [Parameter(Mandatory = $true)]
                [string]$Message
            )

            $TimeStamp = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")
            $LogLine = "[LNV_{0}_{1}]: {2}" -f $Level.ToUpper(), $TimeStamp, $Message

            Out-File -FilePath "$LogPath" -InputObject $LogLine -Append -NoClobber
            return $LogLine
        }

        # Set logging paths
        $TimeStamp = Get-Date -Format "ddMMyyHHmmss"
        $LogFileName = "Get-LnvUpdatesRepo$(if ($DeltaUpdate) { '-Delta' })_$TimeStamp.log"
        $LogPath = Join-Path -Path $RepositoryPath -ChildPath $LogFileName

        # Remove the log file if DeltaUpdate is specified
        if ($DeltaUpdate)
        {
            if (Test-Path -Path $LogPath)
            {
                try
                {
                    Remove-Item -Path $LogPath -Force -ErrorAction SilentlyContinue
                }
                catch
                {
                    Write-Output "Failed to remove delta log file: $LogPath. Error: $_"
                }
            }
        }
        #endregion

        #region OS Version detection
        if (-not $WindowsVersion)
        {
            $WinVersion = (Get-CimInstance -Namespace root/cimv2 -ClassName Win32_OperatingSystem).Version
            switch -Regex ($WinVersion)
            {
                '10.0.1'
                {
                    $script:OS = "Win10"
                    $script:OSName = "Windows 10"
                }
                '10.0.2'
                {
                    $script:OS = "Win11"
                    $script:OSName = "Windows 11"
                }
                default
                {
                    Write-LnvLog -Level Warning -Message "Unknown Windows version: $WinVersion"
                }
            }
        }
        else
        {
            switch ($WindowsVersion)
            {
                '10'
                {
                    $script:OS = "Win10"
                    $script:OSName = "Windows 10"
                }
                '11'
                {
                    $script:OS = "Win11"
                    $script:OSName = "Windows 11"
                }
                default
                {
                    Write-LnvLog -Level Warning -Message "Unknown Windows version: $WindowsVersion"
                }
            }
        }
        #endregion
    }
    #endregion

    #region Process block
    process
    {
        try
        {
            # Confirm Parameters
            if ($CloudRepo -and $RT5toRT3)
            {
                throw "The -CloudRepo switch cannot be used with the -RT5toRT3 parameter"
            }
            if ($RepositoryPath)
            {
                $result = $RepositoryPath -match "^((?:~?\/)|(?:(?:\\\\\?\\)?[a-zA-Z]+\:))(?:\/?(.*))?$"

                if ($result -ne $True)
                {
                    Write-LnvLog -Level Error -Message "RepositoryPath parameter must be a properly formatted and fully qualified path to an existing folder where the local repository resides."
                    return
                }
            }

            if (-not $MachineTypes)
            {
                if ((Get-CimInstance -Namespace root/cimv2 -ClassName Win32_ComputerSystemProduct).Vendor.ToLower() -ne 'lenovo')
                {
                    Write-LnvLog -Level Warning "This script is only supported on Lenovo commercial PC products."
                    return
                }
                $TrimmedMachineType = (Get-CimInstance -Namespace root/cimv2 -ClassName Win32_ComputerSystemProduct).Name.Substring(0, 4).ToUpper().Trim()
                $script:MachineTypesArray = @($TrimmedMachineType)
            }
            else
            {
                # Split the input string and clean up each value
                $script:MachineTypesArray = $MachineTypes -split ',' |
                    ForEach-Object { $_.Trim().ToUpper() } |
                    Where-Object { $_ }
            }

            if ($script:MachineTypesArray.Length -eq 0)
            {
                Write-LnvLog -Level Warning -Message "MachineTypes parameter must contain at least one four character machine type of a Lenovo PC."
                return
            }

            <#
            What to do if repository folder already exists
            #TODO Add parameter to configure this behavior
            Comment and uncomment lines in the if clause below to achieve desired behavior.
            Check if the repository folder exists
            #>
            $RepositoryFolderExists = Test-Path -Path $RepositoryPath
            if ($RepositoryFolderExists)
            {
                if (-not $DeltaUpdate)
                {
                    # Repopulate each time with the latest content
                    Remove-Item $RepositoryPath -Recurse -ErrorAction SilentlyContinue
                }
                else
                {
                    Write-LnvLog -Level Information -Message "DeltaUpdate is enabled. Existing repository content will not be removed."

                    # Remove only database.xml and database.xsd files
                    $DatabaseFiles = @("database.xml", "database.xsd")
                    foreach ($File in $DatabaseFiles)
                    {
                        $FilePath = Join-Path -Path $RepositoryPath -ChildPath $File
                        if (Test-Path -Path $FilePath)
                        {
                            Remove-Item $FilePath -Force -ErrorAction SilentlyContinue
                            Write-LnvLog -Level Information -Message "Removed $FilePath for DeltaUpdate."
                        }
                    }
                }
            }

            # 1. Prepare repository location
            New-Item -ItemType Directory -Path $RepositoryPath -Force | Out-Null

            $RepositoryFolderExists = Test-Path -Path $RepositoryPath
            if (-not $RepositoryFolderExists)
            {
                Write-LnvLog -Level Error -Message "Failed to create folder at the following path $RepositoryPath"
                return
            }

            #region Database
            # 1.1 Create database.xsd file
            [System.XML.XMLDocument]$dbxsd = New-Object -TypeName System.Xml.XmlDocument
            $dbxsd.LoadXml($dbxsd_text)
            $DatabaseXsdPath = Join-Path -Path $RepositoryPath -ChildPath "database.xsd"
            $dbxsd.Save($DatabaseXsdPath)

            <#
            1.2 Create an XML document object to contain database.xml
            Array of severities to translate integer into string
            #>
            $Severities = @("None", "Critical", "Recommended", "Optional")

            # Initialize dbxml
            [System.XML.XMLDocument]$dbxml = New-Object -TypeName System.Xml.XmlDocument

            # Add the XML declaration
            $xmldecl = $dbxml.CreateXmlDeclaration("1.0", "UTF-8", $null)

            # Create the root element <Database>
            [System.XML.XMLElement]$dbxmlRoot = $dbxml.CreateElement("Database")
            $dbxml.InsertBefore($xmldecl, $dbxml.DocumentElement) | Out-Null
            $dbxml.AppendChild($dbxmlRoot) | Out-Null

            # Add the 'version' attribute to the <Database> element
            $dbxmlRoot.SetAttribute("version", "301") | Out-Null

            # Conditionally add the 'cloud' attribute
            if ($CloudRepo)
            {
                $dbxmlRoot.SetAttribute("cloud", "True") | Out-Null
            }
            #endregion

            # 2. Download the updates catalog from https://download.lenovo.com/catalog/<mt>_<os>.xml
            # Calculate progress percentages
            $script:mtcount = $script:MachineTypesArray.Count
            $script:mtportion = (100 / $script:mtcount) # Percentage per machine type
            $UrlTypeTable = @{}
            $Counter = 1
            foreach ($mt in $script:MachineTypesArray)
            {
                Write-Progress -Activity "Gathering packages to evaluate" -Status $mt -PercentComplete ($counter * $script:mtportion)
                if ($mt.Length -eq 4)
                {
                    $CatalogUrl = "https://download.lenovo.com/catalog/$mt`_$script:OS.xml"
                    $Catalog = Get-LnvXmlFilePvt -Url $CatalogUrl
                    if (-not $catalog)
                    {
                        Write-LnvLog -Level Error -Message "Failed to download the updates catalog from $catalogUrl. Check that $mt is a valid machine type."
                        return
                    }

                    # 2.1. Get URLs for package descriptors
                    $Updates = @{}
                    $PackagesUrls = $catalog.packages.package.location

                    foreach ($Url in $PackagesUrls)
                    {
                        $FileName = $Url.Substring($Url.LastIndexOf("/") + 1)
                        $SeparatorIndex = $FileName.IndexOf('.')
                        $PackageID = $FileName.Substring(0, $SeparatorIndex - 3)

                        $Updates.Add($PackageID, $Url)
                    }

                    $PackagesCount = $Updates.Count
                    Write-LnvLog -Level Information -Message("Found packages for $($mt): $($PackagesCount)")

                    if ($Updates.Count -eq 0)
                    {
                        Write-LnvLog -Level Error -Message "No updates found in the updates catalog"
                        return
                    }

                    if ($Updates.Count -ne 0)
                    {
                        # For each package, get package descriptor XML
                        foreach ($Item in $Updates.GetEnumerator())
                        {
                            $Url = $Item.Value
                            if ($UrlTypeTable.Keys -contains $Url)
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
                    Write-LnvLog -Level Warning -Message "Skipping $mt as it is not a valid machine type."
                }
            }
            Write-Progress -Completed -Activity "Gathering packages to evaluate"

            $Counter = 1
            foreach ($Url in $UrlTypeTable.Keys)
            {
                Write-Progress -Activity "Evaluating packages" -Id 1 -PercentComplete ($Counter / $UrlTypeTable.Keys.Count * 100.0)
                # Download package descriptor XML to this subfolder
                try
                {
                    [xml] $PkgXML = Get-LnvXmlFilePvt -Url $Url
                }
                catch
                {
                    Write-LnvLog -Level Error -Message "Failed to download the package descriptor from $Url"
                    continue
                }

                # Get real package ID from XML attribute
                try
                {
                    $PackageId = $PkgXml.Package.id
                }
                catch
                {
                    Write-LnvLog -Level Error -Message "Could not find package ID in package descriptor from $Url"
                    continue
                }
                Write-Progress -ParentId 1 -Activity "Evaluating package" -Status $PackageId -PercentComplete 0


                # Filter by PackageId if PackageList specified and filter by Package Type and Reboot Type
                if (
                    (($script:Packages.Count -eq 0) -or ($script:Packages.Contains($PackageId))) -and
                    ($script:rt -contains $PkgXML.Package.Reboot.type) -and
                    ($script:pt -contains $PkgXML.Package.PackageType.type) -and
                    ($script:sv -contains $PkgXML.Package.Severity.type)
                )
                {
                    <#
                    Save package xml
                    Create a subfolder using package ID as the folder name
                    #>
                    $PackagePath = Join-Path -Path $RepositoryPath -ChildPath $PackageId

                    if ($DeltaUpdate)
                    {
                        if (-not (Test-Path -Path $PackagePath))
                        {
                            Write-LnvLog -Level Information -Message "New update found. Creating folder at the following path $RepositoryPath$PackageId"
                        }
                    }

                    # Create the directory regardless of $DeltaUpdate
                    New-Item -ItemType Directory -Force $PackagePath | Out-Null

                    if (-not (Test-Path -Path $PackagePath))
                    {
                        Write-LnvLog -Level Error -Message "Failed to create folder at the following path $RepositoryPath\$PackageId"
                        continue
                    }
                }
                else
                {
                    $Counter++
                    continue
                }

                Write-LnvLog -Level Information -Message "Getting $PackageID..."

                # Gather data needed for dbxml
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

                #region Package Processing
                try
                {
                    # Validate XML exists and check DeltaUpdate conditions
                    if ($DeltaUpdate -and (Test-Path -Path $__localRepositoryPath))
                    {
                        <#
                        .DESCRIPTION
                        Handles existing XML files when DeltaUpdate is enabled:
                        - Checks if RT5toRT3 changes were already applied
                        - Validates XML versions
                        - Updates or preserves existing files based on conditions
                        #>
                        $existingXml = [xml](Get-Content -Path $__localRepositoryPath)

                        if ($RT5toRT3 -and $pkgXML.Package.Reboot.type -eq '5')
                        {
                            # Check if reboot type was already changed to 3
                            if ($existingXml.Package.Reboot.type -eq '3')
                            {
                                Write-LnvLog -Level Information -Message "Skipping download for $PackageID - RT5toRT3 change already applied."
                                $PkgXML = $existingXml # Use existing XML for database entry
                            }
                            else
                            {
                                # Download and modify XML
                (New-Object System.Net.WebClient).DownloadFile($Url, $__localRepositoryPath)
                                $xml = [xml](Get-Content -Path $__localRepositoryPath)
                                $xml.Package.Reboot.type = '3'
                                $xml.Save($__localRepositoryPath)
                                $PkgXML = $xml
                            }
                        }
                        elseif ($existingXml.Package.version -eq $pkgXML.Package.version)
                        {
                            Write-LnvLog -Level Information -Message "Skipping download for $PackageID - XML is current."
                            $PkgXML = $existingXml # Use existing XML for database entry
                        }
                        else
                        {
                            # Download new XML if versions don't match
                            (New-Object System.Net.WebClient).DownloadFile($Url, $__localRepositoryPath)
                        }
                    }
                    else
                    {
                        # Download new XML if file doesn't exist
                        (New-Object System.Net.WebClient).DownloadFile($Url, $__localRepositoryPath)

                        # Apply RT5toRT3 if needed
                        if (($RT5toRT3) -and ($PkgXML.Package.Reboot.type -eq '5'))
                        {
                            Write-LnvLog -Level Information -Message "Changing reboot type for $packageID"
                            $xml = [xml](Get-Content -Path $__localRepositoryPath)
                            $xml.Package.Reboot.type = '3'
                            $xml.Save($__localRepositoryPath)
                            $PkgXML = $xml
                        }
                    }
                }
                catch
                {
                    Write-LnvLog -Level Error -Message "Failed to save xml at the following path $__localRepositoryPath : $_"
                    continue
                }
                #endregion

                <#
                Load package descriptor XML and download each of the files referenced under the <Files> tag.
                Note that the files will be located at the same relative path as the package descriptor XML on https://download.lenovo.com/...
                #>
                $FileNameElements = @()
                $InstallerFile = @()
                $ReadmeFile = @()
                $ExternalFiles = @()

                $InstallerFile = $PkgXML.GetElementsByTagName("Files").GetElementsByTagName("Installer").GetElementsByTagName("File")
                try
                {
                    $ReadmeFile = $PkgXML.GetElementsByTagName("Files").GetElementsByTagName("Readme").GetElementsByTagName("File")
                }
                catch
                {
                    Write-LnvLog -Level Information -Message "No readme file specified."
                    # Continue on exception: No readme file specified.
                }

                Write-Progress -ParentId 1 -Activity "Evaluating package" -Status $PackageId -PercentComplete 33

                try
                {
                    $externalFiles = $pkgXML.GetElementsByTagName("Files").GetElementsByTagName("External").GetElementsByTagName("File")
                }
                catch
                {
                    Write-LnvLog -Level Information -Message "No external detection files specified."
                    # Continue on exception: No external detection files specified.
                }

                Write-Progress -ParentId 1 -Activity "Evaluating package" -Status $PackageId -PercentComplete 66

                if ($ReadmeFile) { $FileNameElements += $ReadmeFile }
                if ($ExternalFiles) { $FileNameElements += $ExternalFiles }

                $FileNameElements += $InstallerFile

                foreach ($Element in $FileNameElements)
                {
                    try
                    {
                        $FileName = $Element.GetElementsByTagName("Name").InnerText
                        $ExpectedFileSize = $Element.GetElementsByTagName("Size").InnerText
                        $ExpectedFileCRC = $Element.GetElementsByTagName("CRC").InnerText

                        $FileUrl = "$__url/$Filename"
                        $FileDestinationPath = [IO.Path]::Combine($RepositoryPath, $__packageID, $Filename)

                        # Skip download if CloudRepo is enabled
                        if ($CloudRepo)
                        {
                            Write-LnvLog -Level Information -Message "CloudRepo enabled. Skipping download for $Filename."
                            continue
                        }

                        # Validate existing files if DeltaUpdate is enabled
                        if ($DeltaUpdate -and (Test-Path -Path $FileDestinationPath))
                        {
                            try
                            {
                                Write-LnvLog -Level Information -Message "DeltaUpdate is enabled. Validating existing file at $FileDestinationPath."

                                #Check file size and CRC and delete the folder if they are not equal
                                $actualFileCRC = $(Get-FileHash -Path $FileDestinationPath -Algorithm SHA256).Hash
                                $actualFileSize = $(Get-Item -Path $FileDestinationPath).Length

                                if ($actualFileCRC -eq $ExpectedFileCRC -and $ExpectedFileSize -eq $actualFileSize)
                                {
                                    Write-LnvLog -Level Information -Message "File $Filename is valid. Skipping download."
                                    continue
                                }

                                else
                                {
                                    Write-LnvLog -Level Warning -Message "File $Filename is invalid or outdated. It will be re-downloaded."
                                    Remove-Item -Path $FileDestinationPath -Force -ErrorAction SilentlyContinue
                                }
                            }
                            catch
                            {
                                Write-LnvLog -Level Error -Message "Failed to validate or remove existing file $FileDestinationPath. Error: $_"
                                # Optionally, continue to download the file even if validation fails
                            }
                        }
                        else
                        {
                            # Download the file
                            Write-LnvLog -Level Information -Message "Downloading $Filename ($([math]::round($ExpectedFileSize / 1MB, 2)) MB)."
                            $fileDownloadParams = @{
                                Url              = $FileUrl
                                DestinationPath  = $FileDestinationPath
                                ExpectedFileSize = $ExpectedFileSize
                                ExpectedFileCRC  = $ExpectedFileCRC
                            }
                            $fileDownloadResult = Get-LnvFilePvt @fileDownloadParams

                            if (-not $fileDownloadResult) { throw "Failed to download or validate the file $Filename." }

                            Write-LnvLog -Level Information -Message "Downloaded $Filename successfully."
                            $__size += $ExpectedFileSize
                        }
                    }
                    catch
                    {
                        Write-LnvLog -Level Error -Message "Error processing file $($FileName): $_"
                        Write-LnvLog -Level Warning -Message "Deleting package $__packageID due to errors."
                        $PackageFolder = [IO.Path]::Combine($RepositoryPath, $__packageID)
                        Remove-Item $PackageFolder -Recurse -ErrorAction SilentlyContinue
                        $Counter++
                        continue
                    }
                }

                Write-LnvLog -Level Information -Message "$($__packageID) complete."
                Write-Progress -ParentId 1 -Activity "Evaluating package" -Status $PackageId -PercentComplete 100

                #region Database XML creation
                # Build xml elements for dbxml
                Write-LnvLog -Level Information -Message "Creating database entry for $__packageID"

                # Package root element
                $_package = $dbxml.CreateElement("Package")
                $_package.SetAttribute("id", $__packageID) | Out-Null
                $_package.SetAttribute("name", $__name) | Out-Null
                $_package.SetAttribute("description", $__description) | Out-Null

                # Package metadata elements
                $sub1 = $dbxml.CreateElement("FileName")
                $sub1text = $dbxml.CreateTextNode($__filename)
                $sub1.AppendChild($sub1text) | Out-Null

                $sub2 = $dbxml.CreateElement("Version")
                $sub2text = $dbxml.CreateTextNode($__version)
                $sub2.AppendChild($sub2text) | Out-Null

                $sub3 = $dbxml.CreateElement("ReleaseDate")
                # Format release date for database (MM/DD/YYYY)
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

                # System compatability
                $sub13 = $dbxml.CreateElement("SystemCompatibility")
                foreach ($mt in $UrlTypeTable[$url])
                {
                    $sub13sub = $dbxml.CreateElement("System")
                    $sub13sub.SetAttribute("mtm", $mt)
                    $sub13sub.SetAttribute("os", $script:OSName)
                    $sub13.AppendChild($sub13sub) | Out-Null
                }
                #endregion

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
                $Counter++
            }
        }
        catch
        {
            Write-LnvLog -Level Error -Message "Unexpected error occurred:`n $_"
            return
        }
    }
    #endregion

    #region End block
    end
    {
        # Only try to save database.xml if we have valid data
        if ($null -ne $dbxml -and $null -ne $dbxml.LastChild)
        {
            $DatabaseXmlPath = Join-Path -Path $RepositoryPath -ChildPath "database.xml"
            $dbxml.Save($DatabaseXmlPath)
            Write-Progress -Completed -Activity "Evaluating packages"

            if (-not $DeltaUpdate)
            {
                Write-LnvLog -Level Information -Message "Update packages downloaded."
            }
            else
            {
                Write-LnvLog -Level Information -Message "Delta update packages downloaded."
            }
        }
    }
    #endregion
}
# SIG # Begin signature block
