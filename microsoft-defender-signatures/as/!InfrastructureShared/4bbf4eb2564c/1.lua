-- Threat: !InfrastructureShared
-- Name: 4bbf4eb2564c
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
