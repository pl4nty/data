-- Threat: !InfrastructureShared
-- Name: 46bfce7ad00b
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
