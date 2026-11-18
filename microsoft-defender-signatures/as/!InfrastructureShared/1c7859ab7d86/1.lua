-- Threat: !InfrastructureShared
-- Name: 1c7859ab7d86
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
