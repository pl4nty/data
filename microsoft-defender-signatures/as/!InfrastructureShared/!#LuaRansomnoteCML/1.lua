local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_mpattributevalue
L1_1 = "RPF:RansomnoteCML:Probability"
L0_1 = L0_1(L1_1)
if L0_1 ~= nil and 80 <= L0_1 and L0_1 <= 100 then
  L1_1 = {}
  L2_1 = 99
  L3_1 = 95
  L4_1 = 90
  L5_1 = 80
  L1_1[1] = L2_1
  L1_1[2] = L3_1
  L1_1[3] = L4_1
  L1_1[4] = L5_1
  L2_1 = SetAttributeFromClassifierScoresEx
  L3_1 = L0_1
  L4_1 = L1_1
  L5_1 = "Lua:RansomnoteCML:"
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:RansomnoteCMLHigh"
  L2_1(L3_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
