-- Threat: !InfrastructureShared
-- Name: e6bff9d16f91
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
