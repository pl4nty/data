-- Threat: !InfrastructureShared
-- Name: 3c78b882ac27
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
