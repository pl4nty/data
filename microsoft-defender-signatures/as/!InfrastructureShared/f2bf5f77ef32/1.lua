-- Threat: !InfrastructureShared
-- Name: f2bf5f77ef32
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
