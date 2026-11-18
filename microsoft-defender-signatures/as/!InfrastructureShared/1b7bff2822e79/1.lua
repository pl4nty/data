-- Threat: !InfrastructureShared
-- Name: 1b7bff2822e79
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
