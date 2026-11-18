-- Threat: !InfrastructureShared
-- Name: 197871cb1391
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
