-- Threat: !InfrastructureShared
-- Name: 30788f7e2e06
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
