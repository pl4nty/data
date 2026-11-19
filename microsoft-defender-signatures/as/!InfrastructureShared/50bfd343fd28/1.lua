-- Threat: !InfrastructureShared
-- Name: 50bfd343fd28
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
