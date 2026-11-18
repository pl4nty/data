-- Threat: !InfrastructureShared
-- Name: !#Lua:SACPrev
-- Type: 24
-- Includes: SetAttributeFromClassifierScoresEx
-- MpAttributes: RPF:SACPrev:ML:prob:Malware

local l_0_0 = mp.get_mpattributevalue("RPF:SACPrev:ML:prob:Malware")
if l_0_0 then
  SetAttributeFromClassifierScoresEx(l_0_0, {
    99,
    95,
    90,
    80,
    70,
    30,
    20,
    10,
    5,
    0
  }, "Lua:SACPrev:Malware:")
end
return mp.CLEAN
