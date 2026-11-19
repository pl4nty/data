-- Threat: !InfrastructureShared
-- Name: 6d7827c0148f
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
return mp.INFECTED
