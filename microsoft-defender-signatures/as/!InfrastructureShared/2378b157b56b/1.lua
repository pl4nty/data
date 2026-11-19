-- Threat: !InfrastructureShared
-- Name: 2378b157b56b
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
