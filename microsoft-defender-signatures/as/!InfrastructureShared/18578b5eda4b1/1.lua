-- Threat: !InfrastructureShared
-- Name: 18578b5eda4b1
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
