local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[10]
  L1_1 = L1_1.matched
  if not L1_1 then
    goto lbl_13
  end
end
L0_1 = "WebLogic"
goto lbl_118
::lbl_13::
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[11]
  L1_1 = L1_1.matched
  if not L1_1 then
    goto lbl_25
  end
end
L0_1 = "SysAid"
goto lbl_118
::lbl_25::
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[11]
  L1_1 = L1_1.matched
  if not L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.matched
    if not L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[12]
      L1_1 = L1_1.matched
      if not L1_1 then
        goto lbl_47
      end
    end
  end
end
L0_1 = "SysAidServer"
goto lbl_118
::lbl_47::
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[13]
  L1_1 = L1_1.matched
  if not L1_1 then
    goto lbl_59
  end
end
L0_1 = "CrushFTP"
goto lbl_118
::lbl_59::
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[14]
  L1_1 = L1_1.matched
  if not L1_1 then
    goto lbl_71
  end
end
L0_1 = "FortiSSLVPN"
goto lbl_118
::lbl_71::
L1_1 = this_sigattrlog
L1_1 = L1_1[6]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[15]
  L1_1 = L1_1.matched
  if not L1_1 then
    goto lbl_83
  end
end
L0_1 = "Veeam"
goto lbl_118
::lbl_83::
L1_1 = this_sigattrlog
L1_1 = L1_1[7]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[16]
  L1_1 = L1_1.matched
  if not L1_1 then
    goto lbl_95
  end
end
L0_1 = "GoAnywhere"
goto lbl_118
::lbl_95::
L1_1 = this_sigattrlog
L1_1 = L1_1[8]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[17]
  L1_1 = L1_1.matched
  if not L1_1 then
    goto lbl_107
  end
end
L0_1 = "Fortinet"
goto lbl_118
::lbl_107::
L1_1 = this_sigattrlog
L1_1 = L1_1[9]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[18]
  L1_1 = L1_1.matched
  if not L1_1 then
    goto lbl_118
  end
end
L0_1 = "Citrix"
::lbl_118::
L1_1 = isEnabledApp
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = L1_1.ppid
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1.ppid
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "([^\\]+)$"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = bm
L5_1 = L5_1.get_process_relationships
L5_1, L6_1 = L5_1()
if L5_1 then
  L7_1 = ipairs
  L8_1 = L5_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = L11_1.ppid
    if L12_1 then
      L12_1 = L11_1.image_path
      if L12_1 then
        L12_1 = string
        L12_1 = L12_1.lower
        L13_1 = L11_1.image_path
        L12_1 = L12_1(L13_1)
        L13_1 = MpCommon
        L13_1 = L13_1.StringRegExpSearch
        L14_1 = "\\\\(wlserver|sysaid|crushftpservice|fortisslvpndaemon|veeam|outlook|goanywhere|fortinet)"
        L15_1 = L12_1
        L13_1 = L13_1(L14_1, L15_1)
        if L13_1 then
          L2_1 = L11_1.ppid
          break
        end
      end
    end
  end
end
L7_1 = L1_1.ppid
if L2_1 == L7_1 then
  L7_1 = MpCommon
  L7_1 = L7_1.StringRegExpSearch
  L8_1 = "\\\\(wlserver|sysaid|crushftpservice|fortisslvpndaemon|veeam|outlook|goanywhere|fortinet)"
  L9_1 = L3_1
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L7_1 = startTrackingApp
L8_1 = L2_1
L9_1 = L0_1
L10_1 = "programfiles_targeted"
L11_1 = "PFAppTracked"
L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if not L7_1 then
  L9_1 = bm
  L9_1 = L9_1.trigger_sig
  L10_1 = "ProcAttribError"
  L11_1 = safeJsonSerialize
  L12_1 = L8_1
  L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L11_1(L12_1)
  L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
else
  L9_1 = L8_1.IsNewApp
  if L9_1 then
    L8_1.SignatureName = "Bm/PFA_Parent.B"
    L9_1 = bm
    L9_1 = L9_1.trigger_sig
    L10_1 = "SetProcessAttrib"
    L11_1 = safeJsonSerialize
    L12_1 = L8_1
    L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L11_1(L12_1)
    L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
  end
end
L9_1 = nil
L10_1 = mp
L10_1 = L10_1.GetParentProcInfo
L10_1 = L10_1()
if L10_1 then
  L11_1 = L10_1.image_path
  if L11_1 then
    L11_1 = L10_1.image_path
    L12_1 = L11_1
    L11_1 = L11_1.match
    L13_1 = "([^\\]+)$"
    L11_1 = L11_1(L12_1, L13_1)
    L9_1 = L11_1
  end
