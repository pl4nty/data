local L0_1, L1_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = "hklm\\software\\microsoft\\windows defender"
  L1_2 = "hklm\\software\\policies\\microsoft\\windows defender"
  L2_2 = {}
  L2_2.disableantivirus = 0
  L2_2.disableantispyware = 0
  L3_2 = Infrastructure_ReportFirstRegistryValueCheckDefaultDW
  L4_2 = 3449
  L5_2 = L0_2
  L6_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 then
    L3_2 = true
    return L3_2
  end
  L3_2 = Infrastructure_ReportFirstRegistryValueCheckDefaultDW
  L4_2 = 3449
  L5_2 = L1_2
  L6_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 then
    L3_2 = true
    return L3_2
  end
end

Infrastructure_CheckNonUxWDRootConfig = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = "hklm\\software\\microsoft\\windows defender\\real-time protection"
  L1_2 = "hklm\\software\\policies\\microsoft\\windows defender\\real-time protection"
  L2_2 = {}
  L2_2.DisableBehaviorMonitoring = 0
  L2_2.DisableIOAVProtection = 0
  L2_2.DisableOnAccessProtection = 0
  L2_2.DisableScanOnRealtimeEnable = 0
  L2_2.DisableScriptScanning = 0
  L3_2 = Infrastructure_ReportFirstRegistryValueCheckDefaultDW
  L4_2 = 3449
  L5_2 = L0_2
  L6_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 then
    L3_2 = true
    return L3_2
  end
  L3_2 = Infrastructure_ReportFirstRegistryValueCheckDefaultDW
  L4_2 = 3449
  L5_2 = L1_2
  L6_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 then
    L3_2 = true
    return L3_2
  end
end

Infrastructure_CheckNonUxRealTimeProtections = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L0_2 = "hklm\\software\\microsoft\\windows defender\\threats\\ThreatSeverityDefaultAction"
  L1_2 = "hklm\\software\\policies\\microsoft\\windows defender\\threats\\ThreatSeverityDefaultAction"
  L2_2 = "hklm\\software\\policies\\microsoft\\windows defender\\policy manager\\ThreatSeverityDefaultAction"
  L3_2 = {}
  L4_2 = "1"
  L5_2 = "2"
  L6_2 = "4"
  L7_2 = "5"
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L4_2 = {}
  L5_2 = 6
  L6_2 = 9
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L5_2 = {}
  L6_2 = L0_2
  L7_2 = L1_2
  L8_2 = L2_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L6_2 = pairs
  L7_2 = L5_2
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  for L9_2, L10_2 in L6_2, L7_2, L8_2 do
    L11_2 = Infrastructure_ReportFirstRegistryValueIfValueArrMatch
    L12_2 = 3449
    L13_2 = L10_2
    L14_2 = L3_2
    L15_2 = L4_2
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
    if L11_2 then
      L11_2 = true
      return L11_2
    end
  end
  L6_2 = "hklm\\software\\microsoft\\windows defender\\threats\\ThreatTypeDefaultAction"
  L7_2 = "hklm\\software\\policies\\microsoft\\windows defender\\threats\\ThreatTypeDefaultAction"
  L8_2 = {}
  L9_2 = "0"
  L10_2 = "1"
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = {}
  L10_2 = L6_2
  L11_2 = L7_2
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L5_2 = L9_2
  L9_2 = pairs
  L10_2 = L5_2
  L9_2, L10_2, L11_2 = L9_2(L10_2)
  for L12_2, L13_2 in L9_2, L10_2, L11_2 do
    L14_2 = Infrastructure_ReportFirstRegistryValueIfValueArrMatch
    L15_2 = 3449
    L16_2 = L13_2
    L17_2 = L8_2
    L18_2 = L4_2
    L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
    if L14_2 then
      L14_2 = true
      return L14_2
    end
  end
end

Infrastructure_CheckNonUxThreatActions = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = "hklm\\software\\microsoft\\windows defender\\spynet"
  L1_2 = "hklm\\software\\policies\\microsoft\\windows defender\\spynet"
  L2_2 = {}
  L2_2.DisableBlockAtFirstSeen = 0
  L3_2 = {}
  L4_2 = L0_2
  L5_2 = L1_2
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L4_2 = pairs
  L5_2 = L3_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L9_2 = Infrastructure_ReportFirstRegistryValueCheckDefaultDW
    L10_2 = 3449
    L11_2 = L8_2
    L12_2 = L2_2
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    if L9_2 then
      L9_2 = true
      return L9_2
    end
  end
