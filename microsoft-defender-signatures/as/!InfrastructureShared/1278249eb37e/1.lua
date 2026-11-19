-- Threat: !InfrastructureShared
-- Name: 1278249eb37e
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
