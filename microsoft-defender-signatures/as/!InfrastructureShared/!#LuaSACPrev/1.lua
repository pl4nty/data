local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.get_mpattributevalue
L1_1 = "RPF:SACPrev:ML:prob:Malware"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = SetAttributeFromClassifierScoresEx
  L2_1 = L0_1
  L3_1 = {}
  L4_1 = 99
  L5_1 = 95
  L6_1 = 90
  L7_1 = 80
  L8_1 = 70
  L9_1 = 30
  L10_1 = 20
  L11_1 = 10
  L12_1 = 5
  L13_1 = 0
  L3_1[1] = L4_1
  L3_1[2] = L5_1
  L3_1[3] = L6_1
  L3_1[4] = L7_1
  L3_1[5] = L8_1
  L3_1[6] = L9_1
  L3_1[7] = L10_1
  L3_1[8] = L11_1
  L3_1[9] = L12_1
  L3_1[10] = L13_1
  L4_1 = "Lua:SACPrev:Malware:"
  L1_1(L2_1, L3_1, L4_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
