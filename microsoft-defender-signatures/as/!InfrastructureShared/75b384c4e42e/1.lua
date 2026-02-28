local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L0_1 = L1_1.ppid
  end
end
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = MpCommon
  L3_1 = L3_1.PathToWin32Path
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
end
if L2_1 == nil or L0_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "microsoft\\onedrive\\"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L4_1 = L2_1
  L3_1 = L2_1.find
  L5_1 = "windows\\ccm"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    goto lbl_49
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_49::
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "windows\\fortiemsinstaller"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsDetectionThresholdMet
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = TrackPidAndTechniqueBM
  L4_1 = L0_1
  L5_1 = "T1053.005"
  L6_1 = "tt_remediate_cantidate"
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
