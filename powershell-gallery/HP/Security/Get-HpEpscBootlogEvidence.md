---
external help file: HP.PlatformCertificate.Validation.PowerShell.dll-Help.xml
Module Name: HP.Security
online version:
schema: 2.0.0
---

# Get-HpEpscBootlogEvidence

## SYNOPSIS
Retrieves HP Endpoint Security Controller Bootlog Evidence

## SYNTAX

```
Get-HpEpscBootlogEvidence [-Nonce <Byte[]>] [<CommonParameters>]
Get-HpEpscBootlogEvidence -InFile <String> [<CommonParameters>]
Get-HpEpscBootlogEvidence [-Nonce <Byte[]>] -OutFile <String> [<CommonParameters>]
```

## DESCRIPTION

This command retrieves HP Endpoint Security Controller (EpSC) bootlog evidence that contains attestation data about the system boot process. The evidence includes cryptographic signatures and measurements that can be used to verify the integrity and authenticity of the boot sequence.

The cmdlet can operate in different modes:
1. **BIOS Extraction Mode**: When neither -InFile nor -OutFile are specified, the cmdlet retrieves evidence directly from the EpSC on the current system using a random nonce.
2. **BIOS Extraction with Custom Nonce**: When -Nonce parameter is provided, the cmdlet uses the specified 32-byte nonce for evidence generation.
3. **BIOS Extraction with File Output**: When -OutFile parameter is provided, the raw evidence data is saved to the specified file in addition to returning the parsed evidence object.
4. **File Input Mode**: When -InFile parameter is provided, the cmdlet loads and parses evidence from the specified binary file instead of extracting from the current system.

**DEPENDENCY**: HP Endpoint Security Controller Gen5 is required if evidence is being retrieved from EpSC on the current platform.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-HpEpscBootlogEvidence
```

Returns an object with HP EpSC bootlog evidence using a random nonce read from the EpSC on the current system.

### Example 2
```powershell
PS C:\> $nonce = [byte[]](1..32 | ForEach-Object { [byte](Get-Random -Minimum 0 -Maximum 256) })
PS C:\> Get-HpEpscBootlogEvidence -Nonce $nonce
```

Creates a custom 32-byte nonce and retrieves HP EpSC bootlog evidence using the specified nonce from the EpSC on the current system.

### Example 3
```powershell
PS C:\> Get-HpEpscBootlogEvidence -InFile "C:\Users\Tools\Test\HpEpscBootlogEvidence.bin"
```

Returns an object with HP EpSC bootlog evidence loaded from the specified binary file.

### Example 4
```powershell
PS C:\> Get-HpEpscBootlogEvidence -OutFile "C:\Users\Tools\Test\HpEpscBootlogEvidence.bin"
```

Retrieves HP EpSC bootlog evidence using a random nonce and saves the raw evidence data to the specified file.

### Example 5
```powershell
PS C:\> $nonce = [byte[]](1..32 | ForEach-Object { [byte](Get-Random -Minimum 0 -Maximum 256) })
PS C:\> Get-HpEpscBootlogEvidence -Nonce $nonce -OutFile "C:\Users\Tools\Test\HpEpscBootlogEvidence.bin"
```

Creates a custom 32-byte nonce, retrieves HP EpSC bootlog evidence using the specified nonce from the EpSC on the current system, and saves the raw evidence data to the specified file.

## PARAMETERS

### -Nonce
A 32-byte array to be used as the input nonce for HP EpSC evidence generation. This parameter is optional and only used when the EpSC evidence is retrieved directly from the HP EpSC component on the target system. The HP EpSC will include this nonce in the evidence to confirm the evidence is fresh and not a replay of old evidence.

```yaml
Type: Byte[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InFile
If this parameter is present, the HP EpSC bootlog evidence will be loaded from the specified binary format file instead of loading from the current system. This parameter is optional and mutually exclusive with -OutFile and -Nonce.

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

### -OutFile
If this parameter is present, the raw HP EpSC bootlog evidence (retrieved from the current system's EpSC) will be saved to the specified file name in binary format. This parameter is optional and mutually exclusive with -InFile.

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

### EpscBootlogEvidenceView
Returns an object containing:
- **RawData**: The raw binary evidence data
- **Version**: The evidence structure version
- **Ecr0**: ECR0 attestation data
- **Ecr1**: ECR1 attestation data
- **Nonce**: The nonce used for evidence generation
- **Uuid**: The system UUID
- **SignedData**: The cryptographically signed portion of the evidence

## NOTES
- **DEPENDENCY**: HP Endpoint Security Controller Gen5 is required if evidence is being retrieved from EpSC on the current platform
- This command requires an HP system with Endpoint Security Controller (EpSC) support
- When extracting from EpSC, the command requires appropriate system permissions
- The nonce parameter must be exactly 32 bytes when specified
- Binary evidence files should contain valid EpSC bootlog evidence data
- Evidence data includes cryptographic signatures that can be validated using Invoke-HpEpscBootlogEvidenceValidation
- Both -InFile and -OutFile should not be used together