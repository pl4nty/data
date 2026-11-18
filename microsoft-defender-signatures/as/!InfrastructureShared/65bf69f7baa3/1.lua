-- Threat: !InfrastructureShared
-- Name: 65bf69f7baa3
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
