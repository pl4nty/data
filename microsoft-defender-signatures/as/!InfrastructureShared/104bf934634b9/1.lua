-- Threat: !InfrastructureShared
-- Name: 104bf934634b9
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
