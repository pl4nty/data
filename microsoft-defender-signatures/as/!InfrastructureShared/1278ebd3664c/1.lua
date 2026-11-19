-- Threat: !InfrastructureShared
-- Name: 1278ebd3664c
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
