-- Threat: !InfrastructureShared
-- Name: 69bf2d20fa05
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
