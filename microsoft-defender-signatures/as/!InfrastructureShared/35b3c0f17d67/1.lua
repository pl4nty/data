local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "5beb7efe-fd9a-4556-801d-275e5ffc04cc"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.IsHipsRuleEnabled
  L1_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    goto lbl_34
  end
end
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L1_1 = bm_AddRelatedFileFromCommandLine
    L2_1 = L0_1.command_line
    L3_1 = nil
    L4_1 = nil
    L5_1 = 1
    L1_1(L2_1, L3_1, L4_1, L5_1)
    L1_1 = TrackPidAndTechniqueBM
    L2_1 = "BM"
    L3_1 = "T1561.002"
    L4_1 = "folderguard_blk_hips"
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
::lbl_34::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
