-- Threat: !InfrastructureShared
-- Name: 185780d1d45d9
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
