-- Threat: !InfrastructureShared
-- Name: 34bf70d9d125
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
