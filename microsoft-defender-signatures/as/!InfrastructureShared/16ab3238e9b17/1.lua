local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p1
  L2_1 = L1_1
  L1_1 = L1_1.match
  L3_1 = "([^\\]+)$"
  L1_1 = L1_1(L2_1, L3_1)
  L0_1 = L1_1
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p1
    L2_1 = L1_1
    L1_1 = L1_1.match
    L3_1 = "([^\\]+)$"
    L1_1 = L1_1(L2_1, L3_1)
    L0_1 = L1_1
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.utf8p1
      L2_1 = L1_1
      L1_1 = L1_1.match
      L3_1 = "([^\\]+)$"
      L1_1 = L1_1(L2_1, L3_1)
      L0_1 = L1_1
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[5]
        L1_1 = L1_1.utf8p1
        L2_1 = L1_1
        L1_1 = L1_1.match
        L3_1 = "([^\\]+)$"
        L1_1 = L1_1(L2_1, L3_1)
        L0_1 = L1_1
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[6]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[6]
          L1_1 = L1_1.utf8p1
          L2_1 = L1_1
          L1_1 = L1_1.match
          L3_1 = "([^\\]+)$"
          L1_1 = L1_1(L2_1, L3_1)
          L0_1 = L1_1
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[7]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[7]
            L1_1 = L1_1.utf8p2
            L2_1 = L1_1
            L1_1 = L1_1.find
            L3_1 = ".home=.* start"
            L1_1 = L1_1(L2_1, L3_1)
            if L1_1 then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[7]
              L1_1 = L1_1.utf8p1
              L2_1 = L1_1
              L1_1 = L1_1.match
              L3_1 = "([^\\]+)$"
              L1_1 = L1_1(L2_1, L3_1)
              L0_1 = L1_1
            end
          end
        end
      end
    end
  end
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
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
L3_1 = nil
L4_1 = mp
L4_1 = L4_1.GetParentProcInfo
L4_1 = L4_1()
if L4_1 then
  L5_1 = L4_1.image_path
  if L5_1 then
    L5_1 = L4_1.image_path
    L6_1 = L5_1
    L5_1 = L5_1.match
    L7_1 = "([^\\]+)$"
    L5_1 = L5_1(L6_1, L7_1)
    L3_1 = L5_1
  end
end
if not L3_1 then
  L3_1 = "None"
end
L5_1 = {}
L6_1 = MpCommon
L6_1 = L6_1.IsSampled
L7_1 = 100000
L8_1 = true
L9_1 = true
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 then
  L6_1 = "Appomaly_ChildProcName_Server"
  L7_1 = L3_1
  L8_1 = "_"
  L9_1 = L2_1
  L7_1 = L7_1 .. L8_1 .. L9_1
  L8_1 = AnomalyTableCheck
  L9_1 = L6_1
  L10_1 = L7_1
  L11_1 = 30
  L12_1 = "MarkerRecord_"
  L13_1 = L0_1
  L12_1 = L12_1 .. L13_1
  L8_1, L9_1, L10_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 and not L9_1 then
    L11_1 = add_parents
    L11_1()
    L5_1.ParentName = L3_1
    L5_1.ProcessName = L2_1
    L5_1.TrackedProcess = L0_1
    L5_1.SignatureName = "PFAppChildProc.A"
    L5_1.AnomalyTableName = "Appomaly_ChildProcName_Server"
    L5_1.AnomalyTableInfo = L10_1
    L11_1 = bm
    L11_1 = L11_1.get_current_process_startup_info
    L11_1 = L11_1()
    if L11_1 then
      L12_1 = mp
      L12_1 = L12_1.GetProcessCommandLine
      L13_1 = L11_1.ppid
      L12_1 = L12_1(L13_1)
      L13_1 = CommandLineGrader
      L14_1 = L12_1
      L13_1, L14_1 = L13_1(L14_1)
      L5_1.CommandlineScore = L13_1
      L5_1.CommandlineScoreIndicator = L14_1
    end
    L12_1 = {}
    L12_1["cmd.exe"] = 10
    L12_1["powershell.exe"] = 10
    L12_1["reg.exe"] = 5
    L12_1.pwsh = 10
    L12_1["net.exe"] = 5
    L12_1["wmic.exe"] = 5
    L12_1["net1.exe"] = 5
    L12_1["rundll32.exe"] = 5
    L13_1 = string
    L13_1 = L13_1.lower
    L14_1 = L2_1
    L13_1 = L13_1(L14_1)
    L13_1 = L12_1[L13_1]
    if not L13_1 then
      L13_1 = 0
    end
    L5_1.ProcNameWeight = L13_1
    L14_1 = bm
    L14_1 = L14_1.add_related_string
    L15_1 = "AdditionalInfo"
    L16_1 = safeJsonSerialize
    L17_1 = L5_1
    L16_1 = L16_1(L17_1)
    L17_1 = bm
    L17_1 = L17_1.RelatedStringBMReport
    L14_1(L15_1, L16_1, L17_1)
    L14_1 = mp
    L14_1 = L14_1.INFECTED
    return L14_1
  end
