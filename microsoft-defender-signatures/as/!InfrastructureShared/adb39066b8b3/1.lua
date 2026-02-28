local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
  end
end
L1_1 = {}
L1_1[".one"] = true
L2_1 = bm_AddRelatedFileFromCommandLine
L3_1 = L0_1
L4_1 = L1_1
L5_1 = nil
L6_1 = 1
L2_1(L3_1, L4_1, L5_1, L6_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
