<#
  .SYNOPSIS
  Provide a list of BIOS details for a system specified by Machine Type or
  BIOS image code.

  .DESCRIPTION
  This cmdlet will return a custom object which lists various details related
  to the BIOS.

  .PARAMETER

  .EXAMPLE
  Find-LnvBiosInfo -MachineType '21DD'

  .EXAMPLE
  Find-LnvBiosInfo -BiosCode 'n1ye'

  .INPUTS

  .OUTPUTS
  Returns a custom object with the following attributes:
    [string]$ImageCode
    [string]$AvailableVersion
    [string]$UpdateUrl
    [string]$ReadmeUrl
    [string]$CVEs
    [string]$PasswordsSet

  .NOTES

#>

function Find-LnvBiosInfo {
    param (
        #different parameter sets to prevent both from showing
        #something should be mandatory
        [ValidateLength(4,4)][parameter(position = 0, Mandatory = $true, helpMessage = "Enter the four-character Machine Type to search for", ParameterSetName="MT")] [String] $MachineType,
        [ValidateLength(4,4)][parameter(position = 0, Mandatory = $true, helpMessage = "Enter the four-character BIOS Image Name to search for", ParameterSetName="BIOS")] [String] $BiosCode
    )

    #change to hashtable?
    class LnvBiosDetails {
        [string]$ImageCode
        [string]$AvailableVersion
        [string]$UpdateUrl
        [string]$ReadmeUrl
        [string]$CVEs
    }

    $myLnvBios = [LnvBiosDetails]::new()
    ### Get ImageCode

    if (-not[string]::IsNullOrWhiteSpace($MachineType)) {
      $searchString = $MachineType.ToUpper().Trim()
    } elseif (-not[string]::IsNullOrWhiteSpace($BiosCode)) {
      $searchString = $BiosCode.ToUpper().Trim()
    } else {
        return
    }

    #Get the DAT catalog
    try {
        [xml]$catalog = Get-LnvDATCatalog
    }
    catch {
        Write-Output $_
        return
    }
    $node = $catalog.ModelList.Model | Where-Object { ($_.Types.Type.Contains("$searchString")) -or ($_.BIOS.image.ToUpper() -eq $("$searchString")) }
    if ($Null -ne $node) {
        $myLnvBios.ImageCode = $node.BIOS.image
        if ([string]::IsNullorWhiteSpace($MachineType)) {
            $MachineType = $node.Types.Type[0]
        }
    }

    ### Get AvailableVersion
    if ([string]::IsNullOrWhiteSpace($MachineType)) {
        $myLnvBios.AvailableVersion = 'Not found'
    } else {
        $CatalogUrl = "https://download.lenovo.com/catalog/$MachineType`_Win11.xml"

        try {
            [System.Xml.XmlDocument]$CatalogXml = Get-LnvXmlFilePvt $CatalogUrl
        }
        catch {
            Write-Output $_
            Write-Output -InputObject "Catalog for $MachineType and Win11 not found, will try Win10."
        }
        if ($Null -eq $CatalogXml) {
            try {
                $CatalogUrl = "https://download.lenovo.com/catalog/$MachineType`_Win10.xml"
                [System.Xml.XmlDocument]$CatalogXml = Get-LnvXmlFilePvt $CatalogUrl
            }
            catch {
                Write-Output $_
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
            #replace the multiple found with the actual urls via -join
            $myLnvBios.AvailableVersion = 'Multiple found'
        } else {
            try {
                [System.Xml.XmlDocument]$PackageXml = Get-LnvXmlFilePvt $PackageUrls
            }
            catch {
                Write-Output -InputObject "Could not find the update descriptor file"
                return
            }
            $baseUrl = $PackageUrls.Substring(0,$PackageUrls.LastIndexOf('/')+1)
            # Identify BIOS version
            $PackageVersion = $PackageXml.Package.version
            $myLnvBios.UpdateUrl = $baseUrl + $PackageXml.Package.Files.Installer.File.Name
            try {
                #is this terminating
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
    }

    #get CVEs
    # is getting the readme a terminating error?
    if ([string]::IsNullOrEmpty($myLnvBios.ReadmeUrl)) {
        $myLnvBios.CVEs = ""
    } else {
        try {
            #new pvt function to get the readmes
            $readme = (New-Object System.Net.WebClient).DownloadString($myLnvBios.ReadmeUrl)
        }
        catch {
            Write-Output -InputObject "Could not download readme file."
            #break
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
