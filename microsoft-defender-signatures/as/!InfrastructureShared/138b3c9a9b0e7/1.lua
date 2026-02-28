local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.ppid
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.ppid
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = isChildProcByCreatedFlag
  L3_1 = "onedrive"
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.match
L5_1 = "([^\\]+)$"
L3_1 = L3_1(L4_1, L5_1)
L2_1 = L3_1
L3_1 = bm
L3_1 = L3_1.get_process_relationships
L3_1, L4_1 = L3_1()
if L3_1 then
  L5_1 = ipairs
  L6_1 = L3_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = L9_1.ppid
    if L10_1 then
      L10_1 = L9_1.image_path
      if L10_1 then
        L10_1 = string
        L10_1 = L10_1.lower
        L11_1 = L9_1.image_path
        L10_1 = L10_1(L11_1)
        L11_1 = string
        L11_1 = L11_1.find
        L12_1 = L10_1
        L13_1 = "onedrive"
        L14_1 = 1
        L15_1 = true
        L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
        if L11_1 then
          L1_1 = L9_1.ppid
          break
        end
      end
    end
  end
end
L5_1 = startTrackingApp
L6_1 = L1_1
L7_1 = "OneDrive"
L8_1 = "programfiles_targeted"
L9_1 = "PFAppTracked"
L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L7_1 = bm
  L7_1 = L7_1.trigger_sig
  L8_1 = "ProcAttribError"
  L9_1 = safeJsonSerialize
  L10_1 = L6_1
  L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L9_1(L10_1)
  L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
else
  L7_1 = L6_1.IsNewApp
  if L7_1 then
    L6_1.SignatureName = "BM/SetProcAttribOneDrive"
    L7_1 = bm
    L7_1 = L7_1.trigger_sig
    L8_1 = "SetProcessAttrib"
    L9_1 = safeJsonSerialize
    L10_1 = L6_1
    L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L9_1(L10_1)
    L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
  end
end
L7_1 = mp
L7_1 = L7_1.GetProcessCommandLine
L8_1 = L0_1.ppid
L7_1 = L7_1(L8_1)
L8_1 = CommandLineGrader
L9_1 = L7_1
L8_1, L9_1 = L8_1(L9_1)
L10_1 = nil
L11_1 = nil
L12_1 = this_sigattrlog
L12_1 = L12_1[3]
L12_1 = L12_1.matched
if L12_1 then
  L12_1 = this_sigattrlog
  L12_1 = L12_1[3]
  L12_1 = L12_1.utf8p1
  L13_1 = L12_1
  L12_1 = L12_1.match
  L14_1 = "([^\\]+)$"
  L12_1 = L12_1(L13_1, L14_1)
  L13_1 = this_sigattrlog
  L13_1 = L13_1[3]
  L13_1 = L13_1.utf8p2
  if L12_1 ~= L13_1 then
    L12_1 = "RenamedBinary["
    L14_1 = L1_1
    L13_1 = L1_1.match
    L15_1 = "pid:(%d+)"
    L13_1 = L13_1(L14_1, L15_1)
    L14_1 = "]["
    L15_1 = this_sigattrlog
    L15_1 = L15_1[3]
    L15_1 = L15_1.utf8p2
    L16_1 = "-->"
    L17_1 = L2_1
    L18_1 = "]"
    L12_1 = L12_1 .. L13_1 .. L14_1 .. L15_1 .. L16_1 .. L17_1 .. L18_1
    L13_1 = IncreaseProcessAnomalyScore
    L14_1 = L1_1
    L15_1 = 10
    L16_1 = L12_1
    L17_1 = "PFAppTracked"
    L13_1, L14_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
    L11_1 = L14_1
    L10_1 = L13_1
  end
end
L12_1 = true

function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = mp
  L1_2 = L1_2.ContextualExpandEnvironmentVariables
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  if A0_2 then
    L1_2 = string
    L1_2 = L1_2.lower
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    A0_2 = L1_2
  end
  L1_2 = {}
  L2_2 = "%%?program_?%s?files%%?\\microsoft onedrive\\"
  L3_2 = "\\appdata\\local\\microsoft\\onedrive"
  L4_2 = "\\windows\\system32\\"
  L5_2 = "%system%\\"
  L6_2 = "\\program files %(x86%)\\microsoft onedrive\\"
  L7_2 = "\\windows\\syswow64\\"
  L8_2 = "\\program files.*\\microsoft office"
  L9_2 = "\\windows\\ccmcache"
  L10_2 = "\\windows\\imecache\\"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L1_2[7] = L8_2
  L1_2[8] = L9_2
  L1_2[9] = L10_2
  L2_2 = contains
  L3_2 = A0_2
  L4_2 = L1_2
  L5_2 = false
  return L2_2(L3_2, L4_2, L5_2)
