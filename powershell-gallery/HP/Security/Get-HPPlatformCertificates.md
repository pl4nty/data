---
external help file: HP.PlatformCertificate.Validation.PowerShell.dll-Help.xml
Module Name: HP.Security
online version:
schema: 2.0.0
---

# Get-HPPlatformCertificates

## SYNOPSIS
Downloads one or more HP platform certificate packages from OSS.

## SYNTAX

```
Get-HPPlatformCertificates -UseOssIntegration -PurchaseOrder <String> [-Url <String>] [-ClientId <String>] [-ClientSecret <String>] [-OutputFolder <String>] [<CommonParameters>]

Get-HPPlatformCertificates -UseOssIntegration -SerialNumber <String> -ProductNumber <String> [-Url <String>] [-ClientId <String>] [-ClientSecret <String>] [-OutputFolder <String>] [<CommonParameters>]

Get-HPPlatformCertificates -UseOssIntegration -ListFile <String> [-Url <String>] [-ClientId <String>] [-ClientSecret <String>] [-OutputFolder <String>] [<CommonParameters>]
```

## DESCRIPTION
This cmdlet downloads platform certificate packages from the OSS (Order Status Service) API and saves them as ZIP files.

Exactly one request source must be provided:

- Use `-PurchaseOrder` to request all devices associated with a purchase order.

- Use `-SerialNumber` together with `-ProductNumber` to request a single device.

- Use `-ListFile` to request up to 50 devices from a text file containing `SerialNumber;ProductNumber` pairs.

Use `-UseOssIntegration` to enable OSS downloads. Although the switch is optional at PowerShell binding time, OSS integration is currently the only supported mode for this cmdlet, so execution fails validation if the switch is omitted. Successful downloads are written to the output folder as `platformcertificate_<SerialNumber>_<ProductNumber>.zip`. Failed downloads create `platformcertificate_<SerialNumber>_<ProductNumber>.error` files containing the OSS API status or error text. If `-OutputFolder` is not provided, files are written to the current working directory. The cmdlet returns a summary object that includes the total requested, succeeded, failed, and per-device results.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-HPPlatformCertificates -UseOssIntegration -PurchaseOrder "PO-001"
```

Downloads platform certificate packages for all devices associated with purchase order `PO-001` and saves the results in the current working directory.

### Example 2
```powershell
PS C:\> Get-HPPlatformCertificates -UseOssIntegration -PurchaseOrder "PO-001" -OutputFolder "C:\Downloads\PlatformCertificates"
```

Downloads the purchase-order results and saves the ZIP and `.error` files in `C:\Downloads\PlatformCertificates`.

### Example 3
```powershell
PS C:\> Get-HPPlatformCertificates -UseOssIntegration -SerialNumber "SN123456" -ProductNumber "PN123#ABA"
```

Downloads the platform certificate package for a single device identified by serial number and product number.

### Example 4
```powershell
PS C:\> Get-HPPlatformCertificates -UseOssIntegration -ListFile "C:\Temp\devices.txt"
```

Downloads platform certificate packages for devices listed in `devices.txt`. Each non-empty line in the file must use the format `SerialNumber;ProductNumber`.

### Example 5
```powershell
PS C:\> Get-HPPlatformCertificates -UseOssIntegration -ListFile "C:\Temp\devices.txt" -Url "https://custom-oss-api.example.com/api/v1/platformCerts" -ClientId "your-client-id" -ClientSecret "your-client-secret"
```

Downloads platform certificate packages using a custom OSS endpoint and explicit credentials.

### Example 6
```powershell
PS C:\> Get-HPPlatformCertificates -UseOssIntegration -PurchaseOrder "PO-001" | ConvertTo-Json -Depth 5
```

Downloads the certificate packages and converts the returned summary object to JSON for scripting or logging.

### Example 7
```powershell
PS C:\> Get-HPPlatformCertificates -UseOssIntegration -ListFile "C:\Temp\devices.txt" -Verbose
```

Downloads platform certificate packages for the device list and emits verbose logging for authentication, request processing, and file creation.

### Example 8
```powershell
PS C:\> Get-HPPlatformCertificates -UseOssIntegration -PO "PO-001"
```

Downloads platform certificate packages for all devices associated with purchase order `PO-001` using the `PO` alias for `-PurchaseOrder`.

## PARAMETERS

### -UseOssIntegration
Switch that enables OSS integration. This is currently the only supported mode for this cmdlet, and the command fails validation if the switch is omitted.

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

### -PurchaseOrder
Specifies the purchase order number used to download platform certificate packages for all devices returned by OSS for that purchase order. This parameter is mutually exclusive with `-ListFile` and the `-SerialNumber`/`-ProductNumber` pair. Alias: `PO`.

```yaml
Type: String
Parameter Sets: (All)
Aliases: PO

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SerialNumber
Specifies the device serial number for a single-device platform certificate download. This parameter must be used together with `-ProductNumber` and cannot be combined with `-PurchaseOrder` or `-ListFile`.

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

