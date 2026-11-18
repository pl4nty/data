-- Threat: !InfrastructureShared
-- Name: 77bf4384d2f6
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
