
Get-Module | ForEach-Object { Remove-Module -Name $_.Name -Force }
$PSModuleAutoloadingPreference = 'none'
Import-Module Microsoft.PowerShell.Utility
Import-Module Microsoft.PowerShell.Management
Import-Module Microsoft.PowerShell.Security

function Get-Subject-Type($cert)
{
    $basicConstraints = ($cert.Extensions | Where-Object { $_.Oid.FriendlyName -eq "Basic Constraints" }).format(1)
    $subjectTypeLine = ($basicConstraints -split '\r?\n')[0]
    $subjectTypeValue = ($subjectTypeLine -split '=')[1]
    return $subjectTypeValue
}

$Source = @"
	using System;
    using System.Text;
    using System.Diagnostics.Tracing;
    using Microsoft.PowerShell.Commands;
    using System.Security.Cryptography;
    using System.Security.Cryptography.X509Certificates;
    using System.Collections.Generic;
    using System.Linq;

    public static class TvmCertificatesEtwProvider
    {
        public static EventSource log = new EventSource("Microsoft.Windows.Sense.TvmCertificateCollectionEtw", EventSourceSettings.EtwSelfDescribingEventFormat  | EventSourceSettings.ThrowOnEventWriteErrors);
    }

    [EventData] // [EventData] makes it possible to pass an instance of the class as an argument to EventSource.Write().
    public class CollectedCertificate
    {
        public String PsPath { get; set; }
        public String Thumbprint { get; set; }
        public String SerialNumber { get; set; }
        public String Subject { get; set; }
        public String Issuer { get; set; }
        public String FriendlyName { get; set; }
        public String NotAfter { get; set; }
        public String NotBefore { get; set; }
        public String SignatureAlgorithm { get; set; }
        public int KeyLength { get; set; }
        public bool HasPrivateKey { get; set; }
        public String KeyUsage { get; set; }
        public String SubjectAlternativeName { get; set; }
        public String SubjectType { get; set; }
        public String ExtendedKeyUsage { get; set; }
        public String ThumbprintChain { get; set; }

        public CollectedCertificate(
            string psPath,
            string thumbprint,
            string serialNumber,
            string subject,
            string issuer,
            string friendlyName,
            string notAfter,
            string notBefore,
            string signatureAlgorithm,
            int keyLength,
            bool hasPrivateKey,
            string keyUsage,
            string subjectAlternativeName,
            string subjectType,
            string extendedKeyUsage,
            string thumbprintChain
        )
        {
            this.PsPath = psPath;
            this.Thumbprint = thumbprint;
            this.SerialNumber = serialNumber;
            this.Subject = subject;
            this.Issuer = issuer;
            this.FriendlyName = friendlyName;
            this.NotAfter = notAfter;
            this.NotBefore = notBefore;
            this.SignatureAlgorithm = signatureAlgorithm;
            this.KeyLength = keyLength;
            this.HasPrivateKey = hasPrivateKey;
            this.KeyUsage = keyUsage;
            this.SubjectAlternativeName = subjectAlternativeName;
            this.SubjectType = subjectType;
            this.ExtendedKeyUsage = extendedKeyUsage;
            this.ThumbprintChain = thumbprintChain;
        }
    }

    [EventData] 
    public class CollectedCertificateIndex
    {
			public String Index { get; set; }

            public CollectedCertificateIndex(string index)
            {
				this.Index = index;
            }
    }                                                  
"@
Add-Type -TypeDefinition $Source -Language CSharp -IgnoreWarnings

echo "Start certificates script version 1.1"

$certificates = Get-ChildItem Cert:\ -Recurse | 
where { $_.PSIsContainer -eq $false } | 
select PSPath, Thumbprint, SerialNumber, Subject, Issuer, FriendlyName, NotAfter, NotBefore, @{n = "SignatureAlgorithm"; e = { $_.SignatureAlgorithm.FriendlyName } }, @{n = "KeyLength"; e = { $_.PublicKey.Key.KeySize } }, HasPrivateKey, 
@{n = "KeyUsage"; e = { ($_.Extensions | Where-Object { $_.Oid.FriendlyName -eq "Key Usage" }).Format(1) } }, @{n = "SubjectAlternativeName"; e = { ($_.Extensions | Where-Object { $_.Oid.FriendlyName -eq "Subject Alternative Name" }).Format(1) } }, @{n = "SubjectType"; e = { Get-Subject-Type -cert $_ } },
@{n = "ExtendedKeyUsage"; e = { ($_.Extensions | Where-Object { $_.Oid.FriendlyName -eq "Enhanced Key Usage" }).Format(1) } }

