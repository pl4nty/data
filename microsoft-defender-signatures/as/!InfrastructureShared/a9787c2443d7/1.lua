-- Threat: !InfrastructureShared
-- Name: a9787c2443d7
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
return mp.INFECTED
