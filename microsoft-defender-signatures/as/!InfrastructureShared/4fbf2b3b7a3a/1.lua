-- Threat: !InfrastructureShared
-- Name: 4fbf2b3b7a3a
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
