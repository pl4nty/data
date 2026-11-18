-- Threat: !InfrastructureShared
-- Name: 77bfe9ca0801
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