end

Infrastructure_CheckNonUxSpynet = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = "hklm\\software\\policies\\microsoft\\windows defender\\policy manager"
  L1_2 = {}
  L1_2.AllowBehaviorMonitoring = 1
  L1_2.AllowIOAVProtection = 1
  L1_2.AllowOnAccessProtection = 1
  L1_2.AllowScriptScanning = 1
  L2_2 = Infrastructure_ReportFirstRegistryValueCheckDefaultDW
  L3_2 = 3449
  L4_2 = L0_2
  L5_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 then
    L2_2 = true
    return L2_2
  end
end

Infrastructure_CheckNonUxPolicyManager = L0_1

function L0_1()
  local L0_2, L1_2
  L0_2 = Infrastructure_CheckNonUxWDRootConfig
  L0_2 = L0_2()
  if not L0_2 then
    L0_2 = Infrastructure_CheckNonUxRealTimeProtections
    L0_2 = L0_2()
    if not L0_2 then
      L0_2 = Infrastructure_CheckNonUxThreatActions
      L0_2 = L0_2()
      if not L0_2 then
        L0_2 = Infrastructure_CheckNonUxSpynet
        L0_2 = L0_2()
        if not L0_2 then
          L0_2 = Infrastructure_CheckNonUxPolicyManager
          L0_2 = L0_2()
          if not L0_2 then
            goto lbl_23
          end
        end
      end
    end
  end
  L0_2 = true
  do return L0_2 end
  ::lbl_23::
end

Infrastructure_CheckNonUxControlledWDDefaults = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = {}
  L1_2 = "5fe1bc3b-41bf-4197-8ffe-da2311848f06"
  L0_2[1] = L1_2
  L1_2 = versioning
  L1_2 = L1_2.IsServer
  L1_2 = L1_2()
  if not L1_2 then
    L1_2 = Infrastructure_HasAnyPartnerGuid
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
  end
  if L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = MpCommon
  L2_2 = L2_2.GetGlobalMpAttribute
  L3_2 = "IsMSRTProduct"
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = Infrastructure_IsE5
  L2_2 = L2_2()
  L3_2 = Infrastructure_IsE3
  L3_2 = L3_2()
  L4_2 = not L3_2 and L4_2
  L5_2 = Info
  L5_2 = L5_2.Offline
  L5_2 = L4_2 or L5_2
  if not L5_2 and L4_2 then
    L5_2 = Info
    L5_2 = L5_2.OSMajorVersion
    L5_2 = L5_2 == 10
  end
  return L5_2
end

Infrastructure_ShouldRunAntiTamperingRepair = L0_1

function L0_1()
  local L0_2, L1_2
  L0_2 = Infrastructure_ShouldRunAntiTamperingRepair
  L0_2 = L0_2()
  if L0_2 then
    L0_2 = Infrastructure_CheckNonUxControlledWDDefaults
    L0_2()
  end
  return
end

