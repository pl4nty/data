local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = IsLegacyOrgMachine
L0_1 = L0_1()
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm_AddRelatedFileFromCommandLine
L1_1 = "BM"
L2_1 = nil
L3_1 = nil
L4_1 = 6
L0_1(L1_1, L2_1, L3_1, L4_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
