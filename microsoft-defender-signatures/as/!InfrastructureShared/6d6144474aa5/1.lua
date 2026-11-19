-- Threat: !InfrastructureShared
-- Name: 6d6144474aa5
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == mp.HSTR_CALLER_SMS then
  return mp.INFECTED
end
return mp.CLEAN
