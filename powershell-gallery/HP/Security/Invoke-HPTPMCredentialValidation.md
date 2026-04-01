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

**TPM Certificate Chain Architectures:**

TPM systems can have different certificate chain architectures depending on the TPM manufacturer and model:

- **2-Level Chain (EK → Root CA):**
   - The TPM EK certificate is signed directly by the Root CA
   - Only the Root CA certificate is needed for validation

- **3-Level Chain (EK → ICA → Root CA):**
   - The TPM EK certificate is signed by an Intermediate CA (ICA)
   - The ICA is then signed by the Root CA
   - Both ICA and Root CA certificates are required for validation

- **4-Level Chain (EK → ICA-1 → ICA-2 → Root CA):**
   - The TPM EK certificate is signed by the Intermediate CA 1 (ICA-1)
   - The ICA-1 is then signed by the Intermediate CA 2 (ICA-2)
   - The ICA-2 is then signed by the Root CA
   - All three certificates (ICA-1, ICA-2, and Root CA) are required for validation

**Certificate Validation Process:**

The tool validates the certificate chain by matching the Authority Key Identifier (AKI) of each certificate with the Subject Key Identifier (SKI) of its issuer:
- For 2-level chains: EK's AKI must match Root CA's SKI
- For 3-level chains: EK's AKI must match ICA's SKI, and ICA's AKI must match Root CA's SKI
- For 4-level chains: EK's AKI must match ICA-1's SKI, ICA-1's AKI must match ICA-2's SKI, and ICA-2's AKI must match Root CA's SKI

Providing the wrong certificates (e.g., only Root CA when ICA is required) will result in validation failure because the key identifiers won't match.

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
Validates a TPM with a 3-level certificate chain (EK → ICA → Root CA), providing both ICA and Root CA certificates in the correct order.

### Example 4
```powershell
PS C:\> Invoke-HPTPMCredentialValidation -TpmCertificateChain rootCa.cer
```
Validates a TPM with a 2-level certificate chain (EK → Root CA) using only the Root CA certificate.

### Example 5
```powershell
PS C:\> Invoke-HPTPMCredentialValidation -TpmCertificateChain "ica1.cer", "ica2.cer", "rootCa.cer"
```
Validates a TPM with a 4-level certificate chain (EK → ICA-1 → ICA-2 → Root CA), providing both intermediate certificates and the Root CA in the correct order.

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

**IMPORTANT - Certificate Order:**
Certificates must be provided in order from the certificate closest to the EK (leaf) to the Root CA:
- Format: **ica, rootCa** (NOT rootCa, ica)

**Supported Certificate Chain Formats:**

1. **rootCa only** - For 2-level chains where EK is signed directly by Root CA:
   ```powershell
   -TpmCertificateChain rootCa.cer
   ```

2. **ica, rootCa** - For 3-level chains:
   ```powershell
   -TpmCertificateChain ica.cer, rootCa.cer
   ```
   The tool validates: Root CA (self-signed) → ICA (signed by Root CA) → EK (signed by ICA)

3. **ica1, ica2, rootCa** - For 4-level chains:
   ```powershell
   -TpmCertificateChain ica1.cer, ica2.cer, rootCa.cer
   ```
   The tool validates: Root CA (self-signed) → ICA-2 (signed by Root CA) → ICA-1 (signed by ICA-2) → EK (signed by ICA-1)

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

## INPUTS

### None
This cmdlet does not accept pipeline input.

## OUTPUTS

### System.Object
Returns a validation result object containing information about the TPM credential validation, including the TPM EK certificate details, verification status of the certificate chain, and confirmation that the TPM matches the one specified in the platform certificate.

## NOTES
- This cmdlet validates the TPM EK (Endorsement Key) certificate found in the TPM register
- The Microsoft TrustedTpm.cab file can be downloaded from: https://learn.microsoft.com/en-us/windows-server/security/guarded-fabric-shielded-vm/guarded-fabric-install-trusted-tpm-root-certificates
- Using -CabFile is recommended as it simplifies TPM certificate chain management
- When using -TpmCertificateChain, intermediate and root certificates must be downloaded manually and stored offline. Also, It must be provided in leaf-to-root order: ica, rootCa (NOT rootCa, ica).
- The tool verifies that root and intermediate certificates were issued by legitimate TPM vendors
- Successful validation provides confidence in the TPM's ability to attest validation commands
