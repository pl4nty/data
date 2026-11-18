-- Threat: !InfrastructureShared
-- Name: 77540476b37ae
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
