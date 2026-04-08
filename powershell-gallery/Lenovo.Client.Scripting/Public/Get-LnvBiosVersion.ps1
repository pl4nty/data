<#
.SYNOPSIS
Get a BIOS version from the running system in various formats.

.DESCRIPTION
Returns the BIOS version in the specified format

.PARAMETER Format
Mandatory: False
The format can be one of the following:
- string  : Returns the full string value of SMBIOSBIOSVersion
- decimal : Returns a standard version string in the format of n.nn

.EXAMPLE
Get-LnvBiosVersion -Format 'decimal'

.EXAMPLE
Get-LnvBiosVersion

.INPUTS

.OUTPUTS

.NOTES
This function handles the different methods used to express the BIOS version
between ThinkPad and ThinkCentre/ThinkStation. Desktop BIOS will show build
number in hex and the 'decimal' format will convert to a standard version
string format.

If no Format is specified, the function will return the full string of the
SMBIOSBIOSVersion value.
#>
function Get-LnvBiosVersion {
    param (
        [parameter(Mandatory = $false, Position = 0)]
        [ValidateSet("string","decimal")]
        [string]$Format

    )

    $product = Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_ComputerSystemProduct
    $bios    = Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_BIOS

    # ThinkPad
    if ($product.Version -like "ThinkPad*") {
        if ($Format -eq "decimal") {
            [string]$major = $bios.SystemBIOSMajorVersion
            [string]$minor = ($bios.SystemBIOSMinorVersion).ToString().PadLeft(2, '0')
            $BiosVersion = "$major.$minor"
        }
        else {
            $BiosVersion = ($bios.SMBIOSBIOSVersion | Out-String).Trim()
        }
    }

    # ThinkCentre/ThinkStation:
    if ($product.Version -like "ThinkCentre*" -or $product.Version -like "ThinkStation*") {
        if ($Format -eq 'decimal') {
            $hex = '0x' + $bios.SMBIOSBIOSVersion.Substring(5, 2)
            $BiosVersion = $bios.SystemBIOSMajorVersion.ToString() + '.' + [Convert]::ToInt32($hex, 16)
        }
        else {
            $BiosVersion = ($bios.SMBIOSBIOSVersion | Out-String).Trim()
        }
    }
    return $BiosVersion
}

# SIG # Begin signature block
