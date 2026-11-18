-- Threat: !InfrastructureShared
-- Name: 15785fbd4447
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
