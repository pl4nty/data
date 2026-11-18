-- Threat: !InfrastructureShared
-- Name: 9f78ade353f3
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
return mp.INFECTED
