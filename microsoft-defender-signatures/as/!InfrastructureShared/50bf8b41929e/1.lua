-- Threat: !InfrastructureShared
-- Name: 50bf8b41929e
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
