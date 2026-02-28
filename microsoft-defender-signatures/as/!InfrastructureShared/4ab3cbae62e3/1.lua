local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = "ruby.exe"
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = contains
L3_1 = L1_1
L4_1 = {}
L5_1 = "conhost.exe"
L6_1 = "WerFault.exe"
L4_1[1] = L5_1
L4_1[2] = L6_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "([^\\]+)$"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.get_current_process_startup_info
L3_1 = L3_1()
L4_1 = nil
L5_1 = nil
L6_1 = {}
L6_1.TrackedProcess = L0_1
L6_1.SignatureName = "Behavior:Win32/PFAppChildProc.C"
if L3_1 then
  L7_1 = L3_1.integrity_level
  L8_1 = MpCommon
  L8_1 = L8_1.SECURITY_MANDATORY_MEDIUM_RID
  if L7_1 > L8_1 then
    L7_1 = "Appomaly_ChildProcPriv"
    L8_1 = MpCommon
    L8_1 = L8_1.AnomalyEventLookup
    L9_1 = L7_1
    L10_1 = "MarkerRecord_"
    L11_1 = L0_1
    L10_1 = L10_1 .. L11_1
    L11_1 = 1
    L8_1 = L8_1(L9_1, L10_1, L11_1)
    L9_1 = MpCommon
    L9_1 = L9_1.GetCurrentTimeT
    L9_1 = L9_1()
    L10_1 = L9_1
    L11_1 = L0_1
    L12_1 = "_"
    L13_1 = L2_1
    L14_1 = "_"
    L15_1 = L3_1.integrity_level
    L11_1 = L11_1 .. L12_1 .. L13_1 .. L14_1 .. L15_1
    L6_1.AnomalyTableName = "Appomaly_ChildProcPriv"
    L6_1.Key = L11_1
    if L8_1 then
      L12_1 = L8_1.Count
      if L12_1 then
        L10_1 = L8_1.Count
        L12_1 = L9_1 - L10_1
        L12_1 = L12_1 / 60
        L13_1 = MpCommon
        L13_1 = L13_1.AnomalyEventLookup
        L14_1 = L7_1
        L15_1 = L11_1
        L16_1 = 1
        L13_1 = L13_1(L14_1, L15_1, L16_1)
        if not L13_1 then
          if 28800 < L12_1 then
            L14_1 = MpCommon
            L14_1 = L14_1.AnomalyTableLookup
            L15_1 = L7_1
            L14_1 = L14_1(L15_1)
            L6_1.AnomalyTableInfo = L14_1
            L14_1 = bm
            L14_1 = L14_1.trigger_sig
            L15_1 = "AnomalousChildPriv"
            L16_1 = safeJsonSerialize
            L17_1 = L6_1
            L16_1, L17_1, L18_1, L19_1, L20_1 = L16_1(L17_1)
            L14_1(L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
          else
            L14_1 = pcall
            L15_1 = MpCommon
            L15_1 = L15_1.AnomalyEventUpdate
            L16_1 = L7_1
            L17_1 = L11_1
            L18_1 = 1
            L19_1 = 1
            L14_1, L15_1 = L14_1(L15_1, L16_1, L17_1, L18_1, L19_1)
            L5_1 = L15_1
            L4_1 = L14_1
          end
        else
          L14_1 = L13_1.Count
          L15_1 = pcall
          L16_1 = MpCommon
          L16_1 = L16_1.AnomalyEventUpdate
          L17_1 = L7_1
          L18_1 = L11_1
          L19_1 = L14_1 + 1
          L20_1 = 1
          L15_1, L16_1 = L15_1(L16_1, L17_1, L18_1, L19_1, L20_1)
          L5_1 = L16_1
          L4_1 = L15_1
        end
    end
    else
      L10_1 = L9_1
      L12_1 = pcall
      L13_1 = MpCommon
      L13_1 = L13_1.AnomalyEventUpdate
      L14_1 = L7_1
      L15_1 = "MarkerRecord_"
      L16_1 = L0_1
      L15_1 = L15_1 .. L16_1
      L16_1 = L9_1
      L17_1 = 1
      L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1, L16_1, L17_1)
      L5_1 = L13_1
      L4_1 = L12_1
      if L4_1 then
        L12_1 = bm
        L12_1 = L12_1.trigger_sig
        L13_1 = "AnomalyTableMarker_Rcr"
        L14_1 = safeJsonSerialize
        L15_1 = L6_1
        L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1 = L14_1(L15_1)
        L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
        L12_1 = pcall
        L13_1 = MpCommon
        L13_1 = L13_1.AnomalyEventUpdate
        L14_1 = L7_1
        L15_1 = L11_1
        L16_1 = 1
        L17_1 = 1
        L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1, L16_1, L17_1)
        L5_1 = L13_1
        L4_1 = L12_1
      end
    end
    if not L4_1 then
      L6_1.Error = L5_1
      L12_1 = bm
      L12_1 = L12_1.trigger_sig
      L13_1 = "AnomalyTable_Error"
      L14_1 = safeJsonSerialize
      L15_1 = L6_1
      L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1 = L14_1(L15_1)
      L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
    end
  end
