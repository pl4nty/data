---
external help file: HP.Displays.dll-Help.xml
Module Name: HP.Displays
online version: https://developers.hp.com/hp-client-management/doc/update-hpdisplayfirmware
schema: 2.0.0
---

# Update-HPDisplayFirmware

## SYNOPSIS
Updates firmware on connected displays if available

## SYNTAX

### ConnectedUpdates
```
Update-HPDisplayFirmware [[-SerialNumber] <String[]>] [[-Experience] <String>] [<CommonParameters>]
```

### DisconnectedUpdates
```
Update-HPDisplayFirmware [[-SerialNumber] <String[]>] [-Stage] [-StageDelay <Int32>] [-SignalCheck <Int32>]
 [<CommonParameters>]
```

## DESCRIPTION
This command updates firmware on connected displays if available. Please note that daisy chained devices are not currently supported. Prerequisites:
* Close all running applications to avoid installation issues.
* Keep the monitor's power cable connected during the update process.
* Ensure the monitor is powered ON and displaying active video throughout the update.
* Avoid putting the computer system into sleep or shutdown mode during the update.
* Do not connect more than one computer system to the target monitor during the update.
* The monitor must be connected to the computer using a cable (USB-B to A cable, USB-C to C cable, USB-C to A cable, Thunderbolt cable) for the update to function properly.

## EXAMPLES

### Example 1
```powershell
PS C:\> Update-HPDisplayFirmware
```

## PARAMETERS

### -SerialNumber
Specifies the serial number(s) of the display(s) to update.
If not specified, all connected displays will be updated.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Experience
Specifies whether update should run silently or interactively.
If not specified, default is silent. If the display does not yet support silent install, an error will be thrown.
Please note that this parameter cannot be used with the -Stage parameter.

```yaml
Type: String
Parameter Sets: ConnectedUpdates
Aliases:
Accepted values: Silent, Interactive

Required: False
Position: 2
Default value: Silent
Accept pipeline input: False
Accept wildcard characters: False
```

### -SignalCheck
Specifies the interval in minutes for checking the signal status. The default is 0 minutes.

```yaml
Type: Int32
Parameter Sets: DisconnectedUpdates
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Stage
If specified, the command will try and apply disconnected updates if supported and available. This parameter cannot be used with the -Experience parameter.

```yaml
Type: SwitchParameter
Parameter Sets: DisconnectedUpdates
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StageDelay
Specifies how long in minutes after signal loss to intiate the disconnected firmware update. The default is 10 minutes.

```yaml
Type: Int32
Parameter Sets: DisconnectedUpdates
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
