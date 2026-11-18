-- Threat: !InfrastructureShared
-- Name: b1bfc6d16b54
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
