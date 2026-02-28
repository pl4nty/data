local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.utf8p2
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L0_1 = L3_1.utf8p2
    L3_1 = safeJsonDeserialize
    L4_1 = L0_1
    L3_1 = L3_1(L4_1)
    L0_1 = L3_1
    if not L0_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = L0_1.ParentName
    L1_1 = L3_1 or L1_1
    if not L3_1 then
      L1_1 = "None"
    end
    L2_1 = L0_1.ProcessName
  end
end
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L0_1.CommandlineScoreIndicator
L4_1 = nil
if not L3_1 then
  L5_1 = bm
  L5_1 = L5_1.get_current_process_startup_info
  L5_1 = L5_1()
  if L5_1 then
    L6_1 = mp
    L6_1 = L6_1.GetProcessCommandLine
    L7_1 = L5_1.ppid
    L6_1 = L6_1(L7_1)
    if not L6_1 or L6_1 == "" then
      L7_1 = mp
      L7_1 = L7_1.CLEAN
      return L7_1
    end
    L7_1 = CommandLineGrader
    L8_1 = L6_1
    L7_1, L8_1 = L7_1(L8_1)
    if L7_1 < 5 then
      L9_1 = mp
      L9_1 = L9_1.CLEAN
      return L9_1
    end
    L0_1.CommandlineScoreIndicator = L8_1
    L4_1 = L8_1.CommandlineTokens
  else
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
else
  L5_1 = L3_1.Score
  if L5_1 < 5 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L4_1 = L3_1.CommandlineTokens
end
L5_1 = MpCommon
L5_1 = L5_1.IsSampled
L6_1 = 100000
L7_1 = true
L8_1 = true
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 then
  L5_1 = L0_1.AnomalyTableName
  if not L5_1 then
    L5_1 = "Appomaly_ChildProcName_CmdLine"
  end
  L6_1 = L1_1
  L7_1 = ";"
  L8_1 = L2_1
  L9_1 = ";"
  L10_1 = table
  L10_1 = L10_1.concat
  L11_1 = L4_1
  L12_1 = "|"
  L10_1 = L10_1(L11_1, L12_1)
  L6_1 = L6_1 .. L7_1 .. L8_1 .. L9_1 .. L10_1
  L7_1 = AnomalyTableCheck
  L8_1 = L5_1
  L9_1 = L6_1
  L10_1 = 30
  L11_1 = "MarkerRecord_"
  L12_1 = L1_1
  L11_1 = L11_1 .. L12_1
  L7_1, L8_1, L9_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if L7_1 and not L8_1 then
    L10_1 = add_parents
    L10_1()
    L10_1 = {}
    L10_1.CmdLineInfo = L0_1
    L10_1.TrackedProcess = L1_1
    L10_1.AnomalyTableName = L5_1
    L10_1.AnomalyTableInfo = L9_1
    L11_1 = {}
    L11_1["cmd.exe"] = 10
    L11_1["powershell.exe"] = 10
    L11_1["reg.exe"] = 5
    L11_1.pwsh = 10
    L11_1["net.exe"] = 5
    L11_1["wmic.exe"] = 5
    L11_1["net1.exe"] = 5
    L11_1["rundll32.exe"] = 5
    L12_1 = string
    L12_1 = L12_1.lower
    L13_1 = L2_1
    L12_1 = L12_1(L13_1)
    L12_1 = L11_1[L12_1]
    if not L12_1 then
      L12_1 = 0
    end
    L10_1.ProcNameWeight = L12_1
    L13_1 = bm
    L13_1 = L13_1.add_related_string
    L14_1 = "AdditionalInfo"
    L15_1 = safeJsonSerialize
    L16_1 = L10_1
    L15_1 = L15_1(L16_1)
    L16_1 = bm
    L16_1 = L16_1.RelatedStringBMReport
    L13_1(L14_1, L15_1, L16_1)
    L13_1 = GetPidFromParentImagePath
    L14_1 = L1_1
    L13_1 = L13_1(L14_1)
    if L13_1 then
      L14_1 = L0_1.AttributeCategory
      if not L14_1 then
        L14_1 = "generic"
      end
      L15_1 = startTrackingApp
      L16_1 = L13_1.ppid
      L17_1 = L1_1
      L18_1 = L14_1
      L19_1 = L0_1.AttributeName
      L15_1, L16_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
      if not L15_1 then
        L17_1 = bm
        L17_1 = L17_1.trigger_sig
        L18_1 = "ProcAttribError"
        L19_1 = safeJsonSerialize
        L20_1 = L16_1
        L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1 = L19_1(L20_1)
        L17_1(L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1)
      else
        L17_1 = L5_1
        L18_1 = "["
        L19_1 = L13_1.ppid
        L20_1 = L19_1
        L19_1 = L19_1.match
        L21_1 = "pid:(%d+)"
        L19_1 = L19_1(L20_1, L21_1)
        L20_1 = "]"
        L17_1 = L17_1 .. L18_1 .. L19_1 .. L20_1
        L18_1 = IncreaseProcessAnomalyScore
        L19_1 = L13_1.ppid
        L20_1 = 10
        L21_1 = L17_1
        L22_1 = L0_1.AttributeName
        L23_1 = L10_1
        L18_1(L19_1, L20_1, L21_1, L22_1, L23_1)
      end
    end
    L14_1 = mp
    L14_1 = L14_1.INFECTED
    return L14_1
  end
