-- Threat: !InfrastructureShared
-- Name: 157891ec6ba1
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
