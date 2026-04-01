---
external help file: HP.PlatformCertificate.Validation.PowerShell.dll-Help.xml
Module Name: HP.Security
online version:
schema: 2.0.0
---

# Invoke-HPCertificateChainValidation

## SYNOPSIS
Validates HP Platform Certificate trust chains.

## SYNTAX

```
Invoke-HPCertificateChainValidation -PlatformCertificate <String> -Ica <String> [-ValidateRevocation] [<CommonParameters>]

Invoke-HPCertificateChainValidation -UseLocalPlatformCertificate -Ica <String> [-ValidateRevocation] [<CommonParameters>]

Invoke-HPCertificateChainValidation -UseOssIntegration [-Url <String>] [-ClientId <String>] [-ClientSecret <String>] -Ica <String> [-ValidateRevocation] [<CommonParameters>]

Invoke-HPCertificateChainValidation -PlatformCertificate <String> -UseOnlineCertificateChain [-ValidateRevocation] [<CommonParameters>]

Invoke-HPCertificateChainValidation -UseLocalPlatformCertificate -UseOnlineCertificateChain [-ValidateRevocation] [<CommonParameters>]

Invoke-HPCertificateChainValidation -UseOssIntegration [-Url <String>] [-ClientId <String>] [-ClientSecret <String>] -UseOnlineCertificateChain [-ValidateRevocation] [<CommonParameters>]
```

## DESCRIPTION

This cmdlet validates the trust chain of an HP Platform Certificate against intermediate and root certificate authorities. It supports both offline and online validation modes:

1. Offline mode: The command receives an intermediate CA offline path in the -Ica parameter and validates the trust chain. Intermediate CA certificates need to be downloaded online and stored offline either locally in the PC or in a shared location.

2. Online mode: Using the -UseOnlineCertificateChain parameter, the tool will automatically access and download intermediate and root CAs needed to complete trust chain verification without requiring the user to manually download these certificates. Additionally, when using the -ValidateRevocation parameter, the tool will perform online revocation checks on all certificates in the chain, including platform certificate, intermediate CA, and root CA, verifying that none of the certificates have been revoked.

ICA location can be retrieved from the certificate by using Get-HPPlatformCertificateData command.

## EXAMPLES

### Example 1
```powershell
PS C:\> Invoke-HPCertificateChainValidation -PlatformCertificate 'C:\Users\Tools\Test\HPInc.00036635D0.BASE.cer' -Ica 'C:\Users\Tools\Test\ica-2024.cer'
```

### Example 2
```powershell
PS C:\> Invoke-HPCertificateChainValidation -UseLocalPlatformCertificate -Ica 'C:\Users\Tools\Test\ica-2024.cer'
```

### Example 3
```powershell
PS C:\> Invoke-HPCertificateChainValidation -UseOssIntegration -Ica 'C:\Users\Tools\Test\ica-2024.cer'
```

### Example 4
```powershell
PS C:\> Invoke-HPCertificateChainValidation -PlatformCertificate 'C:\Users\Tools\Test\HPInc.00036635D0.BASE.cer' -UseOnlineCertificateChain
```

### Example 5
```powershell
PS C:\> Invoke-HPCertificateChainValidation -UseLocalPlatformCertificate -UseOnlineCertificateChain
```

### Example 6
```powershell
PS C:\> Invoke-HPCertificateChainValidation -UseOssIntegration -UseOnlineCertificateChain
```

### Example 7
```powershell
PS C:\> Invoke-HPCertificateChainValidation -PlatformCertificate 'C:\Users\Tools\Test\HPInc.00036635D0.BASE.cer' -Ica 'C:\Users\Tools\Test\ica-2024.cer' -ValidateRevocation
```

### Example 8
```powershell
PS C:\> Invoke-HPCertificateChainValidation -UseLocalPlatformCertificate -Ica 'C:\Users\Tools\Test\ica-2024.cer' -ValidateRevocation
```

### Example 9
```powershell
PS C:\> Invoke-HPCertificateChainValidation -UseOssIntegration -Url "https://custom-oss-api.example.com/api/v1/platformCerts" -ClientId "your-client-id" -ClientSecret "your-client-secret" -Ica 'C:\Users\Tools\Test\ica-2024.cer' -ValidateRevocation
```

### Example 10
```powershell
PS C:\> Invoke-HPCertificateChainValidation -PlatformCertificate 'C:\Users\Tools\Test\HPInc.00036635D0.BASE.cer' -UseOnlineCertificateChain -ValidateRevocation
```

### Example 11
```powershell
PS C:\> Invoke-HPCertificateChainValidation -UseLocalPlatformCertificate -UseOnlineCertificateChain -ValidateRevocation
```

### Example 12
```powershell
PS C:\> Invoke-HPCertificateChainValidation -UseOssIntegration -Url "https://custom-oss-api.example.com/api/v1/platformCerts" -ClientId "your-client-id" -ClientSecret "your-client-secret" -UseOnlineCertificateChain -ValidateRevocation
```

### Example 13
```powershell
PS C:\> Invoke-HPCertificateChainValidation -PlatformCertificate C:\Users\Tools\Test\Certificates.zip -Ica 'C:\Users\Tools\Test\ica-2024.cer'
```

### Example 14
```powershell
PS C:\> Invoke-HPCertificateChainValidation -PlatformCertificate C:\Users\Tools\Test\ -Ica 'C:\Users\Tools\Test\ica-2024.cer'
```

### Example 15
```powershell
PS C:\> Invoke-HPCertificateChainValidation -UseOssIntegration -Url "https://custom-oss-api.example.com/api/v1/platformCerts" -Ica 'C:\Users\Tools\Test\ica-2024.cer'
```

### Example 16
```powershell
PS C:\> Invoke-HPCertificateChainValidation -UseOssIntegration -ClientId "your-client-id" -ClientSecret "your-client-secret" -UseOnlineCertificateChain
```

## PARAMETERS

### -Ica
Specifies the path to the Intermediate Certificate Authority (ICA) certificate file for validating the HP Platform Certificate. Required when not using -UseOnlineCertificateChain.

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

### -UseOnlineCertificateChain
If specified, the tool automatically downloads and uses the online certificate chain for validation instead of requiring a local ICA certificate. This enables automatic retrieval of intermediate and root CA certificates.

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

### -ValidateRevocation
If specified, the tool will perform online revocation checks on all certificates in the chain:
- Platform certificate revocation: checks if the serial number of the leaf certificate is present on the ICA's CRL
- ICA revocation: checks if the serial number of the ICA is present on the Root's CRL
- RootCA revocation: checks if the serial number of the RootCA is present on the Root's CRL

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

## INPUTS

### None
This cmdlet does not accept pipeline input.

## OUTPUTS

### System.Object
Returns a validation result object containing information about the certificate chain validation, including the status of each certificate in the chain, trust chain verification results, and any revocation check results if -ValidateRevocation was specified.

## NOTES
- Intermediate CA certificates can be obtained from the Authority Information Access (AIA) extension in the platform certificate
- Use Get-HPPlatformCertificateData to retrieve the ICA location from the platform certificate
- When using -UseOnlineCertificateChain, the tool automatically downloads intermediate and root CA certificates
- The -ValidateRevocation parameter requires online connectivity to check Certificate Revocation Lists (CRLs)
- Offline mode requires manual download and storage of intermediate CA certificates
- When using -UseOssIntegration, valid OSS API credentials and network connectivity are required
