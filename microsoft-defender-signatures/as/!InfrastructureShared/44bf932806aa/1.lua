-- Threat: !InfrastructureShared
-- Name: 44bf932806aa
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
