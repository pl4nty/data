-- Threat: !InfrastructureShared
-- Name: !#Lua:Tobeet
-- Type: 11
-- Includes: SetAttributeFromClassifierScoresEx
-- MpAttributes: RPF:Tobeet:Probability & !pea_isdll & !PEPCODE:HasDigitalSignature

local l_0_0 = mp.get_mpattributevalue("RPF:Tobeet:Probability")
if l_0_0 ~= nil and 50 <= l_0_0 and l_0_0 <= 100 and 70 <= l_0_0 then
  local l_0_1 = {
    99,
    95,
    90,
    80,
    70
  }
  SetAttributeFromClassifierScoresEx(l_0_0, l_0_1, "Lua:Tobeet:")
end
return mp.CLEAN
