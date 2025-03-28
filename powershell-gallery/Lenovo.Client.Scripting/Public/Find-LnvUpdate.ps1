<#
    .Synopsis
    Finds available updates based on the System Update content

    .Description
        This script allows users to search for updates for a specified machine type.
        -Defaults to Windows 10 updates
        -Requires users to enter at least a machine type
        -Can be called without identifiers so long as you use the right order
        -PackageType can be:
            1: Application
            2: Driver
            3: Bios
            4: Firmware
        -RebootType can be:
            0: No reboot required
            1: Forced reboot (update itself initiates the reboot)
            3: Requires reboot (Thin Installer/System Update/CV initiates the reboot)
            4: Forces shutdown (update itself initiates shutdown)
            5: Delayed forced reboot (used for firmware, Thin Installer/System Update/CV will enforce reboot with
               dialog displaying count-down timer)

        -Severity can be:
            1: Critical
            2: Recommended
            3: Optional

        Note: 9 can be used for these three parameters to represent 'All'. Multiples can be combined
        by seperating with comma, for example:  "2,3,4" or "1,5" or "1,2"

        Find-LnvUpdate displays a grid-view of the result by default. A single selected update can be
        returned when the grid-view is closed. Therefore, execute the following to display the
        search results and then capture the selected update object:
            > $update = Find-LnvUpdate -MachineType 21DD -WindowsVersion 11

        Then it is possible to view the attributes of the update like this:
            > $update

        ID          : n3jw605w
        Name        : Qualcomm Bluetooth Driver - 11 (21H2 or later)
        Category    : Bluetooth and Modem
        Version     : 2.0.0.775
        ReleaseDate : 2023-07-19
        PackageType : 2
        Reboot      : 3
        Severity    : 2
        Descriptor  : https://download.lenovo.com/pccbbs/mobiles/n3jw605w_2_.xml
        PackageExe  : https://download.lenovo.com/pccbbs/mobiles/n3jw605w.exe

        It is then possible to get the executable or the package descriptor like this:
            > start $update.Descriptor

        To get an object list of all the updates, specify -ListAll

	.PARAMETER MachineType
	Mandatory: True

	.PARAMETER PackageType
	Mandatory: False

	.PARAMETER RebootType
	Mandatory: False

	.PARAMETER Severity
	Mandatory: False

	.PARAMETER WindowsVersion
	Mandatory: False

	.PARAMETER PackageID
	Mandatory: False

    .PARAMETER ListAll
    Mandatory: False

    .Example
        -Find-LnvUpdate -MachineType 20C1 -PackageType 2 -RebootType 1 -WindowsVersion 11 -ListAll

    .Example
        -Find-LnvUpdates 20C1 2

    .Example
        -Find-LnvUpdate 20C1 -PackageType 2
#>
function Find-LnvUpdate {
    param (
        [ValidateLength (4,4)]
        [parameter(position = 0, Mandatory = $true, helpMessage = "Enter the four-charcter Machine Type")] [String] $MachineType,
        [parameter(position = 1, Mandatory = $false )][ValidateSet("1","2","3","4","9")]
        [String] $PackageType = "9",
        [parameter(position = 2, Mandatory = $false )][ValidateSet("0","1","3","4","5","9")]
        [String] $RebootType = "9",
        [parameter(position = 3, Mandatory = $false )][ValidateSet("1","2","3","9")]
        [String] $Severity = "9",
        [parameter(position = 4, Mandatory = $false )][ValidateSet("10","11")]
        [String] $WindowsVersion = "10",
        [parameter(position = 5, Mandatory = $false )][String] $PackageID = "",
        [parameter(position = 6, Mandatory = $false )][Switch] $ListAll
    )

    $url_1 = "http://download.lenovo.com/catalog/" + $MachineType + "_win" + $WindowsVersion + ".xml"

    try {
        [xml]$systemUpdates_1 = Get-LnvXmlFilePvt $url_1
    }
    catch {
        Write-Output $_
        return
    }

    $locations_1 = $systemUpdates_1.packages.package.location
    $categories_1 = $systemUpdates_1.packages.package.category

    #Create table format to display information about the updates
    $tbl = New-Object System.Data.DataTable "Available Updates"
    $col0 = New-Object System.Data.DataColumn ID
    $col1 = New-Object System.Data.DataColumn Name
    $col2 = New-Object System.Data.DataColumn Category
    $col3 = New-Object System.Data.DataColumn Version
    $col4 = New-Object System.Data.DataColumn PackageType
    $col5 = New-Object System.Data.DataColumn Reboot
    $col6 = New-Object System.Data.DataColumn Severity
    $col7 = New-Object System.Data.DataColumn Descriptor
    $col8 = New-Object System.Data.DataColumn PackageExe
    $col9 = New-Object System.Data.DataColumn ReleaseDate

    $tbl.Columns.Add($col0)
    $tbl.Columns.Add($col1)
    $tbl.Columns.Add($col2)
    $tbl.Columns.Add($col3)
    $tbl.Columns.Add($col9)
    $tbl.Columns.Add($col4)
    $tbl.Columns.Add($col5)
    $tbl.Columns.Add($col6)
    $tbl.Columns.Add($col7)
    $tbl.Columns.Add($col8)
    $counter = 0

    #Go through the updates and find the filtered results
    $count = $locations_1.Count
    foreach ($update in $locations_1) {
        try {
            [xml] $up2 = Get-LnvXmlFilePvt $update
        }
        catch {
            Write-Output $_
            $counter++
            $percent_complete = (($counter/$count)*100)
            Write-Progress -Activity "Processing $count updates..." -PercentComplete $percent_complete
            continue
           # Write-Output -InputObject "Could not find the update descriptor file: $update"
        }

        $luPID = $up2.Package.id
        $luCat = $categories_1[$counter]
        $luName = $up2.Package.Title.Desc.InnerText
        $luVer = $up2.Package.version
        $luDate = $up2.Package.ReleaseDate
        $luTyp = $up2.Package.PackageType.type
        $luReb = $up2.Package.Reboot.type
        $luSev = $up2.Package.Severity.type
        $luXml = $update
        $luExe = $update.Substring(0, $update.LastIndexOf('/') + 1) + ($up2.Package.Files.Installer.File.Name)

        if ((($PackageType -eq 9) -or ($PackageType -match $luTyp)) -and (($RebootType -eq 9) -or ($RebootType -match $luReb)) -and (($Severity -eq 9) -or ($Severity -match $luSev)) -and (($PackageID -eq "") -or ($PackageID.ToLower() -eq $luPID.ToLower()))) {
            $row = $tbl.NewRow()
            $row.ID = $luPID
            $row.Name = $luName
            $row.Category = $luCat
            $row.Version = $luVer
            $row.ReleaseDate = $luDate
            $row.PackageType = $luTyp
            $row.Reboot = $luReb
            $row.Severity = $luSev
            $row.Descriptor = $luXml
            $row.PackageExe = $luExe
            $tbl.Rows.Add($row)
        }
        $counter++
        $percent_complete = (($counter/$count)*100)
        Write-Progress -Activity "Processing $count updates..." -PercentComplete $percent_complete
    }

    if ($ListAll) {
        return $tbl
    } else {
        $selection = ($tbl | Out-GridView -OutputMode Single -Title 'Found updates')
        if ($null -ne $selection) {
            $selection
        }
    }

}

# SIG # Begin signature block
