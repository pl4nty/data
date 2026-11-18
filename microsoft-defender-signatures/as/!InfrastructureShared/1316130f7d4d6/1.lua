-- Threat: !InfrastructureShared
-- Name: 1316130f7d4d6
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
