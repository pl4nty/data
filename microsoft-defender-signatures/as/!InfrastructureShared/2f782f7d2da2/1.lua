-- Threat: !InfrastructureShared
-- Name: 2f782f7d2da2
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
return mp.INFECTED
