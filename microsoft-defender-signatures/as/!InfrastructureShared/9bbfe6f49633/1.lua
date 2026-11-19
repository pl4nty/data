-- Threat: !InfrastructureShared
-- Name: 9bbfe6f49633
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
