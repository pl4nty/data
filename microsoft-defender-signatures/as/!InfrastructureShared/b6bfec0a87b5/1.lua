-- Threat: !InfrastructureShared
-- Name: b6bfec0a87b5
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
