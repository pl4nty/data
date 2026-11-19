-- Threat: !InfrastructureShared
-- Name: 157810345c2a
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
