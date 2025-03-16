---
external help file: HP.PlatformCertificate.Validation.PowerShell.dll-Help.xml
Module Name: HP.Security
online version:
schema: 2.0.0
---

# Get-HPPlatformCertificateData

## SYNOPSIS
Retrieves the contents of an x509 Platform Certificate

## SYNTAX

```
Get-HPPlatformCertificateData [-UseLocalPlatformCertificate] [<CommonParameters>]

Get-HPPlatformCertificateData [-PlatformCertificate <String>] [<CommonParameters>]
```

## DESCRIPTION
This command retrieves the contents of an x509 Platform Certificate according to the TCG Platform Certificate Profile, version 1.1 Revision 19. The output is an object convertible to Json.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-HPPlatformCertificateData -UseLocalPlatformCertificate
```

### Example 2
```powershell
PS C:\> Get-HPPlatformCertificateData -PlatformCertificate C:\Users\Tools\Test\HPInc.SCN3315BDN.BASE.cer
```

### Example 3
```powershell
PS C:\> Get-HPPlatformCertificateData -UseLocalPlatformCertificate | ConvertTo-Json -Depth 8
```

## PARAMETERS

### -PlatformCertificate
Specifies the path to the platform certificate file that is stored offline either locally in the PC or in a shared location. If the platform certificate belongs to the PC, the tool installs platform certificate in the local PC in both EFI system partition and UEFI variable. Please follow the following format for the Platform Certificate file: HPInc.<serial number>.BASE.cer

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseLocalPlatformCertificate
If specified, this command uses the Platform Certificate that is stored locally in the PC. The default locations for the certificate are the EFI System Partition /boot/tcg/cert/platform/ or \efi\tcg\cert\platform and UEFI Variable HpPlatformCertificateBase GUID {B44ED025-A047-4312-9E62-A1C3ACC8684D}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).