$certificatesIndex = @()

$CollectedCertificateProvider = [TvmCertificatesEtwProvider]::log

ForEach ($certificate in $certificates)
{

    $psPath = $certificate.PSPath
    $thumbprint = $certificate.Thumbprint
    $serialNumber = $certificate.SerialNumber
    $subject = $certificate.Subject
    $issuer = $certificate.Issuer
    $friendlyName = $certificate.FriendlyName
    $notAfter = $certificate.NotAfter.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss")
    $notBefore = $certificate.NotBefore.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss")
    $signatureAlgorithm = $certificate.SignatureAlgorithm
    $keyLength = $certificate.KeyLength
    $hasPrivateKey = $certificate.HasPrivateKey
    $keyUsage = $certificate.KeyUsage
    $subjectAlternativeName = $certificate.SubjectAlternativeName
    $subjectType = $certificate.SubjectType
    $extendedKeyUsage = $certificate.ExtendedKeyUsage

    #get cert path
    $splitted = $psPath.Split("::")[2]
    $path = "Cert:\" + $splitted
    #get full cert
    $my_cert = Get-ChildItem $path

    # Calculate the thumbprintChain only for design partners
    $thumbprintChain = ""

    $certificateArgumentList = @($psPath, $thumbprint, $serialNumber, $subject, $issuer, $friendlyName, $notAfter, $notBefore, $signatureAlgorithm, $keyLength, $hasPrivateKey, $keyUsage, $subjectAlternativeName, $subjectType, $extendedKeyUsage, $thumbprintChain)
    $collectedCertificate = New-Object CollectedCertificate -ArgumentList $certificateArgumentList   

    # Send data to ETW
    $CollectedCertificateProvider.Write("CollectedCertificates", $collectedCertificate)

    $certificatesIndex += "{0}_{1}" -f $certificate.Thumbprint, $certificate.PSPath
}

