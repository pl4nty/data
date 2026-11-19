-- Threat: !InfrastructureShared
-- Name: 12a7860f75575
-- Type: 21
-- Includes: HstrLuaLib

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 ~= nil and mp.HSTR_CALLER_SMS == l_0_0 then
  reportDetectedRegions()
  return mp.INFECTED
end
return mp.LOWFI