Infrastructure_AntiTamperingCheckAndRepair = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L0_2 = MpCommon
  L0_2 = L0_2.GetGlobalMpAttribute
  L1_2 = "IsMSRTProduct"
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L0_2 = {}
    L1_2 = "hklm\\software\\microsoft\\windows defender"
    L2_2 = "hklm\\software\\policies\\microsoft\\windows defender"
    L0_2[1] = L1_2
    L0_2[2] = L2_2
    L1_2 = {}
    L2_2 = "DisableAntivirus"
    L3_2 = "DisableAntispyware"
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    L2_2 = ipairs
    L3_2 = L0_2
    L2_2, L3_2, L4_2 = L2_2(L3_2)
    for L5_2, L6_2 in L2_2, L3_2, L4_2 do
      L7_2 = sysio
      L7_2 = L7_2.RegOpenKey
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if L7_2 then
        L8_2 = ipairs
        L9_2 = L1_2
        L8_2, L9_2, L10_2 = L8_2(L9_2)
        for L11_2, L12_2 in L8_2, L9_2, L10_2 do
          L13_2 = sysio
          L13_2 = L13_2.GetRegValueAsDword
          L14_2 = L7_2
          L15_2 = L12_2
          L13_2 = L13_2(L14_2, L15_2)
          if L13_2 then
            L14_2 = bitand
            L15_2 = L13_2
            L16_2 = 1
            L14_2 = L14_2(L15_2, L16_2)
            if L14_2 == 1 then
              L14_2 = MpCommon
              L14_2 = L14_2.SetGlobalMpAttribute
              L15_2 = "DefenderTamperingCheckRegKeyScan"
              L14_2(L15_2)
              L14_2 = MpDetection
              L14_2 = L14_2.ScanResource
              L15_2 = string
              L15_2 = L15_2.format
              L16_2 = "regkeyvalue://%s\\\\%s"
              L17_2 = L6_2
              L18_2 = L12_2
              L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2, L17_2, L18_2)
              L14_2(L15_2, L16_2, L17_2, L18_2)
              L14_2 = MpCommon
              L14_2 = L14_2.DeleteGlobalMpAttribute
              L15_2 = "DefenderTamperingCheckRegKeyScan"
              L14_2(L15_2)
              return
            end
          end
        end
      end
    end
  end
  return
end

Infrastructure_MSRTDASTelemetry = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = "hklm\\software\\policies\\microsoft\\windows defender"
  L1_2 = "hklm\\software\\policies\\microsoft\\windows defender\\policy manager"
  L2_2 = sysio
  L2_2 = L2_2.RegOpenKey
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = sysio
    L3_2 = L3_2.GetRegValueAsDword
    L4_2 = L2_2
    L5_2 = "DisableSpecialRunningModes"
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 and L3_2 ~= 0 then
      L4_2 = string
      L4_2 = L4_2.format
      L5_2 = "MpCfgScanDisableSpecialRunningModes%s"
      L6_2 = L3_2
      L4_2 = L4_2(L5_2, L6_2)
      L5_2 = MpCommon
      L5_2 = L5_2.SetGlobalMpAttribute
      L6_2 = L4_2
      L5_2(L6_2)
      L5_2 = MpDetection
      L5_2 = L5_2.ScanResource
      L6_2 = string
      L6_2 = L6_2.format
      L7_2 = "regkeyvalue://%s\\\\DisableSpecialRunningModes"
      L8_2 = L0_2
      L6_2, L7_2, L8_2 = L6_2(L7_2, L8_2)
      L5_2(L6_2, L7_2, L8_2)
      L5_2 = MpCommon
      L5_2 = L5_2.DeleteGlobalMpAttribute
      L6_2 = L4_2
      L5_2(L6_2)
      return
    end
  end
  L3_2 = sysio
  L3_2 = L3_2.RegOpenKey
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  if L2_2 then
    L3_2 = sysio
    L3_2 = L3_2.GetRegValueAsDword
    L4_2 = L2_2
    L5_2 = "DisableSpecialRunningModes"
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 and L3_2 ~= 0 then
      L4_2 = string
      L4_2 = L4_2.format
      L5_2 = "MpCfgScanDisableSpecialRunningModes%s"
      L6_2 = L3_2
      L4_2 = L4_2(L5_2, L6_2)
      L5_2 = MpCommon
      L5_2 = L5_2.SetGlobalMpAttribute
      L6_2 = L4_2
      L5_2(L6_2)
      L5_2 = MpDetection
      L5_2 = L5_2.ScanResource
      L6_2 = string
      L6_2 = L6_2.format
      L7_2 = "regkeyvalue://%s\\\\DisableSpecialRunningModes"
      L8_2 = L1_2
      L6_2, L7_2, L8_2 = L6_2(L7_2, L8_2)
      L5_2(L6_2, L7_2, L8_2)
      L5_2 = MpCommon
      L5_2 = L5_2.DeleteGlobalMpAttribute
      L6_2 = L4_2
      L5_2(L6_2)
    end
  end
end

