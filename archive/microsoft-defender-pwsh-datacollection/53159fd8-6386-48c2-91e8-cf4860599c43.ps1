# Remove pre loaded modules to mitigate exploit
Get-Module | ForEach-Object { Remove-Module -Name $_.Name -Force }
$PSModuleAutoloadingPreference = 'none'
Import-Module Microsoft.PowerShell.Utility

[string]$ScriptName = "ServicesCollector"
[string]$ScriptVersion = "V1.1.0"

# Names are according to modeling in CloudMap
[array]$ServiceDefs = @(
    "Rdp",
    "Wmi",
    "Smb",
    "WinRm",
    "Rpc",
    "RpcMapper"
)

[hashtable]$ServiceDefToServiceNameMapping = @{
    Rdp = "TermService";
    Wmi = "Winmgmt";
    Smb = "LanmanServer";
    WinRm = "WinRM";
    Rpc = "RpcSs";
    RpcMapper = "RpcEptMapper";
}

$EtwWriter = @"
using System;
using System.Text;
using System.Diagnostics.Tracing;
using Microsoft.PowerShell.Commands;


[EventSource(Name = "Microsoft.Windows.Sense.Tvm.Collector", Guid = "26a5f8cc-b64b-5f0b-8916-563a101426b4")]
public sealed class TvmEventSource : EventSource
{
    public TvmEventSource() : base(EventSourceSettings.EtwSelfDescribingEventFormat | EventSourceSettings.ThrowOnEventWriteErrors) { }
}

[EventData]
public class ServicesInfoCollectorEvent
{
    public string ServicesInfoAsJson {get; set;}
}
"@

$StartCpu = Get-WmiObject -class win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object -ExpandProperty Average
$StartTime = Get-Date
$ExitCode = 1100

function ExitWithCode
{
    param
    (
        $exitcode
    )

    $host.SetShouldExit($exitcode)
    exit
}


Add-Type -TypeDefinition $EtwWriter -Language CSharp -IgnoreWarnings
$global:EtwProvider =  New-Object -TypeName TvmEventSource


function Write-Etw{
    param(
        [Parameter(Mandatory=$true)]
        [string]$ServicesInfoAsJson
    )
    
    $etw = New-Object "ServicesInfoCollectorEvent" -Property @{
        ServicesInfoAsJson = $ServicesInfoAsJson;
    }

    $global:EtwProvider.Write("ServicesInfoCollectorEvent", $etw)
}

function Get-Service-Status([string] $ServiceDef){
    try{
        $ServiceName = $ServiceDefToServiceNameMapping[$ServiceDef]
        $GetServiceResult = Get-WmiObject -Query "SELECT StartMode, State FROM Win32_Service WHERE Name = '$ServiceName'" -Namespace "root\CIMv2"
        return [PSCustomObject]@{
            StartMode = $GetServiceResult.StartMode;
            State = $GetServiceResult.State;
            AdditionalData = "";
        }
    }
    catch {
		$errStr = "Failed to query Service{0}:{1}" -f $ServiceName, $Error[0].Exception.ToString()
		Write-Error $errStr
		return $null
	}
}

function Get-RDPStatus-AdditionalData(){
    try{
        return [PSCustomObject]@{
            AllowConnections = ((Get-WmiObject -Query "SELECT AllowTSConnections FROM Win32_TerminalServiceSetting" -Namespace "root\CIMv2\TerminalServices").AllowTSConnections -eq 1);
            NlaRequired = ((Get-WmiObject -Namespace root\cimv2\terminalservices -Query "Select UserAuthenticationRequired FROM Win32_TSGeneralSetting where TerminalName='RDP-tcp'").UserAuthenticationRequired -eq 1);
        } | ConvertTo-Json -Compress;
    }
    catch {
		$errStr = "Failed to get RDPStatus additional data:{0}" -f $Error[0].Exception.ToString()
		Write-Error $errStr
		return ""
	}
}

