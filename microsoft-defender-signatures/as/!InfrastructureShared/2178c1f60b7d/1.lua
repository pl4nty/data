-- Threat: !InfrastructureShared
-- Name: 2178c1f60b7d
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
