-- Threat: !InfrastructureShared
-- Name: 15782b154061
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
