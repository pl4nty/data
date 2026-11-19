-- Threat: !InfrastructureShared
-- Name: a5bf4c7ff3a2
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
