-- Threat: !InfrastructureShared
-- Name: 2bbfc6648fb1
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
