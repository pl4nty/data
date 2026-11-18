-- Threat: !InfrastructureShared
-- Name: 1578e69d1358
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
