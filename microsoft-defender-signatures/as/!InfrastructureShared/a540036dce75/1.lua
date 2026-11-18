-- Threat: !InfrastructureShared
-- Name: a540036dce75
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
