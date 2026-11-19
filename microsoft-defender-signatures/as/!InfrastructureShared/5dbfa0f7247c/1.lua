-- Threat: !InfrastructureShared
-- Name: 5dbfa0f7247c
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