end

L14_1 = this_sigattrlog
L14_1 = L14_1[4]
L14_1 = L14_1.matched
if L14_1 then
  L14_1 = this_sigattrlog
  L14_1 = L14_1[4]
  L14_1 = L14_1.utf8p1
  L15_1 = L13_1
  L16_1 = L14_1
  L15_1 = L15_1(L16_1)
  if not L15_1 then
    L15_1 = IsPotentiallyClean
    L16_1 = "CmdLine"
    L17_1 = "OneDrive"
    L18_1 = ";"
    L19_1 = L2_1
    L17_1 = L17_1 .. L18_1 .. L19_1
    L18_1 = L9_1.CommandlineTokens
    L15_1 = L15_1(L16_1, L17_1, L18_1)
    if L15_1 then
      L15_1 = mp
      L15_1 = L15_1.CLEAN
      return L15_1
    end
    L15_1 = "NoneDefaultDirectory["
    L17_1 = L1_1
    L16_1 = L1_1.match
    L18_1 = "pid:(%d+)"
    L16_1 = L16_1(L17_1, L18_1)
    L17_1 = "]["
    L18_1 = L14_1
    L19_1 = "]"
    L15_1 = L15_1 .. L16_1 .. L17_1 .. L18_1 .. L19_1
    L16_1 = IncreaseProcessAnomalyScore
    L17_1 = L1_1
    L18_1 = 10
    L19_1 = L15_1
    L20_1 = "PFAppTracked"
    L16_1, L17_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
    L11_1 = L17_1
    L10_1 = L16_1
    L12_1 = false
  end
end
L14_1 = nil
if L10_1 then
  L15_1 = {}
  L15_1.ProcessAttrib = L11_1
  L16_1 = bm
  L16_1 = L16_1.add_related_string
  L17_1 = "AdditionalInfo"
  L18_1 = safeJsonSerialize
  L19_1 = L15_1
  L18_1 = L18_1(L19_1)
  L19_1 = bm
  L19_1 = L19_1.RelatedStringBMReport
  L16_1(L17_1, L18_1, L19_1)
  L14_1 = true
end
L15_1 = nil
L16_1 = mp
L16_1 = L16_1.GetParentProcInfo
L16_1 = L16_1()
if L16_1 then
  L17_1 = L16_1.image_path
  if L17_1 then
    L17_1 = L16_1.image_path
    L18_1 = L17_1
    L17_1 = L17_1.match
    L19_1 = "([^\\]+)$"
    L17_1 = L17_1(L18_1, L19_1)
    L15_1 = L17_1
  end
end
if not L15_1 then
  L15_1 = "None"
end
L17_1 = {}
L17_1.ParentName = L15_1
L17_1.ProcessName = L2_1
L17_1.Source = "BM"
L17_1.SignatureName = "Bm/SetProcAttribOneDrive.A"
L17_1.TrackedProcess = "OneDrive"
L17_1.AttributeName = "PFAppTracked"
L17_1.AttributeCategory = "programfiles_targeted"
L17_1.CommandlineScoreIndicator = L9_1
L17_1.CommandlineScore = L8_1
L18_1 = L15_1
L19_1 = "_"
L20_1 = L2_1
L18_1 = L18_1 .. L19_1 .. L20_1
L19_1 = IsPotentiallyClean
L20_1 = "CleanProcessChain"
L21_1 = "OneDrive"
L22_1 = L2_1
L19_1 = L19_1(L20_1, L21_1, L22_1)
if not L19_1 then
  L19_1 = AnomalyTableCheck
  L20_1 = "Appomaly_ChildProcName"
  L21_1 = L18_1
  L22_1 = 30
  L23_1 = "MarkerRecord_OneDrive"
  L19_1, L20_1, L21_1 = L19_1(L20_1, L21_1, L22_1, L23_1)
  if L19_1 and not L20_1 then
    L17_1.AnomalyTableName = "Appomaly_ChildProcName"
    L22_1 = GetProcessNameScore
    L23_1 = L2_1
    L22_1 = L22_1(L23_1)
    L17_1.ProcNameWeight = L22_1
    L17_1.AnomalyTableInfo = L21_1
    L22_1 = bm
    L22_1 = L22_1.trigger_sig
    L23_1 = "PFAppChildProcOneDrive"
    L24_1 = safeJsonSerialize
    L25_1 = L17_1
    L24_1, L25_1, L26_1 = L24_1(L25_1)
    L22_1(L23_1, L24_1, L25_1, L26_1)
  end
