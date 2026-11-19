-- Threat: !InfrastructureShared
-- Name: 1aa78307d24ef
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 ~= nil and mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
