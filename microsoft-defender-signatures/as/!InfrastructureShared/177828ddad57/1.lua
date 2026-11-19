-- Threat: !InfrastructureShared
-- Name: 177828ddad57
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
