-- Threat: !InfrastructureShared
-- Name: 1978d9b1dd00
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
