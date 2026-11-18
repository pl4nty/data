-- Threat: !InfrastructureShared
-- Name: 73bfdd79ba00
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
