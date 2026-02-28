local L0_1, L1_1, L2_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p2
  L1_1 = bm_AddRelatedFileFromCommandLine
  L2_1 = L0_1
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
