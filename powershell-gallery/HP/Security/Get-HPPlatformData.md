---
external help file: HP.PlatformCertificate.Validation.PowerShell.dll-Help.xml
Module Name: HP.Security
online version:
schema: 2.0.0
---

# Get-HPPlatformData

## SYNOPSIS
Retrieves the current PC configuration

## SYNTAX

```
Get-HPPlatformData [<CommonParameters>]
```

## DESCRIPTION
Reads the current PC configuration and returns it into an object that matches with the TCG Platform Certificate Profile specification, version 1.1 Revision 19.

## EXAMPLES
### Example 1
```powershell
PS C:\> Get-HPPlatformData
```

### Example 2
```powershell
PS C:\> Get-HPPlatformData | ConvertTo-Json -Depth 8
```

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).