Infrastructure_ScanMpCfgDefaults = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = 60
  L2_2 = "MpTamperProtectionState"
  if A0_2 == nil then
    A0_2 = true
  end
  if A0_2 then
    L3_2 = MpCommon
    L3_2 = L3_2.QueryPersistContextNoPath
    L4_2 = L2_2
    L5_2 = "off"
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 then
      L3_2 = false
      return L3_2
    end
    L3_2 = MpCommon
    L3_2 = L3_2.QueryPersistContextNoPath
    L4_2 = L2_2
    L5_2 = "on"
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 then
      L3_2 = true
      return L3_2
    end
  end
  L3_2 = sysio
  L3_2 = L3_2.RegOpenKey
  L4_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features"
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = sysio
    L4_2 = L4_2.GetRegValueAsDword
    L5_2 = L3_2
    L6_2 = "TamperProtection"
    L4_2 = L4_2(L5_2, L6_2)
    if L4_2 then
      L5_2 = crypto
      L5_2 = L5_2.bitand
      L6_2 = L4_2
      L7_2 = 1
      L5_2 = L5_2(L6_2, L7_2)
      if L5_2 == 1 then
        L5_2 = MpCommon
        L5_2 = L5_2.SetPersistContextNoPath
        L6_2 = L2_2
        L7_2 = {}
        L8_2 = "on"
        L7_2[1] = L8_2
        L8_2 = L1_2
        L5_2(L6_2, L7_2, L8_2)
        return L4_2
      else
        L5_2 = MpCommon
        L5_2 = L5_2.SetPersistContextNoPath
        L6_2 = L2_2
        L7_2 = {}
        L8_2 = "off"
        L7_2[1] = L8_2
        L8_2 = L1_2
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = false
        return L5_2
      end
    end
  end
  L4_2 = false
  return L4_2
end

isTamperProtectionOn = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = isTamperProtectionOn
  L0_2 = L0_2()
  if L0_2 == false then
    return
  end
  L0_2 = false
  L1_2 = false
  L2_2 = false
  L3_2 = false
  L4_2 = sysio
  L4_2 = L4_2.RegOpenKey
  L5_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender"
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L5_2 = sysio
    L5_2 = L5_2.GetRegValueAsDword
    L6_2 = L4_2
    L7_2 = "ManagedDefenderProductType"
    L5_2 = L5_2(L6_2, L7_2)
    if L5_2 and L5_2 == 6 then
      L0_2 = true
    end
  end
  L5_2 = sysio
  L5_2 = L5_2.RegOpenKey
  L6_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features"
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L6_2 = sysio
    L6_2 = L6_2.GetRegValueAsDword
    L7_2 = L5_2
    L8_2 = "SenseEnabled"
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 and L6_2 == 1 then
      L1_2 = true
    end
    L7_2 = sysio
    L7_2 = L7_2.GetRegValueAsDword
    L8_2 = L5_2
    L9_2 = "TPExclusions"
    L7_2 = L7_2(L8_2, L9_2)
    L6_2 = L7_2
    if L6_2 and L6_2 == 1 then
      L3_2 = true
    end
  end
  L6_2 = sysio
  L6_2 = L6_2.RegOpenKey
  L7_2 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Policy Manager"
  L6_2 = L6_2(L7_2)
  if L6_2 then
    L7_2 = sysio
    L7_2 = L7_2.GetRegValueAsDword
    L8_2 = L6_2
    L9_2 = "DisableLocalAdminMerge"
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 and L7_2 == 1 then
      L2_2 = true
    end
  end
  if L0_2 and L1_2 and L2_2 and L3_2 then
    L7_2 = MpCommon
    L7_2 = L7_2.SetGlobalMpAttribute
    L8_2 = "EnableTPExclusions"
    L7_2(L8_2)
    L7_2 = MpDetection
    L7_2 = L7_2.ScanResource
    L8_2 = "regkeyvalue://HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features\\\\TPExclusions"
    L7_2(L8_2)
    L7_2 = MpCommon
    L7_2 = L7_2.DeleteGlobalMpAttribute
    L8_2 = "EnableTPExclusions"
    L7_2(L8_2)
  end
  if L0_2 and L1_2 and L2_2 then
    L7_2 = MpCommon
    L7_2 = L7_2.SetGlobalMpAttribute
    L8_2 = "EnableDLAM"
    L7_2(L8_2)
    L7_2 = MpDetection
    L7_2 = L7_2.ScanResource
    L8_2 = "regkeyvalue://HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Policy Manager\\\\DisableLocalAdminMerge"
    L7_2(L8_2)
    L7_2 = MpCommon
    L7_2 = L7_2.DeleteGlobalMpAttribute
    L8_2 = "EnableDLAM"
    L7_2(L8_2)
    L7_2 = true
    return L7_2
  end
