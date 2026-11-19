-- Threat: !InfrastructureShared
-- Name: 1e78d4a7d0a1
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
