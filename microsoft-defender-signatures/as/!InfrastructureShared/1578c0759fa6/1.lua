-- Threat: !InfrastructureShared
-- Name: 1578c0759fa6
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
