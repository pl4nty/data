-- Threat: !InfrastructureShared
-- Name: 3abfe20e4625
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
