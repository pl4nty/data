-- Threat: !InfrastructureShared
-- Name: 46bf1070f75c
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
