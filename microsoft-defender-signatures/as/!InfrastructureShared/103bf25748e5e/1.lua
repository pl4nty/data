-- Threat: !InfrastructureShared
-- Name: 103bf25748e5e
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
