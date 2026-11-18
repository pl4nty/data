-- Threat: !InfrastructureShared
-- Name: 78bf036f97da
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
