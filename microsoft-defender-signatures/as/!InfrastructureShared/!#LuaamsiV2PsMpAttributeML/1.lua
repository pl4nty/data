local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_mpattributevalue
L1_1 = "RPF:AMSI2:ML:Ps"
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = {}
  L2_1 = 98
  L3_1 = 95
  L4_1 = 90
  L5_1 = 80
  L6_1 = 70
  L7_1 = 60
  L8_1 = 50
  L9_1 = 40
  L10_1 = 30
  L11_1 = 20
  L1_1[1] = L2_1
  L1_1[2] = L3_1
  L1_1[3] = L4_1
  L1_1[4] = L5_1
  L1_1[5] = L6_1
  L1_1[6] = L7_1
  L1_1[7] = L8_1
  L1_1[8] = L9_1
  L1_1[9] = L10_1
  L1_1[10] = L11_1
  L2_1 = SetAttributeFromClassifierScoresEx
  L3_1 = L0_1
  L4_1 = L1_1
  L5_1 = "RPF:AMSI2:ML:Ps:"
  L2_1(L3_1, L4_1, L5_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
