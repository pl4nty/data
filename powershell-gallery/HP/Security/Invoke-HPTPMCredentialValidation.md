---
external help file: HP.PlatformCertificate.Validation.PowerShell.dll-Help.xml
Module Name: HP.Security
online version:
schema: 2.0.0
---

# Invoke-HPTPMCredentialValidation

## SYNOPSIS
Verifies the TPM on the PC matches the one in Platform Certificate and verifies Intermediate CA(s) and Root CA trust chain.

## SYNTAX

```
Invoke-HPTPMCredentialValidation [-CabFile <String>] [-TpmCertificateChain <String[]>] [<CommonParameters>]
```

## DESCRIPTION
This verification process ensures the TPM in the executing PC is authentic and matches Platform Certificate. It also validates that the collection of root and intermediate certificates that used to sign the TPM certificates were indeed issued by the TPM Vendors.
The TPM's certificate used for this evaluation is the TPM EK Certificate found at the register of the TPM.

After successful verification, it provides the user with the confidence in the TPM to attest the validation commands executed by the verification tool.

## EXAMPLES

### Example 1
```powershell
PS C:\> Invoke-HPTPMCredentialValidation -CabFile C:\Users\Tools\Test\TrustedTpm.cab
```

### Example 2
```powershell
PS C:\> Invoke-HPTPMCredentialValidation -CabFile TrustedTpm.cab | ConvertTo-Json -Depth 8
```

### Example 3
```powershell
PS C:\> Invoke-HPTPMCredentialValidation -TpmCertificateChain ica.cer, rootCa.cer
```

## PARAMETERS

### -CabFile
Specifies the cab file to use. The user needs to download the collection of trusted TPM root and intermediate signing certificates issued by Microsoft and save it offline (e.g., locally or in a shared location). During the integrity verification execution, the tool looks in the cabFile for the intermediate and root certificates that belong to the TPM on the running PC. Then the tool validates intermediate and root certificates trust chain.
This option is recommended when the user does not want to manage the TPM certificate chain individually. More information on the Microsoft package and download can be found from this link https://learn.microsoft.com/en-us/windows-server/security/guarded-fabric-shielded-vm/guarded-fabric-install-trusted-tpm-root-certificates
Path to the cab file is the offline path to the collection of trusted TPM root and intermediate signing certificates issued by Microsoft.

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

### -TpmCertificateChain
Specifies the whole TPM's certificate chain for the tool to validate. The tool will try to match the TPM's EK certificate with the certificate chain passed as parameter and validate them.
Path to TPM's ICA certificate is the offline path of the certificate. User needs to download the intermediate certificate(s) online and save it offline before the tool execution.
RootCa is the root CA of the TPM EK certificate.
Path to TPM's root certificate is the offline path of the certificate. User needs to download the root certificate online and save it offline before the tool execution.
```yaml
Type: String[]
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
