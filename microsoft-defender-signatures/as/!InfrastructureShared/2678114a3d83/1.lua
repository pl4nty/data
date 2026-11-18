-- Threat: !InfrastructureShared
-- Name: 2678114a3d83
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
