local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = L0_1.ppid
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = L0_1.ppid
L2_1 = IsTacticObservedForPid
L3_1 = L1_1
L4_1 = "schtask_target"
L5_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1)
if not L2_1 then
  L2_1 = IsTacticObservedForParents
  L3_1 = L1_1
  L4_1 = "schtask_target"
  L5_1 = 3
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if not L2_1 then
    goto lbl_40
  end
end
L2_1 = bm_AddRelatedFileFromCommandLine
L3_1 = "BM"
L4_1 = nil
L5_1 = nil
L6_1 = 2
L2_1(L3_1, L4_1, L5_1, L6_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
do return L2_1 end
::lbl_40::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
