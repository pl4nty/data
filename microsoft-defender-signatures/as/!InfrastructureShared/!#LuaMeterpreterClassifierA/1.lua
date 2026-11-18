-- Threat: !InfrastructureShared
-- Name: !#Lua:MeterpreterClassifierA
-- Type: 11
-- Includes: SetAttributeFromClassifierScores
-- MpAttributes: RPF:MeterpreterClassifierA

local l_0_0 = mp.get_mpattributevalue("RPF:MeterpreterClassifierA")
if l_0_0 ~= nil then
  local l_0_1 = {
    ["Lua:MeterpreterClassifierA:95"] = 95,
    ["Lua:MeterpreterClassifierA:90"] = 90,
    ["Lua:MeterpreterClassifierA:80"] = 80,
    ["Lua:MeterpreterClassifierA:70"] = 70,
    ["Lua:MeterpreterClassifierA:60"] = 60
  }
  SetAttributeFromClassifierScores(l_0_0, l_0_1)
end
return mp.CLEAN
