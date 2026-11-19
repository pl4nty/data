-- Threat: !InfrastructureShared
-- Name: 2b78554d1c8e
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
