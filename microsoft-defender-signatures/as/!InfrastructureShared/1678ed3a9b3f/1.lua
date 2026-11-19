-- Threat: !InfrastructureShared
-- Name: 1678ed3a9b3f
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
