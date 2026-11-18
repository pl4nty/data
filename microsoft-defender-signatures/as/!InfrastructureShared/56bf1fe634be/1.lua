-- Threat: !InfrastructureShared
-- Name: 56bf1fe634be
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
