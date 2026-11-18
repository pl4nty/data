-- Threat: !InfrastructureShared
-- Name: 5fbf813afb0e
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
