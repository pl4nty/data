-- Threat: !InfrastructureShared
-- Name: 199610f3866dd
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 ~= nil and l_0_0 == mp.HSTR_CALLER_SMS then
  return mp.INFECTED
end
return mp.LOWFI
