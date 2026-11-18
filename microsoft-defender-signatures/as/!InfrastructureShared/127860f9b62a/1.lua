-- Threat: !InfrastructureShared
-- Name: 127860f9b62a
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
