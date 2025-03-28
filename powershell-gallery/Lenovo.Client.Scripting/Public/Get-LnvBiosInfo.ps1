<#
  .SYNOPSIS
  Provide a list of BIOS details from the system

  .DESCRIPTION
  This cmdlet will return a custom object which lists various details related
  to the BIOS.

  .PARAMETER

  .EXAMPLE
  $myLnvBios = Get-LnvBiosDetails

  .INPUTS

  .OUTPUTS
  Returns a custom object with the following attributes:
    [string]$Version
    [string]$VersionString
    [string]$ImageCode
    [string]$AvailableVersion
    [string]$UpdateUrl
    [string]$ReadmeUrl
    [string]$CVEs
    [string]$PasswordsSet

  .NOTES

#>

function Get-LnvBiosInfo {

    class LnvBios {
        [string]$Version
        [string]$VersionString
        [string]$ImageCode
        [string]$AvailableVersion
        [string]$UpdateUrl
        [string]$ReadmeUrl
        [string]$CVEs
        [string]$PasswordsSet
    }

    $myLnvBios = [LnvBios]::new()

    ### Get Version and VersionString
    try {
        # ThinkPad
        if (Get-CimInstance -Query 'SELECT * from Win32_ComputerSystemProduct WHERE Version LIKE "ThinkPad%"') {

            [string]$major = (Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_BIOS).SystemBIOSMajorVersion
            [string]$minor = (Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_BIOS).SystemBIOSMinorVersion
            $myLnvBios.Version = $major + "." + $minor
            $myLnvBios.VersionString = ((Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_BIOS).SMBIOSBIOSVersion | Out-String).Trim()
        }

        # ThinkCentre/ThinkStation:
        if (Get-CimInstance -Query 'SELECT * from Win32_ComputerSystemProduct WHERE Version LIKE "ThinkCentre%" OR Version LIKE "ThinkStation%"') {
            $BiosVersionHex = (Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_BIOS).SMBIOSBIOSVersion
            $BiosVersionHex = "0x" + $BiosVersionHex.Substring(5,2)
            $myLnvBios.Version = (Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_BIOS).SystemBIOSMajorVersion
            $myLnvBios.Version += "."  + [Convert]::ToInt32($BiosVersionHex, 16)

            $myLnvBios.VersionString = ((Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_BIOS).SMBIOSBIOSVersion | Out-String).Trim()
        }
    }
    catch {
        Write-Output -InputObject 'Unexpected error reading from Win32_ComputerSystemProduct'
        #continue on error
    }

    ### Get ImageCode
    try {
        $biosversion = Get-CimInstance -Class "Win32_Bios" -Namespace "root/cimv2" | Select-Object $_.SMBIOSBIOSVersion
        $myLnvBios.ImageCode = $biosversion.SMBIOSBIOSVersion.SubString(0, 4)
    }
    catch {
        Write-Output -InputObject 'Unexpected error reading from Win32_Bios'
        #continue on error
    }

    ### Get AvailableVersion
    try {
        $MachineType = ((Get-CimInstance Win32_ComputerSystem).Model.SubString(0, 4)).Trim()
    }
    catch {
        Write-Output -InputObject 'Unexpected error retrieving Machine Type.'
    }

    if ([string]::IsNullOrWhiteSpace($MachineType)) {
        $myLnvBios.AvailableVersion = 'Not found'
    } else {
        $CatalogUrl = "https://download.lenovo.com/catalog/$MachineType`_Win11.xml"

        try {
            [System.Xml.XmlDocument]$CatalogXml = (New-Object -TypeName System.Net.WebClient).DownloadString($CatalogUrl)
        }
        catch {
            Write-Output -InputObject "Catalog for $MachineType and Win11 not found, will try Win10."
        }
        if ($Null -eq $CatalogXml) {
            try {
                $CatalogUrl = "https://download.lenovo.com/catalog/$MachineType`_Win10.xml"
                [System.Xml.XmlDocument]$CatalogXml = (New-Object -TypeName System.Net.WebClient).DownloadString($CatalogUrl)
            }
            catch {
                Write-Output -InputObject "Catalog for $MachineType not found for Win10 either."
            }
        }

        try {
            $PackageUrls = ($CatalogXml.packages.ChildNodes | Where-Object { $_.category -match "BIOS UEFI" }).location
        }
        catch {
            Write-Output -InputObject "No BIOS update available in catalog."
            $myLnvBios.AvailableVersion = 'Not found'
        }

        if ($PackageUrls.Count -eq 0) {
            Write-Output -InputObject "No BIOS update available in catalog"
            $myLnvBios.AvailableVersion = 'Not found'
        } elseif ($PackageUrls.Count -gt 1) {
            $myLnvBios.AvailableVersion = 'Multiple found'
        } else {
            try {
                [System.Xml.XmlDocument]$PackageXml = (New-Object -TypeName System.Net.WebClient).DownloadString($PackageUrls)
                $baseUrl = $PackageUrls.Substring(0,$PackageUrls.LastIndexOf('/')+1)
                # Identify BIOS version
                $PackageVersion = $PackageXml.Package.version
                $myLnvBios.UpdateUrl = $baseUrl + $PackageXml.Package.Files.Installer.File.Name
                try {
                    $myLnvBios.ReadmeUrl = $baseUrl + $PackageXml.Package.Files.ReadMe.File.Name
                }
                catch {
                    $myLnvBios.ReadmeUrl = ''
                }

                # ThinkCentre/ThinkStation have full BIOS image name with hex build number in package XML version attribute
                if (Get-CimInstance -Query 'SELECT * from Win32_ComputerSystemProduct WHERE Version LIKE "ThinkCentre%" OR Version LIKE "ThinkStation"') {
                    $PackageVersionHex = "0x" + $PackageVersion.SubString(5,2)
                    $PackageVersion = "1." + [Convert]::ToInt32($PackageVersionHex, 16)
                }

                $myLnvBios.AvailableVersion = $PackageVersion
            }
            catch {
                Write-Output -InputObject "Could not find the update descriptor file"
                return
            }
        }
    }

    #Get PasswordsSet
    try {
        if ((New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
            $lbp = Get-CimInstance -ClassName "Lenovo_BiosPasswordSettings" -Namespace "root/wmi"

            Switch ($lbp.PasswordState) {
                0 { $myLnvBios.PasswordsSet = "0: No BIOS Password Set" }

                1 { $myLnvBios.PasswordsSet = "1: Only Power On Password" }

                2 { $myLnvBios.PasswordsSet = "2: Only Supervisor Password" }

                3 { $myLnvBios.PasswordsSet = "3: HDD1 Password" }

                5 { $myLnvBios.PasswordsSet = "5: Power On + HDD1 Password" }

                6 { $myLnvBios.PasswordsSet = "6: Supervisor + HDD1 Password" }

                7 { $myLnvBios.PasswordsSet = "7: Supervisor + Power On + HDD1 Password" }

                8 { $myLnvBios.PasswordsSet = "8: HDD2 Password" }

                9 { $myLnvBios.PasswordsSet = "9: Power On + HDD2 Password" }

                10 { $myLnvBios.PasswordsSet = "10: Supervisor + HDD2 Password" }

                64 { $myLnvBios.PasswordsSet = "64: Only System Management Password" }

                65 { $myLnvBios.PasswordsSet = "65: System Management + Power On Password" }

                66 { $myLnvBios.PasswordsSet = "66: Supervisor + System Management Password" }

                67 { $myLnvBios.PasswordsSet = "67: Supervisor + System Management + Power On Password" }

                68 { $myLnvBios.PasswordsSet = "68: System Management + User HDD and/or User HDD Master Password" }

                69 { $myLnvBios.PasswordsSet = "69: System Management + Power On + User HDD and/or User HDD Master Password" }

                70 { $myLnvBios.PasswordsSet = "70: Supervisor + System Management + User HDD and/or User HDD Master Password" }

                71 { $myLnvBios.PasswordsSet = "71: Supervisor + System Management + Power On + User HDD and/or User HDD Master Password" }

                default { $myLnvBios.PasswordsSet = $lbp.PasswordState.ToString }
            }
        } else {
            $myLnvBios.PasswordsSet = "Requires elevated access."
        }
    }
    catch {
        $myLnvBios.PasswordsSet = "Unexpected error retrieving BIOS passwords set."
    }

    #get CVEs
    if ([string]::IsNullOrEmpty($myLnvBios.ReadmeUrl)) {
        $myLnvBios.CVEs = ""
    } else {
        try {
            $readme = (New-Object System.Net.WebClient).DownloadString($myLnvBios.ReadmeUrl)
        }
        catch {
            Write-Output -InputObject "Could not download readme file."
            return
        }

        $cves = @()
        foreach ($line in $readme) {
            $Regex = [regex] 'CVE-\d{4}-\d{4,7}'
            $Found = $Regex.Matches($line)
            foreach ($Match in $Found) {
                if (-Not $cves.Contains($Match.Value)) {
                    $cves += $Match.Value
                }
            }
        }
        $myLnvBios.CVEs = $cves
    }
    return $myLnvBios
}
# SIG # Begin signature block
