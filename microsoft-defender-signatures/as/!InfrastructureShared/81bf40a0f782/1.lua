-- Threat: !InfrastructureShared
-- Name: 81bf40a0f782
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
