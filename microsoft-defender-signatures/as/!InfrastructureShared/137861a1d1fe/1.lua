-- Threat: !InfrastructureShared
-- Name: 137861a1d1fe
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
