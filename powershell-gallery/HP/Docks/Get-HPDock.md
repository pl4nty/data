---
external help file: HP.Docks.dll-Help.xml
Module Name: HP.Docks
online version:
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

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-HPDock -AutoInstallWmiProvider
```

## PARAMETERS

### -AutoInstallWmiProvider
If specified, run Install-HPDockWmiProvider first to ensure WMI Provider is installed.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).
