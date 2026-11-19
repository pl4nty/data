-- Threat: !InfrastructureShared
-- Name: a2bf5fb89a04
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
