-- Threat: !InfrastructureShared
-- Name: 2178335a67e4
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
