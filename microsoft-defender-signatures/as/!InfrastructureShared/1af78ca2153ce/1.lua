-- Threat: !InfrastructureShared
-- Name: 1af78ca2153ce
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
return mp.INFECTED
