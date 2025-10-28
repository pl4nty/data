---
external help file: HP.Displays.dll-Help.xml
Module Name: HP.Displays
online version:
schema: 2.0.0
---

# Get-HPDisplay

## SYNOPSIS
Retrieves features supported on connected displays

## SYNTAX

```
Get-HPDisplay [[-SerialNumber] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
This command retrieves features supported on connected displays. 

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-HPDisplay -SerialNumber "CN40380ARD"
```

## PARAMETERS

### -SerialNumber
Specifies the serial number of the display(s) to retrieve information for. If multiple serial number(s) are given and multiple displays are connected, return data will only show information for Displays associated with specified serial number(s). If not specified, information for all connected displays will be returned.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).
