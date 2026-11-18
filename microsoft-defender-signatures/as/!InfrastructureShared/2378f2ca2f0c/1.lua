-- Threat: !InfrastructureShared
-- Name: 2378f2ca2f0c
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
