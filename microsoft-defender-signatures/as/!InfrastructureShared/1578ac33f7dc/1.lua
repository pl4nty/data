-- Threat: !InfrastructureShared
-- Name: 1578ac33f7dc
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
