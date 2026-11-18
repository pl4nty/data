-- Threat: !InfrastructureShared
-- Name: 27785c0d3d5c
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
