-- Threat: !InfrastructureShared
-- Name: !#Lua:pyAmsiBehaviorML
-- Type: 24
-- Includes: SetAttributeFromClassifierScoresEx
-- MpAttributes: RPF:PyAMSI:Behavior:ML

local l_0_0 = mp.get_mpattributevalue("RPF:PyAMSI:Behavior:ML")
if l_0_0 ~= nil then
  local l_0_1 = {
    99,
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
  SetAttributeFromClassifierScoresEx(l_0_0, l_0_1, "Lua:PyAMSI:Behavior:ML:")
end
return mp.CLEAN
