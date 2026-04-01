---
external help file: HP.PlatformCertificate.Validation.PowerShell.dll-Help.xml
Module Name: HP.Security
online version:
schema: 2.0.0
---

# Get-HPEpscCerts

## SYNOPSIS
Retrieves HP Endpoint Security Controller Certificates

## SYNTAX

```
Get-HpEpscCerts [[-InFile] <String>] [<CommonParameters>]
Get-HpEpscCerts [[-OutFile] <String>] [<CommonParameters>]
```

## DESCRIPTION
This command retrieves three HP Endpoint Security Controller certificates as an object with a 3x2 array that includes the name of each certificate and a System.Security.Cryptography.X509Certificates.X509Certificate2 object for each.

**DEPENDENCY**: HP Endpoint Security Controller Gen5 is required if certificates are being retrieved from EpSC on the current platform.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-HpEpscCerts
```

Returns an object with three HP EpSC certificates.

### Example 2
```powershell
PS C:\> Get-HpEpscCerts -OutFile "HP EpSC Certificates.pem"
```

Retrieves HP EpSC certificates from current platform, returns an object with three HP EpSC certificates, and saves the certificates in PEM format to the specified file name.

### Example 3
```powershell
PS C:\> Get-HpEpscCerts -InFile "HP EpSC Certificates.pem"
```

Reads the specified HP EpSC certificate file in PEM format and returns an object with three HP EpSC certificates.

## PARAMETERS

### -InFile
If this parameter is present, the three HP EpSC certificates will be loaded from the specified PEM format file instead of loading from the current system. This parameter is optional and mutually exclusive with -OutFile.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutFile
If this parameter is present, the HP EpSC certificates (whether retrieved from the current system's EpSC or loaded from an input file) will be saved to the specified file name in PEM format. This parameter is optional and mutually exclusive with -InFile.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
This cmdlet does not accept pipeline input.

## OUTPUTS

### System.Object[]
Returns a 3x2 array of objects, each containing:
- Name: The descriptive name of the certificate
- Certificate: A System.Security.Cryptography.X509Certificates.X509Certificate2 object representing the certificate

## NOTES
- **DEPENDENCY**: HP Endpoint Security Controller Gen5 is required if certificates are being retrieved from EpSC on the current platform
- This command requires an HP system with Endpoint Security Controller (EpSC) support
- When extracting from EpSC, the command requires appropriate system permissions
- PEM format files should contain the certificates in standard PEM encoding format