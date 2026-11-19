-- Threat: !InfrastructureShared
-- Name: 7d78c868fa07
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0 == mp.HSTR_CALLER_SMS then
  return mp.INFECTED
end
return mp.CLEAN
