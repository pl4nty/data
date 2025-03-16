# Helper functions to be used across resources

Function New-DellEventLog{
[CmdletBinding()]
    param( 
            [Parameter (Mandatory=$false)][System.string] $LogName="DellClientBIOS PowerShell",
            [Parameter (Mandatory=$false)][System.string] $SourceName="DellBIOSProvider DSC"
         )

         $CustomLog = Get-EventLog -list | Where-object { $_.logdisplayname -eq $LogName}
         if (! $CustomLog) {
             $ErrorActionPreference = "Continue"
             try{
                 New-EventLog -LogName $LogName -Source $SourceName
                 Write-EventLog -LogName $LogName -Source $SourceName -EntryType Information -EventID 0 -Message "DellBIOSProvider DSC started."
             }
         
             catch [System.Security.SecurityException] {
              Write-Error "Error:  Run as elevated user.  Unable to write or read to event logs."
            }
         }
         

}

Function Write-DellEventLog{

[CmdletBinding()]
  [OutputType([int])]
    param(
       [Parameter (Mandatory=$false)] [System.string]$LogName="DellClientBIOS PowerShell",
       [Parameter (Mandatory=$false)] [System.string] $SourceName = "DellBIOSProvider DSC",
       [Parameter (Mandatory=$false)] [System.Int16] $EventID=0,
       [Parameter (Mandatory=$false)] [System.String] $EntryType='Information',
       [Parameter(Mandatory=$true)]   [string]$Message
    )

     $CustomLog = Get-EventLog -list | Where-object { $_.logdisplayname -eq $LogName}
         if (! $CustomLog) {
            New-DellEventLog
         }
    Write-EventLog -LogName $LogName -Source $SourceName -EntryType $EntryType -EventID $EventID -Message $Message


}

function Confirm-DellPSDrive{
 [CmdletBinding()]

    # Check if DellBIOSProvider module has already been loaded into the PS session

    $DellPSProvider = Get-Module -name DellBIOSProvider

    if ( !$DellPSProvider)
    {
        Write-Verbose "Drive DellSmbios is not found. Importing DellBiosProvider."
        import-module -name DellBiosProvider -verbose -force -ErrorVariable errorInModule
        If ($errorInModule)
        {
             $Message = “Module DellBiosProvider failed to import. Errors returned: $($errorInModule.exception.message)”
             Throw $Message
        }
        else {
            return $false #  Module was not already loaded
        }
    }
    else
    {
        return $true}
}


function CheckModuleLoaded{
 [CmdletBinding()]

    # Check if DellBIOSProvider module has already been loaded into the PS session

    $DellPSProvider = Get-Module -name DellBIOSProvider

    if ( !$DellPSProvider)
    {
            return $false #  Module was not already loaded
    }
    else
    {
        return $true
    }
}
# SIG # Begin signature block
