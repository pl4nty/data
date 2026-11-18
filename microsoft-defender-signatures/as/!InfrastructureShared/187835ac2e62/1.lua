-- Threat: !InfrastructureShared
-- Name: 187835ac2e62
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
