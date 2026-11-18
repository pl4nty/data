-- Threat: !InfrastructureShared
-- Name: 4678b87c35a9
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
return mp.INFECTED
