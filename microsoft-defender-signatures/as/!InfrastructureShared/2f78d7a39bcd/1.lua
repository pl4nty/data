-- Threat: !InfrastructureShared
-- Name: 2f78d7a39bcd
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
