-- Threat: !InfrastructureShared
-- Name: 1f78c6278fae
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
