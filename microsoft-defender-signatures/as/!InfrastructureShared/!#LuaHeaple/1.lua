-- Threat: !InfrastructureShared
-- Name: !#Lua:Heaple
-- Type: 11
-- Includes: SetAttributeFromClassifierScoresEx
-- MpAttributes: RPF:MsilMetadataClassifier.Probability & !MsilMetadataClassifierException

local l_0_0 = mp.get_mpattributevalue("RPF:MsilMetadataClassifier.Probability")
if l_0_0 ~= nil and 50 <= l_0_0 and l_0_0 <= 100 then
  local l_0_1 = {
    99,
    95,
    90,
    80,
    70,
    60,
    50
  }
  SetAttributeFromClassifierScoresEx(l_0_0, l_0_1, "Lua:Heaple:")
end
return mp.CLEAN
