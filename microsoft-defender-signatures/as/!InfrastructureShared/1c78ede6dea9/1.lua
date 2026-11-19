-- Threat: !InfrastructureShared
-- Name: 1c78ede6dea9
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
