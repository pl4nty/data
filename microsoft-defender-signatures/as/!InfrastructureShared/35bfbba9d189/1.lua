-- Threat: !InfrastructureShared
-- Name: 35bfbba9d189
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