end
L19_1 = bm
L19_1 = L19_1.trigger_sig
L20_1 = "AnomalousChildCommandline"
L21_1 = safeJsonSerialize
L22_1 = L17_1
L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L21_1(L22_1)
L19_1(L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
L19_1 = L0_1.integrity_level
if L19_1 then
  L19_1 = L15_1
  L20_1 = "_"
  L21_1 = L2_1
  L22_1 = "_"
  L23_1 = L0_1.integrity_level
  L18_1 = L19_1 .. L20_1 .. L21_1 .. L22_1 .. L23_1
  L19_1 = IsPotentiallyClean
  L20_1 = "CleanProcessChainPriv"
  L21_1 = "OneDrive"
  L22_1 = L0_1.integrity_level
  L19_1 = L19_1(L20_1, L21_1, L22_1)
  if not L19_1 then
    L19_1 = AnomalyTableCheck
    L20_1 = "Appomaly_ChildProcPriv"
    L21_1 = L18_1
    L22_1 = 30
    L23_1 = "MarkerRecord_OneDrive"
    L19_1, L20_1, L21_1 = L19_1(L20_1, L21_1, L22_1, L23_1)
    if L19_1 and not L20_1 then
      L17_1.AnomalyTableName = "Appomaly_ChildProcPriv"
      L17_1.AnomalyTableInfo = L21_1
      L17_1.Key = L18_1
      L22_1 = bm
      L22_1 = L22_1.trigger_sig
      L23_1 = "AnomalousChildPriv"
      L24_1 = safeJsonSerialize
      L25_1 = L17_1
      L24_1, L25_1, L26_1 = L24_1(L25_1)
      L22_1(L23_1, L24_1, L25_1, L26_1)
    end
  end
end
L19_1 = bm
L19_1 = L19_1.get_imagepath
L19_1 = L19_1()
L20_1 = MpCommon
L20_1 = L20_1.PathToWin32Path
L21_1 = L19_1
L20_1 = L20_1(L21_1)
L19_1 = L20_1
L20_1 = NormalizeDirectory
L21_1 = bm
L21_1 = L21_1.get_imagepath
L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L21_1()
L20_1 = L20_1(L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
L19_1 = L20_1
if L19_1 and not L12_1 then
  L20_1 = L15_1
  L21_1 = "_"
  L22_1 = L19_1
  L23_1 = "_"
  L24_1 = L2_1
  L18_1 = L20_1 .. L21_1 .. L22_1 .. L23_1 .. L24_1
  L20_1 = AnomalyTableCheck
  L21_1 = "Appomaly_ChildProcDir"
  L22_1 = L18_1
  L23_1 = 30
  L24_1 = "MarkerRecord_OneDrive"
  L20_1, L21_1, L22_1 = L20_1(L21_1, L22_1, L23_1, L24_1)
  if L20_1 and not L21_1 then
    L17_1.AnomalyTableName = "Appomaly_ChildProcDir"
    L23_1 = GetProcessNameScore
    L24_1 = L2_1
    L23_1 = L23_1(L24_1)
    L17_1.ProcNameWeight = L23_1
    L17_1.AnomalyTableInfo = L22_1
    L17_1.Key = L18_1
    L23_1 = bm
    L23_1 = L23_1.trigger_sig
    L24_1 = "PFAppChildProcDir"
    L25_1 = safeJsonSerialize
    L26_1 = L17_1
    L25_1, L26_1 = L25_1(L26_1)
    L23_1(L24_1, L25_1, L26_1)
  end
end
if L14_1 then
  L20_1 = mp
  L20_1 = L20_1.INFECTED
  return L20_1
end
L20_1 = mp
L20_1 = L20_1.CLEAN
return L20_1