$certificatesIndexAsJson = ConvertTo-Json -InputObject $certificatesIndex -Compress
$collectedServicesIndex = [CollectedCertificateIndex]::new($certificatesIndexAsJson)
$CollectedCertificateProvider.Write("CollectedCertificatesIndex", $collectedServicesIndex) 
# SIG # Begin signature block
# MIIoZAYJKoZIhvcNAQcCoIIoVTCCKFECAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDRSvi1DpyB/4U2
# 7PVqWGjQndFty5jdJ7mKwkdqCUfbWKCCDZcwggYVMIID/aADAgECAhMzAAAEOExw
# F8dThPTzAAAAAAQ4MA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjQxMTE1MDAwMTIzWhcNMjUxMTEzMDAwMTIzWjCBlDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE+MDwGA1UEAxM1TWlj
# cm9zb2Z0IFdpbmRvd3MgRGVmZW5kZXIgQWR2YW5jZWQgVGhyZWF0IFByb3RlY3Rp
# b24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC7XRtbYKag9kcj7xkU
# ngKJasJqOoGURz5mjsXKDgxWbKkHzjZn2dUlQetNwLN3RrR/2rrNhGM4Vour57xq
# L6MijWd6HfBkGZAl/h3ALhPLrertldZ0FhEzt/kLSsbx/2xq5Vwlt7RkRzwJSoeO
# 4jnXQUaG+dAb9mQW87vtDEARcKJqTTGB5W685hOyg4FWkb1nGPc4WgYE53Ri2XZv
# cCvuCsz5JmIbPjoQQHKomxaAr+wuea7o+r0M/bbm2Ok8v9LcX9bGx1ch515nXVkK
# PfCDQQbJ27pOlEEVOuu9WOHqs5zDCRO5Q4u6VrO/Q9+YF0snySMgsSJQ04BMeKDz
# uoHdAgMBAAGjggFzMIIBbzAfBgNVHSUEGDAWBggrBgEFBQcDAwYKKwYBBAGCN0wv
# ATAdBgNVHQ4EFgQU02W11Adr5UTyXh234s3aOhbYszEwRQYDVR0RBD4wPKQ6MDgx
# HjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEWMBQGA1UEBRMNNDUxODk0
# KzUwMzM3MzAfBgNVHSMEGDAWgBRIbmTlUAXTgqoXNzcitW2oynUClTBUBgNVHR8E
# TTBLMEmgR6BFhkNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9N
# aWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3JsMGEGCCsGAQUFBwEBBFUwUzBR
# BggrBgEFBQcwAoZFaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0
# cy9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3J0MAwGA1UdEwEB/wQCMAAw
# DQYJKoZIhvcNAQELBQADggIBAJFkkzz+21rdOP2DeayTmrKJr3DK/NC2aKa+1TSl
# vaOVCWsqb1pcyqeLzUzCBuNCww5re19s/OESbO65iY3Ky7LquPeI8ZLWPugu8YRm
# 3s3rubr7d+GE0sx8NsOrkl4rfMpcweJ4grwFgrbvXDWEXvZBINlon7UIRsXB+oRH
# astYgbi5mV/1Y5s48vRHaErdlfJVPuyZ3cINFUM/FWMC2pQT17Qsc+76VR0JBC3W
# EHbj6bMkwNJ2881VAthRw2HuR+VSeDo4Qye+WDoq8YGo0wP1futayOCtQKv8ss8E
# E+PhNJhbojtwxKkrj4OspfPcUuna2bl0XFYWmMcK7Nd8ZF/yXEhOm1XQ+34d6KuA
# L3PvUm91X7Dp40jwMj1hMdpGi/p+SAOwzmeYMUw9+ZSaqrPDnDENSiiHCLayYN+E
# 3GMyo2Ha46Dhoop3jWnfMeTOIuY8hL5qiMeRg2WVHT3Y00UKThBnNo3XEf4zmpnx
# J4y/KDP+ntELIl52LLEQL5rzsGum6YRNxhySKbiimX9aj3zUFryeMk9WPgI1ACVG
# tflE5jeQ27eyOhdkwwYTOftQMhknSLXRbKe3q9FOraeYuORsBsyP+G29bnKPIZcs
# MkjsXy3N6HmJV/HYryosl9aaPejoITRumEuhwtt9zcVuCKwg/UY8nA2elYn6mwss
# 4NoRMIIHejCCBWKgAwIBAgIKYQ6Q0gAAAAAAAzANBgkqhkiG9w0BAQsFADCBiDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWlj
# cm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTEwHhcNMTEwNzA4
# MjA1OTA5WhcNMjYwNzA4MjEwOTA5WjB+MQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBTaWduaW5nIFBD
# QSAyMDExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAq/D6chAcLq3Y
# bqqCEE00uvK2WCGfQhsqa+laUKq4BjgaBEm6f8MMHt03a8YS2AvwOMKZBrDIOdUB
# FDFC04kNeWSHfpRgJGyvnkmc6Whe0t+bU7IKLMOv2akrrnoJr9eWWcpgGgXpZnbo
# MlImEi/nqwhQz7NEt13YxC4Ddato88tt8zpcoRb0RrrgOGSsbmQ1eKagYw8t00CT
# +OPeBw3VXHmlSSnnDb6gE3e+lD3v++MrWhAfTVYoonpy4BI6t0le2O3tQ5GD2Xuy
# e4Yb2T6xjF3oiU+EGvKhL1nkkDstrjNYxbc+/jLTswM9sbKvkjh+0p2ALPVOVpEh
# NSXDOW5kf1O6nA+tGSOEy/S6A4aN91/w0FK/jJSHvMAhdCVfGCi2zCcoOCWYOUo2
# z3yxkq4cI6epZuxhH2rhKEmdX4jiJV3TIUs+UsS1Vz8kA/DRelsv1SPjcF0PUUZ3
# s/gA4bysAoJf28AVs70b1FVL5zmhD+kjSbwYuER8ReTBw3J64HLnJN+/RpnF78Ic
# V9uDjexNSTCnq47f7Fufr/zdsGbiwZeBe+3W7UvnSSmnEyimp31ngOaKYnhfsi+E
# 11ecXL93KCjx7W3DKI8sj0A3T8HhhUSJxAlMxdSlQy90lfdu+HggWCwTXWCVmj5P
# M4TasIgX3p5O9JawvEagbJjS4NaIjAsCAwEAAaOCAe0wggHpMBAGCSsGAQQBgjcV
# AQQDAgEAMB0GA1UdDgQWBBRIbmTlUAXTgqoXNzcitW2oynUClTAZBgkrBgEEAYI3
# FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAf
# BgNVHSMEGDAWgBRyLToCMZBDuRQFTuHqp8cx0SOJNDBaBgNVHR8EUzBRME+gTaBL
# hklodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNS
# b29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3JsMF4GCCsGAQUFBwEBBFIwUDBOBggr
# BgEFBQcwAoZCaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNS
# b29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3J0MIGfBgNVHSAEgZcwgZQwgZEGCSsG
# AQQBgjcuAzCBgzA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9kb2NzL3ByaW1hcnljcHMuaHRtMEAGCCsGAQUFBwICMDQeMiAdAEwA
# ZQBnAGEAbABfAHAAbwBsAGkAYwB5AF8AcwB0AGEAdABlAG0AZQBuAHQALiAdMA0G
# CSqGSIb3DQEBCwUAA4ICAQBn8oalmOBUeRou09h0ZyKbC5YR4WOSmUKWfdJ5DJDB
# ZV8uLD74w3LRbYP+vj/oCso7v0epo/Np22O/IjWll11lhJB9i0ZQVdgMknzSGksc
# 8zxCi1LQsP1r4z4HLimb5j0bpdS1HXeUOeLpZMlEPXh6I/MTfaaQdION9MsmAkYq
# wooQu6SpBQyb7Wj6aC6VoCo/KmtYSWMfCWluWpiW5IP0wI/zRive/DvQvTXvbiWu
# 5a8n7dDd8w6vmSiXmE0OPQvyCInWH8MyGOLwxS3OW560STkKxgrCxq2u5bLZ2xWI
# UUVYODJxJxp/sfQn+N4sOiBpmLJZiWhub6e3dMNABQamASooPoI/E01mC8CzTfXh
# j38cbxV9Rad25UAqZaPDXVJihsMdYzaXht/a8/jyFqGaJ+HNpZfQ7l1jQeNbB5yH
# PgZ3BtEGsXUfFL5hYbXw3MYbBL7fQccOKO7eZS/sl/ahXJbYANahRr1Z85elCUtI
# EJmAH9AAKcWxm6U/RXceNcbSoqKfenoi+kiVH6v7RyOA9Z74v2u3S5fi63V4Guzq
# N5l5GEv/1rMjaHXmr/r8i+sLgOppO6/8MO0ETI7f33VtY5E90Z1WTk+/gFcioXgR
# MiF670EKsT/7qMykXcGhiJtXcVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQ
# zTGCGiMwghofAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEC
# EzMAAAQ4THAXx1OE9PMAAAAABDgwDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcN
# AQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUw
# LwYJKoZIhvcNAQkEMSIEIH2elGnUieGBi58AF+gKGKSePpim/exB8l2ipE3bMSB0
# MEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEAeNxoYnhN3pPP
# aPjRBD+S7eNxSVZHMa2xifj4YjPSj7OyM9/9I8Eft++sU13XdGcSgWSftZACFRJ/
# RK/1YVPRRnjTirJhFdzI7qyRV8tRfi/wj5bRe/0yYuh9TYCOj4KjCQJG4TOwerWf
# sqUKGOG3+G6/Vy9eHzYFqGwPhTXRfiv3q9WZF/FA6h5qa7TJPiW3t17utwVXSiT4
# QAedcOykvi4xIJcwPkV0nObVcb+7Zll9SKrF0z2W9GiiKJK8IENxQoLMOAbsuSX6
# snacYV5E4xUjHEtshwftdFXwRtTVf3HsLWmys3DKoMC8MLoFZA/XE8dS4yNLqOnb
# qYGH1cowPqGCF60wghepBgorBgEEAYI3AwMBMYIXmTCCF5UGCSqGSIb3DQEHAqCC
# F4YwgheCAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkE
# ggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQCAQUABCAOYb3w8UWa
# fTXOfq8GkH4SbJGVYwBleSsXzXzAUT0p8gIGaC5jxKfQGBMyMDI1MDYwNTE0NDI0
# MC43NjRaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo2RjFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCEfswggco
# MIIFEKADAgECAhMzAAAB/Bigr8xpWoc6AAEAAAH8MA0GCSqGSIb3DQEBCwUAMHwx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1p
# Y3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTI0MDcyNTE4MzExNFoXDTI1
# MTAyMjE4MzExNFowgdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjZGMUEtMDVFMC1EOTQ3MSUwIwYD
# VQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEAp1DAKLxpbQcPVYPHlJHyW7W5lBZjJWWDjMfl5Wyh
# uAylP/LDm2hb4ymUmSymV0EFRQcmM8BypwjhWP8F7x4iO88d+9GZ9MQmNh3jSDoh
# hXXgf8rONEAyfCPVmJzM7ytsurZ9xocbuEL7+P7EkIwoOuMFlTF2G/zuqx1E+wAN
# slpPqPpb8PC56BQxgJCI1LOF5lk3AePJ78OL3aw/NdlkvdVl3VgBSPX4Nawt3UgU
# ofuPn/cp9vwKKBwuIWQEFZ837GXXITshd2Mfs6oYfxXEtmj2SBGEhxVs7xERuWGb
# 0cK6afy7naKkbZI2v1UqsxuZt94rn/ey2ynvunlx0R6/b6nNkC1rOTAfWlpsAj/Q
# lzyM6uYTSxYZC2YWzLbbRl0lRtSz+4TdpUU/oAZSB+Y+s12Rqmgzi7RVxNcI2lm/
# /sCEm6A63nCJCgYtM+LLe9pTshl/Wf8OOuPQRiA+stTsg89BOG9tblaz2kfeOkYf
# 5hdH8phAbuOuDQfr6s5Ya6W+vZz6E0Zsenzi0OtMf5RCa2hADYVgUxD+grC8Eptf
# WeVAWgYCaQFheNN/ZGNQMkk78V63yoPBffJEAu+B5xlTPYoijUdo9NXovJmoGXj6
# R8Tgso+QPaAGHKxCbHa1QL9ASMF3Os1jrogCHGiykfp1dKGnmA5wJT6Nx7BedlSD
# sAkCAwEAAaOCAUkwggFFMB0GA1UdDgQWBBSY8aUrsUazhxByH79dhiQCL/7QdjAf
# BgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQ
# hk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQl
# MjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBe
# MFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2Nl
# cnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAM
# BgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQE
# AwIHgDANBgkqhkiG9w0BAQsFAAOCAgEAT7ss/ZAZ0bTaFsrsiJYd//LQ6ImKb9JZ
# SKiRw9xs8hwk5Y/7zign9gGtweRChC2lJ8GVRHgrFkBxACjuuPprSz/UYX7n522J
# KcudnWuIeE1p30BZrqPTOnscD98DZi6WNTAymnaS7it5qAgNInreAJbTU2cAosJo
# eXAHr50YgSGlmJM+cN6mYLAL6TTFMtFYJrpK9TM5Ryh5eZmm6UTJnGg0jt1pF/2u
# 8PSdz3dDy7DF7KDJad2qHxZORvM3k9V8Yn3JI5YLPuLso2J5s3fpXyCVgR/hq86g
# 5zjd9bRRyyiC8iLIm/N95q6HWVsCeySetrqfsDyYWStwL96hy7DIyLL5ih8YFMd0
# AdmvTRoylmADuKwE2TQCTvPnjnLk7ypJW29t17Yya4V+Jlz54sBnPU7kIeYZsvUT
# +YKgykP1QB+p+uUdRH6e79Vaiz+iewWrIJZ4tXkDMmL21nh0j+58E1ecAYDvT6B4
# yFIeonxA/6Gl9Xs7JLciPCIC6hGdliiEBpyYeUF0ohZFn7NKQu80IZ0jd511WA2b
# q6x9aUq/zFyf8Egw+dunUj1KtNoWpq7VuJqapckYsmvmmYHZXCjK1Eus7V1I+aXj
# rBYuqyM9QpeFZU4U01YG15uWwUCaj0uZlah/RGSYMd84y9DCqOpfeKE6PLMk7hLn
# hvcOQrnxP6kwggdxMIIFWaADAgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqG
# SIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkg
# MjAxMDAeFw0yMTA5MzAxODIyMjVaFw0zMDA5MzAxODMyMjVaMHwxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBU
# aW1lLVN0YW1wIFBDQSAyMDEwMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
# AgEA5OGmTOe0ciELeaLL1yR5vQ7VgtP97pwHB9KpbE51yMo1V/YBf2xK4OK9uT4X
# YDP/XE/HZveVU3Fa4n5KWv64NmeFRiMMtY0Tz3cywBAY6GB9alKDRLemjkZrBxTz
# xXb1hlDcwUTIcVxRMTegCjhuje3XD9gmU3w5YQJ6xKr9cmmvHaus9ja+NSZk2pg7
# uhp7M62AW36MEBydUv626GIl3GoPz130/o5Tz9bshVZN7928jaTjkY+yOSxRnOlw
# aQ3KNi1wjjHINSi947SHJMPgyY9+tVSP3PoFVZhtaDuaRr3tpK56KTesy+uDRedG
# bsoy1cCGMFxPLOJiss254o2I5JasAUq7vnGpF1tnYN74kpEeHT39IM9zfUGaRnXN
# xF803RKJ1v2lIH1+/NmeRd+2ci/bfV+AutuqfjbsNkz2K26oElHovwUDo9Fzpk03
# dJQcNIIP8BDyt0cY7afomXw/TNuvXsLz1dhzPUNOwTM5TI4CvEJoLhDqhFFG4tG9
# ahhaYQFzymeiXtcodgLiMxhy16cg8ML6EgrXY28MyTZki1ugpoMhXV8wdJGUlNi5
# UPkLiWHzNgY1GIRH29wb0f2y1BzFa/ZcUlFdEtsluq9QBXpsxREdcu+N+VLEhReT
# wDwV2xo3xwgVGD94q0W29R6HXtqPnhZyacaue7e3PmriLq0CAwEAAaOCAd0wggHZ
# MBIGCSsGAQQBgjcVAQQFAgMBAAEwIwYJKwYBBAGCNxUCBBYEFCqnUv5kxJq+gpE8
# RjUpzxD/LwTuMB0GA1UdDgQWBBSfpxVdAF5iXYP05dJlpxtTNRnpcjBcBgNVHSAE
# VTBTMFEGDCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wEwYDVR0lBAww
# CgYIKwYBBQUHAwgwGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQD
# AgGGMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAU1fZWy4/oolxiaNE9lJBb
# 186aGMQwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29t
# L3BraS9jcmwvcHJvZHVjdHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3JsMFoG
# CCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcnQwDQYJKoZI
# hvcNAQELBQADggIBAJ1VffwqreEsH2cBMSRb4Z5yS/ypb+pcFLY+TkdkeLEGk5c9
# MTO1OdfCcTY/2mRsfNB1OW27DzHkwo/7bNGhlBgi7ulmZzpTTd2YurYeeNg2Lpyp
# glYAA7AFvonoaeC6Ce5732pvvinLbtg/SHUB2RjebYIM9W0jVOR4U3UkV7ndn/OO
# PcbzaN9l9qRWqveVtihVJ9AkvUCgvxm2EhIRXT0n4ECWOKz3+SmJw7wXsFSFQrP8
# DJ6LGYnn8AtqgcKBGUIZUnWKNsIdw2FzLixre24/LAl4FOmRsqlb30mjdAy87JGA
# 0j3mSj5mO0+7hvoyGtmW9I/2kQH2zsZ0/fZMcm8Qq3UwxTSwethQ/gpY3UA8x1Rt
# nWN0SCyxTkctwRQEcb9k+SS+c23Kjgm9swFXSVRk2XPXfx5bRAGOWhmRaw2fpCjc
# ZxkoJLo4S5pu+yFUa2pFEUep8beuyOiJXk+d0tBMdrVXVAmxaQFEfnyhYWxz/gq7
# 7EFmPWn9y8FBSX5+k77L+DvktxW/tM4+pTFRhLy/AsGConsXHRWJjXD+57XQKBqJ
# C4822rpM+Zv/Cuk0+CQ1ZyvgDbjmjJnW4SLq8CdCPSWU5nR0W2rRnj7tfqAxM328
# y+l7vzhwRNGQ8cirOoo6CGJ/2XBjU02N7oJtpQUQwXEGahC0HVUzWLOhcGbyoYID
# VjCCAj4CAQEwggEBoYHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo2RjFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcG
# BSsOAwIaAxUATkEpJXOaqI2wfqBsw4NLVwqYqqqggYMwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsFAAIFAOvr/pYwIhgPMjAy
# NTA2MDUxMTMxMzRaGA8yMDI1MDYwNjExMzEzNFowdDA6BgorBgEEAYRZCgQBMSww
# KjAKAgUA6+v+lgIBADAHAgEAAgINmjAHAgEAAgIS0zAKAgUA6+1QFgIBADA2Bgor
# BgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAID
# AYagMA0GCSqGSIb3DQEBCwUAA4IBAQCV8KbUwuicy5A0KaYjRUGH/pCoyyzYlc2c
# dzSB+AVG5xyrFlf0IvjmoCmJZWKIebtaliFSsxfiC+YbrNJV1NKAG6ML2nAHfS9C
# VHcTfNcf/rjGjbbMWirJ5rSEnbHwW768MCbzFmPCa1Gw1j7dPGjqyIr3IVrSf1Xd
# 0+68lSR+b3L7v4QHP2RSQGQvQjt3l8Sid18E7Eq9Tt6Mcv9tX+emHnypG8obw1Vi
# oeXE7/RUPmV2Dzx2a4yYrtWWClG5Nrxoq8wkaN2TG2XQmh6ddWPpNek7huD4nQQi
# 88MeqeIjooDZ2SkIckA9Ge+16UdE0+6EoDHv/h1gufyxk+H9vzeZMYIEDTCCBAkC
# AQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQG
# A1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAH8GKCvzGla
# hzoAAQAAAfwwDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG
# 9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgXedybZTgRnrOJykmhI9zHHL1VeuGOL4X
# JI77n3u2CP4wgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCCVQq+Qu+/h/BOV
# P4wweUwbHuCUhh+T7hq3d5MCaNEtYjCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0
# YW1wIFBDQSAyMDEwAhMzAAAB/Bigr8xpWoc6AAEAAAH8MCIEICqM8c14SPuWqIru
# 7BLHqdXMQEzh4UACHJ88FVPrn1S0MA0GCSqGSIb3DQEBCwUABIICAFOwGP/is0AA
# DDMlcnqhM9+QDniiOWUJ7Q1AsngUDAlMYfkWk9Qfom38koCcJbAe7aaqciCIjl9q
# b1nBOzaCY6Y+V7Ue44k0rqWX3sFLzEwvAh59dMsmUYnCXepLNNM8JJoipdamHMt8
# zkFWxgpCk/JWF6MUdBElji6Ug84+PP4nsvWxP897k05ncue8KBvgHWEWdibWIZB7
# RVtuXzf6qO9BJUWJ884+O+EkaFLoCeA9FOBalzSp7KuIrVSlSuoJLCZFQ7Os7fUx
# Qs4WDqcdr/BltG7rL8P8V675Bl9qfLeVSV0kRy5/6dWAk7FStLUH5NODn8uVCKWL
# /30gSwnkOj0mc1one9+lTus/HAPeYu28eLwQ/fOBMLCWH6iKe0sCGtvmQsZ2oSX5
# m6WF4kNZxAj12b6I/vqt1BWM0lTYjyNbwcwsiWGsiCey4QiV6O4KKACwMlIlRYL2
# tnWIjMYAedLvCaI6Lg4CCkj3Xvo7ejhWIfE5ACJY6AQsdPzwoZwuZsKab3jqQy7g
# q90yFmPadWn+lA9UNJqUmzTFsVctSUlwTYPkiRwwqgPwiY9A2w6qdh3RdDgiclyi
# lqea3qw2D7AzSo4LhXtq2/+nlw1LPjEyduAh24CfAdxbPkcjg65bX8jwWIuy2mrZ
# /l9eizM+E81pYKMWNIKmxVajQqQnqlY6
# SIG # End signature block
