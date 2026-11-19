-- Threat: !InfrastructureShared
-- Name: 1e7842312e21
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
