-- Threat: !InfrastructureShared
-- Name: 18578f2ea26f9
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
