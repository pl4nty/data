-- Threat: !InfrastructureShared
-- Name: 30787cdf44d8
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
return mp.INFECTED
