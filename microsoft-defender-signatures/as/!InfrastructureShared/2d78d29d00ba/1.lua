-- Threat: !InfrastructureShared
-- Name: 2d78d29d00ba
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