end
L7_1 = "Appomaly_ChildProcName"
L8_1 = MpCommon
L8_1 = L8_1.AnomalyEventLookup
L9_1 = L7_1
L10_1 = "MarkerRecord_"
L11_1 = L0_1
L10_1 = L10_1 .. L11_1
L11_1 = 1
L8_1 = L8_1(L9_1, L10_1, L11_1)
L9_1 = 0
L10_1 = MpCommon
L10_1 = L10_1.GetCurrentTimeT
L10_1 = L10_1()
L11_1 = L0_1
L12_1 = "_"
L13_1 = L2_1
L11_1 = L11_1 .. L12_1 .. L13_1
L6_1.AnomalyTableName = "Appomaly_ChildProcName"
L6_1.Key = L11_1
if L8_1 then
  L12_1 = L8_1.Count
  if L12_1 then
    L9_1 = L8_1.Count
    L12_1 = L10_1 - L9_1
    L12_1 = L12_1 / 60
    L13_1 = MpCommon
    L13_1 = L13_1.AnomalyEventLookup
    L14_1 = L7_1
    L15_1 = L11_1
    L16_1 = 1
    L13_1 = L13_1(L14_1, L15_1, L16_1)
    if not L13_1 then
      if 28800 < L12_1 then
        L14_1 = MpCommon
        L14_1 = L14_1.AnomalyTableLookup
        L15_1 = L7_1
        L14_1 = L14_1(L15_1)
        L6_1.AnomalyTableInfo = L14_1
        L14_1 = add_parents
        L14_1()
        L14_1 = bm
        L14_1 = L14_1.get_current_process_startup_info
        L14_1 = L14_1()
        if L14_1 then
          L15_1 = mp
          L15_1 = L15_1.GetProcessCommandLine
          L16_1 = L14_1.ppid
          L15_1 = L15_1(L16_1)
          L16_1 = CommandLineGrader
          L17_1 = L15_1
          L16_1, L17_1 = L16_1(L17_1)
          L6_1.CommandlineScore = L16_1
          L6_1.CommandlineScoreIndicator = L17_1
        end
        L15_1 = {}
        L15_1["cmd.exe"] = 10
        L15_1["powershell.exe"] = 10
        L15_1["reg.exe"] = 5
        L15_1.pwsh = 10
        L15_1["net.exe"] = 5
        L15_1["wmic.exe"] = 5
        L15_1["net1.exe"] = 5
        L15_1["rundll32.exe"] = 5
        L16_1 = string
        L16_1 = L16_1.lower
        L17_1 = L2_1
        L16_1 = L16_1(L17_1)
        L16_1 = L15_1[L16_1]
        if not L16_1 then
          L16_1 = 0
        end
        L6_1.ProcNameWeight = L16_1
        L17_1 = bm
        L17_1 = L17_1.add_related_string
        L18_1 = "AdditionalInfo"
        L19_1 = safeJsonSerialize
        L20_1 = L6_1
        L19_1 = L19_1(L20_1)
        L20_1 = bm
        L20_1 = L20_1.RelatedStringBMReport
        L17_1(L18_1, L19_1, L20_1)
        L17_1 = mp
        L17_1 = L17_1.INFECTED
        return L17_1
      else
        L14_1 = pcall
        L15_1 = MpCommon
        L15_1 = L15_1.AnomalyEventUpdate
        L16_1 = L7_1
        L17_1 = L11_1
        L18_1 = 1
        L19_1 = 1
        L14_1, L15_1 = L14_1(L15_1, L16_1, L17_1, L18_1, L19_1)
        L5_1 = L15_1
        L4_1 = L14_1
      end
    else
      L14_1 = L13_1.Count
      L15_1 = pcall
      L16_1 = MpCommon
      L16_1 = L16_1.AnomalyEventUpdate
      L17_1 = L7_1
      L18_1 = L11_1
      L19_1 = L14_1 + 1
      L20_1 = 1
      L15_1, L16_1 = L15_1(L16_1, L17_1, L18_1, L19_1, L20_1)
      L5_1 = L16_1
      L4_1 = L15_1
    end
