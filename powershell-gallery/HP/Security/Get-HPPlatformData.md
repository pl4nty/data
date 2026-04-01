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

## INPUTS

### None
This cmdlet does not accept pipeline input.

## OUTPUTS

### System.Object
Returns an object representing the current PC configuration that matches with the TCG Platform Certificate Profile specification, version 1.1 Revision 19. The object includes hardware components, firmware information, and system identifiers. The output can be converted to JSON format for easier viewing and processing.

## NOTES
- This cmdlet reads hardware and firmware configuration directly from the current system
- The output format conforms to TCG Platform Certificate Profile specification, version 1.1 Revision 19
- The returned object can be converted to JSON using ConvertTo-Json for easier analysis
- This command is useful for comparing current system configuration against platform certificates
