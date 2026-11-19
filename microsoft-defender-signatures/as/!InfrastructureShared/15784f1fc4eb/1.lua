-- Threat: !InfrastructureShared
-- Name: 15784f1fc4eb
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
