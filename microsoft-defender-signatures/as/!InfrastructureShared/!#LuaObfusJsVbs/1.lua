local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_mpattributevalue
L1_1 = "RPF:ObfusJsVbs:Probability"
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.set_mpattribute
L2_1 = "Lua:ObfusJsVbsML:"
L3_1 = L0_1
L2_1 = L2_1 .. L3_1
L1_1(L2_1)
if L0_1 ~= nil and 70 <= L0_1 and L0_1 <= 100 then
  L1_1 = {}
  L2_1 = 99
  L3_1 = 95
  L4_1 = 90
  L5_1 = 80
  L6_1 = 70
  L7_1 = 60
  L8_1 = 50
  L9_1 = 40
  L1_1[1] = L2_1
  L1_1[2] = L3_1
  L1_1[3] = L4_1
  L1_1[4] = L5_1
  L1_1[5] = L6_1
  L1_1[6] = L7_1
  L1_1[7] = L8_1
  L1_1[8] = L9_1
  L2_1 = SetAttributeFromClassifierScoresEx
  L3_1 = L0_1
  L4_1 = L1_1
  L5_1 = "Lua:ObfusJsVbsML1:"
  L2_1(L3_1, L4_1, L5_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