end

Infrastructure_DLAMTelemetry = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = versioning
  L0_2 = L0_2.IsSeville
  L0_2 = L0_2()
  if not L0_2 then
    return
  end
  L0_2 = sysio
  L0_2 = L0_2.RegOpenKey
  L1_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\Extensions"
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L1_2 = sysio
    L1_2 = L1_2.RegEnumValues
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L2_2 = MpCommon
      L2_2 = L2_2.SetGlobalMpAttribute
      L3_2 = "ExclusionSet"
      L2_2(L3_2)
      L2_2 = MpDetection
      L2_2 = L2_2.ScanResource
      L3_2 = "regkeyvalue://HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features\\\\SenseEnabled"
      L2_2(L3_2)
      L2_2 = MpCommon
      L2_2 = L2_2.DeleteGlobalMpAttribute
      L3_2 = "ExclusionSet"
      L2_2(L3_2)
      L2_2 = true
      return L2_2
    end
  end
  L1_2 = sysio
  L1_2 = L1_2.RegOpenKey
  L2_2 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Exclusions\\Extensions"
  L1_2 = L1_2(L2_2)
  L0_2 = L1_2
  if L0_2 then
    L1_2 = sysio
    L1_2 = L1_2.RegEnumValues
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L2_2 = MpCommon
      L2_2 = L2_2.SetGlobalMpAttribute
      L3_2 = "ExclusionSet"
      L2_2(L3_2)
      L2_2 = MpDetection
      L2_2 = L2_2.ScanResource
      L3_2 = "regkeyvalue://HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features\\\\SenseEnabled"
      L2_2(L3_2)
      L2_2 = MpCommon
      L2_2 = L2_2.DeleteGlobalMpAttribute
      L3_2 = "ExclusionSet"
      L2_2(L3_2)
      L2_2 = true
      return L2_2
    end
  end
  L1_2 = sysio
  L1_2 = L1_2.RegOpenKey
  L2_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\Paths"
  L1_2 = L1_2(L2_2)
  L0_2 = L1_2
  if L0_2 then
    L1_2 = sysio
    L1_2 = L1_2.RegEnumValues
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L2_2 = MpCommon
      L2_2 = L2_2.SetGlobalMpAttribute
      L3_2 = "ExclusionSet"
      L2_2(L3_2)
      L2_2 = MpDetection
      L2_2 = L2_2.ScanResource
      L3_2 = "regkeyvalue://HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features\\\\SenseEnabled"
      L2_2(L3_2)
      L2_2 = MpCommon
      L2_2 = L2_2.DeleteGlobalMpAttribute
      L3_2 = "ExclusionSet"
      L2_2(L3_2)
      L2_2 = true
      return L2_2
    end
  end
  L1_2 = sysio
  L1_2 = L1_2.RegOpenKey
  L2_2 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Exclusions\\Paths"
  L1_2 = L1_2(L2_2)
  L0_2 = L1_2
  if L0_2 then
    L1_2 = sysio
    L1_2 = L1_2.RegEnumValues
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L2_2 = MpCommon
      L2_2 = L2_2.SetGlobalMpAttribute
      L3_2 = "ExclusionSet"
      L2_2(L3_2)
      L2_2 = MpDetection
      L2_2 = L2_2.ScanResource
      L3_2 = "regkeyvalue://HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features\\\\SenseEnabled"
      L2_2(L3_2)
      L2_2 = MpCommon
      L2_2 = L2_2.DeleteGlobalMpAttribute
      L3_2 = "ExclusionSet"
      L2_2(L3_2)
      L2_2 = true
      return L2_2
    end
  end
  L1_2 = true
  return L1_2
end

Infrastructure_ExclusionTelemetry = L0_1
