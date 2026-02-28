local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = pcall
L1_1 = bm
L1_1 = L1_1.GetMemQueryCount
L1_1, L2_1, L3_1, L4_1 = L1_1()
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L1_1 ~= nil and 0 < L1_1 then
  L2_1 = AddResearchData
  L3_1 = "BM"
  L4_1 = true
  L2_1(L3_1, L4_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
