-- Threat: !InfrastructureShared
-- Name: 4b78a2959cb5
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
