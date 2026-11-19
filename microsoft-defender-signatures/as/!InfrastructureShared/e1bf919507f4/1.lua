-- Threat: !InfrastructureShared
-- Name: e1bf919507f4
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
