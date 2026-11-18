-- Threat: !InfrastructureShared
-- Name: 2c784a89115f
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
