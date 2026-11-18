-- Threat: !InfrastructureShared
-- Name: 6540c49b1f5a
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
