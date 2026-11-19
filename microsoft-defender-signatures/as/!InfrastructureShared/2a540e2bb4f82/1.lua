-- Threat: !InfrastructureShared
-- Name: 2a540e2bb4f82
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
