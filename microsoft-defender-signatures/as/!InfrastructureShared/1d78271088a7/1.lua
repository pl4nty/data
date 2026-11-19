-- Threat: !InfrastructureShared
-- Name: 1d78271088a7
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
