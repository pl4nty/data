-- Threat: !InfrastructureShared
-- Name: 40bf11dd5031
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
