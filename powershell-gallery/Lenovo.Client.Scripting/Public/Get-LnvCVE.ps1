<#
.SYNOPSIS
Get a list of CVE IDs addressed in current BIOS update.

.DESCRIPTION
Returns a list of the CVE identifiers that are listed as addressed
vulnerabilities in the current BIOS update for the specified system. A machine
type can be passed as a parameter.  If no parameter is specified, the machine
type of the running system will be used. CVE Data may not be available for all
machine types, especially older models.

.PARAMETER MachineType
Mandatory : False
The four-character machine type of the system to check for.

.EXAMPLE
Get-LnvCVE -MachineType 21DD

.EXAMPLE
Get-LnvCVE

.INPUTS

.OUTPUTS

.NOTES

#>
function Get-LnvCVE {
    param (
        [ValidateLength(4,4)]
        [parameter(position = 0, Mandatory = $false, helpMessage = "Enter the Machine Type to search for")] [String] $MachineType

    )
    $catalogUrl = "https://download.lenovo.com/catalog/"

    if ([string]::IsNullOrWhiteSpace($MachineType)) {
        $MachineType = Get-LnvMachineType
    }

    try {
        [xml]$catalog = Get-LnvXmlFilePvt ($catalogUrl + $MachineType + "_Win11.xml")
    }
    catch {
        Write-Output $_
        return
    }

    try {
        $pkgxmlUrls = $catalog.SelectNodes("//location[../category='BIOS UEFI']")
    }
    catch {
        Write-Output -InputObject "No BIOS update currently available for that machine type."
        return
    }

    $pathUrl = $pkgxmlUrls[0].'#text'.Substring(0, $pkgxmlUrls[0].'#text'.LastIndexOf('/') + 1)

    if ($pkgxmlUrls.Count -gt 1) {
        #skip EC FW update only package in T490, etc. case
        try {
            [xml]$pkgDescriptor = Get-LnvXmlFilePvt ($pkgxmlUrls[1].'#text')
        }
        catch {
            Write-Output $_
            return
        }
    }
    else {
        #only one BIOS update in catalog
        try {
            [xml]$pkgDescriptor = Get-LnvXmlFilePvt ($pkgxmlUrls[0].'#text')
        }
        catch {
            Write-Output $_
            return
        }
    }

    try {
        $readmeUrl = $pkgDescriptor.Package.Files.Readme.File.Name
    }
    catch {
        Write-Output -InputObject "BIOS update package descriptor is missing readme file link."
        return
    }

    $url = $pathUrl + $readmeUrl
    try {
        $readme = (Invoke-WebRequest -Uri $url | Select-Object -ExpandProperty Content) -Split "`n"
    }
    catch {
        Write-Output $_
        return
    }

    $cves = @()
    foreach ($line in $readme) {
        $Regex = [regex] 'CVE-\d{4}-\d{4,7}'
        $Found = $Regex.Matches($line)
        foreach ($Match in $Found) {
            if (-Not $cves.Contains($Match.Value)) {
                $cves += $Match.Value
                Write-Output -InputObject $Match.Value
            }
        }
    }
    if ($cves.Count -eq 0) {
        Write-Output -InputObject "No CVE list found for this model: $MachineType."
    }
}

# SIG # Begin signature block
