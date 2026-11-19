-- Threat: !InfrastructureShared
-- Name: ecbf82464993
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
