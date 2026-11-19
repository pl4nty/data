-- Threat: !InfrastructureShared
-- Name: 1778145ed6ab
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
