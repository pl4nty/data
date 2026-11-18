-- Threat: !InfrastructureShared
-- Name: 1578d346e226
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
