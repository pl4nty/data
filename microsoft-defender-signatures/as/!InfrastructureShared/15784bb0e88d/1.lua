-- Threat: !InfrastructureShared
-- Name: 15784bb0e88d
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