function Get-SMBStatus-AdditionalData(){
    try{
        $SMBServerConfig = Get-SmbServerConfiguration;
        return [PSCustomObject]@{
            AnnounceServer = $SMBServerConfig.AnnounceServer;
            AuditSmb1Access = $SMBServerConfig.AuditSmb1Access;
            AutoShareServer = $SMBServerConfig.AutoShareServer;
            AutoShareWorkstation = $SMBServerConfig.AutoShareWorkstation;
            EnableSecuritySignature = $SMBServerConfig.EnableSecuritySignature;
            EnableSmb1Protocol = $SMBServerConfig.EnableSMB1Protocol;
            EnableSmb2Protocol = $SMBServerConfig.EnableSMB2Protocol;
            EnableSmbQuic = $SMBServerConfig.EnableSMBQUIC;
            EnableStrictNameChecking = $SMBServerConfig.EnableStrictNameChecking;
            EncryptData = $SMBServerConfig.EncryptData;
            RejectUnencryptedAccess = $SMBServerConfig.RejectUnencryptedAccess;
            RequireSecuritySignature = $SMBServerConfig.RequireSecuritySignature;
            RestrictNamedpipeAccessViaQuic = $SMBServerConfig.RestrictNamedpipeAccessViaQuic;
            ServerHidden = $SMBServerConfig.ServerHidden;
        } | ConvertTo-Json -Compress;
    }
    catch{
		$errStr = "Failed to get RDPStatus additional data:{0}" -f $Error[0].Exception.ToString()
		Write-Error $errStr
		return ""
    }
}

[hashtable]$ServiceDefToAdditionalDataFunctionName = @{
    RDP = Get-RDPStatus-AdditionalData;
    SMB = Get-SMBStatus-AdditionalData;
}

function Collect-Services-Info {
    $ServicesInfo = [hashtable]@{}
    foreach ($ServiceDef in $ServiceDefs){
        $ServiceInfo = Get-Service-Status($ServiceDef)

        if ($ServiceInfo -ne $null -and $ServiceDefToAdditionalDataFunctionName.ContainsKey($ServiceDef)){
            $ServiceInfo.AdditionalData = $ServiceDefToAdditionalDataFunctionName[$ServiceDef]
        }

        $ServicesInfo.Add($ServiceDef, $ServiceInfo)
    }

    return $ServicesInfo;
}

function Safe-Execute {
	try {
		$ServicesInfo = Collect-Services-Info
        $ServicesInfoAsJson = $ServicesInfo | ConvertTo-Json -Compress;
	    Write-Etw $ServicesInfoAsJson
	} catch {
		$errStr = "Failed to collect data:{0}" -f $Error[0].Exception.ToString()
		Write-Error $errStr
		ExitWithCode 1109
	}	
}

Safe-Execute;

$LogicalProcessors = (Get-WmiObject -class Win32_processor | Measure-Object -Property NumberOfLogicalProcessors -Sum ).sum;
$TotalMemory = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum

$ProcessInfo = (Get-Process -Id $Pid)

$MemoryUtilization = [Math]::Round(($ProcessInfo.WS * 100 / $TotalMemory), 2)
$CpuUtilization = [Math]::Round(($ProcessInfo.CPU * 100 / $((New-TimeSpan -Start $ProcessInfo.StartTime).TotalSeconds)) /$LogicalProcessors, 2)

$Timespan = New-TimeSpan -Start $StartTime -End (Get-Date) | Select-Object -ExpandProperty TotalSeconds

$EndCpu = Get-WmiObject -class win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object -ExpandProperty Average


Write-Host "Writing telemtry"
Write-Host "ScriptVersion->$ScriptVersion"
Write-Host "Duration->$Timespan"
Write-Host "Memory->$($ProcessInfo.WS/1024)Kb,$MemoryUtilization%"
Write-Host "CPU->$($ProcessInfo.CPU.ToString()),$CpuUtilization%"
Write-Host "TotalCpu->$StartCpu%,$EndCpu%"

