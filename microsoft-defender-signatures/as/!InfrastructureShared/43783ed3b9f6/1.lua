-- Threat: !InfrastructureShared
-- Name: 43783ed3b9f6
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
