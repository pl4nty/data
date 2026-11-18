-- Threat: !InfrastructureShared
-- Name: 33bf9e1681d7
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
