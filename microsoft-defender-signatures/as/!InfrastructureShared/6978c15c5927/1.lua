-- Threat: !InfrastructureShared
-- Name: 6978c15c5927
-- Type: 21
-- Includes: HstrLuaLib

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.LOWFI
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  reportDetectedRegions()
  return mp.INFECTED
end
return mp.LOWFI
