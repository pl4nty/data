-- Threat: !InfrastructureShared
-- Name: 3229dbf8c3c5
-- Type: 21

if mp.get_mpattribute("MpIsWmiMofScan") then
  return mp.INFECTED
end
return mp.CLEAN
