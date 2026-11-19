-- Threat: !InfrastructureShared
-- Name: 1978f28a0cb0
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
