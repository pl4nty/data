local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = bm_AddRelatedFileFromCommandLine
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p2
    L2_1 = nil
    L3_1 = nil
    L4_1 = 1
    L0_1(L1_1, L2_1, L3_1, L4_1)
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
