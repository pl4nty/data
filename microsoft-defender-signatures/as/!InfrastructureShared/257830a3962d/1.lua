-- Threat: !InfrastructureShared
-- Name: 257830a3962d
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
