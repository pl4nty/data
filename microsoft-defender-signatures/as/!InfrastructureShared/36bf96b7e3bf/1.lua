-- Threat: !InfrastructureShared
-- Name: 36bf96b7e3bf
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
