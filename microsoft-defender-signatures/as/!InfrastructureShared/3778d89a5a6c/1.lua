-- Threat: !InfrastructureShared
-- Name: 3778d89a5a6c
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
return mp.INFECTED
