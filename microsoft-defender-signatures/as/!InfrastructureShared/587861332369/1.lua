-- Threat: !InfrastructureShared
-- Name: 587861332369
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