end
else
  L9_1 = L10_1
  L12_1 = pcall
  L13_1 = MpCommon
  L13_1 = L13_1.AnomalyEventUpdate
  L14_1 = L7_1
  L15_1 = "MarkerRecord_"
  L16_1 = L0_1
  L15_1 = L15_1 .. L16_1
  L16_1 = L10_1
  L17_1 = 1
  L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1, L16_1, L17_1)
  L5_1 = L13_1
  L4_1 = L12_1
  if L4_1 then
    L12_1 = bm
    L12_1 = L12_1.trigger_sig
    L13_1 = "AnomalyTableMarker_Rcr"
    L14_1 = safeJsonSerialize
    L15_1 = L6_1
    L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1 = L14_1(L15_1)
    L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
    L12_1 = pcall
    L13_1 = MpCommon
    L13_1 = L13_1.AnomalyEventUpdate
    L14_1 = L7_1
    L15_1 = L11_1
    L16_1 = 1
    L17_1 = 1
    L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1, L16_1, L17_1)
    L5_1 = L13_1
    L4_1 = L12_1
  end
end
if not L4_1 then
  L6_1.Error = L5_1
  L12_1 = bm
  L12_1 = L12_1.trigger_sig
  L13_1 = "AnomalyTable_Error"
  L14_1 = safeJsonSerialize
  L15_1 = L6_1
  L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1 = L14_1(L15_1)
  L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
end
L12_1 = {}
L12_1.ParentName = L0_1
L12_1.ProcessName = L2_1
L12_1.Source = "BM"
L12_1.SignatureName = "Behavior:Win32/PFAppChildProc.C"
L12_1.AnomalyTableName = "Appomaly_ChildProcName_CmdLine"
L13_1 = GetAnomalyTableAge
L14_1 = "Appomaly_ChildProcName_CmdLine"
L13_1 = L13_1(L14_1)
L12_1.TableAge = L13_1
L12_1.AttributeName = "PFApp_Parent"
L12_1.AttributeCategory = "PFServers"
L13_1 = L6_1.CommandlineScoreIndicator
L12_1.CommandlineScoreIndicator = L13_1
L13_1 = L6_1.CommandlineScore
L12_1.CommandlineScore = L13_1
L13_1 = bm
L13_1 = L13_1.trigger_sig
L14_1 = "AnomalousChildCommandline"
L15_1 = safeJsonSerialize
L16_1 = L12_1
L15_1, L16_1, L17_1, L18_1, L19_1, L20_1 = L15_1(L16_1)
L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
L13_1 = mp
L13_1 = L13_1.CLEAN
return L13_1