else
  L5_1 = L0_1.AnomalyTableName
  if not L5_1 then
    L5_1 = "Appomaly_ChildProcName_CmdLine"
  end
  L6_1 = MpCommon
  L6_1 = L6_1.AnomalyEventLookup
  L7_1 = L5_1
  L8_1 = "MarkerRecord_"
  L9_1 = L1_1
  L8_1 = L8_1 .. L9_1
  L9_1 = 1
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  L7_1 = MpCommon
  L7_1 = L7_1.GetCurrentTimeT
  L7_1 = L7_1()
  L8_1 = L7_1
  L9_1 = L1_1
  L10_1 = ";"
  L11_1 = L2_1
  L12_1 = ";"
  L13_1 = table
  L13_1 = L13_1.concat
  L14_1 = L4_1
  L15_1 = "|"
  L13_1 = L13_1(L14_1, L15_1)
  L9_1 = L9_1 .. L10_1 .. L11_1 .. L12_1 .. L13_1
  L10_1 = {}
  L10_1.CmdLineInfo = L0_1
  L10_1.TrackedProcess = L1_1
  L10_1.AnomalyTableName = L5_1
  L11_1 = nil
  L12_1 = nil
  if L6_1 then
    L13_1 = L6_1.Count
    if L13_1 then
      L8_1 = L6_1.Count
      L13_1 = L7_1 - L8_1
      L13_1 = L13_1 / 60
      L14_1 = MpCommon
      L14_1 = L14_1.AnomalyEventLookup
      L15_1 = L5_1
      L16_1 = L9_1
      L17_1 = 1
      L14_1 = L14_1(L15_1, L16_1, L17_1)
      if not L14_1 then
        if 43200 < L13_1 then
          L15_1 = add_parents
          L15_1()
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
          L10_1.ProcNameWeight = L16_1
          L17_1 = bm
          L17_1 = L17_1.add_related_string
          L18_1 = "AdditionalInfo"
          L19_1 = safeJsonSerialize
          L20_1 = L10_1
          L19_1 = L19_1(L20_1)
          L20_1 = bm
          L20_1 = L20_1.RelatedStringBMReport
          L17_1(L18_1, L19_1, L20_1)
          L17_1 = GetPidFromParentImagePath
          L18_1 = L1_1
          L17_1 = L17_1(L18_1)
          if L17_1 then
            L18_1 = L0_1.AttributeCategory
            if not L18_1 then
              L18_1 = "generic"
            end
            L19_1 = startTrackingApp
            L20_1 = L17_1.ppid
            L21_1 = L1_1
            L22_1 = L18_1
            L23_1 = L0_1.AttributeName
            L19_1, L20_1 = L19_1(L20_1, L21_1, L22_1, L23_1)
            if not L19_1 then
              L21_1 = bm
              L21_1 = L21_1.trigger_sig
              L22_1 = "ProcAttribError"
              L23_1 = safeJsonSerialize
              L24_1 = L20_1
              L23_1, L24_1, L25_1, L26_1, L27_1 = L23_1(L24_1)
              L21_1(L22_1, L23_1, L24_1, L25_1, L26_1, L27_1)
            else
              L21_1 = L5_1
              L22_1 = "["
              L23_1 = L17_1.ppid
              L24_1 = L23_1
              L23_1 = L23_1.match
              L25_1 = "pid:(%d+)"
              L23_1 = L23_1(L24_1, L25_1)
              L24_1 = "]"
              L21_1 = L21_1 .. L22_1 .. L23_1 .. L24_1
              L22_1 = IncreaseProcessAnomalyScore
              L23_1 = L17_1.ppid
              L24_1 = 10
              L25_1 = L21_1
              L26_1 = L0_1.AttributeName
              L27_1 = L10_1
              L22_1(L23_1, L24_1, L25_1, L26_1, L27_1)
            end
          end
          L18_1 = mp
          L18_1 = L18_1.INFECTED
          return L18_1
        else
          L15_1 = pcall
          L16_1 = MpCommon
          L16_1 = L16_1.AnomalyEventUpdate
          L17_1 = L5_1
          L18_1 = L9_1
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
        L18_1 = L5_1
        L19_1 = L9_1
        L20_1 = L15_1 + 1
        L21_1 = 1
        L16_1, L17_1 = L16_1(L17_1, L18_1, L19_1, L20_1, L21_1)
        L12_1 = L17_1
        L11_1 = L16_1
      end
  end
  else
    L8_1 = L7_1
    L13_1 = pcall
    L14_1 = MpCommon
    L14_1 = L14_1.AnomalyEventUpdate
    L15_1 = L5_1
    L16_1 = "MarkerRecord_"
    L17_1 = L1_1
    L16_1 = L16_1 .. L17_1
    L17_1 = L7_1
    L18_1 = 1
    L13_1, L14_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1)
    L12_1 = L14_1
    L11_1 = L13_1
    if L11_1 then
      L13_1 = bm
      L13_1 = L13_1.trigger_sig
      L14_1 = "AnomalyTableMarker_Rcr"
      L15_1 = safeJsonSerialize
      L16_1 = L10_1
      L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1 = L15_1(L16_1)
      L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1)
      L13_1 = pcall
      L14_1 = MpCommon
      L14_1 = L14_1.AnomalyEventUpdate
      L15_1 = L5_1
      L16_1 = L9_1
      L17_1 = 1
      L18_1 = 1
      L13_1, L14_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1)
      L12_1 = L14_1
      L11_1 = L13_1
    end
  end
  if not L11_1 then
    L10_1.Error = L12_1
    L13_1 = bm
    L13_1 = L13_1.trigger_sig
    L14_1 = "AnomalyTable_Error"
    L15_1 = safeJsonSerialize
    L16_1 = L10_1
    L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1 = L15_1(L16_1)
    L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1)
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
