-- Threat: !InfrastructureShared
-- Name: 2078c8a06705
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
