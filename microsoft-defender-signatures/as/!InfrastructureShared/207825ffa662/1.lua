-- Threat: !InfrastructureShared
-- Name: 207825ffa662
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
