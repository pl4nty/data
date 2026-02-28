local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = IsTechniqueObservedForParents
L2_1 = L0_1
L3_1 = "T1047"
L4_1 = 2
L1_1 = L1_1(L2_1, L3_1, L4_1)
if not L1_1 then
  L1_1 = IsTechniqueObservedForParents
  L2_1 = L0_1
  L3_1 = "T1021.006"
  L4_1 = 2
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  if not L1_1 then
    goto lbl_28
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_28::
L1_1 = mp
L1_1 = L1_1.LOWFI
return L1_1
