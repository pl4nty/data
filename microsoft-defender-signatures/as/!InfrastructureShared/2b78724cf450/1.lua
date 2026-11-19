-- Threat: !InfrastructureShared
-- Name: 2b78724cf450
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
