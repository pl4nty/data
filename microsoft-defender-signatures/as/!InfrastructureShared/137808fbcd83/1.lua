-- Threat: !InfrastructureShared
-- Name: 137808fbcd83
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
