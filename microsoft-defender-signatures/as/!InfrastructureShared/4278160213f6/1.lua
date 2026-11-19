-- Threat: !InfrastructureShared
-- Name: 4278160213f6
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
