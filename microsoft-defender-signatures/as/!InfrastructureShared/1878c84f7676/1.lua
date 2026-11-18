-- Threat: !InfrastructureShared
-- Name: 1878c84f7676
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
