-- Threat: !InfrastructureShared
-- Name: 6540f0710ec8
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
