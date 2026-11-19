-- Threat: !InfrastructureShared
-- Name: 5abf142fb9a1
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
