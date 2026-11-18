-- Threat: !InfrastructureShared
-- Name: 1c7865b81630
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
