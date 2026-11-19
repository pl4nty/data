-- Threat: !InfrastructureShared
-- Name: a2bf3599c825
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
