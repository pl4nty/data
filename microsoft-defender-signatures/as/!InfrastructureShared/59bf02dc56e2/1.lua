-- Threat: !InfrastructureShared
-- Name: 59bf02dc56e2
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
