-- Threat: !InfrastructureShared
-- Name: 6540456a5e6e
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
