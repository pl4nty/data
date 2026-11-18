-- Threat: !InfrastructureShared
-- Name: 2478ba4b1917
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
return mp.INFECTED
