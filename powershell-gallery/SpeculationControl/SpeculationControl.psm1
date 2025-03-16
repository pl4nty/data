function Get-SpeculationControlSettings {
  <#

  .SYNOPSIS
  This function queries the speculation control settings for the system.

  .DESCRIPTION
  This function queries the speculation control settings for the system.

  .PARAMETER Quiet
  This parameter suppresses host output that is displayed by default.
  
  #>

  [CmdletBinding()]
  param (
    [switch]$Quiet
  )
  
  process {

    $NtQSIDefinition = @'
    [DllImport("ntdll.dll")]
    public static extern int NtQuerySystemInformation(uint systemInformationClass, IntPtr systemInformation, uint systemInformationLength, IntPtr returnLength);
'@
    
    $ntdll = Add-Type -MemberDefinition $NtQSIDefinition -Name 'ntdll' -Namespace 'Win32' -PassThru

    $SYSTEM_SPECULATION_CONTROL_INFORMATION_LENGTH = 8
    
    [System.IntPtr]$systemInformationPtr = [System.Runtime.InteropServices.Marshal]::AllocHGlobal($SYSTEM_SPECULATION_CONTROL_INFORMATION_LENGTH)
    [System.IntPtr]$returnLengthPtr = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(4)

    $object = New-Object -TypeName PSObject

    try {
        if ($PSVersionTable.PSVersion -lt [System.Version]("3.0.0.0")) {
            $cpu = Get-WmiObject Win32_Processor
        }
        else {
            $cpu = Get-CimInstance Win32_Processor
        }

        if ($cpu -is [array]) {
            $cpu = $cpu[0]
        }

        $PROCESSOR_ARCHITECTURE_ARM64 = 12
        $PROCESSOR_ARCHITECTURE_ARM   = 5

        $manufacturer = $cpu.Manufacturer
        $processorArchitecture = $cpu.Architecture

        $isArmCpu = ($processorArchitecture -eq $PROCESSOR_ARCHITECTURE_ARM) -or ($processorArchitecture -eq $PROCESSOR_ARCHITECTURE_ARM64)

        if ($manufacturer -eq "GenuineIntel") {
            $intelFmsRegex = [regex]'Family (\d+) Model (\d+) Stepping (\d+)'
            $intelFmsRegexResult = $intelFmsRegex.Match($cpu.Description)

            if ($intelFmsRegexResult.Success) {
                $intelCpuFamily = [System.UInt32]$intelFmsRegexResult.Groups[1].Value
                $intelCpuModel = [System.UInt32]$intelFmsRegexResult.Groups[2].Value
                $intelCpuStepping = [System.UInt32]$intelFmsRegexResult.Groups[3].Value
            } else {
                throw ("Unsupported processor: {0}" -f $cpu.Description) 
            }
        }
 
        #
        # Query branch target injection information.
        #

        if ($Quiet -ne $true) {

            Write-Host "For more information about the output below, please refer to https://support.microsoft.com/help/4074629" -ForegroundColor Cyan
            Write-Host
            Write-Host "Speculation control settings for CVE-2017-5715 [branch target injection]" -ForegroundColor Cyan

            if ($manufacturer -eq "AuthenticAMD") {
                Write-Host "AMD CPU detected: mitigations for branch target injection on AMD CPUs have additional registry settings for this mitigation, please refer to FAQ #15 at https://portal.msrc.microsoft.com/en-us/security-guidance/advisory/ADV180002" -ForegroundColor Cyan
            }

            Write-Host
        }

        $btiHardwarePresent = $false
        $btiWindowsSupportPresent = $false
        $btiWindowsSupportEnabled = $false
        $btiDisabledBySystemPolicy = $false
        $btiDisabledByNoHardwareSupport = $false

        $ssbdAvailable = $false
        $ssbdHardwarePresent = $false
        $ssbdSystemWide = $false
        $ssbdRequired = $null

        $mdsHardwareProtected = $null
        $mdsMbClearEnabled = $false
        $mdsMbClearReported = $false

        $sbdrSsdpHardwareProtected = $null
        $fbsdpHardwareProtected = $null
        $psdpHardwareProtected = $null
        $fbClearEnabled = $false
        $fbClearReported = $false
    
        [System.UInt32]$systemInformationClass = 201
        [System.UInt32]$systemInformationLength = $SYSTEM_SPECULATION_CONTROL_INFORMATION_LENGTH

        $retval = $ntdll::NtQuerySystemInformation($systemInformationClass, $systemInformationPtr, $systemInformationLength, $returnLengthPtr)

        [System.UInt32]$returnLength = [System.UInt32][System.Runtime.InteropServices.Marshal]::ReadInt32($returnLengthPtr)

        if ($retval -eq 0xc0000003 -or $retval -eq 0xc0000002) {
            # fallthrough
        }
        elseif ($retval -ne 0) {
            throw (("Querying branch target injection information failed with error {0:X8}" -f $retval))
        }
        else {
    
            [System.UInt32]$scfBpbEnabled = 0x01
            [System.UInt32]$scfBpbDisabledSystemPolicy = 0x02
            [System.UInt32]$scfBpbDisabledNoHardwareSupport = 0x04
            [System.UInt32]$scfSpecCtrlEnumerated = 0x08
            [System.UInt32]$scfSpecCmdEnumerated = 0x10
            [System.UInt32]$scfIbrsPresent = 0x20
            [System.UInt32]$scfStibpPresent = 0x40
            [System.UInt32]$scfSmepPresent = 0x80
            [System.UInt32]$scfSsbdAvailable = 0x100
            [System.UInt32]$scfSsbdSupported = 0x200
            [System.UInt32]$scfSsbdSystemWide = 0x400
            [System.UInt32]$scfSsbdRequired = 0x1000
            [System.UInt32]$scfSpecCtrlRetpolineEnabled = 0x4000
            [System.UInt32]$scfSpecCtrlImportOptimizationEnabled = 0x8000
            [System.UInt32]$scfEnhancedIbrs = 0x10000
            [System.UInt32]$scfHvL1tfStatusAvailable = 0x20000
            [System.UInt32]$scfHvL1tfProcessorNotAffected = 0x40000
            [System.UInt32]$scfHvL1tfMigitationEnabled = 0x80000
            [System.UInt32]$scfHvL1tfMigitationNotEnabled_Hardware = 0x100000
            [System.UInt32]$scfHvL1tfMigitationNotEnabled_LoadOption = 0x200000
            [System.UInt32]$scfHvL1tfMigitationNotEnabled_CoreScheduler = 0x400000
            [System.UInt32]$scfEnhancedIbrsReported = 0x800000
            [System.UInt32]$scfMdsHardwareProtected = 0x1000000
            [System.UInt32]$scfMbClearEnabled = 0x2000000
            [System.UInt32]$scfMbClearReported = 0x4000000

            [System.UInt32]$scf2SbdrSsdpHardwareProtected = 0x01
            [System.UInt32]$scf2FbsdpHardwareProtected =  0x02
            [System.UInt32]$scf2PsdpHardwareProtected =  0x04
            [System.UInt32]$scf2FbClearEnabled =  0x08
            [System.UInt32]$scf2FbClearReported =  0x10

            [System.UInt32]$scf2RdclHardwareProtectedReported =  0x800
            [System.UInt32]$scf2RdclHardwareProtected =  0x1000

            [System.UInt32]$flags = [System.UInt32][System.Runtime.InteropServices.Marshal]::ReadInt32($systemInformationPtr)
            
            if ($returnLength -gt 4) {
                [System.UInt32]$flags2 = [System.UInt32][System.Runtime.InteropServices.Marshal]::ReadInt32($systemInformationPtr, 4)
            }
            else {
                [System.UInt32]$flags2 = 0
            }
            
            $btiHardwarePresent = ((($flags -band $scfSpecCtrlEnumerated) -ne 0) -or (($flags -band $scfSpecCmdEnumerated)))
            $btiWindowsSupportPresent = $true
            $btiWindowsSupportEnabled = (($flags -band $scfBpbEnabled) -ne 0)
            $btiRetpolineEnabled = (($flags -band $scfSpecCtrlRetpolineEnabled) -ne 0)
            $btiImportOptimizationEnabled = (($flags -band $scfSpecCtrlImportOptimizationEnabled) -ne 0)

            $mdsHardwareProtected = (($flags -band $scfMdsHardwareProtected) -ne 0)
            $mdsMbClearEnabled = (($flags -band $scfMbClearEnabled) -ne 0)
            $mdsMbClearReported = (($flags -band $scfMbClearReported) -ne 0)

            if (($manufacturer -eq "AuthenticAMD") -or
                ($isArmCpu -eq $true)) {
                $mdsHardwareProtected = $true
            }

            if ($btiWindowsSupportEnabled -eq $false) {
                $btiDisabledBySystemPolicy = (($flags -band $scfBpbDisabledSystemPolicy) -ne 0)
                $btiDisabledByNoHardwareSupport = (($flags -band $scfBpbDisabledNoHardwareSupport) -ne 0)
            }
            
            $ssbdAvailable = (($flags -band $scfSsbdAvailable) -ne 0)

            if ($ssbdAvailable -eq $true) {
                $ssbdHardwarePresent = (($flags -band $scfSsbdSupported) -ne 0)
                $ssbdSystemWide = (($flags -band $scfSsbdSystemWide) -ne 0)
                $ssbdRequired = (($flags -band $scfSsbdRequired) -ne 0)
            }

            $sbdrSsdpHardwareProtected = (($flags2 -band $scf2SbdrSsdpHardwareProtected) -ne 0)
            $fbsdpHardwareProtected = (($flags2 -band $scf2FbsdpHardwareProtected) -ne 0)
            $psdpHardwareProtected = (($flags2 -band $scf2PsdpHardwareProtected) -ne 0)
            $fbClearEnabled = (($flags2 -band $scf2FbClearEnabled) -ne 0)
            $fbClearReported = (($flags2 -band $scf2FbClearReported) -ne 0)

            $rdclHardwareProtectedReported = (($flags2 -band $scf2RdclHardwareProtectedReported) -ne 0)
            $rdclHardwareProtected = (($flags2 -band $scf2RdclHardwareProtected) -ne 0)

            if (($manufacturer -eq "AuthenticAMD") -or
                ($isArmCpu -eq $true)) {
                $sbdrSsdpHardwareProtected = $true
                $fbsdpHardwareProtected = $true
                $psdpHardwareProtected = $true
            }

            $hvL1tfStatusAvailable = (($flags -band $scfHvL1tfStatusAvailable) -ne 0)
            $hvL1tfProcessorNotAffected = (($flags -band $scfHvL1tfProcessorNotAffected) -ne 0)

            if ($Quiet -ne $true -and $PSBoundParameters['Verbose']) {
                Write-Verbose "BpbEnabled                        : $(($flags -band $scfBpbEnabled) -ne 0)"
                Write-Verbose "BpbDisabledSystemPolicy           : $(($flags -band $scfBpbDisabledSystemPolicy) -ne 0)"
                Write-Verbose "BpbDisabledNoHardwareSupport      : $(($flags -band $scfBpbDisabledNoHardwareSupport) -ne 0)"
                Write-Verbose "SpecCtrlEnumerated                : $(($flags -band $scfSpecCtrlEnumerated) -ne 0)"
                Write-Verbose "SpecCmdEnumerated                 : $(($flags -band $scfSpecCmdEnumerated) -ne 0)"
                Write-Verbose "IbrsPresent                       : $(($flags -band $scfIbrsPresent) -ne 0)"
                Write-Verbose "StibpPresent                      : $(($flags -band $scfStibpPresent) -ne 0)"
                Write-Verbose "SmepPresent                       : $(($flags -band $scfSmepPresent) -ne 0)"
                Write-Verbose "SsbdAvailable                     : $(($flags -band $scfSsbdAvailable) -ne 0)"
                Write-Verbose "SsbdSupported                     : $(($flags -band $scfSsbdSupported) -ne 0)"
                Write-Verbose "SsbdSystemWide                    : $(($flags -band $scfSsbdSystemWide) -ne 0)"
                Write-Verbose "SsbdRequired                      : $(($flags -band $scfSsbdRequired) -ne 0)"
                Write-Verbose "SpecCtrlRetpolineEnabled          : $(($flags -band $scfSpecCtrlRetpolineEnabled) -ne 0)"
                Write-Verbose "SpecCtrlImportOptimizationEnabled : $(($flags -band $scfSpecCtrlImportOptimizationEnabled) -ne 0)"
            }
        }

        if ($Quiet -ne $true) {
            Write-Host "Hardware support for branch target injection mitigation is present:"($btiHardwarePresent)
            Write-Host "Windows OS support for branch target injection mitigation is present:"($btiWindowsSupportPresent)
            Write-Host "Windows OS support for branch target injection mitigation is enabled:"($btiWindowsSupportEnabled)

            if ($btiWindowsSupportPresent -eq $true -and $btiWindowsSupportEnabled -eq $false) {
                Write-Host "Windows OS support for branch target injection mitigation is disabled by system policy:"($btiDisabledBySystemPolicy)
                Write-Host "Windows OS support for branch target injection mitigation is disabled by absence of hardware support:"($btiDisabledByNoHardwareSupport)
            }
        }
        
        $object | Add-Member -MemberType NoteProperty -Name BTIHardwarePresent -Value $btiHardwarePresent
        $object | Add-Member -MemberType NoteProperty -Name BTIWindowsSupportPresent -Value $btiWindowsSupportPresent
        $object | Add-Member -MemberType NoteProperty -Name BTIWindowsSupportEnabled -Value $btiWindowsSupportEnabled
        $object | Add-Member -MemberType NoteProperty -Name BTIDisabledBySystemPolicy -Value $btiDisabledBySystemPolicy
        $object | Add-Member -MemberType NoteProperty -Name BTIDisabledByNoHardwareSupport -Value $btiDisabledByNoHardwareSupport
        $object | Add-Member -MemberType NoteProperty -Name BTIKernelRetpolineEnabled -Value $btiRetpolineEnabled
        $object | Add-Member -MemberType NoteProperty -Name BTIKernelImportOptimizationEnabled -Value $btiImportOptimizationEnabled
        
        #
        # Query kernel VA shadow information.
        #

        $kvaShadowRequired = $true
        $kvaShadowPresent = $false
        $kvaShadowEnabled = $false
        $kvaShadowPcidEnabled = $false

        # CPUs Vulnerable to L1TF (Family, Model, Stepping)

        $l1tfVulnerableCpus = [tuple]::Create(6, 26, 4), [tuple]::Create(6, 26, 5), [tuple]::Create(6, 30, 4), [tuple]::Create(6, 30, 5), 
                                [tuple]::Create(6, 37, 2), [tuple]::Create(6, 37, 5), [tuple]::Create(6, 42, 7), [tuple]::Create(6, 44, 2), 
                                [tuple]::Create(6, 45, 6), [tuple]::Create(6, 45, 7), [tuple]::Create(6, 46, 6), [tuple]::Create(6, 47, 2), 
                                [tuple]::Create(6, 58, 9), [tuple]::Create(6, 60, 3), [tuple]::Create(6, 61, 4), [tuple]::Create(6, 62, 4), 
                                [tuple]::Create(6, 62, 7), [tuple]::Create(6, 63, 2), [tuple]::Create(6, 63, 4), [tuple]::Create(6, 69, 1), 
                                [tuple]::Create(6, 70, 1), [tuple]::Create(6, 78, 3), [tuple]::Create(6, 79, 1), [tuple]::Create(7, 69, 1), 
                                [tuple]::Create(6, 85, 3), [tuple]::Create(6, 85, 4), [tuple]::Create(6, 86, 2), [tuple]::Create(6, 86, 3), 
                                [tuple]::Create(6, 86, 4), [tuple]::Create(6, 86, 5), [tuple]::Create(6, 94, 3), [tuple]::Create(6, 102, 3), 
                                [tuple]::Create(6, 142, 9), [tuple]::Create(6, 142, 10), [tuple]::Create(6, 142, 11), [tuple]::Create(6, 158, 9), 
                                [tuple]::Create(6, 158, 10), [tuple]::Create(6, 158, 11), [tuple]::Create(6, 158, 12)

        
        if ($manufacturer -eq "GenuineIntel") {
            $l1tfRequired = $true

            if (($rdclHardwareProtectedReported-eq $true) -and ($rdclHardwareProtected -eq $true)) {
                $l1tfRequired = $false
            } 
            elseif (($hvL1tfStatusAvailable -eq $true) -and ($hvL1tfProcessorNotAffected -eq $true)) {
                $l1tfRequired = $false
            } 
            else {
                $fmsTuple = [tuple]::Create([int]$intelCpuFamily, [int]$intelCpuModel, [int]$intelCpuStepping)
                
                if ($l1tfVulnerableCpus.Contains($fmsTuple) -eq $false) {
                    $l1tfRequired = $false
                }
            }
        } 
        else {
            $l1tfRequired = $false
        }

        $l1tfMitigationPresent = $false
        $l1tfMitigationEnabled = $false
        $l1tfFlushSupported = $false
        $l1tfInvalidPteBit = $null

        [System.UInt32]$systemInformationClass = 196
        [System.UInt32]$systemInformationLength = 4

        $retval = $ntdll::NtQuerySystemInformation($systemInformationClass, $systemInformationPtr, $systemInformationLength, $returnLengthPtr)

        if ($retval -eq 0xc0000003 -or $retval -eq 0xc0000002) {
        }
        elseif ($retval -ne 0) {
            throw (("Querying kernel VA shadow information failed with error {0:X8}" -f $retval))
        }
        else {
    
            [System.UInt32]$kvaShadowEnabledFlag = 0x01
            [System.UInt32]$kvaShadowUserGlobalFlag = 0x02
            [System.UInt32]$kvaShadowPcidFlag = 0x04
            [System.UInt32]$kvaShadowInvpcidFlag = 0x08
            [System.UInt32]$kvaShadowRequiredFlag = 0x10
            [System.UInt32]$kvaShadowRequiredAvailableFlag = 0x20
            
            [System.UInt32]$l1tfInvalidPteBitMask = 0xfc0
            [System.UInt32]$l1tfInvalidPteBitShift = 6
            [System.UInt32]$l1tfFlushSupportedFlag = 0x1000
            [System.UInt32]$l1tfMitigationPresentFlag = 0x2000

            [System.UInt32]$flags = [System.UInt32][System.Runtime.InteropServices.Marshal]::ReadInt32($systemInformationPtr)

            $kvaShadowPresent = $true
            $kvaShadowEnabled = (($flags -band $kvaShadowEnabledFlag) -ne 0)
            $kvaShadowPcidEnabled = ((($flags -band $kvaShadowPcidFlag) -ne 0) -and (($flags -band $kvaShadowInvpcidFlag) -ne 0))
            
            if (($flags -band $kvaShadowRequiredAvailableFlag) -ne 0) {
                $kvaShadowRequired = (($flags -band $kvaShadowRequiredFlag) -ne 0)
            }
            else {

                if ($manufacturer -eq "AuthenticAMD") {
                    $kvaShadowRequired = $false
                }
                elseif ($manufacturer -eq "GenuineIntel") {
                    if (($intelCpuFamily -eq 0x6) -and 
                        (($intelCpuModel -eq 0x1c) -or
                         ($intelCpuModel -eq 0x26) -or
                         ($intelCpuModel -eq 0x27) -or
                         ($intelCpuModel -eq 0x36) -or
                         ($intelCpuModel -eq 0x35))) {

                        $kvaShadowRequired = $false
                    }
                }
                else {
                    throw ("Unsupported processor manufacturer: {0}" -f $manufacturer)
                }
            }

            $l1tfInvalidPteBit = [math]::Floor(($flags -band $l1tfInvalidPteBitMask) * [math]::Pow(2,-$l1tfInvalidPteBitShift))

            $l1tfMitigationEnabled = (($l1tfInvalidPteBit -ne 0) -and ($kvaShadowEnabled -eq $true))
            $l1tfFlushSupported = (($flags -band $l1tfFlushSupportedFlag) -ne 0)

            if (($flags -band $l1tfMitigationPresentFlag) -or
                ($l1tfMitigationEnabled -eq $true) -or 
                ($l1tfFlushSupported -eq $true)) {
                $l1tfMitigationPresent = $true
            }

            if ($Quiet -ne $true -and $PSBoundParameters['Verbose']) {
                Write-Verbose "KvaShadowEnabled             : $(($flags -band $kvaShadowEnabledFlag) -ne 0)"
                Write-Verbose "KvaShadowUserGlobal          : $(($flags -band $kvaShadowUserGlobalFlag) -ne 0)"
                Write-Verbose "KvaShadowPcid                : $(($flags -band $kvaShadowPcidFlag) -ne 0)"
                Write-Verbose "KvaShadowInvpcid             : $(($flags -band $kvaShadowInvpcidFlag) -ne 0)"
                Write-Verbose "KvaShadowRequired            : $kvaShadowRequired"
                Write-Verbose "KvaShadowRequiredAvailable   : $(($flags -band $kvaShadowRequiredAvailableFlag) -ne 0)"
                Write-Verbose "L1tfRequired                 : $l1tfRequired"
                Write-Verbose "L1tfInvalidPteBit            : $l1tfInvalidPteBit"
                Write-Verbose "L1tfFlushSupported           : $l1tfFlushSupported"
            }
        }
        
        if ($Quiet -ne $true) {
            Write-Host
            Write-Host "Speculation control settings for CVE-2017-5754 [rogue data cache load]" -ForegroundColor Cyan
            Write-Host 

            if ($rdclHardwareProtectedReported) {
                Write-Host "Hardware is vulnerable to rogue data cache load:" ($rdclHardwareProtected -ne $true)

                if ($rdclHardwareProtected -ne $true) {
                    Write-Host "Windows OS support for rogue data cache load mitigation is present:" $kvaShadowPresent
                    Write-Host "Windows OS support for rogue data cache load mitigation is enabled:" $kvaShadowEnabled
                }

                Write-Host
            }

            Write-Host "Hardware requires kernel VA shadowing:"$kvaShadowRequired

            if ($kvaShadowRequired) {

                Write-Host "Windows OS support for kernel VA shadow is present:"$kvaShadowPresent
                Write-Host "Windows OS support for kernel VA shadow is enabled:"$kvaShadowEnabled

                if ($kvaShadowEnabled) {
                    Write-Host "Windows OS support for PCID performance optimization is enabled: $kvaShadowPcidEnabled [not required for security]"
                }
            }
        }

        $object | Add-Member -MemberType NoteProperty -Name RdclHardwareProtectedReported -Value $rdclHardwareProtectedReported
        if ($rdclHardwareProtectedReported) {
            $object | Add-Member -MemberType NoteProperty -Name RdclHardwareProtected -Value $rdclHardwareProtected
        }
        $object | Add-Member -MemberType NoteProperty -Name KVAShadowRequired -Value $kvaShadowRequired
        $object | Add-Member -MemberType NoteProperty -Name KVAShadowWindowsSupportPresent -Value $kvaShadowPresent
        $object | Add-Member -MemberType NoteProperty -Name KVAShadowWindowsSupportEnabled -Value $kvaShadowEnabled
        $object | Add-Member -MemberType NoteProperty -Name KVAShadowPcidEnabled -Value $kvaShadowPcidEnabled

        #
        # Speculation Control Settings for CVE-2018-3639 (Speculative Store Bypass)
        #
        
        if ($Quiet -ne $true) {
            Write-Host
            Write-Host "Speculation control settings for CVE-2018-3639 [speculative store bypass]" -ForegroundColor Cyan
            Write-Host    
        }
        
        if ($Quiet -ne $true) {
            if (($ssbdAvailable -eq $true)) {
                Write-Host "Hardware is vulnerable to speculative store bypass:"$ssbdRequired
                if ($ssbdRequired -eq $true) {
                    Write-Host "Hardware support for speculative store bypass disable is present:"$ssbdHardwarePresent
                    Write-Host "Windows OS support for speculative store bypass disable is present:"$ssbdAvailable
                    Write-Host "Windows OS support for speculative store bypass disable is enabled system-wide:"$ssbdSystemWide
                }
            }
            else {
                Write-Host "Windows OS support for speculative store bypass disable is present:"$ssbdAvailable
            }
        }

        $object | Add-Member -MemberType NoteProperty -Name SSBDWindowsSupportPresent -Value $ssbdAvailable
        $object | Add-Member -MemberType NoteProperty -Name SSBDHardwareVulnerable -Value $ssbdRequired
        $object | Add-Member -MemberType NoteProperty -Name SSBDHardwarePresent -Value $ssbdHardwarePresent
        $object | Add-Member -MemberType NoteProperty -Name SSBDWindowsSupportEnabledSystemWide -Value $ssbdSystemWide

        
        #
        # Speculation Control Settings for CVE-2018-3620 (L1 Terminal Fault)
        #
        
        if ($Quiet -ne $true) {
            Write-Host
            Write-Host "Speculation control settings for CVE-2018-3620 [L1 terminal fault]" -ForegroundColor Cyan
            Write-Host    
        }
        
        if ($Quiet -ne $true) {
            Write-Host "Hardware is vulnerable to L1 terminal fault:"$l1tfRequired

            if ($l1tfRequired -eq $true) {
                Write-Host "Windows OS support for L1 terminal fault mitigation is present:"$l1tfMitigationPresent
                Write-Host "Windows OS support for L1 terminal fault mitigation is enabled:"$l1tfMitigationEnabled
            }
        }

        $object | Add-Member -MemberType NoteProperty -Name L1TFHardwareVulnerable -Value $l1tfRequired
        $object | Add-Member -MemberType NoteProperty -Name L1TFWindowsSupportPresent -Value $l1tfMitigationPresent
        $object | Add-Member -MemberType NoteProperty -Name L1TFWindowsSupportEnabled -Value $l1tfMitigationEnabled
        $object | Add-Member -MemberType NoteProperty -Name L1TFInvalidPteBit -Value $l1tfInvalidPteBit
        $object | Add-Member -MemberType NoteProperty -Name L1DFlushSupported -Value $l1tfFlushSupported
        $object | Add-Member -MemberType NoteProperty -Name HvL1tfStatusAvailable -Value $hvL1tfStatusAvailable
        $object | Add-Member -MemberType NoteProperty -Name HvL1tfProcessorNotAffected -Value $hvL1tfProcessorNotAffected

        #
        # Speculation control settings for MDS [microarchitectural data sampling]
        #

        if ($Quiet -ne $true) {
            Write-Host
            Write-Host "Speculation control settings for MDS [microarchitectural data sampling]" -ForegroundColor Cyan
            Write-Host
        }

        if ($Quiet -ne $true) {
        
            Write-Host "Windows OS support for MDS mitigation is present:"$mdsMbClearReported

            if ($mdsMbClearReported -eq $true) {
                Write-Host "Hardware is vulnerable to MDS:"($mdsHardwareProtected -ne $true)
                
                if ($mdsHardwareProtected -eq $false) {
                    Write-Host "Windows OS support for MDS mitigation is enabled:"$mdsMbClearEnabled
                }
            }
        }
        
        $object | Add-Member -MemberType NoteProperty -Name MDSWindowsSupportPresent -Value $mdsMbClearReported
        
        if ($mdsMbClearReported -eq $true) {
            $object | Add-Member -MemberType NoteProperty -Name MDSHardwareVulnerable -Value ($mdsHardwareProtected -ne $true)
            $object | Add-Member -MemberType NoteProperty -Name MDSWindowsSupportEnabled -Value $mdsMbClearEnabled
        }

        #
        # Speculation control settings for SBDR [shared buffers data read]
        #

        if ($Quiet -ne $true) {
            Write-Host
            Write-Host "Speculation control settings for SBDR [shared buffers data read]" -ForegroundColor Cyan
            Write-Host
            Write-Host "Windows OS support for SBDR mitigation is present:"$fbClearReported

            if ($fbClearReported -eq $true) {
                Write-Host "Hardware is vulnerable to SBDR:"($sbdrSsdpHardwareProtected -ne $true)
                
                if ($sbdrSsdpHardwareProtected -eq $false) {
                    Write-Host "Windows OS support for SBDR mitigation is enabled:"$fbClearEnabled
                }
            }
        }

        #
        # Speculation control settings for FBSDP [fill buffer stale data propagator]
        #

        if ($Quiet -ne $true) {
            Write-Host
            Write-Host "Speculation control settings for FBSDP [fill buffer stale data propagator]" -ForegroundColor Cyan
            Write-Host
            Write-Host "Windows OS support for FBSDP mitigation is present:"$fbClearReported

            if ($fbClearReported -eq $true) {
                Write-Host "Hardware is vulnerable to FBSDP:"($fbsdpHardwareProtected -ne $true)
                
                if ($fbsdpHardwareProtected -eq $false) {
                    Write-Host "Windows OS support for FBSDP mitigation is enabled:"$fbClearEnabled
                }
            }
        }

        #
        # Speculation control settings for PSDP [primary stale data propagator]
        #

        if ($Quiet -ne $true) {
            Write-Host
            Write-Host "Speculation control settings for PSDP [primary stale data propagator]" -ForegroundColor Cyan
            Write-Host
            Write-Host "Windows OS support for PSDP mitigation is present:"$fbClearReported

            if ($fbClearReported -eq $true) {
                Write-Host "Hardware is vulnerable to PSDP:"($psdpHardwareProtected -ne $true)
                
                if ($psdpHardwareProtected -eq $false) {
                    Write-Host "Windows OS support for PSDP mitigation is enabled:"$fbClearEnabled
                }
            }
        }

        $object | Add-Member -MemberType NoteProperty -Name FBClearWindowsSupportPresent -Value $fbClearReported
        
        if ($fbClearReported -eq $true) {
            $object | Add-Member -MemberType NoteProperty -Name SBDRSSDPHardwareVulnerable -Value ($sbdrSsdpHardwareProtected -ne $true)
            $object | Add-Member -MemberType NoteProperty -Name FBSDPHardwareVulnerable -Value ($fbsdpHardwareProtected -ne $true)
            $object | Add-Member -MemberType NoteProperty -Name PSDPHardwareVulnerable -Value ($psdpHardwareProtected -ne $true)
            $object | Add-Member -MemberType NoteProperty -Name FBClearWindowsSupportEnabled -Value $fbClearEnabled
        }
        
        #
        # Provide guidance as appropriate.
        #

        $actions = @()
        
        if ($btiHardwarePresent -eq $false) {
            $actions += "Install BIOS/firmware update provided by your device OEM that enables hardware support for the branch target injection mitigation."
        }
        
        if (($btiWindowsSupportPresent -eq $false) -or 
            ($kvaShadowPresent -eq $false) -or
            ($ssbdAvailable -eq $false) -or
            ($l1tfMitigationPresent -eq $false) -or
            ($mdsMbClearReported -eq $false) -or
            ($fbClearReported -eq $false) -or
            ($rdclHardwareProtectedReported -eq $false)) {
            $actions += "Install the latest available updates for Windows with support for speculation control mitigations."
        }

        if (($btiHardwarePresent -eq $true -and $btiWindowsSupportEnabled -eq $false) -or 
            ($kvaShadowRequired -eq $true -and $kvaShadowEnabled -eq $false) -or
            ($l1tfRequired -eq $true -and $l1tfMitigationEnabled -eq $false) -or
            ($mdsMbClearReported -eq $true -and $mdsHardwareProtected -eq $false -and $mdsMbClearEnabled -eq $false) -or 
            ($fbClearReported -eq $true -and $sbdrSsdpHardwareProtected -eq $false -and $fbClearEnabled -eq $false) -or
            ($fbClearReported -eq $true -and $fbsdpHardwareProtected -eq $false -and $fbClearEnabled -eq $false) -or
            ($fbClearReported -eq $true -and $psdpHardwareProtected -eq $false -and $fbClearEnabled -eq $false)) {
            $guidanceUri = ""
            $guidanceType = ""

            if ($PSVersionTable.PSVersion -lt [System.Version]("3.0.0.0")) {
                $os = Get-WmiObject Win32_OperatingSystem
            }
            else {
                $os = Get-CimInstance Win32_OperatingSystem
            }

            if ($os.ProductType -eq 1) {
                # Workstation
                $guidanceUri = "https://support.microsoft.com/help/4073119"
                $guidanceType = "Client"
            }
            else {
                # Server/DC
                $guidanceUri = "https://support.microsoft.com/help/4072698"
                $guidanceType = "Server"
            }

            $actions += "Follow the guidance for enabling Windows $guidanceType support for speculation control mitigations described in $guidanceUri"
        }

        if ($Quiet -ne $true -and $actions.Length -gt 0) {

            Write-Host
            Write-Host "Suggested actions" -ForegroundColor Cyan
            Write-Host 

            foreach ($action in $actions) {
                Write-Host " *" $action
            }
        }

        return $object

    }
    finally
    {
        if ($systemInformationPtr -ne [System.IntPtr]::Zero) {
            [System.Runtime.InteropServices.Marshal]::FreeHGlobal($systemInformationPtr)
        }
 
        if ($returnLengthPtr -ne [System.IntPtr]::Zero) {
            [System.Runtime.InteropServices.Marshal]::FreeHGlobal($returnLengthPtr)
        }
    }    
  }
}

# SIG # Begin signature block
