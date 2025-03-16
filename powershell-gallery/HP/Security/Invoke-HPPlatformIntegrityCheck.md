---
external help file: HP.PlatformCertificate.Validation.PowerShell.dll-Help.xml
Module Name: HP.Security
online version:
schema: 2.0.0
---

# Invoke-HPPlatformIntegrityCheck

## SYNOPSIS
Verifies components and configuration on the PC match Platform Certificate.

## SYNTAX

```
Invoke-HPPlatformIntegrityCheck [-UseLocalPlatformCertificate] [<CommonParameters>]

Invoke-HPPlatformIntegrityCheck [-PlatformCertificate <String>] [<CommonParameters>]

Invoke-HPPlatformIntegrityCheck [-PlatformCertificate <String>] [-NoInstallPlatformCertificate] [<CommonParameters>]
```

## DESCRIPTION
Verifies components and configuration on the PC match Platform Certificate.

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
PS C:\> Invoke-HPPlatformIntegrityCheck -PlatformCertificate HPInc.SCN3315BDN.BASE.cer -NoInstallPlatformCertificate | ConvertTo-Json -Depth 8
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
