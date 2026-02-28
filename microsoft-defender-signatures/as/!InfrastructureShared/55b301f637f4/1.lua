local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
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
    goto lbl_39
  end
end
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\program files"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1555.004"
L4_1 = "credentialaccess"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_39::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
