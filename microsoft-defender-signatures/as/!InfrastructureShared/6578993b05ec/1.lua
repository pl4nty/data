-- Threat: !InfrastructureShared
-- Name: 6578993b05ec
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
return mp.INFECTED
