-- Threat: !InfrastructureShared
-- Name: 2f78a3b89fb8
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
return mp.INFECTED
