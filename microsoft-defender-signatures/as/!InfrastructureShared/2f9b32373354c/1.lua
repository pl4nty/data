local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[4]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[4]
    L0_1 = L0_1.utf8p1
    L2_1 = L0_1
    L1_1 = L0_1.match
    L3_1 = "filepath:(.*)"
    L1_1 = L1_1(L2_1, L3_1)
    L0_1 = L1_1
    L1_1 = {}
    L1_1[".dll"] = true
    L1_1[".ocx"] = true
    L2_1 = bm_AddRelatedFileFromCommandLine
    L3_1 = L0_1
    L4_1 = L1_1
    L5_1 = nil
    L6_1 = 6
    L2_1(L3_1, L4_1, L5_1, L6_1)
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
