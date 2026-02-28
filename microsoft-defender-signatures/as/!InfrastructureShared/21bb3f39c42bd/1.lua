local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = MpCommon
L1_1 = L1_1.GetProcessAttributeValue
L2_1 = L0_1.ppid
L3_1 = "PFAppTracked"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = MpCommon
  L1_1 = L1_1.GetProcessAttributeValue
  L2_1 = L0_1.ppid
  L3_1 = "inherit:PFAppTracked"
  L1_1 = L1_1(L2_1, L3_1)
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = safeJsonDeserialize
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L2_1.AppName
L4_1 = bm
L4_1 = L4_1.get_imagepath
L4_1 = L4_1()
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = contains
L6_1 = L4_1
L7_1 = {}
L8_1 = "conhost.exe"
L9_1 = "WerFault.exe"
L7_1[1] = L8_1
L7_1[2] = L9_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L6_1 = L4_1
L5_1 = L4_1.match
L7_1 = "([^\\]+)$"
L5_1 = L5_1(L6_1, L7_1)
L6_1 = "Appomaly_ChildProcName"
L7_1 = MpCommon
L7_1 = L7_1.AnomalyEventLookup
L8_1 = L6_1
L9_1 = "MarkerRecord_"
L10_1 = L3_1
L9_1 = L9_1 .. L10_1
L10_1 = 1
L7_1 = L7_1(L8_1, L9_1, L10_1)
L8_1 = MpCommon
L8_1 = L8_1.GetCurrentTimeT
L8_1 = L8_1()
L9_1 = L8_1
L10_1 = nil
L11_1 = mp
L11_1 = L11_1.GetParentProcInfo
L11_1 = L11_1()
if L11_1 then
  L12_1 = L11_1.image_path
  if L12_1 then
    L12_1 = L11_1.image_path
    L13_1 = L12_1
    L12_1 = L12_1.match
    L14_1 = "([^\\]+)$"
    L12_1 = L12_1(L13_1, L14_1)
    L10_1 = L12_1
  end
end
if not L10_1 then
  L10_1 = "None"
end
L12_1 = L10_1
L13_1 = "_"
L14_1 = L5_1
L12_1 = L12_1 .. L13_1 .. L14_1
L13_1 = nil
L14_1 = nil
L15_1 = {}
L15_1.TrackedProcess = L3_1
L15_1.ParentName = L10_1
L15_1.SignatureName = "PFAppChildProc.B"
L15_1.AnomalyTableName = "Appomaly_ChildProcName"
L15_1.Key = L12_1
if L7_1 then
  L16_1 = L7_1.Count
  if L16_1 then
    L9_1 = L7_1.Count
    L16_1 = L8_1 - L9_1
    L16_1 = L16_1 / 60
    L17_1 = MpCommon
    L17_1 = L17_1.AnomalyEventLookup
    L18_1 = L6_1
    L19_1 = L12_1
    L20_1 = 1
    L17_1 = L17_1(L18_1, L19_1, L20_1)
    if not L17_1 then
      if 43200 < L16_1 then
        L18_1 = add_parents
        L18_1()
        L18_1 = MpCommon
        L18_1 = L18_1.AnomalyTableLookup
        L19_1 = L6_1
        L18_1 = L18_1(L19_1)
        L15_1.AnomalyTableInfo = L18_1
        L18_1 = mp
        L18_1 = L18_1.GetProcessCommandLine
        L19_1 = L0_1.ppid
        L18_1 = L18_1(L19_1)
        L19_1 = CommandLineGrader
        L20_1 = L18_1
        L19_1, L20_1 = L19_1(L20_1)
        L15_1.CommandlineScore = L19_1
        L15_1.CommandlineScoreIndicator = L20_1
        L21_1 = {}
        L21_1["cmd.exe"] = 10
        L21_1["powershell.exe"] = 10
        L21_1["reg.exe"] = 5
        L21_1.pwsh = 10
        L21_1["net.exe"] = 5
        L21_1["wmic.exe"] = 5
        L21_1["net1.exe"] = 5
        L21_1["rundll32.exe"] = 5
        L22_1 = string
        L22_1 = L22_1.lower
        L23_1 = L5_1
        L22_1 = L22_1(L23_1)
        L22_1 = L21_1[L22_1]
        if not L22_1 then
          L22_1 = 0
        end
        L15_1.ProcNameWeight = L22_1
        L23_1 = bm
        L23_1 = L23_1.add_related_string
        L24_1 = "AdditionalInfo"
        L25_1 = safeJsonSerialize
        L26_1 = L15_1
        L25_1 = L25_1(L26_1)
        L26_1 = bm
        L26_1 = L26_1.RelatedStringBMReport
        L23_1(L24_1, L25_1, L26_1)
        L23_1 = mp
        L23_1 = L23_1.INFECTED
        return L23_1
      else
        L18_1 = pcall
        L19_1 = MpCommon
        L19_1 = L19_1.AnomalyEventUpdate
        L20_1 = L6_1
        L21_1 = L12_1
        L22_1 = 1
        L23_1 = 1
        L18_1, L19_1 = L18_1(L19_1, L20_1, L21_1, L22_1, L23_1)
        L14_1 = L19_1
        L13_1 = L18_1
      end
    else
      L18_1 = L17_1.Count
      L19_1 = pcall
      L20_1 = MpCommon
      L20_1 = L20_1.AnomalyEventUpdate
      L21_1 = L6_1
      L22_1 = L12_1
      L23_1 = L18_1 + 1
      L24_1 = 1
      L19_1, L20_1 = L19_1(L20_1, L21_1, L22_1, L23_1, L24_1)
      L14_1 = L20_1
      L13_1 = L19_1
    end