else
  L6_1 = "Appomaly_ChildProcName_Server"
  L7_1 = MpCommon
  L7_1 = L7_1.AnomalyEventLookup
  L8_1 = L6_1
  L9_1 = "MarkerRecord_"
  L10_1 = L0_1
  L9_1 = L9_1 .. L10_1
  L10_1 = 1
  L7_1 = L7_1(L8_1, L9_1, L10_1)
  L8_1 = MpCommon
  L8_1 = L8_1.GetCurrentTimeT
  L8_1 = L8_1()
  L9_1 = L8_1
  L10_1 = L3_1
  L11_1 = "_"
  L12_1 = L2_1
  L10_1 = L10_1 .. L11_1 .. L12_1
  L11_1 = nil
  L12_1 = nil
  L5_1.ParentName = L3_1
  L5_1.ProcessName = L2_1
  L5_1.TrackedProcess = L0_1
  L5_1.SignatureName = "PFAppChildProc.A"
  L5_1.AnomalyTableName = "Appomaly_ChildProcName_Server"
  if L7_1 then
    L13_1 = L7_1.Count
    if L13_1 then
      L9_1 = L7_1.Count
      L13_1 = L8_1 - L9_1
      L13_1 = L13_1 / 60
      L14_1 = MpCommon
      L14_1 = L14_1.AnomalyEventLookup
      L15_1 = L6_1
      L16_1 = L10_1
      L17_1 = 1
      L14_1 = L14_1(L15_1, L16_1, L17_1)
      if not L14_1 then
        if 43200 < L13_1 then
          L15_1 = add_parents
          L15_1()
          L15_1 = MpCommon
          L15_1 = L15_1.AnomalyTableLookup
          L16_1 = L6_1
          L15_1 = L15_1(L16_1)
          L5_1.AnomalyTableInfo = L15_1
          L15_1 = bm
          L15_1 = L15_1.get_current_process_startup_info
          L15_1 = L15_1()
          if L15_1 then
            L16_1 = mp
            L16_1 = L16_1.GetProcessCommandLine
            L17_1 = L15_1.ppid
            L16_1 = L16_1(L17_1)
            L17_1 = CommandLineGrader
            L18_1 = L16_1
            L17_1, L18_1 = L17_1(L18_1)
            L5_1.CommandlineScore = L17_1
            L5_1.CommandlineScoreIndicator = L18_1
          end
          L16_1 = {}
          L16_1["cmd.exe"] = 10
          L16_1["powershell.exe"] = 10
          L16_1["reg.exe"] = 5
          L16_1.pwsh = 10
          L16_1["net.exe"] = 5
          L16_1["wmic.exe"] = 5
          L16_1["net1.exe"] = 5
          L16_1["rundll32.exe"] = 5
          L17_1 = string
          L17_1 = L17_1.lower
          L18_1 = L2_1
          L17_1 = L17_1(L18_1)
          L17_1 = L16_1[L17_1]
          if not L17_1 then
            L17_1 = 0
          end
          L5_1.ProcNameWeight = L17_1
          L18_1 = bm
          L18_1 = L18_1.add_related_string
          L19_1 = "AdditionalInfo"
          L20_1 = safeJsonSerialize
          L21_1 = L5_1
          L20_1 = L20_1(L21_1)
          L21_1 = bm
          L21_1 = L21_1.RelatedStringBMReport
          L18_1(L19_1, L20_1, L21_1)
          L18_1 = mp
          L18_1 = L18_1.INFECTED
          return L18_1
        else
          L15_1 = pcall
          L16_1 = MpCommon
          L16_1 = L16_1.AnomalyEventUpdate
          L17_1 = L6_1
          L18_1 = L10_1
          L19_1 = 1
          L20_1 = 1
          L15_1, L16_1 = L15_1(L16_1, L17_1, L18_1, L19_1, L20_1)
          L12_1 = L16_1
          L11_1 = L15_1
        end
      else
        L15_1 = L14_1.Count
        L16_1 = pcall
        L17_1 = MpCommon
        L17_1 = L17_1.AnomalyEventUpdate
        L18_1 = L6_1
        L19_1 = L10_1
        L20_1 = L15_1 + 1
        L21_1 = 1
        L16_1, L17_1 = L16_1(L17_1, L18_1, L19_1, L20_1, L21_1)
        L12_1 = L17_1
        L11_1 = L16_1
      end
  end
  else
    L9_1 = L8_1
    L13_1 = pcall
    L14_1 = MpCommon
    L14_1 = L14_1.AnomalyEventUpdate
    L15_1 = L6_1
    L16_1 = "MarkerRecord_"
    L17_1 = L0_1
    L16_1 = L16_1 .. L17_1
    L17_1 = L8_1
    L18_1 = 1
    L13_1, L14_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1)
    L12_1 = L14_1
    L11_1 = L13_1
    if L11_1 then
      L13_1 = bm
      L13_1 = L13_1.trigger_sig
      L14_1 = "AnomalyTableMarker_Rcr"
      L15_1 = safeJsonSerialize
      L16_1 = L5_1
      L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L15_1(L16_1)
      L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
      L13_1 = pcall
      L14_1 = MpCommon
      L14_1 = L14_1.AnomalyEventUpdate
      L15_1 = L6_1
      L16_1 = L10_1
      L17_1 = 1
      L18_1 = 1
      L13_1, L14_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1)
      L12_1 = L14_1
      L11_1 = L13_1
    end
  end
  if not L11_1 then
    L5_1.Error = L12_1
    L13_1 = bm
    L13_1 = L13_1.trigger_sig
    L14_1 = "AnomalyTable_Error"
    L15_1 = safeJsonSerialize
    L16_1 = L5_1
    L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L15_1(L16_1)
    L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
  end
end
L6_1 = {}
L6_1.ParentName = L3_1
L6_1.TrackedProcess = L0_1
L6_1.ProcessName = L2_1
L6_1.Source = "BM"
L6_1.SignatureName = "Behavior:Win32/PFAppChildProc.A"
L6_1.AnomalyTableName = "Appomaly_ChildProcName_CmdLine"
L7_1 = GetAnomalyTableAge
L8_1 = "Appomaly_ChildProcName_CmdLine"
L7_1 = L7_1(L8_1)
L6_1.TableAge = L7_1
L6_1.AttributeName = "PFApp_Parent"
L6_1.AttributeCategory = "PFServers"
L7_1 = L5_1.CommandlineScoreIndicator
L6_1.CommandlineScoreIndicator = L7_1
L7_1 = L5_1.CommandlineScore
L6_1.CommandlineScore = L7_1
L7_1 = bm
L7_1 = L7_1.trigger_sig
L8_1 = "AnomalousChildCommandline"
L9_1 = safeJsonSerialize
L10_1 = L6_1
L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L9_1(L10_1)
L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
