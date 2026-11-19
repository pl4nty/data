-- Threat: !InfrastructureShared
-- Name: 2378b4f4762a
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
