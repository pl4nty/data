local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = MpCommon
L0_1 = L0_1.PathToWin32Path
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.utf8p1
if not L1_1 then
  L1_1 = ""
end
L0_1 = L0_1(L1_1)
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
if not L2_1 then
  L2_1 = ""
end
L1_1 = L1_1(L2_1)
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
L3_1 = isnull
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = isnull
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      L3_1 = isnull
      L4_1 = L2_1.ppid
      L3_1 = L3_1(L4_1)
      if not L3_1 then
        goto lbl_45
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_45::
L3_1 = mp
L3_1 = L3_1.ContextualExpandEnvironmentVariables
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L1_1 = L3_1
L3_1 = isnull
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.IsKnownFriendlyFile
L4_1 = L1_1
L5_1 = false
L6_1 = true
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.IsKnownFriendlyFile
L4_1 = L1_1
L5_1 = false
L6_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 == nil or L3_1 == true then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.GetCurrentTimeT
L4_1 = L4_1()
if not L4_1 then
  L4_1 = 0
end
L5_1 = sysio
L5_1 = L5_1.GetFileLastWriteTime
L6_1 = L1_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = 0
end
if L4_1 ~= 0 and L5_1 ~= 0 then
  L6_1 = L5_1 / 10000000
  L6_1 = L4_1 - L6_1
  L6_1 = L6_1 - 11644473600
  if not (3600 < L6_1) then
    goto lbl_102
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_102::
L6_1 = sysio
L6_1 = L6_1.GetFileAttributes
L7_1 = L1_1
L6_1 = L6_1(L7_1)
L7_1 = L6_1 ~= 4294967295
L8_1 = bm
L8_1 = L8_1.add_related_file
L9_1 = L0_1
L8_1(L9_1)
L8_1 = bm
L8_1 = L8_1.add_related_string
L9_1 = "Keylog_Metadata"
L10_1 = safeJsonSerialize
L11_1 = {}
L11_1.ProcPath = L1_1
L11_1.Log = L0_1
L11_1.ProcHidden = L7_1
L11_1.ProcFileTime = L5_1
if L3_1 then
  L12_1 = "yes"
  if L12_1 then
    goto lbl_136
  end
end
L12_1 = "no"
::lbl_136::
L11_1.Friend = L12_1
L10_1 = L10_1(L11_1)
L11_1 = bm
L11_1 = L11_1.RelatedStringBMReport
L8_1(L9_1, L10_1, L11_1)
L8_1 = TrackPidAndTechniqueBM
L9_1 = L2_1.ppid
L10_1 = "T1056.001"
L11_1 = "collect_keylog"
L8_1(L9_1, L10_1, L11_1)
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
