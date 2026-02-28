local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.IsHipsRuleEnabled
  L1_1 = "9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = IsDetectionThresholdMet
    L1_1 = "BM"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      goto lbl_26
    end
  end
end
L0_1 = bm_AddRelatedFileFromCommandLine
L1_1 = "bm"
L2_1 = nil
L3_1 = nil
L4_1 = 1
L0_1(L1_1, L2_1, L3_1, L4_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_26::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
