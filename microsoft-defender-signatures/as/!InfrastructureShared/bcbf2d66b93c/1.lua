-- Threat: !InfrastructureShared
-- Name: bcbf2d66b93c
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
