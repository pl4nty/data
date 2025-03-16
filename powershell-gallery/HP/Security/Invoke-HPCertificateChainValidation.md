---
external help file: HP.PlatformCertificate.Validation.PowerShell.dll-Help.xml
Module Name: HP.Security
online version:
schema: 2.0.0
---

# Invoke-HPCertificateChainValidation

## SYNOPSIS
Verifies whether a Platform Certificate has been issued by HP, by validating intermediate and root certificates trust chain.

## SYNTAX

```
Invoke-HPCertificateChainValidation [-PlatformCertificate <String>] -Ica <String> -RootCa <String> [<CommonParameters>]
Invoke-HPCertificateChainValidation [-UseLocalPlatformCertificate] -Ica <String> -RootCa <String> [<CommonParameters>]
```

## DESCRIPTION
This command receives intermediate and root CAs offline paths in parameter and validate the trust chain. Intermediate and root CAs need to be downloaded online and stored offline either locally in the PC or in a shared location.

ICA location can be retrieved from the certificate by using Get-HPPlatformCertificateData command.

For instance, the following command will retrieve the online location of the ICA for certificate HPInc.00036635D0.BASE.cer:

Invoke-HPCertificateChainValidation-PlatformCertificate 'C:\Tools\Certificate\HPInc.00036635D0.BASE.cer' | Select-Object -ExpandProperty PlatformCertificateGeneralData | Select-Object -ExpandProperty PlatformCertificateExtensions | Select-Object -ExpandProperty PlatformCertificateAuthorityInfoAccess | Select-Object AccessLocation

## EXAMPLES

### Example 1
```powershell
PS C:\> Invoke-HPCertificateChainValidation -UseLocalPlatformCertificate -Ica C:\Users\Tools\Test\ica-2024.cer" -RootCa "C:\Users\Tools\Test\hp_ps1.cer"
```
### Example 2
```powershell
PS C:\> Invoke-HPCertificateChainValidation -UseLocalPlatformCertificate -Ica 'C:\Users\Tools\Test\ica-2024.cer' -RootCa 'C:\Users\Tools\Test\hp_ps1.cer'
```

### Example 3
```powershell
PS C:\> Invoke-HPCertificateChainValidation -PlatformCertificate 'C:\Users\Tools\Test\ HPInc.00036635D0.BASE.cer' -Ica 'C:\Users\Tools\Test\ica-2024.cer' -RootCa 'C:\Users\Tools\Test\hp_ps1.cer'
```

### Example 4
```powershell
PS C:\> Invoke-HPCertificateChainValidation -PlatformCertificate '.\HPInc.00036635D0.BASE.cer' -Ica '.\ica-2024.cer' -RootCa '.\hp_ps1.cer' | ConvertTo-Json -Depth 8
```
## PARAMETERS

### -Ica
Specifies the Intermediate CA of the HP base Platform Certificate

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
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

### -RootCa
Specifies the Root CA of the HP base Platform Certificate

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
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