end
if not L9_1 then
  L9_1 = "None"
end
L11_1 = {}
L11_1.ProcessName = L4_1
L11_1.ParentName = L9_1
L11_1.Source = "BM"
L11_1.SignatureName = "Bm/PFA_Parent.B"
L11_1.AttributeName = "PFAppTracked"
L11_1.AttributeCategory = "programfiles_targeted"
L11_1.ParentName = L9_1
L11_1.TrackedProcess = L0_1
L12_1 = mp
L12_1 = L12_1.GetProcessCommandLine
L13_1 = L1_1.ppid
L12_1 = L12_1(L13_1)
L13_1 = CommandLineGrader
L14_1 = L12_1
L13_1, L14_1 = L13_1(L14_1)
L11_1.CommandlineScoreIndicator = L14_1
L11_1.CommandlineScore = L13_1
L15_1 = L9_1
L16_1 = "_"
L17_1 = L4_1
L15_1 = L15_1 .. L16_1 .. L17_1
L16_1 = IsPotentiallyClean
L17_1 = "CleanProcessChain"
L18_1 = L0_1
L19_1 = L4_1
L16_1 = L16_1(L17_1, L18_1, L19_1)
if not L16_1 then
  L16_1 = IsPotentiallyClean
  L17_1 = "CleanProcessChain_ParentChild"
  L18_1 = L0_1
  L19_1 = L15_1
  L16_1 = L16_1(L17_1, L18_1, L19_1)
  if L16_1 then
    L16_1 = AnomalyTableCheck
    L17_1 = "Appomaly_ChildProcName"
    L18_1 = L15_1
    L19_1 = 20
    L20_1 = "MarkerRecord_"
    L21_1 = L0_1
    L20_1 = L20_1 .. L21_1
    L16_1, L17_1, L18_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
    if L16_1 and not L17_1 then
      L19_1 = GetProcessNameScore
      L20_1 = L4_1
      L19_1 = L19_1(L20_1)
      L11_1.ProcNameWeight = L19_1
      L11_1.AnomalyTableName = "Appomaly_ChildProcName"
      L11_1.AnomalyTableInfo = L18_1
      L19_1 = bm
      L19_1 = L19_1.trigger_sig
      L20_1 = "PFAppChildProc_D"
      L21_1 = safeJsonSerialize
      L22_1 = L11_1
      L21_1, L22_1 = L21_1(L22_1)
      L19_1(L20_1, L21_1, L22_1)
    end
  end
end
L16_1 = bm
L16_1 = L16_1.trigger_sig
L17_1 = "AnomalousChildCommandline"
L18_1 = safeJsonSerialize
L19_1 = L11_1
L18_1, L19_1, L20_1, L21_1, L22_1 = L18_1(L19_1)
L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
L16_1 = L1_1.integrity_level
if L16_1 then
  L16_1 = IsPotentiallyClean
  L17_1 = "CleanProcessChainPriv"
  L18_1 = L0_1
  L19_1 = L1_1.integrity_level
  L16_1 = L16_1(L17_1, L18_1, L19_1)
  if not L16_1 then
    L16_1 = L9_1
    L17_1 = "_"
    L18_1 = L4_1
    L19_1 = "_"
    L20_1 = L1_1.integrity_level
    L15_1 = L16_1 .. L17_1 .. L18_1 .. L19_1 .. L20_1
    L16_1 = AnomalyTableCheck
    L17_1 = "Appomaly_ChildProcPriv"
    L18_1 = L15_1
    L19_1 = 20
    L20_1 = "MarkerRecord_"
    L21_1 = L0_1
    L20_1 = L20_1 .. L21_1
    L16_1, L17_1, L18_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
    if L16_1 and not L17_1 then
      L11_1.AnomalyTableInfo = L18_1
      L11_1.AnomalyTableName = "Appomaly_ChildProcPriv"
      L11_1.Key = L15_1
      L19_1 = bm
      L19_1 = L19_1.trigger_sig
      L20_1 = "AnomalousChildPriv"
      L21_1 = safeJsonSerialize
      L22_1 = L11_1
      L21_1, L22_1 = L21_1(L22_1)
      L19_1(L20_1, L21_1, L22_1)
    end
  end
end
L16_1 = mp
L16_1 = L16_1.CLEAN
return L16_1
