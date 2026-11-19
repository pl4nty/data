-- Threat: !InfrastructureShared
-- Name: 174bf3ba11e75
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
