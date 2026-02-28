local L0_1, L1_1, L2_1
L0_1 = IsLegacyOrgMachine
L0_1 = L0_1()
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = AddResearchData
L1_1 = "BM"
L2_1 = true
L0_1(L1_1, L2_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
