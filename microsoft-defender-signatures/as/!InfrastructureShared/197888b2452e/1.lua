-- Threat: !InfrastructureShared
-- Name: 197888b2452e
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
