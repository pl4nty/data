-- Threat: !InfrastructureShared
-- Name: 173bf3754464a
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
