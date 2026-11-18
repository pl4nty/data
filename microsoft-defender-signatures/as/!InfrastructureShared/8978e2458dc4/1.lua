-- Threat: !InfrastructureShared
-- Name: 8978e2458dc4
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
return mp.INFECTED
