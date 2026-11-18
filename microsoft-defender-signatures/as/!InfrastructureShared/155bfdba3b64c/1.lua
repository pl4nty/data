-- Threat: !InfrastructureShared
-- Name: 155bfdba3b64c
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
