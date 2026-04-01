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
Invoke-HPPlatformIntegrityCheck -PlatformCertificate <String> [-NoInstallPlatformCertificate] [<CommonParameters>]

Invoke-HPPlatformIntegrityCheck -UseLocalPlatformCertificate [<CommonParameters>]

Invoke-HPPlatformIntegrityCheck -UseOssIntegration [-Url <String>] [-ClientId <String>] [-ClientSecret <String>] [-NoInstallPlatformCertificate] [<CommonParameters>]
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

### Example 6
```powershell
PS C:\> Invoke-HPPlatformIntegrityCheck -UseOssIntegration
```

### Example 7
```powershell
PS C:\> Invoke-HPPlatformIntegrityCheck -UseOssIntegration -Url "https://custom-oss-api.example.com/api/v1/platformCerts" -ClientId "your-client-id" -ClientSecret "your-client-secret"
```

### Example 8
```powershell
PS C:\> Invoke-HPPlatformIntegrityCheck -UseOssIntegration -Url "https://custom-oss-api.example.com/api/v1/platformCerts"
```

### Example 9
```powershell
PS C:\> Invoke-HPPlatformIntegrityCheck -UseOssIntegration -ClientId "your-client-id" -ClientSecret "your-client-secret"
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

### -UseOssIntegration
If specified, this command uses the OSS (Order Status Service) API integration to retrieve the platform certificate. When this option is used, the tool can automatically prompt for OSS API credentials (client ID and client secret) and retrieve the platform certificate for the current device from the OSS system. Optional connection details can be supplied with `-Url`, `-ClientId`, and `-ClientSecret`. This option requires network connectivity and valid OSS API credentials.

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

### -Url
Specifies a custom OSS API endpoint URL for integration operations. This parameter is optional and can be used with the -UseOssIntegration parameter to override the default OSS API endpoint. If not specified, the tool uses the default production OSS API endpoint.

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

### -ClientId
Specifies the OSS integration client identifier used to authenticate when `-UseOssIntegration` is provided. If omitted, the cmdlet first prompts the user to enter the client ID interactively before asking for the client secret.

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

### -ClientSecret
Specifies the OSS integration client secret used together with `-ClientId` when `-UseOssIntegration` is enabled. Provide this value when using custom OSS credentials or automation scenarios. When not supplied, the cmdlet securely prompts for the secret immediately after the client ID prompt.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
This cmdlet does not accept pipeline input.

## OUTPUTS

### System.Object
Returns an integrity check result object containing detailed validation results for each component verified against the platform certificate. The object includes pass/fail status for disk, memory, processor, graphics card, chassis, baseboard, networking devices, PCIe devices, NVMe devices, BIOS firmware version, feature byte, UUID, and Endpoint Security Controller (EpSC) ID certificate hash.

## NOTES
- This cmdlet performs comprehensive hardware and firmware validation against the platform certificate
- When using -PlatformCertificate without -NoInstallPlatformCertificate, the certificate will be installed locally
- The tool verifies multiple components: disk, memory, processor, graphics, chassis, baseboard, network devices, PCIe devices, NVMe devices, BIOS version, feature byte, UUID, and EpSC ID certificate hash
- When using -UseOssIntegration, valid OSS API credentials and network connectivity are required
- The validation process compares current system configuration against the specifications in the platform certificate
