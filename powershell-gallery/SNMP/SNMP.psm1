function Get-SnmpData {

<#    
.SYNOPSIS
    Function reading data from SNMP.

.DESCRIPTION
    Function reads data from SNMP using library SharpSnmpLib.
    Libraries taken from project SharpSnmpLib (http://sharpsnmplib.codeplex.com).
#>

[CmdletBinding()]
param (
    # Endpoint IP address.
    [Parameter(
        Mandatory = $true,
        HelpMessage = 'Endpoint IP address'
    )]
    [Net.IPAddress]$IP,

    # OID list.
    [Parameter(
        Mandatory = $true,
        HelpMessage = 'OID list'
    )]
    [string[]]$OID,
    
    # SNMP Community.
    [string]$Community = 'public', 
    
    # SNMP port.
    [int]$UDPport = 161,

    # SNMP version.
    [Lextm.SharpSnmpLib.VersionCode]$Version = 'V2',

    # Time out value.    
    [int]$TimeOut = 3000
)

    $variableList = New-Object Collections.Generic.List[Lextm.SharpSnmpLib.Variable]
    foreach ($singleOID in $OID) {
        $variableList.Add($(
            New-Object Lextm.SharpSnmpLib.ObjectIdentifier $singleOID
        ))
    }
 
    $endpoint = New-Object Net.IpEndPoint $IP, $UDPport
 
    try {
        $message = [Lextm.SharpSnmpLib.Messaging.Messenger]::Get(
            $Version, 
            $endpoint, 
            $Community, 
            $variableList, 
            $TimeOut
        )
    } catch {
        Write-Warning "SNMP Get error: $_"
        return
    }
 
    foreach ($variable in $message) {
        New-Object PSObject -Property @{
            OID = $variable.Id.ToString()
            Data = $variable.Data.ToString()
        }
    }
}


function Set-SnmpData {

<#    
.SYNOPSIS
    Function that changes data in SNMP.
.DESCRIPTION
    Function that changes data in SNMP using SharpSnmpLib library.
    Libraries taken from project SharpSnmpLib (http://sharpsnmplib.codeplex.com).
#>

[CmdletBinding()]
param (
    # Endpoint IP address.
    [Parameter(
        Mandatory = $true,
        HelpMessage = 'Endpoint IP address'
    )]
    [Net.IPAddress]$IP,

    # OID of object that will be set.
    [Parameter(
        Mandatory = $true,
        HelpMessage = 'OID of object that will be set'
    )]
    [string]$OID,

    # Value that will be used.
    $Value,

    # Type of value.
    [ValidateSet(
        'Integer32',
        'Gauge32',
        'TimeTicks',
        'IP',
        'ObjectIdentifier',
        'OctetString',
        'Null',
        IgnoreCase = $false
    )]
    [string]$ValueType = 'OctetString',
    
    # SNMP Community.
    [string]$Community = 'private', 
    
    # SNMP port.
    [int]$UDPport = 161,

    # SNMP version.
    [Lextm.SharpSnmpLib.VersionCode]$Version = 'V2',

    # Time out value.
    [int]$TimeOut=3000
)

    if ($ValueType -eq 'Null' -or $Value -eq $null) {

        $CookedValue = New-Object Lextm.SharpSnmpLib.Null

    } else {

        $CookedValue = New-Object "Lextm.SharpSnmpLib.$ValueType" $Value
    }

    $VariableList = New-Object Collections.Generic.List[Lextm.SharpSnmpLib.Variable]

    $VariableList.Add($(
        New-Object Lextm.SharpSnmpLib.Variable -ArgumentList @(
            $(New-Object Lextm.SharpSnmpLib.ObjectIdentifier $OID),
            $CookedValue
        )
    ))
    
 
    $Endpoint = New-Object Net.IpEndPoint $IP, $UDPport

    try {
        $Message = [Lextm.SharpSnmpLib.Messaging.Messenger]::Set(
            $Version, 
            $Endpoint, 
            $Community, 
            $VariableList, 
            $TimeOut
        )
    } catch {
        Write-Warning "SNMP Set error: $_"
        return
    }
 
    foreach ($Variable in $Message) {
        New-Object PSObject -Property @{
            OID = $Variable.Id.ToString()
            Data = $Variable.Data.ToString()
        }
    }
}


function Invoke-SnmpWalk {

<#    
.SYNOPSIS
    Function reading data from SNMP using "Walk" method.
.DESCRIPTION
    Function reading data from SNMP using "Walk" method using SharpSnmpLib library.
    Libraries taken from project SharpSnmpLib (http://sharpsnmplib.codeplex.com).
#>

[CmdletBinding()]
param (
    # Endpoint IP address.
    [Parameter(
        Mandatory = $true,
        HelpMessage = 'Endpoint IP address'
    )]
    [Net.IPAddress]$IP,

    # OID of root object.
    [Parameter(
        Mandatory = $true,
        HelpMessage = 'OID of root object'
    )]
    [string[]]$OIDStart, 
    
    # SNMP Community.
    [string]$Community = 'public', 
    
    # SNMP port.
    [int]$UDPport = 161,

    # SNMP version.
    [Lextm.SharpSnmpLib.VersionCode]$Version = 'V2',

    # "Walk" method mode.
    [Lextm.SharpSnmpLib.Messaging.WalkMode]$WalkMode = 'WithinSubtree',

    # Time out value.    
    [int]$TimeOut = 3000

) 

    $OID = New-Object Lextm.SharpSnmpLib.ObjectIdentifier $OIDStart
    $results = New-Object Collections.Generic.List[Lextm.SharpSnmpLib.Variable]
    $endpoint = New-Object Net.IpEndPoint $IP, $UDPport
    
    try {
        [Lextm.SharpSnmpLib.Messaging.Messenger]::Walk(
            $Version, 
            $endpoint, 
            $Community, 
            $OID, 
            $results, 
            $TimeOut, 
            $WalkMode
        ) | Write-Verbose -Message { 'Found: {0}' -f [bool]$_ }
    } catch {
        Write-Warning "SNMP Walk issue: $_"
        return
    }
 
    foreach ($variable in $results) {
        New-Object PSObject -Property @{
            OID = $variable.Id.ToString()
            Data = $variable.Data.ToString()
        }
    }
}