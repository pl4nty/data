<#
    .Synopsis
    Get-LnvUpdate finds and downloads updates for Lenovo machine type

    .Description
        This script allows users to search for updates that will be downloaded to a folder of their choice
        -Defaults to Windows 10 updates and a folder named c:\testrepo if you do not specify
        -Requires users to enter at least a machine type
        -Can be called without identifiers so long as you use the right order
        -If a repositoryfolder is specified that doesn't exist the script will create it
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

        Note: 9 can be used for these three parameters to represent 'All'


	.PARAMETER MachineType
    Mandatory : True

	.PARAMETER WindowsVersion

	.PARAMETER RepositoryFolder

	.PARAMETER PackageType

	.PARAMETER RebootType

    .PARAMETER Csv

    .PARAMETER Expand


    .Example
        Get-LnvUpdate -MachineType 20E4 -WindowsVersion 10 -RepositoryFolder "C:\repository" -PackageType 1

    .Example
        Get-LnvUpdate 20E4 10 "C:\repository"

    .Example
        Get-LnvUpdate -MachineType "20E6" -RepositoryFolder "C:\repository"
#>
function Get-LnvUpdate {
    param (
        [ValidateLength(4,4)][parameter(Mandatory = $true, position = 0)] [String] $MachineType,
        [parameter(position = 4, Mandatory = $false )][ValidateSet("10","11")]
        [String] $WindowsVersion = "10",
        [parameter(position = 2)][String] $RepositoryFolder = "c:\testrepo",
        [parameter(position = 3)][String] $PackageType = "9",
        [parameter(position = 4)][String] $RebootType = "9",
        [parameter(position = 5)][Switch] $Csv,
        [parameter(position = 6)][Switch] $Expand
    )

    $url = "https://download.lenovo.com/catalog/" + $MachineType + "_win" + $WindowsVersion + ".xml"

    if ($Csv) {
        #Create table format to display information about the updates
        $tbl = New-Object System.Data.DataTable "Available Updates"
        $col0 = New-Object System.Data.DataColumn ID
        $col1 = New-Object System.Data.DataColumn Name
        #$col2 = New-Object System.Data.DataColumn Category
        $col3 = New-Object System.Data.DataColumn Version
        $col4 = New-Object System.Data.DataColumn PackageType
        $col5 = New-Object System.Data.DataColumn Reboot
        $col6 = New-Object System.Data.DataColumn Severity
        $col7 = New-Object System.Data.DataColumn Descriptor
        $col8 = New-Object System.Data.DataColumn PackageExe

        $tbl.Columns.Add($col0)
        $tbl.Columns.Add($col1)
        #$tbl.Columns.Add($col2)
        $tbl.Columns.Add($col3)
        $tbl.Columns.Add($col4)
        $tbl.Columns.Add($col5)
        $tbl.Columns.Add($col6)
        $tbl.Columns.Add($col7)
        $tbl.Columns.Add($col8)
    }

    #accesses the updates xml file for a system
    try {
        $systemUpdates = Get-LnvXmlFilePvt $url
    }
    catch {
        Write-Output $_
        return
    }

    if($Expand)
    {
        if(-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
        {
            Write-Output "Not running in elevated session. Skipping expand."
            $Expand = $false
        }
        else {
            $hash = [hashtable]::Synchronized(@{})
            $hash["RepoPath"] = $RepositoryFolder
            $initialSessionState = [InitialSessionState]::CreateDefault()
            $RunspacePool = [RunspaceFactory]::CreateRunspacePool($initialSessionState)
            [void]$RunspacePool.SetMaxRunspaces(2)
            $RunspacePool.Open()
            $Jobs = New-Object System.Collections.ArrayList
            $Worker = {
                param($Exe, $Fold)
                Start-Process -FilePath $Exe -ArgumentList "/VERYSILENT /DIR=`"$Fold`" /EXTRACT=`"YES`""
            }
        }
    }

    #holds the urls for all the updates for a system
    $locations = $systemUpdates.packages.package.location
    $qnty = $systemUpdates.packages.count

    Write-Output -InputObject ("Total Updates Found: " + $qnty)
    #Create Repo & prepare to download
    #check if we have permissions
    if (-NOT (Test-Path $RepositoryFolder)) { new-item -ItemType directory -path $RepositoryFolder }

    #questionable code
    $RepositoryFolder += "\"
    $downloadCount = 0

    #Loops the updates for a machine to download them in a folder with their readme and xml
    Foreach ($file in $locations) {
        try {
            $up1 = Get-LnvXmlFilePvt $file
        }
        catch {
            Write-Output $_
            continue
        }

        #only get updates that match specified package type and/or reboot type
        $pkgType = $up1.Package.PackageType.type
        $rbType = $up1.Package.Reboot.type
        $pkgID = $up1.Package.id.ToString()
        if ((($PackageType -eq 9) -or ($PackageType -match $pkgType)) -and (($RebootType -eq 9) -or ($RebootType -match $rbType))) {
            #Create Folder for update if it does not already exst
            $innerFold = $RepositoryFolder.ToString() + $pkgID + "\"
            if (-NOT (Test-Path $innerFold)) {

                #Get Links; "$file" is the .xml
                #.xml
                $beg = $file.SubString(0, $file.LastIndexOf('/') + 1)
                #$end = $file.Substring($file.LastIndexOf('/') + 1)
                #.exe
                #grab crc as well to use Get-LnvFilePvt?
                $exeFile = $up1.Package.Files.Installer.File.Name
                $exeLink = $beg + $exeFile
                #.readme
                $readMeFile = $up1.Package.Files.Readme.File.Name
                $readMeLink = $beg + $readMeFile

                New-Item -ItemType directory -Path $innerFold
                #Download all parts of the update
                try {
                    #$pathToExe = Join-Path -Path $innerFold -ChildPath $exeFile
                    #(New-Object System.Net.WebClient).DownloadFile($exeLink, $innerFold + $exeFile);
                    $dest = $innerFold + $exeFile
                    Start-BitsTransfer -Source $exeLink -Destination $dest -ErrorAction Stop
                    if ($Expand) {
                        $PowerShell = [powershell]::Create()
                        $PowerShell.RunspacePool = $RunspacePool
                        $PowerShell.AddScript($Worker).AddArgument($innerFold + $exeFile).AddArgument("${RepositoryFolder}\${MachineType}_${WindowsVersion}\${pkgID}") | Out-Null
                        $JobObj = New-Object -TypeName PSObject -Property @{
                            Runspace = $PowerShell.BeginInvoke()
                            PowerShell = $PowerShell
                        }
                        $Jobs.Add($JobObj) | Out-Null
                    }
                } catch {
                    Write-Output -InputObject "Could not download EXE: $exeFile"
                }
                try {
                    (New-Object System.Net.WebClient).DownloadFile($readMeLink, $innerFold + $readMeFile);
                } catch {
                    Write-Output -InputObject "Could not download Readme: $readMeFile"
                }

                #count could be wrong
                $downloadCount += 1

                if ($Csv) {
                    $luPID = $up1.Package.id
                    #$luCat = $categories_1[$counter]
                    $luName = $up1.Package.Title.Desc.InnerText
                    $luVer = $up1.Package.version
                    $luTyp = $up1.Package.PackageType.type
                    $luReb = $up1.Package.Reboot.type
                    $luSev = $up1.Package.Severity.type
                    $luXml = $file
                    $luExe = $file.Substring(0, $file.LastIndexOf('/') + 1) + ($up1.Package.Files.Installer.File.Name)

                    $row = $tbl.NewRow()
                    $row.ID = $luPID
                    $row.Name = $luName
                    # $row.Category = $luCat
                    $row.Version = $luVer
                    $row.PackageType = $luTyp
                    $row.Reboot = $luReb
                    $row.Severity = $luSev
                    $row.Descriptor = $luXml
                    $row.PackageExe = $luExe
                    $tbl.Rows.Add($row)
                }
            }
            else {
                Write-Output -InputObject ($up1.Package.id.ToString() + " exists in repository.")
                if ($Expand) {

                    $beg = $file.SubString(0, $file.LastIndexOf('/') + 1)
                    #$end = $file.Substring($file.LastIndexOf('/') + 1)
                    #.exe
                    #grab crc as well to use Get-LnvFilePvt?
                    $exeFile = $up1.Package.Files.Installer.File.Name
                    $exeLink = $beg + $exeFile

                    $PowerShell = [powershell]::Create()
                    $PowerShell.RunspacePool = $RunspacePool
                    $PowerShell.AddScript($Worker).AddArgument($innerFold + $exeFile).AddArgument("${RepositoryFolder}\${MachineType}_${WindowsVersion}\${pkgID}") | Out-Null
                    $JobObj = New-Object -TypeName PSObject -Property @{
                        Runspace = $PowerShell.BeginInvoke()
                        PowerShell = $PowerShell
                    }
                    $Jobs.Add($JobObj) | Out-Null
                }
            }
        }
    }
    Write-Output -InputObject ("Downloaded Updates: " + $downloadCount)
    if ($Csv) {
        $csvFilePath = "${RepositoryFolder}\${MachineType}_${WindowsVersion}.csv"
        $tbl | Export-Csv -Path $csvFilePath
    }

    if($Expand)
    {
        while ($Jobs.Runspace.IsCompleted -contains $false) {
            Write-Output (Get-date).Tostring() "Still expanding packages..."
            Start-Sleep 1
        }
        $RunspacePool.Dispose()
    }

}

# SIG # Begin signature block
