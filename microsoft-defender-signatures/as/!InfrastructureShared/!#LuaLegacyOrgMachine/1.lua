local L0_1, L1_1
L0_1 = IsLegacyOrgMachine
L0_1 = L0_1()
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "Lua:TTExclusion"
  L0_1(L1_1)
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "Lua:IsNotLegacyOrgMachine"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
