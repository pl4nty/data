---
external help file: HP.Docks.dll-Help.xml
Module Name: HP.Docks
online version:
schema: 2.0.0
---

# Update-HPDockFirmware

## SYNOPSIS
Updates firmware on connected docks if available

## SYNTAX

```
Update-HPDockFirmware [-AutoInstallWmiProvider] [-UpdateNow] [[-Experience] <String>] [-Force] [<CommonParameters>]
```

## DESCRIPTION
This command updates firmware on connected docks if available.

## EXAMPLES

### Example 1
```powershell
PS C:\> Update-HPDockFirmware -Experience "NonInteractive" -UpdateNow
```

## PARAMETERS

### -AutoInstallWmiProvider
If specified, run Install-HPDockWmiProvider first to ensure WMI provider is installed.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Experience
Specifies user interaction.
Values are Silent, Interactive, Non-Interactive.
If not specified, Silent mode is default.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Silent, Interactive, NonInteractive

Required: False
Position: 2
Default value: Silent
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
If specified, the command updates all firmware components to be updated regardless of the current version.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UpdateNow
If specified, the command updates the firmware immediately rather than staging the update onto the dock so that update occurs when dock is disconnected.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).
