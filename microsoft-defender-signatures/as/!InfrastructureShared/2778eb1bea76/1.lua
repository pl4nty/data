-- Threat: !InfrastructureShared
-- Name: 2778eb1bea76
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
