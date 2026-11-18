-- Threat: !InfrastructureShared
-- Name: a17801f22a84
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
return mp.INFECTED
