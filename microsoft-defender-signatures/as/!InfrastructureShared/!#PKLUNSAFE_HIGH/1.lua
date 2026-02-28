local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "PKL_HIGH:"
L0_1 = L0_1(L1_1)
L0_1 = #L0_1
if 1 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
