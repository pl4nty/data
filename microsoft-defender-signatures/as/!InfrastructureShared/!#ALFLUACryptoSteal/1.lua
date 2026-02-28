local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = 0
L1_1 = "//SCPT:HTML/DoubleCryptoFraudKey"
L2_1 = 1
L3_1 = 30
L4_1 = 1
for L5_1 = L2_1, L3_1, L4_1 do
  L6_1 = L1_1
  L7_1 = L5_1
  L6_1 = L6_1 .. L7_1
  L7_1 = mp
  L7_1 = L7_1.get_mpattribute
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if L7_1 then
    L0_1 = L0_1 + 1
  end
end
if 1 < L0_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
