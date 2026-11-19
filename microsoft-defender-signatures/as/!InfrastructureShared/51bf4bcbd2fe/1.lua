-- Threat: !InfrastructureShared
-- Name: 51bf4bcbd2fe
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
