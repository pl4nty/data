-- Threat: !InfrastructureShared
-- Name: 3b781bce76f5
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