end
else
  L9_1 = L8_1
  L16_1 = pcall
  L17_1 = MpCommon
  L17_1 = L17_1.AnomalyEventUpdate
  L18_1 = L6_1
  L19_1 = "MarkerRecord_"
  L20_1 = L3_1
  L19_1 = L19_1 .. L20_1
  L20_1 = L8_1
  L21_1 = 1
  L16_1, L17_1 = L16_1(L17_1, L18_1, L19_1, L20_1, L21_1)
  L14_1 = L17_1
  L13_1 = L16_1
  if L13_1 then
    L16_1 = bm
    L16_1 = L16_1.trigger_sig
    L17_1 = "AnomalyTableMarker_Rcr"
    L18_1 = safeJsonSerialize
    L19_1 = L15_1
    L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L18_1(L19_1)
    L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
    L16_1 = pcall
    L17_1 = MpCommon
    L17_1 = L17_1.AnomalyEventUpdate
    L18_1 = L6_1
    L19_1 = L12_1
    L20_1 = 1
    L21_1 = 1
    L16_1, L17_1 = L16_1(L17_1, L18_1, L19_1, L20_1, L21_1)
    L14_1 = L17_1
    L13_1 = L16_1
  end
end
if not L13_1 then
  L15_1.Error = L14_1
  L16_1 = bm
  L16_1 = L16_1.trigger_sig
  L17_1 = "AnomalyTable_Error"
  L18_1 = safeJsonSerialize
  L19_1 = L15_1
  L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L18_1(L19_1)
  L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
end
L16_1 = {}
L16_1.TrackedProcess = L3_1
L16_1.ParentName = L10_1
L16_1.ProcessName = L5_1
L16_1.Source = "BM"
L16_1.SignatureName = "PFAppChildProc.B"
L16_1.AnomalyTableName = "Appomaly_ChildProcName_CmdLine"
L17_1 = GetAnomalyTableAge
L18_1 = "Appomaly_ChildProcName_CmdLine"
L17_1 = L17_1(L18_1)
L16_1.TableAge = L17_1
L16_1.AttributeName = "PFAppTracked"
L16_1.AttributeCategory = "programfiles_Net"
L17_1 = L15_1.CommandlineScoreIndicator
L16_1.CommandlineScoreIndicator = L17_1
L17_1 = L15_1.CommandlineScore
L16_1.CommandlineScore = L17_1
L17_1 = bm
L17_1 = L17_1.trigger_sig
L18_1 = "AnomalousChildCommandline"
L19_1 = safeJsonSerialize
L20_1 = L16_1
L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L19_1(L20_1)
L17_1(L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
L17_1 = mp
L17_1 = L17_1.CLEAN
return L17_1
