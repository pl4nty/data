local L0_1, L1_1, L2_1, L3_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
    L1_1 = bm_AddRelatedFileFromCommandLine
    L2_1 = L0_1
    L3_1 = nil
    L1_1(L2_1, L3_1)
    L1_1 = AddResearchData
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.ppid
    L3_1 = true
    L1_1(L2_1, L3_1)
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
