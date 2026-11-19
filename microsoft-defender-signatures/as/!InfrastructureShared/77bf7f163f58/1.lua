-- Threat: !InfrastructureShared
-- Name: 77bf7f163f58
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
