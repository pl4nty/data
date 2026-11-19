-- Threat: !InfrastructureShared
-- Name: 4abf21db685a
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
