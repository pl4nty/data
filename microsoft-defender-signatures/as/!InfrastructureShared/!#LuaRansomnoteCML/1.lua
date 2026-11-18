-- Threat: !InfrastructureShared
-- Name: !#Lua:RansomnoteCML
-- Type: 24
-- Includes: SetAttributeFromClassifierScoresEx
-- MpAttributes: RPF:RansomnoteCML:Probability

local l_0_0 = mp.get_mpattributevalue("RPF:RansomnoteCML:Probability")
if l_0_0 ~= nil and 80 <= l_0_0 and l_0_0 <= 100 then
  local l_0_1 = {
    99,
    95,
    90,
    80
  }
  SetAttributeFromClassifierScoresEx(l_0_0, l_0_1, "Lua:RansomnoteCML:")
  mp.set_mpattribute("Lua:RansomnoteCMLHigh")
end
return mp.CLEAN
