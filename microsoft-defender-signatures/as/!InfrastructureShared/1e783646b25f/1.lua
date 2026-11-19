-- Threat: !InfrastructureShared
-- Name: 1e783646b25f
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
