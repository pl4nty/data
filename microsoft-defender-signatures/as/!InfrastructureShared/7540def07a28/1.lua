-- Threat: !InfrastructureShared
-- Name: 7540def07a28
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
