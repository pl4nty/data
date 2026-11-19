-- Threat: !InfrastructureShared
-- Name: !#Lua:GenPeClassifier
-- Type: 11
-- Includes: SetAttributeFromClassifierScoresEx
-- MpAttributes: RPF:PEClassifier:Probability

local l_0_0 = mp.get_mpattributevalue("RPF:PEClassifier:Probability")
if l_0_0 ~= nil and 80 <= l_0_0 and l_0_0 <= 100 then
  local l_0_1 = {
    99,
    95,
    90,
    80
  }
  SetAttributeFromClassifierScoresEx(l_0_0, l_0_1, "Lua:GenPeClassifier:")
end
return mp.CLEAN
