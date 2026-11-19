-- Threat: !InfrastructureShared
-- Name: 2fbf24f8a8dc
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