### -ProductNumber
Specifies the device product number for a single-device platform certificate download. This parameter must be used together with `-SerialNumber` and cannot be combined with `-PurchaseOrder` or `-ListFile`.

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

### -ListFile
Specifies the path to a text file containing one device per line in the format `SerialNumber;ProductNumber`. Empty lines are ignored. Leading and trailing spaces are trimmed. Lines that do not match the expected format, have missing values, fail the SerialNumber/ProductNumber regex validation, or are duplicate pairs are treated as invalid and produce a `.error` file in the output folder. The file can contain at most 50 non-empty lines. This parameter is mutually exclusive with `-PurchaseOrder` and the `-SerialNumber`/`-ProductNumber` pair.

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

### -OutputFolder
Specifies the folder where downloaded platform certificate ZIP files and `.error` files are written. If the folder does not exist, it is created. If this parameter is omitted, the current working directory is used.

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

### -Url
Specifies a custom OSS API endpoint URL for the download operation. If omitted, the default production OSS API endpoint is used.

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
Specifies the OSS integration client identifier used for authentication. If omitted, the cmdlet can prompt for credentials interactively, depending on the execution environment.

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
Specifies the OSS integration client secret used for authentication. Provide this value together with `-ClientId` for unattended or scripted use. If omitted, the cmdlet can prompt for credentials interactively, depending on the execution environment.

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

### HP.PlatformCertificate.Validation.Validator.Models.PlatformCertificatesResult
Returns a summary object with these properties:

- `TotalRequested`: Total number of device requests submitted to OSS.
- `TotalSucceeded`: Number of devices for which a certificate package was returned.
- `TotalFailed`: Number of devices that did not return a certificate package.
- `Results`: A collection of per-device results. Each entry includes `SerialNumber`, `ProductNumber`, `PurchaseOrder`, `IsSuccess`, and `ErrorMessage`.

## NOTES
- `-UseOssIntegration` is optional in PowerShell parameter binding, but the cmdlet currently requires OSS mode and fails validation if the switch is omitted.
- Provide exactly one source: `-PurchaseOrder`, `-ListFile`, or `-SerialNumber` together with `-ProductNumber`.
- Successful downloads are saved as `platformcertificate_<SerialNumber>_<ProductNumber>.zip`.
- Failed downloads are saved as `platformcertificate_<SerialNumber>_<ProductNumber>.error` and contain the OSS API status or an internal package-format error message.
- If a returned certificate package is not valid Base64, the cmdlet writes an `.error` file instead of a ZIP file.
- Devices present in the request but absent from the API response each produce a `.error` file.
- When using `-PurchaseOrder` and the API returns an empty response, a single `platformcertificate_PO_<PurchaseOrder>.error` file is saved.
- The `-ListFile` can contain at most 50 non-empty lines. Lines with invalid format, missing values, regex-invalid SerialNumber or ProductNumber, or duplicate `SerialNumber;ProductNumber` pairs produce a `.error` file. SerialNumber must be exactly 10 alphanumeric characters. ProductNumber must be 6–7 alphanumeric characters with an optional `#XXX` suffix.
- Relative paths for `-ListFile` and `-OutputFolder` are resolved from the current PowerShell working directory.
- Network connectivity and valid OSS credentials are required.