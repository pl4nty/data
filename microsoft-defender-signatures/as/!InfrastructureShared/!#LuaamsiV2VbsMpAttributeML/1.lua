-- Threat: !InfrastructureShared
-- Name: !#Lua:amsiV2VbsMpAttributeML
-- Type: 24
-- Includes: SetAttributeFromClassifierScoresEx
-- MpAttributes: RPF:AMSI2:ML:Vbs

local l_0_0 = mp.get_mpattributevalue("RPF:AMSI2:ML:Vbs")
if l_0_0 ~= nil then
  local l_0_1 = {
    98,
    95,
    90,
    80,
    70,
    60,
    50,
    40,
    30,
    20
  }
  SetAttributeFromClassifierScoresEx(l_0_0, l_0_1, "RPF:AMSI2:ML:Vbs:")
end
return mp.CLEAN
