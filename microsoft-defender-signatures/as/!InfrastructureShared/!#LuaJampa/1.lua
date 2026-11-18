-- Threat: !InfrastructureShared
-- Name: !#Lua:Jampa
-- Type: 24
-- Includes: SetAttributeFromClassifierScoresEx
-- MpAttributes: RPF:Jampa:Probability & !SCPT:Nemucod_exclusion

local l_0_0 = mp.get_mpattributevalue("RPF:Jampa:Probability")
if l_0_0 ~= nil and 70 <= l_0_0 and l_0_0 <= 100 then
  local l_0_1 = {
    99,
    95,
    90,
    80,
    70
  }
  SetAttributeFromClassifierScoresEx(l_0_0, l_0_1, "Lua:Jampa:")
end
return mp.CLEAN
