-- Threat: !InfrastructureShared
-- Name: 175408e1e3e27
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
