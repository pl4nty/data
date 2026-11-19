-- Threat: !InfrastructureShared
-- Name: 91bf1f627dc2
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
