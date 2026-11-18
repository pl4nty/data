-- Threat: !InfrastructureShared
-- Name: 137878e6d983
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
