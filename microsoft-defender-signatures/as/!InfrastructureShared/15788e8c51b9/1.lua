-- Threat: !InfrastructureShared
-- Name: 15788e8c51b9
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
