-- Threat: !InfrastructureShared
-- Name: 175400c6d418f
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
