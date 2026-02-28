local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = string
  L0_1 = L0_1.lower
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  L0_1 = L0_1(L1_1)
  L1_1 = bm_AddRelatedFileFromCommandLine
  L2_1 = L0_1
  L3_1 = nil
  L4_1 = nil
  L5_1 = 1
  L1_1(L2_1, L3_1, L4_1, L5_1)
end
L0_1 = pcall
L1_1 = reportBmInfo
L0_1, L1_1 = L0_1(L1_1)
if not L0_1 and L1_1 then
  L2_1 = bm
  L2_1 = L2_1.add_related_string
  L3_1 = "bmInfoFailReason"
  L4_1 = tostring
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  L5_1 = bm
  L5_1 = L5_1.RelatedStringBMReport
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = add_parents
L2_1()
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
