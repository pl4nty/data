-- Threat: !InfrastructureShared
-- Name: 754048eb7bb8
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
