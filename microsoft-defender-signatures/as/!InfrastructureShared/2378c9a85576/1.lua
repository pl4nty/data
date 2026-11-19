-- Threat: !InfrastructureShared
-- Name: 2378c9a85576
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
