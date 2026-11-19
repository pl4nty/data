-- Threat: !InfrastructureShared
-- Name: a0bf83d737fd
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
