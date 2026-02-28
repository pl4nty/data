local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = "SearchHijackIgfxtray"
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.utf8p1
L2_1 = this_sigattrlog
L2_1 = L2_1[6]
L2_1 = L2_1.utf8p1
L3_1 = isnull
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_21
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_21::
L3_1 = mp
L3_1 = L3_1.ContextualExpandEnvironmentVariables
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = L1_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = ""
end
L3_1 = L3_1(L4_1)
L1_1 = L3_1
L3_1 = mp
L3_1 = L3_1.ContextualExpandEnvironmentVariables
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = L2_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = ""
end
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = isnull
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_56
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_56::
L3_1 = string
L3_1 = L3_1.match
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L1_1
L4_1 = L4_1(L5_1)
L5_1 = "(.+)\\igfxtray.exe"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = string
L4_1 = L4_1.match
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L2_1
L5_1 = L5_1(L6_1)
L6_1 = "(.+)\\hccutils.dll"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = isnull
L6_1 = L3_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = isnull
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if not L5_1 and L3_1 == L4_1 then
    goto lbl_87
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_87::
L5_1 = bm
L5_1 = L5_1.add_threat_file
L6_1 = L2_1
L5_1(L6_1)
L5_1 = bm
L5_1 = L5_1.add_related_string
L6_1 = L0_1
L7_1 = safeJsonSerialize
L8_1 = {}
L8_1.Process = L1_1
L8_1.Module = L2_1
L7_1 = L7_1(L8_1)
L8_1 = bm
L8_1 = L8_1.RelatedStringBMReport
L5_1(L6_1, L7_1, L8_1)
L5_1 = bm
L5_1 = L5_1.get_current_process_startup_info
L5_1 = L5_1()
if L5_1 then
  L6_1 = L5_1.ppid
  if L6_1 then
    L6_1 = TrackPidAndTechniqueBM
    L7_1 = L5_1.ppid
    L8_1 = "T1574.001"
    L9_1 = "evasion_searchhijack_igfxtray"
    L6_1(L7_1, L8_1, L9_1)
  end
end
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
