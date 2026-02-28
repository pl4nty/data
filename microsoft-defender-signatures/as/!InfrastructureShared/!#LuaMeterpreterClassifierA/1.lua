local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_mpattributevalue
L1_1 = "RPF:MeterpreterClassifierA"
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = {}
  L1_1["Lua:MeterpreterClassifierA:95"] = 95
  L1_1["Lua:MeterpreterClassifierA:90"] = 90
  L1_1["Lua:MeterpreterClassifierA:80"] = 80
  L1_1["Lua:MeterpreterClassifierA:70"] = 70
  L1_1["Lua:MeterpreterClassifierA:60"] = 60
  L2_1 = SetAttributeFromClassifierScores
  L3_1 = L0_1
  L4_1 = L1_1
  L2_1(L3_1, L4_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
