local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.command_line
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_26
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_26::
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[6]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[6]
  L3_1 = L4_1.utf8p1
end
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = nil
L5_1 = this_sigattrlog
L5_1 = L5_1[7]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[7]
  L4_1 = L5_1.utf8p2
end
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = L3_1
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = MpCommon
L5_1 = L5_1.GetCurrentTimeT
L5_1 = L5_1()
L6_1 = sysio
L6_1 = L6_1.GetFileLastWriteTime
L7_1 = L3_1
L6_1 = L6_1(L7_1)
L7_1 = sysio
L7_1 = L7_1.GetLastResult
L7_1 = L7_1()
L7_1 = L7_1.Success
if L7_1 and L6_1 and L6_1 ~= 0 then
  L7_1 = L6_1 / 10000000
  L6_1 = L7_1 - 11644473600
end
L7_1 = L5_1 - L6_1
if L7_1 <= 0 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = L7_1 / 3600
if 4 < L8_1 then
  L9_1 = TrackPidAndTechniqueBM
  L10_1 = "BM"
  L11_1 = "T1070"
  L12_1 = "DefenseEvasion_IndicatorRemoval_GetFileLastWriteTime"
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
