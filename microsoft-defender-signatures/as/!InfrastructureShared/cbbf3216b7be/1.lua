-- Threat: !InfrastructureShared
-- Name: cbbf3216b7be
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