ExitWithCode $ExitCode
# SIG # Begin signature block
# MIIoZAYJKoZIhvcNAQcCoIIoVTCCKFECAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCnyOBKqXlLtAgM
# Qior8Dg2bxgegtjSXnhsmrqGpIdOMaCCDZcwggYVMIID/aADAgECAhMzAAAEOExw
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
# LwYJKoZIhvcNAQkEMSIEINHOl0H1Ly8PJCg45v6qbZyVt6/8RtSuaz4rtXTnwt8v
# MEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEARHobmC9nQ8Gk
# WYHtys04TGdXc88yPk4xAB/SaCmjMhvumeW1X3QqKqVxia91iNA7MxU+VdZdfl87
# jJOjVY+r4DhxRqiwFcI045N8DHlzLW4/I9xdTRH/mX+L9BIN5i8gc3V8hZNZEGCj
# BeYBhwQ20gNJBuRbk6oys3bjvWMVg/M74Auip9gLppvtBVrClQ9NIpU/yQ7tExqr
# bZ9bIC/nW2wNJOuiP0dCpZAUAge0F5Q/5dPXCrMXbBFkqguBtMv5TQ0WjedxgHQz
# cImId7UeP46Yb8QQwU4S4HVGPjdA/wAL28BcQJ9c7n6Q+QoYjRlsOcXLCX28p3da
# UjeqJahmFqGCF60wghepBgorBgEEAYI3AwMBMYIXmTCCF5UGCSqGSIb3DQEHAqCC
# F4YwgheCAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkE
# ggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQCAQUABCBg2kuakczq
# +xwnOp0XJsG233naoxV7xbUlqoop1bfuQQIGaC5Lp9sOGBMyMDI1MDYwNTE0NDIz
# Ny44MTVaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo1NTFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCEfswggco
# MIIFEKADAgECAhMzAAACAdFFWZgQzEJPAAEAAAIBMA0GCSqGSIb3DQEBCwUAMHwx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1p
# Y3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTI0MDcyNTE4MzEyMloXDTI1
# MTAyMjE4MzEyMlowgdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjU1MUEtMDVFMC1EOTQ3MSUwIwYD
# VQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEAtWrf+HzDu7sk50y5YHheCIJG0uxRSFFcHNek+Td9
# ZmyJj20EEjaU8JDJu5pWc4pPAsBI38NEAJ1b+KBnlStqU8uvXF4qnEShDdi8nPsZ
# ZQsTZDKWAgUM2iZTOiWIuZcFs5ZC8/+GlrVLM5h1Y9nfMh5B4DnUQOXMremAT9Mk
# vUhg3uaYgmqLlmYyODmba4lXZBu104SLAFsXOfl/TLhpToT46y7lI9sbI9uq3/Ae
# rh3aPi2knHvEEazilXeooXNLCwdu+Is6o8kQLouUn3KwUQm0b7aUtsv1X/OgPmsO
# Ji6yN3LYWyHISvrNuIrJ4iYNgHdBBumQYK8LjZmQaTKFacxhmXJ0q2gzaIfxF2yI
# wM+V9sQqkHkg/Q+iSDNpMr6mr/OwknOEIjI0g6ZMOymivpChzDNoPz9hkK3gVHZK
# W7NV8+UBXN4G0aBX69fKUbxBBLyk2cC+PhOoUjkl6UC8/c0huqj5xX8m+YVIk81e
# 7t6I+V/E4yXReeZgr0FhYqNpvTjGcaO2WrkP5XmsYS7IvMPIf4DCyIJUZaqoBMTo
# AJJHGRe+DPqCHg6bmGPm97MrOWv16/Co6S9cQDkXp9vMSSRQWXy4KtJhZfmuDz2v
# r1jw4NeixwuIDGw1mtV/TdSI+vpLJfUiLl/b9w/tJB92BALQT8e1YH8NphdOo1xC
# wkcCAwEAAaOCAUkwggFFMB0GA1UdDgQWBBSwcq9blqLoPPiVrym9mFmFWbyyUjAf
# BgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQ
# hk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQl
# MjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBe
# MFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2Nl
# cnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAM
# BgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQE
# AwIHgDANBgkqhkiG9w0BAQsFAAOCAgEAOjQAyz0cVztTFGqXX5JLRxFK/O/oMe55
# uDqEC8Vd1gbcM28KBUPgvUIPXm/vdDN2IVBkWHmwCp4AIcy4dZtkuUmd0fnu6aT9
# Mvo1ndsLp2YJcMoFLEt3TtriLaO+i4Grv0ZULtWXUPAW/Mn5Scjgn0xZduGPBD/X
# s3J7+get9+8ZvBipsg/N7poimYOVsHxLcem7V5XdMNsytTm/uComhM/wgR5KlDYT
# VNAXBxcSKMeJaiD3V1+HhNkVliMl5VOP+nw5xWF55u9h6eF2G7eBPqT+qSFQ+rQC
# QdIrN0yG1QN9PJroguK+FJQJdQzdfD3RWVsciBygbYaZlT1cGJI1IyQ74DQ0UBdT
# pfeGsyrEQ9PI8QyqVLqb2q7LtI6DJMNphYu+jr//0spr1UVvyDPtuRnbGQRNi1CO
# wJcj9OYmlkFgKNeCfbDT7U3uEOvWomekX60Y/m5utRcUPVeAPdhkB+DxDaev3J1y
# wDNdyu911nAVPgRkyKgMK3USLG37EdlatDk8FyuCrx4tiHyqHO3wE6xPw32Q8e/v
# muQPoBZuX3qUeoFIsyZEenHq2ScMunhcqW32SUVAi5oZ4Z3nf7dAgNau21NEPwgW
# +2wkrNqDg7Hp8yHyoOKbgEBu6REQbvSfZ5Kh4PV+S2gxf2uq6GoYDnlqABOMYwz3
# 09ISi0bPMh8wggdxMIIFWaADAgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqG
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
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo1NTFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcG
# BSsOAwIaAxUA1+26cR/yH100DiNFGWhuAv2rYBqggYMwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsFAAIFAOvr5nYwIhgPMjAy
# NTA2MDUwOTQ4MzhaGA8yMDI1MDYwNjA5NDgzOFowdDA6BgorBgEEAYRZCgQBMSww
# KjAKAgUA6+vmdgIBADAHAgEAAgIHAzAHAgEAAgITNzAKAgUA6+039gIBADA2Bgor
# BgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAID
# AYagMA0GCSqGSIb3DQEBCwUAA4IBAQB2xtVkiU+dR1VB3yG8Rc+EwQK4af9bZ2Ea
# Jd8GWgmOLMR0WxGeOcs4d1ByYTdG78HPBcdVyjSTeMYSI2w9wai6JBDys6E8ylLf
# m2+4Q0DFfM2AWgYAHfLIeHNfM/+JBUqGyy6iqEWJTigB2sHPmN0y5pZSFrYh6yRg
# W0opA3Fz9fVYBYcsXSIySxHDPotaL9x0POATNFBZ2X3d8CAW2SsKTN1zPLBz9s1e
# X0OAzMax0klJ/65iBrOlwdzYKifdWNM9BQTsosJe2aSNv606iG16ERUzlUaWkkGs
# It6iloAcsNHKDnk9IxrIRF3S//TfIYTlSwEMj/DTH8zkdpZS/Bd6MYIEDTCCBAkC
# AQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQG
# A1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAIB0UVZmBDM
# Qk8AAQAAAgEwDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG
# 9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQghLFQqWhDkFe1MRAnDNXIbJQO21ljOq9B
# CBB9HbXU2GcwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCBYa7I6TJQRcmx0
# HaSTWZdJgowdrl9+Zrr0pIdqHtc4IzCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0
# YW1wIFBDQSAyMDEwAhMzAAACAdFFWZgQzEJPAAEAAAIBMCIEIPiVLdV0AITmfu0k
# 52NNVzoR8k/eCpPz31bbJAmDLQhuMA0GCSqGSIb3DQEBCwUABIICAD5h4VES5eRy
# 0ZA1pb7o0mCaPMosxXtleeChR2W5ELYTFfOwcpF1u3mZmckMBiapqkpvVO2FFW5p
# +DBT1F5TK6wYq6fSyb/aLP5LUmvoLSK7L7sr9dbfJygdpY2qYGSeo2qp8vGYOcrl
# wDnJ16kbzrTE7+BOTpNUXX3FFZDt3oJ4CFinUtgvq48BSqirzI1jNPMa45N22Meu
# hkAxE1oPlJJHdKNhQJo6DCvdb4o0Z0G4afAipXXbKGPoVBVoBhQ75RJhuxbnlFr8
# AcDvNIeyIKjQ/18hT1vU5x3CCL+MQe3qxmyME5MFx5Tveq90nw1tOy0FQo+8iwq1
# EY69xiyEce9Gs0NG/1As9OnJtdsaC2BnuAUmWd8gw+vv2/fdmRrlhgB4NnsT3EON
# P44JsfPXNwuJhqzo1jYUBppCWe/7qLGn9o0UrBiLwXBwexJ+UsObgjSMcfuS8mdl
# E9eh4i6CAS3EZSIFk4OuBKlnTS8NUuWjuyq3FxiSxxqiwFsFPABCTTeLL96l24/D
# MXn8uGb6k+e9Bf/xeolP+jZoEm9MkDHRGbOrkil/PU/r9bYM14tSU9bRjEJ7BvtM
# ogSZbt87jBAPH8ce1JWQMGKDKd8pEAsxFKe7Pw39+r+p+mjJjS9AHwHSJGa6uYCB
# TentPUdiOzv5A9+54Xz8kKMmXH/eWrRV
# SIG # End signature block
