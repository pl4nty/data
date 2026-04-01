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
Get-HPPlatformCertificateData -UseLocalPlatformCertificate [<CommonParameters>]

Get-HPPlatformCertificateData -PlatformCertificate <String> [<CommonParameters>]

Get-HPPlatformCertificateData -UseOssIntegration [-Url <String>] [-ClientId <String>] [-ClientSecret <String>] [<CommonParameters>]
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
PS C:\> Get-HPPlatformCertificateData -PlatformCertificate C:\Users\Tools\Test\
```

### Example 4
```powershell
PS C:\> Get-HPPlatformCertificateData -UseLocalPlatformCertificate | ConvertTo-Json -Depth 8
```

### Example 5
```powershell
PS C:\> Get-HPPlatformCertificateData -PlatformCertificate C:\Users\Tools\Test\Certificates.zip
```

### Example 6
```powershell
PS C:\> Get-HPPlatformCertificateData -UseOssIntegration
```

### Example 7
```powershell
PS C:\> Get-HPPlatformCertificateData -UseOssIntegration -Url "https://custom-oss-api.example.com/api/v1/platformCerts" -ClientId "your-client-id" -ClientSecret "your-client-secret"
```

### Example 8
```powershell
PS C:\> Get-HPPlatformCertificateData -UseOssIntegration -Url "https://custom-oss-api.example.com/api/v1/platformCerts"
```

### Example 9
```powershell
PS C:\> Get-HPPlatformCertificateData -UseOssIntegration -ClientId "your-client-id" -ClientSecret "your-client-secret"
```

## PARAMETERS

### -PlatformCertificate
Specifies the path to either a platform certificate file, a directory containing platform certificates, or a zip file containing platform certificates that are stored offline either locally in the PC or in a shared location. If the platform certificate belongs to the PC, the tool installs platform certificate in the local PC in both EFI system partition and UEFI variable. When providing a folder or a zip file, the tool will search for the certificate file named in the following format: HPInc.<serial_number_of_the_pc>.BASE.cer .

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
Returns a platform certificate data object containing the parsed contents of the x509 Platform Certificate according to the TCG Platform Certificate Profile specification. The object includes platform properties, component information, and can be converted to JSON format.

## NOTES
- This cmdlet requires the platform certificate to be in x509 format following TCG Platform Certificate Profile, version 1.1 Revision 19
- When using -UseLocalPlatformCertificate, the certificate must be installed in the EFI System Partition or UEFI variable
- The output object can be converted to JSON using ConvertTo-Json for easier viewing and processing
- When using -UseOssIntegration, network connectivity and valid OSS API credentials are required
- The tool can automatically install platform certificates when provided via -PlatformCertificate parameter
