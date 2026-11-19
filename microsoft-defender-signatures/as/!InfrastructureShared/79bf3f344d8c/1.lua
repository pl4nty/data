-- Threat: !InfrastructureShared
-- Name: 79bf3f344d8c
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
