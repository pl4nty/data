-- Threat: !InfrastructureShared
-- Name: 407879f0c974
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
