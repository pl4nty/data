-- Threat: !InfrastructureShared
-- Name: 79bffd404f71
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
