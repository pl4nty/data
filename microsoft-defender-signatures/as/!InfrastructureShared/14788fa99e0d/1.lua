-- Threat: !InfrastructureShared
-- Name: 14788fa99e0d
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
