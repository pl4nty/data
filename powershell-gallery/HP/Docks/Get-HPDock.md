---
external help file: HP.Docks.dll-Help.xml
Module Name: HP.Docks
online version: https://developers.hp.com/hp-client-management/doc/get-hpdock
schema: 2.0.0
---

# Get-HPDock

## SYNOPSIS
Retrieves properties on connected docks

## SYNTAX

```
Get-HPDock [-AutoInstallWmiProvider] [<CommonParameters>]
```

## DESCRIPTION
This command retrieves properties on connected docks.
By default, only the properties available from the HP Dock WMI Provider are returned (SerialNumber, ProductName, MACAddress, Publisher, and FirmwareVersion) and Internet access is not required.
When the AutoInstallWmiProvider parameter is specified, Internet access is used to also return the following properties, which are only supported on select docks: WLANCapability, WifiSSID, Bluetooth, QuickConnect, QuickConnectProximity, LEDBaseLight, and LEDPowerLight. 
If Internet access is not available when AutoInstallWmiProvider is specified, only the default properties are returned.
If a property is supported for the current dock but retrieved null or empty value, please try updating to the latest dock firmware and latest version of the HP Dock WMI Provider.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-HPDock
```

### Example 2
```powershell
PS C:\> Get-HPDock -AutoInstallWmiProvider
```

## PARAMETERS

### -AutoInstallWmiProvider
If specified, run Install-HPDockWmiProvider first to ensure WMI Provider is installed. This also requires Internet access to return the properties that are only supported on select docks.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

