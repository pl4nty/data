<#
  .SYNOPSIS
  Returns details about the available driver packs for a specified machine type.

  .DESCRIPTION
  Returns a list of the available driver packs for the machine type specified
  which includes the OS and the OS build version, the CRC of the pack, and the
  URL to the package executable. The OS will be "win10" or "win11" and the OS
  build version will be the four character designator like "21H2" or "22H2".

  .PARAMETER MachineType
  The four-character Machine Type to search for (e.g., "21DD").

  .PARAMETER Latest
  Switch to return only the latest SCCM driver pack.

  .EXAMPLE
  Find-LnvDriverPack -MachineType 21DD

  .EXAMPLE
  Find-LnvDriverPack 21DD

  .EXAMPLE
  Find-LnvDriverPack -MachineType "21DD" -Latest

  .EXAMPLE
  $url = (Find-LnvDriverPack -MachineType 21DD | Where-Object { (($_.OS -eq 'win10') -and ($_.version -eq '21H2')) }).'#text'

  .INPUTS
  None.

  .OUTPUTS
  An object consisting of "os", "version", "crc", "#text" elements where
  "#text" represents the URL to the package executable file.

  .NOTES
  The Where-Object cmdlet can be used to filter on OS and version to return
  just one URL. The URL is in the '#text' field of the returned object.
#>
function Find-LnvDriverPack
{
    param (
        [ValidateLength(4, 4)]
        [parameter(position = 0, Mandatory = $true, helpMessage = 'Enter the four-character Machine Type')]
        [String] $MachineType,

        [Parameter(Mandatory = $false, HelpMessage = 'Switch to return only the latest SCCM driver pack.')]
        [switch]$Latest
    )

    $MachineType = $MachineType.ToUpper()

    try
    {
        # Attempt to retrieve the catalog
        [xml]$catalog = Get-LnvDATCatalog
    }
    catch
    {
        Write-Error "Failed to load the driver pack catalog: $_"
        return
    }

    try
    {
        # Find the model node corresponding to the given MachineType
        $node = $catalog.ModelList.Model | Where-Object { $_.Types.Type -eq $MachineType }
        if (-not $node)
        {
            Write-Warning "Machine type '$MachineType' was not found in the catalog."
            return
        }

        # If SCCM driver packs exist, return them or return the latest, if requested
        $sccmPacks = $node.SCCM
        if ($null -eq $sccmPacks)
        {
            Write-Warning "No SCCM driver packs found for machine type '$MachineType'."
            return
        }

        if ($Latest)
        {
            # Return only the latest SCCM driver pack
            return $sccmPacks | Select-Object -Last 1
        }
        else
        {
            # Return all SCCM driver packs for the machine type
            return $sccmPacks
        }
    }
    catch
    {
        Write-Error "An error occurred while retrieving driver packs: $_"
        throw
    }
}

# SIG # Begin signature block
