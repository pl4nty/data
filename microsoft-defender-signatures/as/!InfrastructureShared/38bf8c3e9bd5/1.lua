-- Threat: !InfrastructureShared
-- Name: 38bf8c3e9bd5
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
