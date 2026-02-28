local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= "" then
      goto lbl_44
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_44::
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.utf8p1
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "/%.[^/]+$"
L7_1 = 1
L8_1 = false
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= nil then
  L4_1 = SuspMacPathsToMonitor
  L5_1 = L3_1
  L6_1 = true
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = TrackPidAndTechniqueBM
    L5_1 = "BM"
    L6_1 = "T1573.002"
    L7_1 = "CommandAndControl_EncryptedChannel_AsymmetricCryptography"
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
