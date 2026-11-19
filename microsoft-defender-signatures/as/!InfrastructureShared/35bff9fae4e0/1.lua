-- Threat: !InfrastructureShared
-- Name: 35bff9fae4e0
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
