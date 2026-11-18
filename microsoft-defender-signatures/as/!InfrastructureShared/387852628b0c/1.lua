-- Threat: !InfrastructureShared
-- Name: 387852628b0c
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
return mp.INFECTED
