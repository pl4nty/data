local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.utf8p2
  if L0_1 ~= nil then
    L1_1 = bm_AddRelatedFileFromCommandLine
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L2_1 = ipairs
    L3_1 = L1_1
    L2_1, L3_1, L4_1 = L2_1(L3_1)
    for L5_1, L6_1 in L2_1, L3_1, L4_1 do
      L7_1 = mp
      L7_1 = L7_1.IsKnownFriendlyFile
      L8_1 = L6_1
      L9_1 = false
      L10_1 = false
      L7_1 = L7_1(L8_1, L9_1, L10_1)
      if L7_1 == false then
        L7_1 = mp
        L7_1 = L7_1.INFECTED
        return L7_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
