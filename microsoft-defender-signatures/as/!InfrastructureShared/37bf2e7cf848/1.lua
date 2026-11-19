-- Threat: !InfrastructureShared
-- Name: 37bf2e7cf848
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
