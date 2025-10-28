---
external help file: HP.PlatformCertificate.Validation.PowerShell.dll-Help.xml
Module Name: HP.Security
online version:
schema: 2.0.0
---

# Invoke-HPPlatformIntegrityCheck

## SYNOPSIS
Validates PC components against HP Platform Certificate.

## SYNTAX

```
Invoke-HPPlatformIntegrityCheck -PlatformCertificate <string> [-NoInstallPlatformCertificate] [<CommonParameters>]
Invoke-HPPlatformIntegrityCheck -UseLocalPlatformCertificate [<CommonParameters>]
```

## DESCRIPTION
This cmdlet verifies that the current PC's components and configuration match the specifications in the HP Platform Certificate.

Components and configuration in scope include disk, memory, processor, graphic card, chassis, baseboard, networking, PCIe devices, NVMe devices, BIOS firmware version, feature byte, UUID, and Endpoint Security Controller (EpSC) ID certificate hash included in the PC.

## EXAMPLES

### Example 1
```powershell
PS C:\> Invoke-HPPlatformIntegrityCheck -UseLocalPlatformCertificate
```

### Example 2
```powershell
PS C:\> Invoke-HPPlatformIntegrityCheck -PlatformCertificate C:\Users\Tools\Test\HPInc.SCN3315BDN.BASE.cer
```

### Example 3
```powershell
PS C:\> Invoke-HPPlatformIntegrityCheck -PlatformCertificate C:\Users\Tools\Test\HPInc.SCN3315BDN.BASE.cer -NoInstallPlatformCertificate
```

### Example 4
```powershell
PS C:\> Invoke-HPPlatformIntegrityCheck -PlatformCertificate C:\Users\Tools\Test
```

### Example 5
```powershell
PS C:\> Invoke-HPPlatformIntegrityCheck -PlatformCertificate C:\Users\Tools\Test\Certificates.zip
```

## PARAMETERS

### -NoInstallPlatformCertificate
If specified, the command will not save the Platform Certificate passed into the PlatformCertificate parameter locally on the PC.

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

### -PlatformCertificate
Specifies the path to a platform certificate file, directory containing platform certificates, or zip file with platform certificates. When using a directory or zip file, the tool searches for files named in the format: HPInc.<serial_number>.BASE.cer


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
If specified, this command uses the Platform Certificate that is stored locally in the PC. The default locations for the certificate are:
- **EFI System Partition:** /boot/tcg/cert/platform/ or \efi\tcg\cert\platform
- **UEFI Variable:** HpPlatformCertificateBase GUID {B44ED025-A047-4312-9E62-A1C3ACC8684D}

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
