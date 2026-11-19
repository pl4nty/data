-- Threat: !InfrastructureShared
-- Name: !#Lua:ObfusJsVbs
-- Type: 24
-- Includes: SetAttributeFromClassifierScoresEx
-- MpAttributes: RPF:ObfusJsVbs:Probability

local l_0_0 = mp.get_mpattributevalue("RPF:ObfusJsVbs:Probability")
mp.set_mpattribute("Lua:ObfusJsVbsML:" .. l_0_0)
if l_0_0 ~= nil and 70 <= l_0_0 and l_0_0 <= 100 then
  local l_0_1 = {
    99,
    95,
    90,
    80,
    70,
    60,
    50,
    40
  }
  SetAttributeFromClassifierScoresEx(l_0_0, l_0_1, "Lua:ObfusJsVbsML1:")
end
return mp.CLEAN
