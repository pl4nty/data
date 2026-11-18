-- Threat: !InfrastructureShared
-- Name: 1678f399fdaa
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
