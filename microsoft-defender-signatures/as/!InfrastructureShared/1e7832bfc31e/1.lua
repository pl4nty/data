-- Threat: !InfrastructureShared
-- Name: 1e7832bfc31e
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
