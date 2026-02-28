local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattributesubstring
L1_1 = "MHSTR:XL4:Expert:Feature"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
