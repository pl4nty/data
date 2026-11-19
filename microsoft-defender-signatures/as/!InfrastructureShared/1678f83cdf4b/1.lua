-- Threat: !InfrastructureShared
-- Name: 1678f83cdf4b
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
