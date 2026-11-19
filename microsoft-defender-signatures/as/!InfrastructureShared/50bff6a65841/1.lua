-- Threat: !InfrastructureShared
-- Name: 50bff6a65841
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
