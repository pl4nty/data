-- Threat: !InfrastructureShared
-- Name: 104bf8b919567
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
