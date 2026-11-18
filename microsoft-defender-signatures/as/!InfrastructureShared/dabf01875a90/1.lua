-- Threat: !InfrastructureShared
-- Name: dabf01875a90
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
