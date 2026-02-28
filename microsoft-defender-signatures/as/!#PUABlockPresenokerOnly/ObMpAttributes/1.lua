local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "PUA:ML:Block"
L0_1 = L0_1(L1_1)
L1_1 = #L0_1
if 0 < L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.enum_mpattributesubstring
L2_1 = "PUA:Block:"
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = #L0_1
if L1_1 == 0 or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = ipairs
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  if L5_1 ~= "PUA:Block:Presenoker" then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
