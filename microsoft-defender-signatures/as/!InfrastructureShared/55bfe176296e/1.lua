-- Threat: !InfrastructureShared
-- Name: 55bfe176296e
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
