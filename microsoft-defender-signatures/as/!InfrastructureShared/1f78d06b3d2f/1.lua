-- Threat: !InfrastructureShared
-- Name: 1f78d06b3d2f
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
