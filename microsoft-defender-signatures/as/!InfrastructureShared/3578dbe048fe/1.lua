-- Threat: !InfrastructureShared
-- Name: 3578dbe048fe
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
