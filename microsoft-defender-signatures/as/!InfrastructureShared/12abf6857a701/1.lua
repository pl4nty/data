-- Threat: !InfrastructureShared
-- Name: 12abf6857a701
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
