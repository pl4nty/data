-- Threat: !InfrastructureShared
-- Name: 25406119f3cd
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
