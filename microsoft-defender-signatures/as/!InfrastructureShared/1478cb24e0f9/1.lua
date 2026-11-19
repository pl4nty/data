-- Threat: !InfrastructureShared
-- Name: 1478cb24e0f9
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
