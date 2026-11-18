-- Threat: !InfrastructureShared
-- Name: 70bf6cea1927
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
