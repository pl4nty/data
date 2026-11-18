-- Threat: !InfrastructureShared
-- Name: 107bff5a11d4c
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
