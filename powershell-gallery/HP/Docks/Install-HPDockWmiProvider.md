---
external help file: HP.Docks.dll-Help.xml
Module Name: HP.Docks
online version:
schema: 2.0.0
---

# Install-HPDockWmiProvider

## SYNOPSIS
Installs HP Dock WMI Provider

## SYNTAX

```
Install-HPDockWmiProvider [-Force] [<CommonParameters>]
```

## DESCRIPTION
This command installs HP Dock WMI Provider with the version specified in https://www.hp.com/us-en/solutions/client-management-solutions/download.html

## EXAMPLES

### Example 1
```powershell
PS C:\> Install-HPDockWmiProvider -Force
```

## PARAMETERS

### -Force
If specified, the command installs WMI provider regardless if WMI provider is already installed and if so, regardless of the current version.

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
