-- Threat: !InfrastructureShared
-- Name: 2ebf2a14d753
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
