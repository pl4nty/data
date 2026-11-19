-- Threat: !InfrastructureShared
-- Name: 5b78273d5d2d
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
