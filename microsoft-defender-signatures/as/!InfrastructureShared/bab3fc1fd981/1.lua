local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = IsTacticObservedForPid
L1_1 = "BM"
L2_1 = "schtask_target"
L3_1 = true
L0_1 = L0_1(L1_1, L2_1, L3_1)
if not L0_1 then
  L0_1 = IsTacticObservedForParents
  L1_1 = "BM"
  L2_1 = "schtask_target"
  L3_1 = 3
  L0_1 = L0_1(L1_1, L2_1, L3_1)
  if not L0_1 then
    goto lbl_23
  end
end
L0_1 = bm_AddRelatedFileFromCommandLine
L1_1 = "BM"
L2_1 = nil
L3_1 = nil
L4_1 = 2
L0_1(L1_1, L2_1, L3_1, L4_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_23::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
