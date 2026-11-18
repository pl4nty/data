-- Threat: !InfrastructureShared
-- Name: 217841e53812
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
