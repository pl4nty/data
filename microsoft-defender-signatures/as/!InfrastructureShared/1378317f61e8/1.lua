-- Threat: !InfrastructureShared
-- Name: 1378317f61e8
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
